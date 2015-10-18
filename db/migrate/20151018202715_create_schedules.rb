class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.text :description
      t.string :type
      t.boolean :published
      t.datetime :published_on
      t.string :status
      t.boolean :favorite
      t.integer :executed_count
      t.datetime :executed_last
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
