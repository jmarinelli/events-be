class Activity < ApplicationRecord
	has_many :disciplines, dependent: :destroy
  belongs_to :event
end
