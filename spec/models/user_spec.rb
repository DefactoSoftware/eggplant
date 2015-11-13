require "spec_helper"

describe User do

  describe "#validations" do
  end

  describe "associations" do
    it { should have_many :posts }
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  provider   :string
#  uid        :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

