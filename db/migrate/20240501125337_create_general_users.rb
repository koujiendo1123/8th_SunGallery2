class CreateGeneralUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :general_users do |t|
      t.string :name
      t.string :mail
      t.string :password_digest
      t.string :reset_password_token
      t.string :encrypted_password
      t.datetime :remember_created_at

      t.timestamps
    end
  end
end
