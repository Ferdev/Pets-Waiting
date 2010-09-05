PetsWaiting::Application.configure do
  config.action_mailer.smtp_settings = APP_CONFIG[:smtp_settings]
end