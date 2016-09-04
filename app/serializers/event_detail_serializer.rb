class EventDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :author, :link, :contact_email, :contact_phone, 
  					:tags, :start_date, :end_date
  
  has_one(:country) { object.country.name }
  has_one(:state) { object.state.name }
  has_one(:city) { object.city.name }
  has_one(:category) { object.category.name }

  has_many(:activities) { object.activities.active }
end
