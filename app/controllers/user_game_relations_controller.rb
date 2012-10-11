class UserGameRelationsController < ApplicationController
  before_filter :signed_in_user

  def create
    @game = Game.find(params[:user_game_relation][:game_id])
    @relation = UserGameRelation.new(user_id: current_user.id, game_id: @game.id)
    @relation.save
    respond_to do |format|
      format.html { redirect_to @game }
      format.js
    end
  end

  def destroy
    UserGameRelation.find(params[:id]).destroy
    @game = Game.find(params[:user_game_relation][:game_id])
    #current_user.user_game_relations.find_by_game_id(@game.id).destroy
    respond_to do |format|
      format.html { redirect_to @game }
      format.js
    end
  end
end
