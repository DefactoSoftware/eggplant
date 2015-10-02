class Post < ActiveRecord::Base
  belongs_to :user
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
#

