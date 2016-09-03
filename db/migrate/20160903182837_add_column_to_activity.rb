class AddColumnToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :start_date, :datetime
    add_column :activities, :end_date, :datetime
  end
end
