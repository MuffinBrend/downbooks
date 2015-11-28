class Book < ActiveRecord::Base
  has_attached_file :cover, :styles => {:medium => "210x300>", :thumb => "70x100>"}, :default_url => "/images/:style/cover.jpeg"
  has_attached_file :file
  has_many :ratings, dependent: :delete_all
  belongs_to :user
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :publication_date, presence: true
  validates :publisher, presence: true
  validates :language, presence: true
  validates :genre, presence: true
  validates :description, presence: true
  validates :file, attachment_presence: true
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

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