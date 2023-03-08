class CreateCabinets < ActiveRecord::Migration[7.0]
  def change
    create_table :cabinets do |t|
      t.string :name, null: false
      t.boolean :private, default: true

      t.timestamps
    end
  end
end
