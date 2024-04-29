class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.bigint :authorable_id
      t.string :authorable_type

      t.timestamps
    end
    add_index :authors, [:authorable_type, :authorable_id]
  end
end
