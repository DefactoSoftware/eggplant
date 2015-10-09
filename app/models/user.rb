class User < ActiveRecord::Base
  has_many :posts

  has_many :memberships, :dependent => :destroy
  has_many :teams, through: :memberships

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.image_url = auth["info"]["image"]
    end
  end
end
