class CreateFavoriteRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_recipes do |t|
      t.bigint :recipe_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
