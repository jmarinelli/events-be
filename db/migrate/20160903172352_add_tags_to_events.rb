class AddTagsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :tags, :string, array: true
  end
end
