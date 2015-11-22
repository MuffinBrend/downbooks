class DeleteRatingFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :rating
  end
end
