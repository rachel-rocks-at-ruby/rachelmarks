class Like < ActiveRecord::Base
  belongs_to :bookmark
  has_many :bookmarks_from_likes, class: "Bookmark", through: :likes
end