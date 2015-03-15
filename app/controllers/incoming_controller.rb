class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"

    @bookmark = Bookmark.new
    @bookmark.user = User.find_by_email(params["Sender"])
      temp = (params["Subject"])
      a = temp.split
      if a[0] == "#"
        @bookmark.topic = a.shift.join
      else 
        @bookmark.topic = a.join
      end
    @bookmark.address = (params["body-plain"]).strip

    @bookmark.save!
    head 200
  end
end