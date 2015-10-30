require 'rest_client'
require 'json'

module Insteon
  class Config
    attr_reader :callback, :api_key, :state

    def self.callback
      "http://localhost:3000/insteon/authenticate/token"
    end

    def self.api_key
      ENV["INSTEON_KEY"]
    end

    def self.state
      ENV["INSTEON_STATE"]
    end

  end
end
