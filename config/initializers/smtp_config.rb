# encoding: UTF-8
ActionMailer::Base.smtp_settings = APP_CONFIG[:smtp_settings].to_options! unless APP_CONFIG[:smtp_settings].nil?