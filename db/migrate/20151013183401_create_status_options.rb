class CreateStatusOptions < ActiveRecord::Migration
  def change
    create_table :status_options do |t|
      t.references :status, index: true, foreign_key: true
      t.references :device, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :status_options, [:status_id, :device_id], unique: true
  end
end
