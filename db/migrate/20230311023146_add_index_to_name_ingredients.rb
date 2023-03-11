class AddIndexToNameIngredients < ActiveRecord::Migration[7.0]
  def change
    add_index :ingredients, :name
    #Ex:- add_index("admin_users", "username")
  end
end
