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
      t.string :insteon_house_id

      t.timestamps null: false
      t.integer :created_by
      t.integer :updated_by
    end
  end
end
