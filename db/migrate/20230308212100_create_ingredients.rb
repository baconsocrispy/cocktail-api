class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :type
      t.string :display_name, null:false
      t.string :sub_type, null:false
      t.string :brand
      t.string :product
      t.decimal :abv
      t.integer :age

      t.timestamps
    end
  end
end
