class Game < ActiveRecord::Base
  attr_accessible :category, :description, :name
  validates :name, presence: true, length: {maximum: 40}
  validates :category, presence: true, length: {maximum: 20}
  validates :description, length: {maximum: 250}

  has_many :user_game_relations, dependent: :destroy
  has_many :users, through: :user_game_relations

  has_many :posts

end
