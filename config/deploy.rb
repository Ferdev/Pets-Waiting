$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require "rvm/capistrano"

ssh_options[:paranoid]      = false
ssh_options[:forward_agent] = true
default_run_options[:pty]   = true


set :stages,        %w(production)
set :default_stage, "production"


set :rvm_ruby_string, 'ree@petswaiting'


set :application,   "petswaiting"
set :domain,        "petswaiting.com"
set :user,          "fer"
set :use_sudo,      false
set :deploy_to,     "/var/www/localhost/htdocs/petswaiting.com"
set :deploy_via,    :remote_cache
set :keep_releases, 3


set :repository,    "git@github.com:Ferdev/Pets-Waiting.git"
set :scm,           :git
set :branch,        'master'
set :git_enable_submodules, 1

set :rails_env,     'production'

role :app, "178.79.135.197"
role :web, "178.79.135.197"
role :db,  "178.79.135.197", :primary => true

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do 
    god.start
  end
  task :stop, :roles => :app, :except => { :no_release => true } do 
    god.terminate
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    god.reload
    god.restart_unicorn
  end

  task :bundle do
   run "cd #{release_path} && RAILS_ENV=#{rails_env} bundle install"
  end
  
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
  
end

namespace :db do
  desc "Copy local database.yml.example to server"
  task :database_yml, :roles => :app do
    run "mkdir #{deploy_to}/shared/config ; true"
    upload("config/database.yml.example", "#{deploy_to}/shared/config/database.yml")
  end
end

namespace :god do
  
  task :restart_unicorn, :roles => :app do
    run "god restart pw_unicorn"
  end
  
  desc "Reload config"
  task :reload, :roles => :app do
    run "god load /etc/god/config.god"
  end  

  desc "Start god"
  task :start, :roles => :app do
    run "god -c /etc/god/config.god"
  end
  
  desc "Quit god, but not the processes it's monitoring"
  task :quit, :roles => :app do
    run "god quit"
  end

  desc "Terminate god and all monitored processes"
  task :terminate, :roles => :app do
    run "god terminate"
  end

  desc "Describe the status of the running tasks"
  task :status, :roles => :app do
    run "god status"
  end
end

namespace :nginx do
  
  desc "Restart nginx"
  task :restart do
    sudo "/etc/init.d/nginx restart"
  end
  
  desc "Stop nginx"
  task :stop do
    sudo "/etc/init.d/nginx stop"
  end
  
  desc "Start nginx"
  task :start do
    sudo "/etc/init.d/nginx start"
  end
  
end

desc "Show memory consumption on the server"
task :free do
  run "free -lm"
end


after "deploy:update_code" do
  deploy.symlink_db
  deploy.bundle
  deploy.migrate
end