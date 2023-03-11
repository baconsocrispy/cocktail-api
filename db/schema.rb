# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_11_205005) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabinets", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "private", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "slug"
    t.index ["name"], name: "index_cabinets_on_name", unique: true
    t.index ["slug"], name: "index_cabinets_on_slug"
    t.index ["user_id"], name: "index_cabinets_on_user_id"
  end

  create_table "cabinets_tools", force: :cascade do |t|
    t.bigint "cabinet_id", null: false
    t.bigint "tool_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cabinet_id"], name: "index_cabinets_tools_on_cabinet_id"
    t.index ["tool_id"], name: "index_cabinets_tools_on_tool_id"
  end

  create_table "cabinets_users", force: :cascade do |t|
    t.bigint "cabinet_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cabinet_id", "user_id"], name: "index_cabinets_users_on_cabinet_id_and_user_id"
    t.index ["user_id", "cabinet_id"], name: "index_cabinets_users_on_user_id_and_cabinet_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "categories_recipes", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id", "recipe_id"], name: "index_categories_recipes_on_category_id_and_recipe_id"
    t.index ["recipe_id", "category_id"], name: "index_categories_recipes_on_recipe_id_and_category_id"
  end

  create_table "favorite_recipes", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id", "user_id"], name: "index_favorite_recipes_on_recipe_id_and_user_id"
    t.index ["user_id", "recipe_id"], name: "index_favorite_recipes_on_user_id_and_recipe_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "type"
    t.string "name", null: false
    t.string "sub_type", null: false
    t.string "brand"
    t.string "product"
    t.decimal "abv"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ingredients_on_name"
  end

  create_table "ingredients_portions", force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "portion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id", "portion_id"], name: "index_ingredients_portions_on_ingredient_id_and_portion_id"
    t.index ["portion_id", "ingredient_id"], name: "index_ingredients_portions_on_portion_id_and_ingredient_id"
  end

  create_table "portions", force: :cascade do |t|
    t.decimal "amount"
    t.string "unit"
    t.string "portionable_type", null: false
    t.bigint "portionable_id", null: false
    t.bigint "ingredient_id", null: false
    t.boolean "optional"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_portions_on_ingredient_id"
    t.index ["optional"], name: "index_portions_on_optional"
    t.index ["portionable_type", "portionable_id"], name: "index_portions_on_portionable"
    t.check_constraint "amount > 0::numeric", name: "amount_check"
  end

  create_table "recipes", force: :cascade do |t|
    t.text "description"
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_recipes_on_name", unique: true
    t.index ["slug"], name: "index_recipes_on_slug"
  end

  create_table "recipes_tools", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "tool_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id", "tool_id"], name: "index_recipes_tools_on_recipe_id_and_tool_id"
    t.index ["tool_id", "recipe_id"], name: "index_recipes_tools_on_tool_id_and_recipe_id"
  end

  create_table "recipes_users", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id", "user_id"], name: "index_recipes_users_on_recipe_id_and_user_id"
    t.index ["user_id", "recipe_id"], name: "index_recipes_users_on_user_id_and_recipe_id"
  end

  create_table "sort_options", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sort_options_on_name"
  end

  create_table "steps", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_steps_on_recipe_id"
  end

  create_table "tools", force: :cascade do |t|
    t.string "tool_type", null: false
    t.string "tool_brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tool_type"], name: "index_tools_on_tool_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "default_cabinet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cabinets_tools", "cabinets"
  add_foreign_key "cabinets_tools", "tools"
  add_foreign_key "categories_recipes", "categories"
  add_foreign_key "categories_recipes", "recipes"
  add_foreign_key "recipes_tools", "recipes"
  add_foreign_key "recipes_tools", "tools"
  add_foreign_key "steps", "recipes"
end
