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

ActiveRecord::Schema.define(version: 2021_07_05_092817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "address"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "menu_item_id", null: false
    t.integer "quantity", default: 1
    t.index ["menu_item_id"], name: "index_cart_items_on_menu_item_id"
    t.index ["user_id"], name: "index_cart_items_on_user_id"
  end

  create_table "menu_categories", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: true
  end

  create_table "menu_category_items", force: :cascade do |t|
    t.bigint "menu_category_id", null: false
    t.bigint "menu_item_id", null: false
    t.index ["menu_category_id"], name: "index_menu_category_items_on_menu_category_id"
    t.index ["menu_item_id"], name: "index_menu_category_items_on_menu_item_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "veg", default: true
    t.float "price"
    t.boolean "status", default: true
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "name"
    t.integer "quantity"
    t.float "price"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "status_id", default: 1, null: false
    t.float "price"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_orders_on_status_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "menu_item_id", null: false
    t.integer "rating"
    t.index ["menu_item_id"], name: "index_ratings_on_menu_item_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cart_items", "menu_items"
  add_foreign_key "cart_items", "users"
  add_foreign_key "menu_category_items", "menu_categories"
  add_foreign_key "menu_category_items", "menu_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "statuses"
  add_foreign_key "orders", "users"
  add_foreign_key "ratings", "menu_items"
  add_foreign_key "ratings", "users"
  add_foreign_key "users", "roles"
end
