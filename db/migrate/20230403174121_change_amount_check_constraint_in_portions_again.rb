class ChangeAmountCheckConstraintInPortionsAgain < ActiveRecord::Migration[7.0]
  def change
    change_table :portions do |t|
      t.remove_check_constraint "amount > 0::numeric", name: 'amount_check'
      t.check_constraint "amount >= 0::numeric", name: "amount_check"
    end
  end
end
