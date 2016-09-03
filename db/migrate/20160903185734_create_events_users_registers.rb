class CreateEventsUsersRegisters < ActiveRecord::Migration[5.0]
  def change
    create_table :events_users_registers, id: false do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
    end
  end
end
