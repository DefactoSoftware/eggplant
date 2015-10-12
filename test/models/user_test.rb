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
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
