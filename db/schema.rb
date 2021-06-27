ActiveRecord::Schema.define(version: 2021_06_27_145231) do
  enable_extension "plpgsql"

  create_table "addres", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "address"
    t.index ["user_id"], name: "index_addres_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "menu_item_id", null: false
    t.integer "quantity"
    t.index ["menu_item_id"], name: "index_cart_items_on_menu_item_id"
    t.index ["user_id"], name: "index_cart_items_on_user_id"
  end

  create_table "menu_categories", force: :cascade do |t|
    t.string "name"
    t.string "status"
  end

  create_table "menu_items", force: :cascade do |t|
    t.bigint "menu_category_id", null: false
    t.string "name"
    t.string "description"
    t.float "price"
    t.string "status"
    t.index ["menu_category_id"], name: "index_menu_items_on_menu_category_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "menu_item_id", null: false
    t.text "review"
    t.integer "rating"
    t.index ["menu_item_id"], name: "index_ratings_on_menu_item_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "addres", "users"
  add_foreign_key "cart_items", "menu_items"
  add_foreign_key "cart_items", "users"
  add_foreign_key "menu_items", "menu_categories"
  add_foreign_key "ratings", "menu_items"
  add_foreign_key "ratings", "users"
  add_foreign_key "users", "roles"
end
