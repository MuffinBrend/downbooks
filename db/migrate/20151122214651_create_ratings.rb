class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :book_id
      t.integer :user_id
      t.integer :rating

      t.timestamps null: false
    end
    add_index :ratings, :book_id
    add_index :ratings, :user_id
    add_index :ratings, [:book_id, :user_id], unique: true
  end
end
