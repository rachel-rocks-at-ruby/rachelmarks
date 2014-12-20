class LikesController < ApplicationController

   def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)

     if like.save
        flash[:notice] = "Success."
        redirect_to [@bookmark.topic, @bookmark]
     else
       flash[:error] = "There was an error. Please try again."
       redirect_to [@bookmark.topic, @bookmark]
     end

   def destroy
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.find(params[:id])
   
     if like.destroy
       flash[:notice] = "Success."
       redirect_to [@bookmark.topic, @bookmark]
     else
       flash[:error] = "There was an error. Please try again."
       redirect_to [@bookmark.topic, @bookmark]
     end
    end
  end
end