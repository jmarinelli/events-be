class RemoveStatusFromUsersAddActiveToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :status, :string
    add_column :users, :active, :boolean
  end
end
