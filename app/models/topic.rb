class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :topics
  has_many :bookmarks
end
