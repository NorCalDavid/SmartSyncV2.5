require 'insteon/config'

require 'rest_client'
require 'json'

module Insteon
  class Room 

    def self.get_rooms(token)
			response = RestClient.get "https://connect.insteon.com/api/v2/rooms?properties=all", headers(token)
			return JSON(response)
    end

    def self.room_details(token, room_id)
			response = RestClient.get "https://connect.insteon.com/api/v2/rooms/#{room_id}", headers(token)
			return JSON(response)
    end

    private

    def self.headers(token)
      return { :content_type => "application/json", :authentication => "APIKey #{Insteon::Config.api_key}", :authorization => "Bearer #{token}" }
    end

  end
end
