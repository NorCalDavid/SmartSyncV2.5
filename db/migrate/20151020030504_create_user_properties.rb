class CreateUserProperties < ActiveRecord::Migration
  def change
    create_table :user_properties do |t|
      t.references :user, index: true, foreign_key: true
      t.references :property, index: true, foreign_key: true
      t.boolean :favorite, default: false
      t.boolean :receive_notifications, default: false
      t.boolean :authorized_control, default: false
      t.boolean :authorized_change, default: false

      t.timestamps null: false
    end

    add_index :user_properties, [:user_id, :property_id], unique: true
  end
end
