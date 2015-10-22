class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :title
      t.text :description
      t.integer :frequency, :default => 1
      t.string :period, :default => 'monthly'
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.string :time_zone, null: false
      t.boolean :all_day, :default => false
      t.string :type, null: false
      t.boolean :published, default: false
      t.datetime :published_on
      t.boolean :favorite, default: false
      t.integer :executed_count, null: false, default: 0
      t.datetime :executed_last
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
      t.integer :created_by
      t.integer :updated_by      
    end
  end
end
