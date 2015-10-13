class CreateDeviceCommands < ActiveRecord::Migration
  def change
    create_table :device_commands do |t|
      t.integer :device_id
      t.string :comamnd_id
      t.boolean :published
      t.integer :executed_count
      t.datetime :executed_last
      t.integer :event_condition_id

      t.timestamps null: false
    end
  end
end
