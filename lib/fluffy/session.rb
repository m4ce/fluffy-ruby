require_relative 'session/addressbook'
require_relative 'session/services'
require_relative 'session/rules'
require_relative 'session/interfaces'
require_relative 'session/chains'

module Fluffy
  class Session
    include Fluffy::API

    # @return [Fluffy::Session::Addressbook] The session addressbook
    attr_reader :addressbook
    # @return [Fluffy::Session::Services] The session services
    attr_reader :services
    # @return [Fluffy::Session::Rules] The session rules
    attr_reader :rules
    # @return [Fluffy::Session::Interfaces] The session interfaces
    attr_reader :interfaces
    # @return [Fluffy::Session::Chains] The session chains
    attr_reader :chains
    # @return [String] The session endpoint
    attr_reader :endpoint

    # Create a new session
    #
    # @param name [String] Session name
    # @param owner [String] Session owner
    # @param ttl [Integer] Session time-to-live
    #
    def initialize(name:, owner:, ttl:)
      @endpoint = ["sessions", name]

      # create session
      @@api.post(endpoint: @endpoint, params: {'owner' => owner, 'ttl' => ttl})

      @addressbook = Addressbook.new(endpoint: @endpoint)
      @services = Services.new(endpoint: @endpoint)
      @rules = Rules.new(endpoint: @endpoint)
      @interfaces = Interfaces.new(endpoint: @endpoint)
      @chains = Chains.new(endpoint: @endpoint)
    end

    # Commit the session configuration
    #
    # @param rollback [Boolean] Enable rollback `defaults to false`
    # @param rollback_interval [Integer] Rollback configuration at the given interval (seconds) `defaults to 60`
    #
    def commit!(rollback: true, rollback_interval: 60)
      @@api.post(endpoint: self.endpoint + ['commit'], params: params)
    end

    # Confirm the session configuration
    #
    def confirm!
      @@api.post(endpoint: self.endpoint + ['confirm'])
    end

    # Destroy the session
    #
    def destroy!
      @@api.delete(endpoint: self.endpoint)
    end
  end
end
