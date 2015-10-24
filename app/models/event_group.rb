class EventGroup < ActiveRecord::Base
	# audited allow_mass_assignment: true
	
	has_many :events	
  
end
