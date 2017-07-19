require_relative '../api'

module Fluffy
  class Session
    class Addressbook
      include Fluffy::API

      # @return [String] The session endpoint
      attr_reader :endpoint

      # Create an addressbook instance for a given session
      #
      # @param endpoint [String] API session endpoint
      #
      def initialize(endpoint:)
        @endpoint = endpoint + ['addressbook']
      end

      # Retrieve the session addressbook
      #
      # @return [Hash] The session addressbook
      #
      def get
        @@api.get(endpoint: self.endpoint)
      end

      # Add a new entry in the session addressbook
      #
      # @param name [String] Entry name
      # @param **params [Hash] Any number of parameters to push into the Hash
      # @return [Hash, nil] API response
      #
      def add(name:, **params)
        @@api.post(endpoint: self.endpoint + [name], params: params)
      end

      # Update an existing entry in the session addressbook
      #
      # @param name [String] Entry name
      # @param **params [Hash] Any number of parameters to push into the Hash
      # @return [Hash, nil] API response
      #
      def update(name:, **params)
        @@api.patch(endpoint: self.endpoint + [name], params: params)
      end

      # Delete an entry from the session addressbook
      #
      # @param name [String] Entry name
      # @return [Hash, nil] API response
      #
      def delete(name:)
        @@api.delete(endpoint: self.endpoint + [name])
      end
    end
  end
end
