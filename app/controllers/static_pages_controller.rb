class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @user = current_user
      @users = @user.followed_users
      @users.append(@user)
      @feed = Feed.new
      @feeds = []
      @users.each do |user|
        user.feeds.each do |feed|
          @feeds.append feed
        end
      end
      @feeds.sort! {|a,b| b.created_at <=> a.created_at}
    end
  end
end
