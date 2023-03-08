class CreateTable < ActiveRecord::Migration[7.0]
  def change
    create_table :cabinets_tools do |t|
      t.bigint :cabinet_id, null: false
      t.bigint :tool_id, null:false

      t.timestamps
    end
  end
end
