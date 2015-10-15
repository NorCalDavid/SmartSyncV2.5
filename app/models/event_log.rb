class EventLog < ActiveRecord::Base

	belongs_to :event
	belongs_to :event_conditions, through: :event
	belongs_to :event_actions, through: :event_conditions, source: :event

end
