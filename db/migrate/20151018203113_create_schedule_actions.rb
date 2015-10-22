class CreateScheduleActions < ActiveRecord::Migration
  def change
    create_table :schedule_actions do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :status
      t.integer :target_id
      t.integer :command_id
      t.string :action
      t.references :schedule, index: true, foreign_key: true
      
      t.timestamps null: false
      t.integer :created_by
      t.integer :updated_by      
    end
  end
end

