class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :favorite
      t.integer :status_code, default: 999
      t.string :status
      t.string :status_icon
      t.integer :status_level
      t.string :brand
      t.string :type
      t.string :location
      t.string :EDID
      t.string :version
      t.string :image
      t.ingteger :property_id, null: false
      t.integer :room_id, null: false
      t.boolean :controllable, :default => false
      t.string :api_id
      t.string :api_house_id
      t.integer :api_firmware_version
      t.boolean :dimmable, :default => false
      t.integer :dim_level, :default => 100
      t.integer :ramp_rate, :default => 1
      t.integer :led_level, :default => 5
      t.time :on_time
      t.time :off_time
      t.boolean :timer_enabled, :default => false
      t.integer :group

      t.timestamps null: false
    end
  end
end
