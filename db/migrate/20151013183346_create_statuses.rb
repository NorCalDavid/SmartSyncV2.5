class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :code, null: false
      t.string :name, null: false
      t.string :icon

      t.timestamps null: false
    end
  end
end
