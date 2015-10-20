class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :provider, null: false
      t.string :uid
      t.string :token
      t.string :token_secret
      t.string :image
      t.string :provider_email
      t.string :provider_profile
      t.datetime :provider_DOB
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
