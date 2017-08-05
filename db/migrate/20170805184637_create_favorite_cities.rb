class CreateFavoriteCities < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_cities do |t|
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
