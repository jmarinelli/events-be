class Event < ApplicationRecord
	has_many :activities, inverse_of: :event, dependent: :destroy
	has_many :social_providers, dependent: :destroy
  belongs_to :country
  belongs_to :state
  belongs_to :city
  belongs_to :category
  has_and_belongs_to_many :favorited_users, :class_name => 'User', 
													:join_table => 'events_users_favorites', :uniq => true
	has_and_belongs_to_many :registered_users, :class_name => 'User',
													:join_table => 'events_users_registers', :uniq => true

	accepts_nested_attributes_for :activities
	after_initialize :default_values

	def self.filter_events(params={})
		filtered_events = Event.all

		if params[:category_ids].present? then filtered_events = filtered_events.with_category_in(params[:category_ids]) end
		if params[:country_id].present? then filtered_events = filtered_events.with_country(params[:country_id]) end
		if params[:state_id].present? then filtered_events = filtered_events.with_state(params[:state_id]) end
		if params[:city_id].present? then filtered_events = filtered_events.with_city(params[:city_id]) end
		if params[:first_date].present? && params[:last_date].present?
			filtered_events = filtered_events.between_dates(params[:first_date], params[:last_date])
		end

		filtered_events
	end

	private
		def default_values
			self.published ||= false
			self.deleted ||= false
		end

	scope :active, -> { where(published: true, deleted: false) }
	scope :with_category_in, -> (categories){ where(category_id: categories) }
	scope :with_country, -> (country_id){ where(country_id: country_id) }
	scope :with_state, -> (state_id){ where(state_id: state_id) }
	scope :with_city, -> (city_id){ where(city_id: city_id) }
	scope :between_dates, -> (first_date, last_date){ where(start_date: first_date ..last_date) }
end
