class User < ActiveRecord::Base
  attr_encrypted :twitter_token, key: ENV["ENCRYPTED_USER_DATA_KEY"]
  attr_encrypted :twitter_secret, key: ENV["ENCRYPTED_USER_DATA_KEY"]

  validates :name, presence: true
  validates :uid, presence: true
  validates :provider, presence: true
  validates :twitter_handle, presence: true

  has_many :posts
  has_many :memberships, dependent: :destroy
  has_many :teams, through: :memberships

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.image_url = auth["info"]["image"]
      user.twitter_handle = auth["info"]["nickname"]
      user.twitter_token = auth["credentials"]["token"]
      user.twitter_secret = auth["credentials"]["secret"]
    end
  end

  def twitter_url
    'https://www.twitter.com/@' + twitter_handle
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
