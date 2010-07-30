require File.dirname(__FILE__) + "/../spec_helper"
require "steak"
require 'capybara/rails'
require 'capybara/envjs'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
Capybara.default_host = 'test.petswaiting.com'
Capybara.default_driver = :envjs
Capybara.default_selector = :css

Rspec.configure do |config|
  config.include Capybara
  config.include ActiveSupport::Testing::Assertions

  config.before(:each) do
    Rails.cache.clear
    DatabaseCleaner.clean
    DatabaseCleaner.start
  end
end

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
