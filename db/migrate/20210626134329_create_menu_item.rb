class CreateMenuItem < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :description
      t.boolean :veg, default: true
      t.float :price
      t.boolean :status, default: true
    end
  end
end
