class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
    	t.string :name, null: false
    	t.text :description
    	t.integer :recipient_id
        t.string :recipient_name
        t.string :recipient_phone_number
    	t.datetime :notification_time
    	t.string :time_zone
        t.references :property, index: true, foreign_key: true

    	t.timestamps null: false
    end
  end
end
