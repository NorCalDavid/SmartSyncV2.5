class ChangeRecipientOnReminders < ActiveRecord::Migration
  def change
  	remove_column :reminders, :recepient_name, :string
  	add_column :reminders, :recipient_name, :string
  end
end

