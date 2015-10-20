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
      t.references :event_group, index: true, foreign_key: true
      t.references :property, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
