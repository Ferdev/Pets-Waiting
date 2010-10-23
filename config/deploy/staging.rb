set :rails_env,     'staging'

role :app, petswaiting_staging
role :web, petswaiting_staging
role :db,  petswaiting_staging, :primary => true

set :branch, "staging"
set :deploy_to,     "/var/www/localhost/htdocs/staging.petswaiting.com"

task :set_staging_flag, :roles => [:app] do
  run <<-CMD
    cd #{release_path} &&
    touch STAGING
  CMD
end