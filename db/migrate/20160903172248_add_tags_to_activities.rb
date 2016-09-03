class AddTagsToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :tags, :string, array: true
  end
end
