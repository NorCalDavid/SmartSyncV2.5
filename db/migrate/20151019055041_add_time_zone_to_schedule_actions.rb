class AddTimeZoneToScheduleActions < ActiveRecord::Migration
  def change
    add_column :schedule_actions, :time_zone, :string
  end
end
