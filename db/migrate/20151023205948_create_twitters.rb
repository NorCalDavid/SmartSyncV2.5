class CreateTwitters < ActiveRecord::Migration
  def change
    create_table :twitters do |t|
      t.string :screen_name
      t.string :location
      t.string :image_url
      t.string :profile_url
      t.string :uid
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
