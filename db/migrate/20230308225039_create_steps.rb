class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.string :name, null: false
      t.text :description
      t.bigint :recipe_id, null: false

      t.timestamps
    end
  end
end
