class Command < ActiveRecord::Base

	has_many :device_commands, dependent: :destroy
	
end
