class CreateScheduleActions < ActiveRecord::Migration
  def change
    create_table :schedule_actions do |t|
      t.string :name
      t.text :description
      t.datetime :starttime, null: false
      t.datetime :endtime, null: false
      t.boolean :all_day, :default => false
      t.string :type
      t.boolean :published
      t.datetime :published_on
      t.string :action
      t.integer :target_id
      t.integer :command_id
      t.integer :executed_count
      t.datetime :executed_last
      t.references :schedule, index: true, foreign_key: true
      t.string :status
      t.integer :schedule_action_series_id
      
      t.timestamps null: false
    end
  end
end
