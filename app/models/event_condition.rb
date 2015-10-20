class EventCondition < ActiveRecord::Base
	belongs_to :event
	has_many :event_actions, dependent: :destroy
end
