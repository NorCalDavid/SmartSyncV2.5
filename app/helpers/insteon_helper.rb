module InsteonHelper

  def linked_property
    Property.find_by(:insteon_house_id).id
  end

  def imported_device?(deviceID)
  	Device.exists?(insteon_device_id: deviceID)
  end

end
