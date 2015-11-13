require "spec_helper"

describe Membership, type: :model do

  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :team }
  end
end

# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


