require 'insteon/config'

require 'rest_client'
require 'json'

module Insteon
  class Account

	def self.get_accounts(token)
		response = RestClient.get "https://connect.insteon.com/api/v2/accounts?properties=all", headers(token)
		ap response
		return JSON(response)
	end

	def self.get_houses(token)
		response = RestClient.get "https://connect.insteon.com/api/v2/houses", headers(token)
		return JSON(response)
	end

	def self.get_devices(token)
		response = RestClient.get "https://connect.insteon.com/api/v2/devices?properties=all", headers(token)
		return JSON(response)
	end

	private

	def self.headers(token)
		return { :content_type => "application/json", :authentication => "APIKey #{Insteon::Config.api_key}", :authorization => "Bearer #{token}" }
	end

  end
end
