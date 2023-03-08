class AddIndicesToFavoriteRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column :favorite_recipes, :recipe_id, :bigint, null: false
    change_column :favorite_recipes, :user_id, :bigint, null: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)

    add_index :favorite_recipes, [:recipe_id, :user_id]
    add_index :favorite_recipes, [:user_id, :recipe_id]
    #Ex:- add_index("admin_users", "username")
  end
end
