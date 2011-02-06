source 'http://rubygems.org'

gem 'rails', '~> 3.0.0'

gem 'capistrano'
gem 'capistrano-ext'
gem 'god'

gem 'haml'
gem 'devise'
gem 'formtastic'
gem 'globalize3'
gem 'rack-contrib', :require => 'rack/contrib'
gem 'carrierwave'
gem 'rmagick'
gem 'will_paginate', '~> 3.0.pre2'
gem 'escape_utils'
gem 'routing-filter'

group :development, :test do
  gem 'irbtools', :git => 'git://github.com/amatsuda/irbtools.git'
  gem 'sqlite3-ruby', :require => "sqlite3"
  gem 'rails3-generators'
  gem 'ruby-debug', :platforms => :mri_18
  gem 'ruby-debug19', :platforms => :mri_19
#  gem 'perftools.rb'
end

group :test do
  gem 'rspec-rails', '~> 2.0.0'
  gem 'capybara'
  gem 'steak', '~> 1.0.0'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'machinist'
  gem 'faker'
end

group :production do
  gem 'pg'
  gem 'passenger'
end
