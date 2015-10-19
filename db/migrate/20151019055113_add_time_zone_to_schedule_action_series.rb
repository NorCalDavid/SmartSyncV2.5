class AddTimeZoneToScheduleActionSeries < ActiveRecord::Migration
  def change
    add_column :schedule_action_series, :time_zone, :string
  end
end
