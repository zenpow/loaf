$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
ENV["RAILS_ENV"] = "test"
#require 'rails'
#require 'rails/test_help'
#require 'rails'
require 'rspec/rails'
require 'loaf'

require File.expand_path("../rails_app/config/environment.rb", __FILE__)

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

# Capybara for integration testing
require 'capybara'
require 'capybara/rails'
require 'capybara/rspec'
Capybara.default_driver   = :rack_test
Capybara.default_selector = :css

RSpec.configure do |config|
  #config.include RSpec::Rails::RequestExampleGroup,   
  #                :example_group => { :file => /spec\/integration/ }
  config.include Capybara::DSL
  config.include Rails.application.routes.url_helpers

  config.mock_with :rspec
end
