class AddConfirmableToGeneralUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :general_users, :confirmation_token, :string
    add_index :general_users, :confirmation_token
    add_column :general_users, :confirmed_at, :datetime
    add_column :general_users, :confirmation_sent_at, :datetime
  end
end
