class Game < ActiveRecord::Base
  attr_accessible :category, :description, :name
  validates :name, presence: true, length: {maximum: 20}
  validates :category, presence: true, length: {maximum: 20}
  validates :description, length: {maximum: 250}


end
