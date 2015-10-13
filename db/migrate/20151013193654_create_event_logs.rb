class CreateEventLogs < ActiveRecord::Migration
  def change
    create_table :event_logs do |t|
      t.integer :event_id, null: false
      t.string :entry_type
      t.string :reference_type
      t.integer :status_code
      t.text :event_status

      t.timestamps null: false
    end
  end
end
