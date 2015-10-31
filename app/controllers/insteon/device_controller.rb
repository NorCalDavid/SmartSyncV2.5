require 'insteon/device'

class Insteon::DeviceController < Insteon::BaseController
	before_action :authenticate_user!

  # GET /insteon/devices/
  def index
    devices = Insteon::Device.get_devices(@token)
    @insteon_devices = devices["DeviceList"]
  end

  def import
  	@api_device = Insteon::Device.device_details(@token, params["device_id"])
  	ap @api_device
  	@device = Device.new( :name => @api_device['DeviceName'],
  												:favorite => @api_device['Favorite'],
  												:brand => @api_device['Manufacturer'],
  												:EDID => @api_device['InsteonID'],
  												:api_firmware_version => @api_device['FirmwareVersion'],
  												:version => @api_device['SerialNumber'],
  												:controllable => true,
  												:insteon_device_id => @api_device['DeviceID'].to_i,
  												:dim_level => @api_device['DimLevel'],
  												:ramp_rate => @api_device['RampRate'],
  												:led_level => @api_device['LEDLevel'],
  												:on_time => @api_device['OnTime'],
  												:off_time => @api_device['OffTime'],
  												:timer_enabled => @api_device['TimerEnabled'],
  												:property_id => Property.find_by_insteon_house_id(@api_device['HouseID'].to_i).id )
	end

	def create
		@device = Property.new(device_params)

    if @device.save
      current_user.devices << @device
      redirect_to insteon_devices_path, notice: 'Device was successfully imported.'
    else
      render :new 
    end
	end

  private

	def device_params
    params.require(:device).permit(:name, :favorite, :brand, :EDID, :api_firmware_version, :controllable, :insteon_device_id, :dim_level, :ramp_rate, :led_level, :on_time, :off_time, :timer_enabled, :property_id)
  end

end


 