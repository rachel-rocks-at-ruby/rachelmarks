class BookmarksController < ApplicationController

  def index
    topics = Bookmark.pluck(:topic).uniq
    @bookmarks_by_topics = {}

    topics.each do |topic|
      @bookmarks_by_topics[topic] = Bookmark.where(topic: topic)
    end
  end

  def my_rachelmarks
    @total_bookmarks = current_user.bookmarks + current_user.bookmarks_from_likes
    topics = @total_bookmarks.map(&:topic).uniq
    @bookmarks_by_topics = {}

    topics.each do |topic|
      @bookmarks_by_topics[topic] = current_user.bookmarks.where(topic: topic) + current_user.bookmarks_from_likes.where(topic: topic)
    end
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = bookmarks.build(params.require(:bookmark).permit(:address, :topic))
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
 
    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted successfully."
      redirect_to bookmarks_my_rachelmarks_path
    else
      flash[:error] = "There was an error deleting the bookmark."
      redirect_to bookmarks_my_rachelmarks_path
    end
  end
end
