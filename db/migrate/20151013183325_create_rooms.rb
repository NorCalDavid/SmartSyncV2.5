class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.text :description
      t.string :location, null: false
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
