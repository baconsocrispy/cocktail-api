class CreatePortions < ActiveRecord::Migration[7.0]
  def change
    create_table :portions do |t|
      t.decimal :amount
      t.string :unit
      t.string :portionable_type, null: false
      t.bigint :portionable_id, null: false
      t.bigint :ingredient_id, null: false
      t.boolean :optional
      t.check_constraint "amount > 0::numeric", name: "amount_check"

      t.timestamps
    end
  end
end
