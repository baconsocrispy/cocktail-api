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

ActiveRecord::Schema[7.0].define(version: 2023_03_08_220313) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabinets", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "private", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "slug"
    t.index ["name"], name: "index_cabinets_on_name"
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

  create_table "ingredients", force: :cascade do |t|
    t.string "type"
    t.string "display_name", null: false
    t.string "sub_type", null: false
    t.string "brand"
    t.string "product"
    t.decimal "abv"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["display_name"], name: "index_ingredients_on_display_name"
  end

  create_table "recipes", force: :cascade do |t|
    t.text "description"
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_recipes_on_name"
    t.index ["slug"], name: "index_recipes_on_slug"
  end

end
