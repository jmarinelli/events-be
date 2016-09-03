class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.references :event, foreign_key: true
      t.string :status
      t.string :link
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.float :price

      t.timestamps
    end
  end
end
