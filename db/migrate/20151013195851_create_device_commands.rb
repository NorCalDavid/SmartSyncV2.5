class CreateDeviceCommands < ActiveRecord::Migration
  def change
    create_table :device_commands do |t|
      t.references :device, index: true, foreign_key: true
      t.references :command, index: true, foreign_key: true
      t.boolean :published, default: false
      t.datetime :published_on
      t.integer :executed_count, null: false, default: 0
      t.datetime :executed_last

      t.timestamps null: false
    end

      add_index :device_commands, [:device_id, :command_id], unique: true
  end
end
