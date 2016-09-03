class CreateDisciplines < ActiveRecord::Migration[5.0]
  def change
    create_table :disciplines do |t|
      t.string :type
      t.string :distance
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
