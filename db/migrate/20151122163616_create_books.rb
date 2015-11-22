class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.date :publication_date
      t.string :publisher
      t.string :language
      t.decimal :rating
      t.string :genre
      t.text :description

      t.timestamps null: false
    end
  end
end

