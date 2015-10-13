class CreateStatusOptions < ActiveRecord::Migration
  def change
    create_table :status_options do |t|
      t.integer :status_id
      t.integer :device_id

      t.timestamps null: false
    end

    add_index :status_options, :status_id
    add_index :status_options, :device_id
    add_index :status_options, [:status_id, :device_id], unique: true

  end
end
