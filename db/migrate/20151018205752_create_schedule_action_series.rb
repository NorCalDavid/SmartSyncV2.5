class CreateScheduleActionSeries < ActiveRecord::Migration
  def change
    create_table :schedule_action_series do |t|
      t.integer :frequency, :default => 1
      t.string :period
      t.datetime :starttime
      t.datetime :endtime
      t.boolean :all_day
    end
  end
end
