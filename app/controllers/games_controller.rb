class GamesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game])
    if @game.save
      flash[:success] = "Well played"
      redirect_to games_path
    else
      render 'new'
    end
  end

  def index
    @games = Game.all.paginate(page: params[:page])
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end
end
