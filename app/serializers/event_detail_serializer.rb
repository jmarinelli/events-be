class EventDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :author
  has_many :activities do |serializer|
  	serializer.active_activities
  end

  def active_activities
  	object.activities.active
  end
end
