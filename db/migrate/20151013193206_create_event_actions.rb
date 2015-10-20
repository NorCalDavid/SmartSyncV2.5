class CreateEventActions < ActiveRecord::Migration
  def change
    create_table :event_actions do |t|
      t.string :name, null: false
      t.text :description
      t.string :type, null: false
      t.boolean :published, null: false, default: false
      t.datetime :published_on
      t.string :action
      t.integer :target_id
      t.integer :command_id
      t.integer :execution_order
      t.integer :executed_count, null: false, default: 0
      t.datetime :executed_last
      t.references :event_condition, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
