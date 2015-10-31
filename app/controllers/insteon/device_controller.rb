require 'insteon/device'

class Insteon::DeviceController < Insteon::BaseController
	before_action :authenticate_user!

  # GET /insteon/devices/
  def index
    devices = Insteon::Device.get_devices(@token)
    @insteon_devices = devices["DeviceList"]
    ap @insteon_devices
  end

  def import
  	devices = Insteon::Device.get_devices(@token)

  	devices["DeviceList"].each do |device|
  		ap device
	  	@device = Device.new( :name => device['DeviceName'],
	  												:favorite => device['Favorite'],
	  												:brand => device['Manufacturer'],
	  												:EDID => device['InsteonID'],
	  												:api_firmware_version => device['FirmwareVersion'],
	  												:version => device['SerialNumber'],
	  												:controllable => true,
	  												:insteon_device_id => device['DeviceID'].to_i,
	  												:dim_level => device['DimLevel'],
	  												:ramp_rate => device['RampRate'],
	  												:led_level => device['LEDLevel'],
	  												:on_time => device['OnTime'],
	  												:off_time => device['OffTime'],
	  												:timer_enabled => device['TimerEnabled'],
	  												:property_id => Property.find_by_insteon_house_id(device['HouseID']).id )
			@device.save
			current_user.devices << @device
	  	ap @device
	  end
	  redirect_to devices_path
  end

  private

	def device_params
    params.require(:device).permit(:name, :favorite, :brand, :EDID, :api_firmware_version, :controllable, :insteon_device_id, :dim_level, :ramp_rate, :led_level, :on_time, :off_time, :timer_enabled, :property_id)
  end

end


 