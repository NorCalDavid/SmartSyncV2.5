class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.text :description
      t.string :type, null: false
      t.boolean :published, default: false
      t.datetime :published_on
      t.string :status
      t.boolean :favorite, default: false
      t.integer :executed_count, null: false, default: 0
      t.datetime :executed_last
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
