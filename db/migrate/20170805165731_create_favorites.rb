class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.string :city
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
