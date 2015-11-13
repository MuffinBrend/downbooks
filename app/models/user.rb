class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: {maximum: 150}
  validates :username, presence: true, length: {maximum: 25}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }

  has_secure_password validations: false
end
