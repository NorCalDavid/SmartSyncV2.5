require 'insteon/config'

require 'rest_client'
require 'json'

module Insteon
  class Device

    def self.get_devices(token)
      response = RestClient.get "https://connect.insteon.com/api/v2/devices?properties=all", headers(token)
      return JSON(response)
    end

    def self.device_details(token, device_id)
			response = RestClient.get "https://connect.insteon.com/api/v2/devices/" + device_id, headers(token)
			return JSON(response)
    end

    private

    def self.headers(token)
      return { :content_type => "application/json", :authentication => "APIKey #{Insteon::Config.api_key}", :authorization => "Bearer #{token}" }
    end

  end
end
