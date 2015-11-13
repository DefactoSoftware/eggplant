require "spec_helper"

describe Post, type: :model do

  describe "#validations" do
    it { should validate_presence_of :tweet }
    it { should validate_presence_of :planned_time }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :team }
  end
end

# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  tweet        :text
#  user_id      :integer
#  planned_time :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  team_id      :integer
#
