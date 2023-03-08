class AddIndicesToIngredientsPortions < ActiveRecord::Migration[7.0]
  def change
    add_index :ingredients_portions, [:ingredient_id, :portion_id]
    add_index :ingredients_portions, [:portion_id, :ingredient_id]
  end
end
