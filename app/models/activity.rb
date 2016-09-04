class Activity < ApplicationRecord
	has_many :disciplines, dependent: :destroy
  belongs_to :event, inverse_of: :activities

  after_initialize :default_values

  private
		def default_values
			self.published ||= false
			self.deleted ||= false
		end

	scope :active, -> { where(published: true, deleted: false) }
end
