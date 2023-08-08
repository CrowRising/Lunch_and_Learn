class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.string :country
      t.string :recipe_link
      t.string :recipe_title
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end