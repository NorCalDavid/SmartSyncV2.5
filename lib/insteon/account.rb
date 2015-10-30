require 'insteon/config'
require 'rest_client'
require 'json'

module Insteon
  class Account

    def self.get_account(token)
    	headers  = { :content_type => "application/json", :authentication => "APIKey #{Insteon::Config.api_key}", :authorization => "Bearer #{token["access_token"]}" }
			response = RestClient.get "https://connect.insteon.com/api/v2/accounts", headers
			return JSON(response)
    end

    def self.get_houses(token)
    	headers  = { :content_type => "application/json", :authentication => "APIKey #{Insteon::Config.api_key}", :authorization => "Bearer #{token["access_token"]}" }
			response = RestClient.get "https://connect.insteon.com/api/v2/houses", headers
			return JSON(response)
    end

    def self.get_devices(token)
    	headers  = { :content_type => "application/json", :authentication => "APIKey #{Insteon::Config.api_key}", :authorization => "Bearer #{token["access_token"]}" }
			response = RestClient.get "https://connect.insteon.com/api/v2/devices?properties=all", headers
			return JSON(response)
    end

  end
end
