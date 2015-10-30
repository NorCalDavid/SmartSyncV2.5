require 'rest_client'

module Insteon
  class Config
    attr_reader :callback

    def self.callback
      "http://localhost:3000/insteon/authenticate/token"
    end

  end
end

module Insteon
  class Auth
    
    def self.authenticate
      headers  = {:content_type => "application/x-www-form-urlencoded"}
      response = RestClient.get "https://connect.insteon.com/api/v2/oauth2/auth?client_id=#{ENV["INSTEON_KEY"]}&state=#{ENV["INSTEON_STATE"]}&response_type={code}&redirect_uri=#{Insteon::Config.callback}", headers
      auth_packet = { method: response.args[:method],
                      url: response.args[:url],
                      client_id: ENV["INSTEON_KEY"],
                      state: ENV["INSTEON_STATE"],
                      token: response.cookies.values[0] }

      return { auth_packet: auth_packet, response: response }
    end

    def self.request_token(code)
      values = CGI::escape("grant_type=authorization_code\u0026code=#{code}\u0026client_id=#{ENV["INSTEON_KEY"]}\u0026client_secret=#{ENV["INSTEON_SECRET"]}\u0026redirect_uri=http://localhost:3000/insteon/authenticate/token")
      ap values
      headers  = {:content_type => "application/x-www-form-urlencoded"}

      response = RestClient.post "https://connect.insteon.com/api/v2/oauth2/token", values, headers
      ap response
      return response
    end
    
  end
end
