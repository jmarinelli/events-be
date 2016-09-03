class Event < ApplicationRecord
	has_many :activities, dependent: :destroy
	has_many :social_providers, dependent: :destroy
  belongs_to :country
  belongs_to :state
  belongs_to :city
  belongs_to :category
  has_and_belongs_to_many :favorited_users, :class_name => 'User', 
													:join_table => 'events_users_favorites', :uniq => true
	has_and_belongs_to_many :registered_users, :class_name => 'User',
													:join_table => 'events_users_registers', :uniq => true
end
