require 'insteon/config'
require 'rest_client'
require 'json'

module Insteon
  class Control

    def self.off(token, device_id)
    	values   = "{\n    \"command\": \"fast_off\",\n    \"device_id\": #{device_id}\n}  "
    	headers  = { :content_type => "application/json", :authentication => "APIKey #{Insteon::Config.api_key}", :authorization => "Bearer #{token}" }
			response = RestClient.post "https://connect.insteon.com/api/v2/commands", values, headers
			
			return JSON(response)
    end

  end
end
