class CreateRecipesTools < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes_tools do |t|
      t.bigint :recipe_id, null: false
      t.bigint :tool_id, null: false

      t.timestamps
    end
  end
end
