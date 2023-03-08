class CreateRecipesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes_users do |t|
      t.bigint :recipe_id, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end
  end
end
