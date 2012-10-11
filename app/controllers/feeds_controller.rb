class FeedsController < ApplicationController

  def create
    @feed = Feed.new(params[:feed])
    if @feed.save
      flash[:success] = "Welcome!"
    else
      flash[:notice] = "Forgot something?"
    end
    redirect_to root_path
  end
end
