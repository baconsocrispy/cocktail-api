class ChangeToolsToolTypeColumnNameToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :tools, :tool_type, :name
  end
end
