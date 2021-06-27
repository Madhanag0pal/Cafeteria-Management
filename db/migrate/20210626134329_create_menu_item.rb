class CreateMenuItem < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.references :menu_category, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.float :price
      t.boolean :status, default: true
    end
  end
end
