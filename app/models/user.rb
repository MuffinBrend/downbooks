class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
           foreign_key: "follower_id",
           dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
           foreign_key: "followed_id",
           dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: {maximum: 150}
  validates :username, presence: true, length: {maximum: 25}, uniqueness: {case_sensitive: false}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 8}, if: :password_digest_changed?

  has_secure_password

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  private
end
