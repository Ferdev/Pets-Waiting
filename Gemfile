source 'http://rubygems.org'

gem 'rails', '~> 3.0.0.rc2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'haml'
gem 'devise', '~> 1.1.rc.2'
gem 'formtastic', :git => "http://github.com/justinfrench/formtastic.git", :branch => "rails3"
gem 'globalize3'
gem 'http_accept_language', :git => 'http://github.com/iain/http_accept_language.git'
gem 'carrierwave', '~> 0.5.0.beta2'
gem 'rmagick'

group :development, :test do
  gem 'sqlite3-ruby', :require => "sqlite3"
  gem 'ruby-debug'
  gem 'rails3-generators'
end

group :test do
	gem 'rspec-rails', '~> 2.0.0.beta.16'
	gem 'steak', '~> 0.4.0.beta.1'
	gem 'capybara'
	gem 'database_cleaner'
	gem 'launchy'
	gem 'machinist'
	gem 'faker'
end

group :production do
  gem 'pg'
  gem 'unicorn'
end