class Bookmark < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  default_scope { order('created_at DESC') }
end
