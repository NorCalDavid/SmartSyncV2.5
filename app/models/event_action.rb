class EventAction < ActiveRecord::Base
	audited allow_mass_assignment: true
	
	# belongs_to :event_condition
	# has_one :event, through: :event_condition

	after_update :published_changes

	def executed
		self.executed_count += 1
		self.executed_last = Time.now 
		self.save
	end

	def published_changes
		if self.attribute_changed?(:published)
			if self.published_at
				self.published_at = Time.now
			else
				self.published_at = nil
			end
		end
	end
	
end
