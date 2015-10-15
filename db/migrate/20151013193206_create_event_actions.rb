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
      t.integer :test_option_id
      t.integer :execution_order
      t.integer :executed_count, null: false, default: 0
      t.datetime :executed_last
      t.integer :event_condition_id, null: false

      t.timestamps null: false
    end
  end
end
