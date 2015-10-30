require 'insteon/config'

require 'rest_client'
require 'json'

module Insteon
  class House

    def self.get_houses(token)
			response = RestClient.get "https://connect.insteon.com/api/v2/houses?properties=all", headers(token)
			return JSON(response)
    end

    def self.house_details(token, house_id)
			response = RestClient.get "https://connect.insteon.com/api/v2/houses/#{house_id}", headers(token)
			return JSON(response)
    end

    private

    def self.headers(token)
      return { :content_type => "application/json", :authentication => "APIKey #{Insteon::Config.api_key}", :authorization => "Bearer #{token}" }
    end

  end
end
