class AddIndicesToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :email, :string, unique: true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
