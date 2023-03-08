class AddIndicesToRecipesUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :recipes_users, [:recipe_id, :user_id]
    add_index :recipes_users, [:user_id, :recipe_id]
  end
end
