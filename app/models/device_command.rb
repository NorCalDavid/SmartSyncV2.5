class DeviceCommand < ActiveRecord::Base

	belongs_to :device
	belongs_to :commnd
	
end
