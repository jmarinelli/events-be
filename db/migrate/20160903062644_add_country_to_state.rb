class AddCountryToState < ActiveRecord::Migration[5.0]
  def change
  	add_reference :states, :country, index: true, foreign_key: true
  end
end
