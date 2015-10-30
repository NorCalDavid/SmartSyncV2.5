require 'insteon/config'
require 'insteon/authentication'
require 'insteon/account'
require 'rest_client'

class Insteon::ConnectController < ApplicationController
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
      current_user.update_attributes(insteon_token: auth_token["access_token"])
      response = {}
      response[:auth_token] = auth_token
      account = Insteon::Account.get_account(auth_token)
      response[:account] = account
      houses = Insteon::Account.get_houses(auth_token)
      response[:houses] = houses
      devices = Insteon::Account.get_devices(auth_token)
      response[:devices] = devices
    else
      ap "Hacker Alert"
    end
    render text: response
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


 