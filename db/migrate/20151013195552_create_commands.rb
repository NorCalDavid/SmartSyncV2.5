class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :name, null: false
      t.text :description
      t.string :type, null: false
      t.string :action
      t.string :route
      t.references :device, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
