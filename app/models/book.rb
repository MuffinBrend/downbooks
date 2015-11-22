class Book < ActiveRecord::Base
  has_many :ratings, dependent: :delete_all
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :publication_date, presence: true
  validates :publisher, presence: true
  validates :language, presence: true
  validates :genre, presence: true
  validates :description, presence: true
end