class AddIndexToIngredientsPortions < ActiveRecord::Migration[7.0]
  def change
    remove_index :ingredients_portions, name: "index_ingredients_portions_on_ingredient_id_and_portion_id"
    remove_index :ingredients_portions, name: "index_ingredients_portions_on_portion_id_and_ingredient_id"
    add_index :ingredients_portions, :ingredient_id
    add_index :ingredients_portions, :portion_id
    #Ex:- add_index("admin_users", "username")
  end
end
