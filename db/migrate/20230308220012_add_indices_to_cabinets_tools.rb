class AddIndicesToCabinetsTools < ActiveRecord::Migration[7.0]
  def change
    add_index :cabinets_tools, :cabinet_id
    add_index :cabinets_tools, :tool_id
  end
end
