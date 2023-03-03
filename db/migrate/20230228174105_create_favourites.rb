class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.references :book, foreign_key: true
      t.timestamps
    end
  end
end
