class CreateEventGroups < ActiveRecord::Migration
  def change
    create_table :event_groups do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
      t.integer :created_by
      t.integer :updated_by    
    end
  end
end
