class Feed < ActiveRecord::Base
  attr_accessible :comment, :user_id

  validates :comment, presence: true, length: {maximum: 250}
  validates :user_id, presence: true

  belongs_to :user
end
