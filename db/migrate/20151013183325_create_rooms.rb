class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.text :description
      t.string :location
      t.integer :property_id, null: false

      t.timestamps null: false
    end
  end
end
