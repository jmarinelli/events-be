class CreateSocialNetworkProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :social_network_profiles do |t|
      t.string :provider
      t.string :access_token
      t.string :refresh_token
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
