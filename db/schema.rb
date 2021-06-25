ActiveRecord::Schema.define(version: 2021_06_24_072952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "address"
  end

  create_table "menu_categories", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
  end

  create_table "menu_items", force: :cascade do |t|
    t.bigint "menu_categorie_id"
    t.string "name"
    t.string "description"
    t.float "price"
    t.boolean "status"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "role_id"
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end
end
