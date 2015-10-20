class Schedule < ActiveRecord::Base
  audited allow_mass_assignment: true

  belongs_to :property
  has_many :users, through: :property
  
  has_many :schedule_action_series, dependent: :destroy
  has_many :schedule_actions, through: :schedule_action_series

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
