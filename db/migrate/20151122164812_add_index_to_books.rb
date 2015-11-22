class AddIndexToBooks < ActiveRecord::Migration
  def change
    add_index :books, :title
    add_index :books, :author
    add_index :books, :isbn
  end
end
