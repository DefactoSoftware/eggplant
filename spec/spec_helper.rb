ENV["RAILS_ENV"] = "test"

if ENV['RAILS_ENV'] == 'test'
  require "simplecov"
  SimpleCov.start "rails"
end
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "capybara/rspec"
require "webmock/rspec"
require "capybara/webkit"
require "database_cleaner"
require "shoulda/matchers"

Dir[File.expand_path(File.join(File.dirname(__FILE__),"support","**","*.rb"))].each {|f| require f}

module Features
  # Extend this module in spec/support/features/*.rb
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.fail_fast = true
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include Features, type: :feature
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.order = "random"
  config.use_transactional_fixtures = false
  config.include ActionDispatch::TestProcess
  config.include IntegrationSpecHelper, type: :feature

  DatabaseCleaner.strategy = :truncation

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Capybara.javascript_driver = :webkit
WebMock.disable_net_connect!(allow_localhost: true)

Capybara.default_host = "http://example.org"

OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:twitter, {
  info: {
    uid: "12345",
    nickname: "zapnap"
  },
  credentials: {
    token: "929ejelf2",
    secret: "twitter_secret"
  }
})

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
