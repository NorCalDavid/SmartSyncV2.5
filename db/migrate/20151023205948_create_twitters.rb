class CreateTwitters < ActiveRecord::Migration
  def change
    create_table :twitters do |t|
      t.string :screen_name
      t.string :description
      t.string :location
      t.string :image_url
      t.string :profile_url
      t.integer :followers_count
      t.integer :friends_count
      t.integer :favorites_count
      t.date :member_since
      t.string :uid
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
