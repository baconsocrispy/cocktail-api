class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.text :description
      t.string :name, null:false
      t.string :slug, null:false

      t.timestamps
    end
  end
end
