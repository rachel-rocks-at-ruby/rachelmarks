class BookmarksController < ApplicationController

  def index
    @bookmarks = current_user.bookmarks
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = bookmarks.build(params.require(:bookmark).permit(:address))
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    address = @bookmark.address
 
    if @bookmark.destroy
      flash[:notice] = "\"#{address}\" was deleted successfully."
      redirect_to bookmarks_path
    else
      flash[:error] = "There was an error deleting the bookmark."
      render :show
    end
  end

end
