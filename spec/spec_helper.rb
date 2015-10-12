
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.fail_fast = true
  config.use_transactional_fixtures = false
  config.use_instantiated_fixtures  = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.infer_spec_type_from_file_location!
end
