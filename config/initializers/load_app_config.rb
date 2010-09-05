raw_config = File.read("#{Rails.root}/config/app_config.yml")
debugger
APP_CONFIG = YAML.load(raw_config)[Rails.env].symbolize_keys