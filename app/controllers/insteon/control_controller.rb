require 'insteon/config'
require 'insteon/control'
require 'rest_client'

class Insteon::ControlController < ApplicationController
	before_action :authenticate_user!

  # POST /insteon/device/:device_id/off
  def off
    token = current_user.insteon_token
    response = Insteon::Control.off(token, params[:device_id])
    render text: response
  end

end


 