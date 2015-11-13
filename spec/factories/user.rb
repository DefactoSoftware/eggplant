include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :User do
    provider "Twitter"
    uid "101dke"
    name "Rob orsel"
  end
end
