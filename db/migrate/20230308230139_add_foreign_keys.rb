class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :cabinets_tools, :cabinets
    add_foreign_key :cabinets_tools, :tools
    add_foreign_key :categories_recipes, :categories
    add_foreign_key :categories_recipes, :recipes
    add_foreign_key :recipes_tools, :recipes
    add_foreign_key :recipes_tools, :tools
    add_foreign_key :steps, :recipes
  end
end
