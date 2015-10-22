class CreateEventConditions < ActiveRecord::Migration
  def change
    create_table :event_conditions do |t|
      t.string :name, null: false
      t.text :description
      t.string :type, null: false
      t.boolean :published, null: false, default: false
      t.datetime :published_on
      t.string :condition
      t.integer :trigger_id
      t.integer :test_option_id
      t.string :test_one
      t.string :test_two
      t.integer :execution_order
      t.integer :executed_count, null: false, default: 0
      t.datetime :executed_last
      t.references :event, index: true, foreign_key: true
      
      t.timestamps null: false
      t.integer :created_by
      t.integer :updated_by      
    end
  end
end
