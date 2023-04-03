class ChangeAmountCheckConstraintInPortions < ActiveRecord::Migration[7.0]
  def change
    change_column :portions, :amount, :decimal, check: 'amount >= 0'
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
