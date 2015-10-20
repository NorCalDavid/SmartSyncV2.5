class CreateLocationOptions < ActiveRecord::Migration
  def change
    create_table :location_options do |t|
      t.string :name, null: false
      t.text :description
      t.string :location_type, null: false

      t.timestamps null: false
    end
  end
end
