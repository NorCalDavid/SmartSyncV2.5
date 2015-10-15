class Event < ActiveRecord::Base

	belongs_to :user
	belongs_to :event_groups
	has_many :event_conditions, dependent: :destroy
	has_many :event_actions, through: :event_conditions, dependent: :destroy
	has_many :event_logs, dependent: :destroy
	
end
