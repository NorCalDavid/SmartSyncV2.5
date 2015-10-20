class CreateEventGroups < ActiveRecord::Migration
  def change
    create_table :event_groups do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
