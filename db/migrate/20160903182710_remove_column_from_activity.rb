class RemoveColumnFromActivity < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities, :start_date, :string
    remove_column :activities, :start_time, :string
    remove_column :activities, :end_date, :string
    remove_column :activities, :end_time, :string
  end
end
