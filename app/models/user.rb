class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: {maximum: 150}
  validates :username, presence: true, length: {maximum: 25}, uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, if: :password_digest_changed?

  has_secure_password
end
