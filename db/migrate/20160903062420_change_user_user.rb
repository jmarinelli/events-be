class ChangeUserUser < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :user, :user_name
  end
end
