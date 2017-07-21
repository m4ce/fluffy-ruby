require_relative 'session'

module Fluffy
  class Sessions
    include Fluffy::API

    # @return [String] Sessions API endpoint
    attr_reader :endpoint

    # Create a Sessions object
    #
    # @param api [Fluffy::Client::API] Client API instance
    #
    def initialize
      @endpoint = ['sessions']
    end

    # Retrieve the active sessions
    #
    # @return [Hash] List of sessions
    #
    def get
      @@api.get(endpoint: self.endpoint)
    end

    # Create a new session
    #
    # @param name [String] Session key
    # @param **params [Hash] Any number of session parameters to push into the Hash
    # @return [Fluffy::Session] Session instance
    #
    def add(name:, **params)
      Session.new(name: name, **params)
    end

    # Delete a session
    #
    # @param name [String] Session key
    # @return [nil]
    #
    def delete(name:)
      @@api.delete(endpoint: self.endpoint + [name])
    end
  end
end
