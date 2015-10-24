class Event < ActiveRecord::Base
	# audited allow_mass_assignment: true

	belongs_to :property
	has_many :user_properties, through: :property
	has_many :users, through: :user_properties, source: :property
	
	# belongs_to :event_group
	# has_many :event_conditions, dependent: :destroy
	# has_many :event_actions, through: :event_conditions	

	# after_update :published_changes

	# def executed
	# 	self.executed_count += 1
	# 	self.executed_last = Time.now 
	# 	self.save
	# end

	# def published_changes
	# 	if self.attribute_changed?(:published)
	# 		if self.published_at
	# 			self.published_at = Time.now
	# 		else
	# 			self.published_at = nil
	# 		end
	# 	end
	# end

	validate :finish_cannot_be_earlier_than_start
  
  validates :name,        presence: true, length: { in: 2..100 }
  validates :description, presence: true, length: { in: 2..1000 }
  validates :start,       presence: true
  validates :finish,      presence: true

  private

    def finish_cannot_be_earlier_than_start
      unless start.nil? || finish.nil?
        time_error if finish < start
      end
    end

    def time_error
      errors.add(:time_error, 'The fundamental laws of nature prevent time travel')
    end

end
