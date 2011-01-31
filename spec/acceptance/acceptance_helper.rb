# encoding: UTF-8
require File.dirname(__FILE__) + "/../spec_helper"
require "steak"
require 'capybara/rails'
require 'faker'

module Capybara
  class << self
    attr_accessor :js_driver
  end

  alias peich save_and_open_page
end

Capybara.register_driver :selenium do |app|
  require "selenium-webdriver"
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['intl.accept_languages'] = 'en'
  Capybara::Driver::Selenium.new(app, :profile => profile)
end

Capybara.default_host = 'test.petswaiting.com'
Capybara.default_driver   = :rack_test
Capybara.default_selector = :css
Capybara.js_driver        = :selenium

Rspec.configure do |config|
  config.include Capybara
  config.include ActiveSupport::Testing::Assertions

  config.before(:each) do
    Capybara.use_default_driver
    Capybara.reset_sessions!
    Rails.cache.clear
    DatabaseCleaner.clean
  end
end

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
