class Team < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "user_id", touch: true
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
end
