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

  def avg_rating
    rating_count = ratings.size
    if rating_count == 0
      return 0
    end
    total_rating = 0
    ratings.each do |r|
      total_rating = total_rating + r.rating
    end
    return total_rating / Float(rating_count)
  end

end