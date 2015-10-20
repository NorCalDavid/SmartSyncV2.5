class CreateScheduleActionSeries < ActiveRecord::Migration
  def change
    create_table :schedule_action_series do |t|
      t.integer :frequency, :default => 1
      t.string :period, :default => 'monthly'
      t.datetime :starttime
      t.datetime :endtime
      t.string :time_zone, null: false
      t.boolean :all_day, :default => false
      t.string :type
      t.boolean :published, :default => false
      t.datetime :published_on
      t.string :status
      t.integer :target_id
      t.integer :command_id
      t.string :action
      t.integer :executed_count, null: false, default: 0
      t.datetime :executed_last
      t.integer :schedule_id

      t.timestamps null: true
    end
  end
end
