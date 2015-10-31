require 'myq/system'

class Myq::ControlController < Insteon::BaseController
	before_action :authenticate_user!

  # GET /myq/authenticate
  def auth
    @system = MyQ::System.authenticate("mail@daviduli.com", "Depot525500")
    render text: @system
  end

  # GET /myq/doors
  def index
    @system = MyQ::System.authenticate("mail@daviduli.com", "Depot525500")
    response = MyQ::System.doors(@system)
    render text: response
  end

  # GET /myq/doors/count
  def count
    @system = MyQ::System.authenticate("mail@daviduli.com", "Depot525500")
    response = MyQ::System.door_count(@system)
    render text: response
  end

  # GET /myq/doors/:id/open
  def open
    @system = MyQ::System.authenticate("mail@daviduli.com", "Depot525500")
    response = MyQ::System.open(@system, params[:id].to_i)
    render text: response
  end

  # GET /myq/doors/:id/close
  def close
    @system = MyQ::System.authenticate("mail@daviduli.com", "Depot525500")
    response = MyQ::System.close(@system, params[:id].to_i)
    render text: response
  end

  # GET /myq/doors/:id/status
  def status
    @system = MyQ::System.authenticate("mail@daviduli.com", "Depot525500")
    response = MyQ::System.status(@system, params[:id].to_i)
    render text: response
  end

end


 