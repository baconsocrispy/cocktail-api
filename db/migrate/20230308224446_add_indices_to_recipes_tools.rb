class AddIndicesToRecipesTools < ActiveRecord::Migration[7.0]
  def change
    add_index :recipes_tools, [:recipe_id, :tool_id]
    add_index :recipes_tools, [:tool_id, :recipe_id]
  end
end
