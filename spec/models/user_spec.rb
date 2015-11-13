require "spec_helper"

describe User, type: :model do

  describe "#validations" do
    it { should validate_precense_of :name }
    it { should validate_precense_of :uid }
    it { should validate_presence_of :provider }
    it { should validate_presence_of :twitter_handle }
  end

  describe "associations" do
    it { should have_many :posts }
    it { should have_many :memberships }
    it { should have_many :teams }
  end
end

# == Schema Information
#
# Table name: users
#
#  id                       :integer          not null, primary key
#  provider                 :string
#  uid                      :string
#  name                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  image_url                :string
#  encrypted_twitter_token  :string
#  encrypted_twitter_secret :string
#  twitter_handle           :string
#
