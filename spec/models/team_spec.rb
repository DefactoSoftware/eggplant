require "spec_helper"

describe Team, type: :model do

  describe "#validations" do
    it { should validate_presence_of :name }
  end

  describe "associations" do
    it { should belong_to :owner }
    it { should have_many :memberships }
    it { should have_many :users }
    it { should have_many :posts }
  end
end

