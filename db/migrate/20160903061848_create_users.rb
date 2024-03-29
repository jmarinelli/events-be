class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :user
      t.string :password
      t.string :status
      t.date :birthdate
      t.string :picture

      t.timestamps
    end
  end
end
