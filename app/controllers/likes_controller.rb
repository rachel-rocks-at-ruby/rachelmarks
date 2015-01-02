class LikesController < ApplicationController

  def index
    @bookmarks = current_user.bookmarks_from_likes
  end

  def create
    @like = Like.new(params.require(:like).permit( :user_id, :bookmark_id))
    if @like.save
      flash[:notice] = "Liked bookmark."
      redirect_to bookmarks_my_rachelmarks_path

    else
      flash[:error] = "Unable to like. Please try again."
      redirect_to bookmarks_path
    end
  end


  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      flash[:notice] = "Like Removed"
      redirect_to bookmarks_my_rachelmarks_path

    else
      flash[:error] = "Unable to dislike. Please try again."
      redirect_to bookmarks_my_rachelmarks_path
    end
  end

end