class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_configuration, only: [:index, :refresh, :new_property, :new_room, :new_device ]
  skip_before_filter :verify_authenticity_token, :only => :refresh


  def index
  end

  def refresh

    if request.xhr?
      case params[:refresh_action]
      when "Set Property"
        session[:active_property] = params[:active_property] unless params[:active_property].nil?
        session[:active_room] = nil
        p "Active Property Set: Property Session = #{session[:active_property]}, Room Session = #{session[:active_room]}"
      when "Set Room"
        session[:active_room] = params[:active_room] unless params[:active_room].nil?
        session[:active_property] = Room.find(session[:active_room]).property.id
        p "Active Room Set: Property Session = #{session[:active_property]}, Room Session = #{session[:active_room]}"
      when "Reset"
        session[:active_property] = nil
        session[:active_room] = nil
        p "Panel Reset: Property Session = #{session[:active_property]}, Room Session = #{session[:active_room]}"
      end

      set_configuration
      render partial: 'dashboard/partials/dashboard', status: :accepted, location: dashboard_path(@configuration)

    end
  end

  def new_property
    @property = current_user.properties.new
    add_breadcrumb :new_property, :dashboard_devices_new_path
  end

  def new_room
    @room = current_user.rooms.new
  end

  def new_device
    @device = current_user.devices.new({status_code: 999, status: "Configure Device"})
  end

  private

  def set_configuration
    @configuration = {  user: current_user,
      properties: current_user.properties,
      property_count: current_user.properties.count,
      room_location_options: LocationOption.where(location_type: "Room") || ["No Location Options"],
      device_location_options: LocationOption.where(location_type: "Device") || ["No Location Options"]   }

      if session[:active_room] != nil
        @configuration[:active_property] = Room.find(session[:active_room]).property
        @configuration[:active_room] = Room.find(session[:active_room])
        @configuration[:rooms] = Property.find(session[:active_property]).rooms || current_user.rooms
        @configuration[:devices] = Room.find(session[:active_room]).devices
        @configuration[:device_count] = @configuration[:devices].count
      elsif session[:active_property] != nil
        @configuration[:active_property] = Property.find(session[:active_property])
        @configuration[:rooms] = Property.find(session[:active_property]).rooms || current_user.rooms
        @configuration[:room_count] = @configuration[:rooms].count || current_user.rooms.count
        @configuration[:devices] = current_user.devices
        @configuration[:device_count] = current_user.devices.count
      else
        @configuration[:rooms] = current_user.rooms
        @configuration[:room_count] = current_user.rooms.count
        @configuration[:devices] = current_user.devices
        @configuration[:device_count] = current_user.devices.count
      end
    end

  end
