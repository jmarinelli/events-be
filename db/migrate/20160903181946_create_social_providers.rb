class CreateSocialProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :social_providers do |t|
      t.string :provider
      t.string :link
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
