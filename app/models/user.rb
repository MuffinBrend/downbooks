class User < ActiveRecord::Base
  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "70x70>"}, :default_url => "/images/:style/profile.png"
  has_many :active_relationships, class_name: "Relationship",
           foreign_key: "follower_id",
           dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
           foreign_key: "followed_id",
           dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :ratings, dependent: :delete_all
  has_many :books, dependent: :delete_all

  before_save { self.email = email.downcase }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :name, presence: true, length: {maximum: 150}
  validates :username, presence: true, length: {maximum: 25}, uniqueness: {case_sensitive: false}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 8, too_short: "demasiado corta"}, if: :password_digest_changed?

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

  def get_vote(book)
    return ratings.find_by(book_id: book.id)
  end

  def vote(book, rating)
    if vote?(book)
      ratings.delete(get_vote(book))
    end
    ratings.create(book_id: book.id, rating: rating)
  end

  def vote?(book)
    return get_vote(book) != nil
  end
end
