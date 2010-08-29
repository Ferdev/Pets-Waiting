require File.dirname(__FILE__) + "/../spec_helper"
require "steak"
require 'capybara/rails'
require 'database_cleaner'
require 'faker'

Capybara.default_host = 'test.petswaiting.com'
Capybara.default_driver = :rack_test
Capybara.default_selector = :css
DatabaseCleaner.strategy = :truncation

Rspec.configure do |config|
  config.include Capybara
  config.include ActiveSupport::Testing::Assertions

  config.before(:each) do
    Capybara.use_default_driver
    Rails.cache.clear
    DatabaseCleaner.clean
  end
  
  config.after(:all) do
    # clean disk of uploaded photos
    uploads_photo_dir = File.dirname(__FILE__) + '/../../public/uploads/photo'
    uploads_tmp_dir = File.dirname(__FILE__) + '/../../public/uploads/tmp'
    FileUtils.rm_r(uploads_photo_dir) if File.directory?(uploads_photo_dir)
    FileUtils.rm_r(uploads_tmp_dir) if File.directory?(uploads_tmp_dir)
  end
  
end

Capybara::Driver::Selenium.class_eval do
  class << self
    def driver
      @driver ||= begin
        profile = Selenium::WebDriver::Firefox::Profile.new 
        profile['intl.accept_languages'] = 'en'
        driver = Selenium::WebDriver.for :firefox, :profile => profile
        at_exit { driver.quit }
        driver
      end
    end
  end
end

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
