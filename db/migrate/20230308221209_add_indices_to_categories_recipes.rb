class AddIndicesToCategoriesRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column :categories_recipes, :category_id, :bigint, null: false
    change_column :categories_recipes, :recipe_id, :bigint, null: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)

    add_index :categories_recipes, [:category_id, :recipe_id]
    add_index :categories_recipes, [:recipe_id, :category_id]
  end
end
