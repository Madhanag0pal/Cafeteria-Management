class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :role
      t.string :name
      t.string :email
      t.string :password_digest
    end
  end
end
