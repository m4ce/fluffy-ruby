module Fluffy
  class Session
    class Rules
      include Fluffy::API

      # @return [String] The session endpoint
      attr_reader :endpoint

      # Create a rules instance for a given session
      #
      # @param endpoint [String] API session endpoint
      #
      def initialize(endpoint:)
        @endpoint = endpoint + ['rules']
      end

      # Retrieve the session rules
      #
      # @return [Hash] The session rules
      #
      def get
        @@api.get(endpoint: self.endpoint)
      end

      # Add a new entry in the session rules
      #
      # @param name [String] Entry name
      # @param **params [Hash] Any number of parameters to push into the Hash
      # @return [Hash, nil] API response
      #
      def add(name:, **params)
        @@api.post(endpoint: self.endpoint + [name], params: params)
      end

      # Update an existing entry in the session rules
      #
      # @param name [String] Entry name
      # @param **params [Hash] Any number of parameters to push into the Hash
      # @return [Hash, nil] API response
      #
      def update(name:, **params)
        @@api.post(endpoint: self.endpoint + [name], params: params)
      end

      # Delete an entry from the session rules
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
