require 'insteon/auth'

class Insteon::ConnectController < Insteon::BaseController
	before_action :authenticate_user!
  before_action :set_insteon, only: []

  # GET /insteon/authenticate
  def auth
  	@response = Insteon::Auth.authenticate
    render 'auth', :locals => {args: @response[:auth_packet]}
  end

  # POST /insteon/authenticate/token
  def callback
    if params["state"] == ENV["INSTEON_STATE"]
  	  auth_token = Insteon::Auth.request_token(params["code"])
      session[:insteon_token] = "Connected"
      current_user.update_attributes( insteon_token: auth_token["access_token"],
                                      insteon_refresh_token: auth_token["refresh_token"],
                                      insteon_token_type: auth_token["token_type"],
                                      insteon_token_expiration: DateTime.now + auth_token["expires_in"].seconds )
      
      ap "Insteon Successfully Authenticated: #{auth_token}"
      redirect_to dashboard_path, notice: 'Insteon Authentication was Successfull.'
    else
      ap "Insteon Authentication Failed - Hacker Alert"
      redirect_to dashboard_path, alert: 'Insteon Authentication Failed - Invalid Credentials.'
    end
  end
  
  private
  
  def set_auth
    @user = User.find(params[:id])
  end
  
end
