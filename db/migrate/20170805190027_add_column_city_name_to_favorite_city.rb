class AddColumnCityNameToFavoriteCity < ActiveRecord::Migration[5.1]
  def change
    add_column :favorite_cities, :city_name, :string
  end
end
