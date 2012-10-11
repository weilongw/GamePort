class UserGameRelation < ActiveRecord::Base
  attr_accessible :game_id, :user_id

  belongs_to :user
  belongs_to :game

  validates :game_id, presence: true
  validates :user_id, presence: true

end
