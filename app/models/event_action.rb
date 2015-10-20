class EventAction < ActiveRecord::Base
	belongs_to :event_condition
	has_one :event, through: :event_condition
	has_many :event_logs, through: :event	
end
