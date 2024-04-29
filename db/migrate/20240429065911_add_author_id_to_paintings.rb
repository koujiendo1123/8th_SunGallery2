class AddAuthorIdToPaintings < ActiveRecord::Migration[7.0]
  def change
    add_reference :paintings, :author, null: false, foreign_key: true
  end
end
