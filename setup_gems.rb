# -*- encoding : utf-8 -*-
gemset_name = ask("Name of the gemset to create").downcase
run "rvm --rvmrc --create 1.9.2@#{gemset_name}" unless gemset_name.empty?

run 'rm Gemfile'
file 'Gemfile', <<-CODE
source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'rake', '0.9.2'
gem 'devise'
gem 'simple_form', :git => "https://github.com/plataformatec/simple_form.git"
gem 'less-rails-bootstrap', '~> 1.3.0'

group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  # gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'heroku'
end

group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug19'
  gem 'rspec-rails', '~> 2.6.0'
  gem 'factory_girl_rails', '~> 1.2.0'
  gem 'simplecov', '~> 0.5.3', :require => false
end

group :test do
  gem 'spork', '~> 0.9.0.rc'
  gem 'capybara', '~> 1.1.1'
  gem 'launchy'
end

group :production do
  gem 'pg'
end
CODE

run 'bundle'
