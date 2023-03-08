class AddIndicesToSteps < ActiveRecord::Migration[7.0]
  def change
    add_index :steps, :recipe_id
  end
end
