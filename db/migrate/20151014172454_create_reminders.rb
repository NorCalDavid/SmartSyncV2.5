class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
    	t.string :name, null: false
    	t.text :description
    	t.integer :recipient_id
        t.string :recipient_phone_number
    	t.datetime :notification_time
    	t.string :time_zone
        t.integer :user_id, null: false

    	t.timestamps null: false
    end
  end
end
