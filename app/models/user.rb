class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  before_save {|user| user.email = email.downcase}
  before_save :create_remember_token

  has_many :user_relations, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :user_relations, source: :followed
  has_many :reverse_user_relations, foreign_key: "followed_id",
                                    class_name: "UserRelation",
                                    dependent: :destroy
  has_many :followers, through: :reverse_user_relations, source: :follower

  def following?(other_user)
    user_relations.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    user_relations.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    user_relations.find_by_followed_id(other_user.id).destroy
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
