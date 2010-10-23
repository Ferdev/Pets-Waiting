set :rails_env,     'production'

role :app, petswaiting_production
role :web, petswaiting_production
role :db,  petswaiting_production, :primary => true

set :branch, "master"
set :deploy_to,     "/var/www/localhost/htdocs/petswaiting.com"

task :set_staging_flag, :roles => [:app] do
end