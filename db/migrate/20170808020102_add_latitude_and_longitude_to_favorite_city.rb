class AddLatitudeAndLongitudeToFavoriteCity < ActiveRecord::Migration[5.1]
  def change
    add_column :favorite_cities, :latitude, :float
    add_column :favorite_cities, :longitude, :float
  end
end
