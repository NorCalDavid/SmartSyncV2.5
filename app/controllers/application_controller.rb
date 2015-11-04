class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :ensure_signup_complete, only: [:create, :update]
  before_action :set_configuration
  before_action :set_insteon_token
  before_filter :set_current_user_insteon_token

    def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if (current_user && !current_user.email_verified?)
      redirect_to finish_signup_path(current_user)
    end
  end

  private

  def set_configuration
    @configuration = {  user: current_user,
      properties: (current_user.nil? ? nil : current_user.properties),
      property_count: (current_user.nil? ? nil : current_user.properties.count),
      room_location_options: LocationOption.where(location_type: "Room") || ["No Location Options"],
      device_location_options: LocationOption.where(location_type: "Device") || ["No Location Options"]   }

    if session[:active_room] != nil
      @configuration[:active_property] = Room.find(session[:active_room]).property
      @configuration[:active_room] = Room.find(session[:active_room])
      @configuration[:rooms] = Property.find(session[:active_property]).rooms || get_rooms
      @configuration[:devices] = Room.find(session[:active_room]).devices
      @configuration[:device_count] = @configuration[:devices].count
    elsif session[:active_property] != nil
      @configuration[:active_property] = Property.find(session[:active_property])
      @configuration[:rooms] = Property.find(session[:active_property]).rooms || get_rooms
      @configuration[:room_count] = @configuration[:rooms].count || get_rooms.count
      @configuration[:devices] = get_devices
      @configuration[:device_count] = @configuration[:devices].count
    else
      @configuration[:rooms] = get_rooms
      @configuration[:room_count] = (@configuration[:rooms].nil? ? 0 : @configuration[:rooms].count)
      @configuration[:devices] = get_devices
      @configuration[:device_count] = (@configuration[:devices].nil? ? 0 : @configuration[:devices].count)
    end
  end

  def get_rooms
    rooms = []
    return nil if current_user.nil?
    return nil if current_user.properties.nil?
    current_user.properties.each do |property|
      rooms.concat(property.rooms)
    end
    return rooms
  end

  def get_devices
    devices = []
    return nil if get_rooms.nil?
    get_rooms.each do |room|
      devices.concat(room.devices)
    end
    return devices
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def get_user_schedules
    schedules =[]
    return nil if current_user.nil?
    return nil if current_user.properties.nil?
    
    current_user.properties.each do |property|
      schedules.concat(property.schedules)
    end
    
    return schedules
  end

  def get_user_events
    events =[]
    return nil if current_user.nil?
    return nil if current_user.properties.nil?
    
    current_user.properties.each do |property|
      events.concat(property.events)
    end
    
    return events
  end

  def get_user_reminders
    reminders =[]
    return nil if current_user.nil?
    return nil if current_user.properties.nil?
    
    current_user.properties.each do |property|
      reminders.concat(property.reminders)
    end
    
    return reminders
  end

  def set_insteon_token
    return nil if current_user.nil? 
    @token = current_user.insteon_token if current_user.valid_insteon_token?
  end

  def set_current_user_insteon_token
    return nil if current_user.nil?
    Device.insteon_token = current_user.insteon_token if current_user.valid_insteon_token?
  end

end
