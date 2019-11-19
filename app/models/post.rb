class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :title,:body,:description,:important,:comment_enabled
end
