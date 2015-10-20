class DeviceCommand < ActiveRecord::Base
	belongs_to :device
	belongs_to :commnd
	
  validates :device_id, presence: true
  validates :command_id, presence: true

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
