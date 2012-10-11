class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create]

  def create
    @post = Post.new(params[:post])
    @game = Game.find(params[:post][:game_id])
    if @post.save
      flash[:success] = "Thanks for your support"
      redirect_to @game
    else
      flash[:error] = "More words.."
      redirect_to @game
    end
  end
end
