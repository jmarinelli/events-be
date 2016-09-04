class User < ApplicationRecord
	has_many :social_network_profiles, dependent: :destroy
	has_and_belongs_to_many :favorited_events, :class_name => 'Event', 
													:join_table => 'events_users_favorites', :uniq => true
	has_and_belongs_to_many :registered_events, :class_name => 'Event',
													:join_table => 'events_users_registers', :uniq => true

	after_initialize :default_values

	private
		def default_values
			self.active ||= false
		end
end
