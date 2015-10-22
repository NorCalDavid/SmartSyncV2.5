class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.text :description
      t.string :location, null: false
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
      t.integer :created_by
      t.integer :updated_by
    end
  end
end
