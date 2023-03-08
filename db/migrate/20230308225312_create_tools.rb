class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.string :tool_type, null: false
      t.string :tool_brand

      t.timestamps
    end
  end
end
