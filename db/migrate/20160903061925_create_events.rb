class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :author
      t.references :country, foreign_key: true
      t.references :state, foreign_key: true
      t.references :city, foreign_key: true
      t.references :category, foreign_key: true
      t.string :status
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.string :link
      t.string :contact_email
      t.string :contact_phone

      t.timestamps
    end
  end
end
