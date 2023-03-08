class AddIndexToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_index :recipes, :name
    add_index :recipes, :slug
  end
end
