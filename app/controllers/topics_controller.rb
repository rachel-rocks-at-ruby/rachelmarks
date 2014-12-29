class TopicsController < ApplicationController

  def show
    @bookmarks = Bookmark.where(topic: params[:id])
  end

end
