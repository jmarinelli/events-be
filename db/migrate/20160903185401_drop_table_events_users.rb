class DropTableEventsUsers < ActiveRecord::Migration[5.0]
  def change
  	drop_table :events_users
  end
end
