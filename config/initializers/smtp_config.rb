# encoding: UTF-8
smtp_settings = APP_CONFIG[:smtp_settings].to_options!

ActionMailer::Base.smtp_settings = {
  :user_name            => ENV['SMTP_USER'] || '',
  :password             => ENV['SMTP_PASSWORD'] || '',
  :address              => smtp_settings[:address],
  :port                 => smtp_settings[:port],
  :domain               => smtp_settings[:domain],
  :authentication       => smtp_settings[:authentication],
  :enable_starttls_auto => smtp_settings[:enable_starttls_auto]
}