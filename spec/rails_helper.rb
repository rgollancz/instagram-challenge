ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'rails-controller-testing'
require 'devise'
require 'factory_girl_rails'
require 'support/web_helpers'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  config.include Warden::Test::Helpers
  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include WebHelpers, :type => :view

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.after :each do
    Warden.test_reset!
  end
end
