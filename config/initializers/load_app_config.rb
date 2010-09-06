raw_config = File.read("#{Rails.root}/config/app_config.yml")
APP_CONFIG = YAML.load(raw_config)[Rails.env]
APP_CONFIG = APP_CONFIG.to_options! unless APP_CONFIG.nil?