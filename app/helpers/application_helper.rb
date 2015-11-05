module ApplicationHelper

  def resource_class
	devise_mapping.to
  end

  def signin_path(provider)
    "/users/auth/#{provider.to_s}"
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def current_user_id
    current_user.id
  end

  def insteon_connected?
    return false if current_user.nil?
    current_user.valid_insteon_token?
  end

  def favorite_devices
    current_user.devices.where(favorite: true)
  end

  def property_name(id)
    Property.find(id).name
  end

  def room_name(id)
    Room.find(id).name
  end

  def location_name(id)
    LocationOption.find(id).name
  end

  def find_user(user_id)
    User.find(user_id)
  end
  
end