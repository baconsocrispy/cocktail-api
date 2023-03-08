class CreateIngredientsPortions < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients_portions do |t|
      t.bigint :ingredient_id, null: false
      t.bigint :portion_id, null: false

      t.timestamps
    end
  end
end
