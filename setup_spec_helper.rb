# -*- encoding : utf-8 -*-
run 'rm spec/spec_helper.rb'
file 'spec/spec_helper.rb', <<'CODE'
require 'rubygems'
require 'spork'

Spork.prefork do
  require 'simplecov'
  SimpleCov.start

  require 'ruby-debug' ; Debugger.start

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'

  # Since we're using devise, the spork guys recommend us to reload the routes on this step
  # https://github.com/timcharper/spork/wiki/Spork.trap_method-Jujutsu
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!) if defined?(Rails)

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

    config.include Devise::TestHelpers, :type => :controller
  end
end

Spork.each_run do
  FactoryGirl.reload
end
CODE
