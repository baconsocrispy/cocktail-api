class AddIndicesToPortions < ActiveRecord::Migration[7.0]
  def change
    add_index :portions, :ingredient_id
    add_index :portions, :optional
    add_index :portions, [:portionable_type, :portionable_id], name: "index_portions_on_portionable"
  end
end
