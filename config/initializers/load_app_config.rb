app_config_file = File.read("#{Rails.root}/config/app_config.yml")
raw_config = YAML.load(app_config_file)[Rails.env]
APP_CONFIG = raw_config.to_options! unless raw_config.nil?