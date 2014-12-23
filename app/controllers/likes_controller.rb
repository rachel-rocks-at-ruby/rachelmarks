class LikesController < ApplicationController

def index
  @bookmarks = current_user.bookmarks_from_likes
end

def new
  @like = Like.new
end

def create
  @like = Like.create(likes_path({like: { user_id: current_user.id, bookmark_id: bookmark.id}}))
  if @like.save
      flash[:notice] = "Liked bookmark."
      redirect_to bookmarks_path

    else
      flash[:error] = "Unable to like. Please try again."
      redirect_to topics_path
    end
  end

def destroy
  @bookmark = Bookmark.find(params[:bookmark_id])
  like = current_user.likes.find(params[:id])
  if like.destroy
      flash[:notice] = "Like Removed"
      redirect_to bookmarks_path

    else
      flash[:error] = "Unable to dislike. Please try again."
      redirect_to bookmarks_path
    end
  end
end