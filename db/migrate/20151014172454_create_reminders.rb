class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
    	t.string :name, null: false
    	t.text :description
    	t.integer :recipient_id
    	t.string :receipient_phone_number
    	t.datetime :notification_time
    	t.string :time_zone

    	t.timestamps null: false
    end
  end
end
