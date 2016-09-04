class FixStatusForEvents < ActiveRecord::Migration[5.0]
  def change
  	remove_column :events, :status, :string
  	add_column :events, :published, :boolean
  	add_column :events, :deleted, :boolean

  	remove_column :activities, :status, :string
  	add_column :activities, :published, :boolean
  	add_column :activities, :deleted, :boolean
  end
end
