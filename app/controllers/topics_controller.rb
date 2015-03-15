class TopicsController < ApplicationController

	def index
		@topics = Bookmark.where(topic: params[:id])
	end

  def show
    @bookmarks = Bookmark.where(topic: params[:id])
  end

end
