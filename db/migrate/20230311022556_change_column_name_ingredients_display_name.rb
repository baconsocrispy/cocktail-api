class ChangeColumnNameIngredientsDisplayName < ActiveRecord::Migration[7.0]
  def change
    remove_index :ingredients, name: "index_ingredients_on_display_name"
  end
end
