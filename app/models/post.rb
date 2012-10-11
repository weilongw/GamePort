class Post < ActiveRecord::Base
  attr_accessible :comment, :game_id, :user_id

  validates :comment, presence: true, length: {maximum: 250}
  validates :game_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :game

  default_scope order: 'posts.created_at DESC'
end
