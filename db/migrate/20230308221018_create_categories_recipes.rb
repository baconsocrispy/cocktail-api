class CreateCategoriesRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_recipes do |t|
      t.bigint :recipe_id
      t.bigint :category_id

      t.timestamps
    end
  end
end
