class UserDetailSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :user_name, :email, :birthdate, :picture
  has_many(:favorited_events, serializer: EventPreviewSerializer){ object.favorited_events.active }
  has_many(:registered_events, serializer: EventPreviewSerializer){ object.registered_events.active }
end
