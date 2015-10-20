class Event < ActiveRecord::Base
	audited allow_mass_assignment: true

	belongs_to :property
	has_many :user_properties, through: :property
	has_many :users, through: :user_properties, source: :property
	
	belongs_to :event_group
	has_many :event_conditions, dependent: :destroy
	has_many :event_actions, through: :event_conditions	

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
