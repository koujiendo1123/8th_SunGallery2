class AddUnconfirmedEmailToGeneralUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :general_users, :unconfirmed_email, :string
  end
end
