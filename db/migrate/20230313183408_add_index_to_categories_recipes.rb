class AddIndexToCategoriesRecipes < ActiveRecord::Migration[7.0]
  def change
    add_index :categories_recipes, :category_id
    #Ex:- add_index("admin_users", "username")
  end
end
