class EventCondition < ActiveRecord::Base

	belongs_to :event
	has_many :event_logs, through: :event
	has_many :event_actions, dependent: :destroy

end
