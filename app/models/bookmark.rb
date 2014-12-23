class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :bookmarks
  has_many :likes
  default_scope { order('created_at DESC') }
end
