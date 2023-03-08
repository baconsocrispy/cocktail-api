class AddColumnsToCabinet < ActiveRecord::Migration[7.0]
  def change
    add_column :cabinets, :user_id, :bigint
    add_column :cabinets, :slug, :string

    add_index :cabinets, :name
    add_index :cabinets, :slug
    add_index :cabinets, :user_id
  end
end
