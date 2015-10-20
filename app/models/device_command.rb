class DeviceCommand < ActiveRecord::Base
	belongs_to :device
	belongs_to :commnd
	
  validates :device_id, presence: true
  validates :command_id, presence: true
end
