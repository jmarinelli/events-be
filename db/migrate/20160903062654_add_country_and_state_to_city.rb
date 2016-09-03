class AddCountryAndStateToCity < ActiveRecord::Migration[5.0]
  def change
  	add_reference :cities, :country, index: true, foreign_key: true
  	add_reference :cities, :state, index: true, foreign_key: true
  end
end
