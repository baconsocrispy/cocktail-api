class AddIndexToSortOption < ActiveRecord::Migration[7.0]
  def change
    add_index :sort_options, :name
    #Ex:- add_index("admin_users", "username")
  end
end
