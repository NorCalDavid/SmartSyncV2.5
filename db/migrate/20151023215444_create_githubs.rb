class CreateGithubs < ActiveRecord::Migration
  def change
    create_table :githubs do |t|
      t.string :screen_name
      t.string :location
      t.string :image_url
      t.string :profile_url
      t.string :personal_website_url
      t.integer :public_repos_count
      t.string :public_repos_url
      t.integer :private_repos_count
      t.integer :public_gists_count
      t.string :public_gists_url
      t.integer :private_gists_count
      t.integer :personal_private_repos_count
      t.bigint :total_data_stored
      t.integer :followers_count
      t.string :followers_url
      t.integer :following_count
      t.string :following_url
      t.string :starred_url
      t.string :subscriptions_url
      t.string :organizations_url
      t.string :events_url
      t.date :member_since
      
      t.string :uid
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
