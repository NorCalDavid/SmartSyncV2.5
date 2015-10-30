require 'insteon/config'

require 'rest_client'
require 'json'

module Insteon
  class Control

	def self.fast_off(token, device_id)
		values   = "{\n    \"command\": \"fast_off\",\n    \"device_id\": #{device_id}\n}  "
		response = RestClient.post "https://connect.insteon.com/api/v2/commands", values, headers(token)
			
		return JSON(response)
	end

	def self.off(token, device_id)
		values   = "{\n    \"command\": \"off\",\n    \"device_id\": #{device_id}\n}  "
		response = RestClient.post "https://connect.insteon.com/api/v2/commands", values, headers(token)
			
		return JSON(response)
	end

	def self.fast_on(token, device_id)
		values   = "{\n    \"command\": \"fast_on\",\n    \"device_id\": #{device_id}\n}  "
		response = RestClient.post "https://connect.insteon.com/api/v2/commands", values, headers(token)
			
		return JSON(response)
	end

	def self.on(token, device_id, level)
		values   = "{\n    \"command\": \"on\",\n    \"level\": #{level},\n    \"device_id\": #{device_id}\n}"
		response = RestClient.post "https://connect.insteon.com/api/v2/commands", values, headers(token)
			
		return JSON(response)
	end

	def self.start_dim_up(token, device_id)
		values   = "{\n    \"command\": \"start_dim_up\",\n    \"device_id\": #{device_id}\n}  "
		response = RestClient.post "https://connect.insteon.com/api/v2/commands", values, headers(token)
			
		return JSON(response)
	end

	def self.start_dim_down(token, device_id)
		values   = "{\n    \"command\": \"start_dim_down\",\n    \"device_id\": #{device_id}\n}  "
		response = RestClient.post "https://connect.insteon.com/api/v2/commands", values, headers(token)
			
		return JSON(response)
	end

	def self.stop_dim(token, device_id)
		values   = "{\n    \"command\": \"stop_dim\",\n    \"device_id\": #{device_id}\n}  "
		response = RestClient.post "https://connect.insteon.com/api/v2/commands", values, headers(token)
			
		return JSON(response)
	end

	def self.instant_on(token, device_id, level)
		values   = "{\n    \"command\": \"instant_on\",\n    \"level\": #{level},\n    \"device_id\": #{device_id}\n}"
		response = RestClient.post "https://connect.insteon.com/api/v2/commands", values, headers(token)
			
		return JSON(response)
	end

	def self.beep(token, device_id)
		values   = "{\n    \"command\": \"beep\",\n    \"device_id\": #{device_id}\n}  "
		response = RestClient.post "https://connect.insteon.com/api/v2/commands", values, headers(token)
			
		return JSON(response)
	end

	def self.status(token, device_id)
		values   = "{\n    \"command\": \"get_status\",\n    \"device_id\": #{device_id}\n}  "
		response = RestClient.post "https://connect.insteon.com/api/v2/commands", values, headers(token)
			
		return JSON(response)
	end

	private

	def self.headers(token)
		return { :content_type => "application/json", :authentication => "APIKey #{Insteon::Config.api_key}", :authorization => "Bearer #{token}" }
	end

  end
end
