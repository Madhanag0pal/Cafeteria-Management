class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.bigint :role_id
      t.string :name
      t.string :email
      t.string :password_digest
    end
  end
end
