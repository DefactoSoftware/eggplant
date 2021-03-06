class Team < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "user_id", touch: true
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :posts

  validates :name, presence: true
end

# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  user_id     :integer
#


