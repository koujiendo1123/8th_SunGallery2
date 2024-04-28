class CreatePaintings < ActiveRecord::Migration[7.0]
  def change
    create_table :paintings do |t|
      t.string :name, :null => false #追加

      t.timestamps
    end
  end
end
