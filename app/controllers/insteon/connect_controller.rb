require 'insteon/authentication'
require 'rest_client'

class Insteon::ConnectController < ApplicationController
	before_action :authenticate_user!
  before_action :set_insteon, only: []

  # GET /insteon/authenticate
  def auth

  	@response = Insteon::Auth.authenticate
    ap "Authenticate"
    # render :text => @response.to_s 
    render 'auth', :locals => {args: @response[:auth_packet]}
  end

  # POST /insteon/authenticate/token
  def callback
    ap params
    
    if params["state"] == ENV["INSTEON_STATE"]
      values = CGI::escape("grant_type=authorization_code\u0026code=#{params["code"]}\u0026client_id=#{ENV["INSTEON_KEY"]}\u0026client_secret=#{ENV["INSTEON_SECRET"]}\u0026redirect_uri=#{Insteon::Config.callback}")
      values = {  grant_type: "authorization_code",
                  code: params["code"],
                  client_id: ENV["INSTEON_KEY"],
                  client_secret: ENV["INSTEON_SECRET"],
                  redirect_uri: Insteon::Config.callback }
      ap values
      headers  = {:content_type => "application/x-www-form-urlencoded"}

      response = RestClient.post "https://connect.insteon.com/api/v2/oauth2/token", values, headers

  	  # auth_token = Insteon::Auth.request_token(params["code"])
     ap response
     #  ap auth_token
    else
      ap "Hacker Alert"
    end
    render nothing: true
  end
  
  private
  
  def set_auth
    @user = User.find(params[:id])
  end

  # def insteon_params
  #   accessible = [ :code, :state ] # extend with your own params
  #   # accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
  #   params.require(:user).permit(accessible)
  # end
  
end


 