class AddUniqueConstraintsToCabinetsAndRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_index :cabinets, :name
    remove_index :recipes, :name
    add_index :cabinets, :name, unique: true 
    add_index :recipes, :name, unique: true 
  end
end
