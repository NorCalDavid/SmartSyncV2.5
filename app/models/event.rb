class Event < ActiveRecord::Base
	belongs_to :property
	has_many :user_properties, through: :property
	has_many :users, through: :user_properties, source: :property
	
	belongs_to :event_group
	has_many :event_conditions, dependent: :destroy
	has_many :event_actions, through: :event_conditions	
end
