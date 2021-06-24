class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.integer :menu_categorie_id
      t.string :name
      t.string :description
      t.integer :price
      t.boolean :status
    end
  end
end
