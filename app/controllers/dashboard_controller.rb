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
  end

  def new_room
    @room = Room.new
  end

  def new_device
    @device = Device.new({status_code: 999, status: "Configure Device"})
  end

  private

  

end
