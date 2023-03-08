class CreateTableCabinetsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :cabinets_users do |t|
      t.bigint :cabinet_id, null: false
      t.bigint :user_id, null: false 
      
      t.timestamps
    end
  end
end
