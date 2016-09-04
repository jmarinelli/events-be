class EventPreviewSerializer < ActiveModel::Serializer
	attributes :id, :name, :author, :link, :tags
end