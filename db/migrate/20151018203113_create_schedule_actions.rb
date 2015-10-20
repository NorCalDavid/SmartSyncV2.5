class CreateScheduleActions < ActiveRecord::Migration
  def change
    create_table :schedule_actions do |t|
      t.string :name
      t.text :description
      t.datetime :starttime, null: false
      t.datetime :endtime, null: false
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
      t.integer :schedule_action_series_id
      
      t.timestamps null: false
    end
    add_index :schedule_actions, :schedule_action_series_id
  end
end

