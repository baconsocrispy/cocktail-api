class AddRecipeIdIndexToCategoriesRecipes < ActiveRecord::Migration[7.0]
  def change
    add_index :categories_recipes, :recipe_id
    remove_index :categories_recipes, name: "index_categories_recipes_on_category_id_and_recipe_id"
    remove_index :categories_recipes, name: "index_categories_recipes_on_recipe_id_and_category_id"
    add_index :categories_recipes, [:recipe_id, :category_id], unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
