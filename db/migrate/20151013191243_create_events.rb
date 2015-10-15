class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description
      t.string :type, null: false
      t.boolean :published, null: false, default: false
      t.datetime :published_on
      t.string :status
      t.boolean :favorite, null: false, default: false
      t.integer :executed_count, null: false, default: 0
      t.datetime :executed_last
      t.integer :event_group_id
      
      t.timestamps null: false
    end
  end
end
