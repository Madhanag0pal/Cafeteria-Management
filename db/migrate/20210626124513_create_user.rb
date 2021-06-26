class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.references :role, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :password_digest
    end
  end
end
