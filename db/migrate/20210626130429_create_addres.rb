class CreateAddres < ActiveRecord::Migration[6.1]
  def change
    create_table :addres do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :address
    end
  end
end
