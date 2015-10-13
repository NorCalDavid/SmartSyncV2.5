class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :image, :default => "http://res.cloudinary.com/hupgpadmb/image/upload/v1444201245/DefaultProperty.png"
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
