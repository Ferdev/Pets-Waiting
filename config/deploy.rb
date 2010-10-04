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
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :bundle do
   run "cd #{release_path} && RAILS_ENV=#{rails_env} bundle install"
  end
  
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
  
  desc "Symlinks the app_config.yml"
  task :symlink_app_config, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/app_config.yml #{release_path}/config/app_config.yml"
  end
  
  desc "Symlinks uploads folder"
  task :symlink_uploads_folder, :roles => :app do
    run "mkdir -m 777 #{deploy_to}/shared/uploads ; true"
    run "ln -nfs #{deploy_to}/shared/uploads/ #{release_path}/public/uploads"
  end
  
end

namespace :db do
  desc "Copy local database.yml.example to server"
  task :database_yml, :roles => :app do
    run "mkdir #{deploy_to}/shared/config ; true"
    upload("config/database.yml.example", "#{deploy_to}/shared/config/database.yml")
  end
end

namespace :config do
  desc "Copy local app_config.yml to server"
  task :app_config, :roles => :app do
    run "mkdir #{deploy_to}/shared/config ; true"
    upload("config/app_config.yml", "#{deploy_to}/shared/config/app_config.yml")
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

namespace :rake do
  namespace :db do

    desc "Run rake:seed on remote app server"
    task :seed do
      run "cd #{current_release} && RAILS_ENV=#{rails_env} rake db:seed"
    end

  end
end

after "deploy:update_code" do
  deploy.symlink_db
  deploy.symlink_app_config
  deploy.symlink_uploads_folder
  deploy.bundle
  deploy.migrate
end