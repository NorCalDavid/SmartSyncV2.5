class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string, :limit => 50
    add_column :users, :mobile, :string, :limit => 50
    add_column :users, :receive_sms, :boolean, null: false, default: false
  end
end
