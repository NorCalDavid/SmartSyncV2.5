class AddRecipientToReminders < ActiveRecord::Migration
  def change
  	add_column :reminders, :recepient_name, :string
  end
end

