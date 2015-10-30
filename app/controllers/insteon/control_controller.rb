require 'insteon/control'

class Insteon::ControlController < Insteon::BaseController
	before_action :authenticate_user!
  before_action :set_token

  # POST /insteon/device/:id/on?level=XX
  def on
  	level = params[:level] || 100
    response = Insteon::Control.on(@token, params[:id], level)
    render text: response
  end

  # POST /insteon/device/:id/fast_on
  def fast_on
    response = Insteon::Control.fast_on(@token, params[:id])
    render text: response
  end

  # POST /insteon/device/:id/instant_on?level=XX
  def instant_on
  	level = params[:level] || 100
    response = Insteon::Control.instant_on(@token, params[:id], level)
    render text: response
  end

  # POST /insteon/device/:id/off
  def off
    response = Insteon::Control.off(@token, params[:id])
    render text: response
  end

  # POST /insteon/device/:id/fast_off
  def fast_off
    response = Insteon::Control.fast_off(@token, params[:id])
    render text: response
  end

  # POST /insteon/device/:id/start_dim_up
  def start_dim_up
    response = Insteon::Control.start_dim_up(@token, params[:id])
    render text: response
  end

  # POST /insteon/device/:id/start_dim_down
  def start_dim_down
    response = Insteon::Control.start_dim_down(@token, params[:id])
    render text: response
  end

  # POST /insteon/device/:id/stop_dim
  def stop_dim
    response = Insteon::Control.stop_dim(@token, params[:id])
    render text: response
  end

  # POST /insteon/device/:id/beep
  def beep
    response = Insteon::Control.beep(@token, params[:id])
    render text: response
  end

  # POST /insteon/device/:id/status
  def status
    response = Insteon::Control.status(@token, params[:id])
    render text: response
  end

  private

  def set_token
    @token = current_user.insteon_token
  end

end


 