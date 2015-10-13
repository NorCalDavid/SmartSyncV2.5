class CreateComamnds < ActiveRecord::Migration
  def change
    create_table :comamnds do |t|
      t.string :name, null: false
      t.text :description
      t.string :resource
      t.string :type, null: false
      t.string :endpoint, null: false

      t.timestamps null: false
    end
  end
end
