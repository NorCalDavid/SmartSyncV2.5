class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :name, null: false
      t.text :description
      t.string :command_type, null: false
      t.string :action
      t.string :action_type
      t.string :values
      t.string :headers
      t.string :route

      t.timestamps null: false    
    end
  end
end
