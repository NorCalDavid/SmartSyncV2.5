class CreateEventGroups < ActiveRecord::Migration
  def change
    create_table :event_groups do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :favorite, null: false, default: false
      t.integer :executed_count, null: false, default: 0
      t.datetime :executed_last
      t.string :status
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
