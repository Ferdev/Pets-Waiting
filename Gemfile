source 'http://rubygems.org'

gem 'rails', '~> 3.0.0.rc2'

gem 'capistrano'
gem 'capistrano-ext'
gem 'god'

gem 'haml'
gem 'devise', '~> 1.1.rc.2'
gem 'formtastic', '~> 1.1.0.beta'
gem 'globalize3'
gem 'rack-contrib', :require => 'rack/contrib'
gem 'carrierwave', '~> 0.5.0.beta2'
gem 'rmagick'
gem 'will_paginate', '~> 3.0.pre2'
gem 'escape_utils'

group :development, :test do
  gem 'sqlite3-ruby', :require => "sqlite3"
  gem 'rails3-generators'
  if RUBY_VERSION < '1.9'
    gem 'ruby-debug'
  else
    gem 'ruby-debug19'
  end
end

group :test do
  gem 'rspec-rails', '~> 2.0.0.beta.16'
  gem 'steak', '~> 1.0.0.beta.2'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'machinist'
  gem 'faker'
end

group :production do
  gem 'pg'
  gem 'passenger'
end
