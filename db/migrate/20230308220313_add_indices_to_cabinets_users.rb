class AddIndicesToCabinetsUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :cabinets_users, [:cabinet_id, :user_id]
    add_index :cabinets_users, [:user_id, :cabinet_id]
  end
end
