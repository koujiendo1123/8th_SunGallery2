class AddColumnToGeneralUser < ActiveRecord::Migration[7.0]
  def change
    add_column :general_users, :name, :string
  end
end
