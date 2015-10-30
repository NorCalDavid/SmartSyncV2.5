require 'insteon/device'

class Insteon::DeviceController < Insteon::BaseController
	
  # GET /insteon/devices/
  def index
    devices = Insteon::Device.get_devices(@token)
    @insteon_devices = devices["DeviceList"]
    ap @insteon_devices
  end

end


 