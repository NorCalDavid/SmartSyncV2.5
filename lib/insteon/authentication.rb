require 'insteon/config'
require 'rest_client'
require 'json'

module Insteon
  class Auth
    
    def self.authenticate
      headers  = {:content_type => "application/x-www-form-urlencoded"}
      response = RestClient.get "https://connect.insteon.com/api/v2/oauth2/auth?client_id=#{Insteon::Config.api_key}&state=#{Insteon::Config.state}&response_type={code}&redirect_uri=#{Insteon::Config.callback}", headers
      auth_packet = { method: response.args[:method],
                      url: response.args[:url],
                      client_id: Insteon::Config.api_key,
                      state: Insteon::Config.state,
                      token: response.cookies.values[0] }

      return { auth_packet: auth_packet, response: response }
    end

    def self.request_token(code)
      values = {  grant_type: "authorization_code",
                  code: code,
                  client_id: Insteon::Config.api_key,
                  client_secret: ENV["INSTEON_SECRET"],
                  redirect_uri: Insteon::Config.callback }

      headers  = {:content_type => "application/x-www-form-urlencoded"}
      response = RestClient.post "https://connect.insteon.com/api/v2/oauth2/token", values, headers
      
      return JSON(response)
    end
    
  end
end
