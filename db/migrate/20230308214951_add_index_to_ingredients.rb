class AddIndexToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_index :ingredients, :display_name
  end
end
