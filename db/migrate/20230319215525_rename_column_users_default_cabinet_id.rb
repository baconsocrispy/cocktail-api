class RenameColumnUsersDefaultCabinetId < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :default_cabinet_id, :current_cabinet_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
