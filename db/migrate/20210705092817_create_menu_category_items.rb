class CreateMenuCategoryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_category_items do |t|
      t.references :menu_category, null: false, foreign_key: true
      t.references :menu_item, null: false, foreign_key: true
    end
  end
end
