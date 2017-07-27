require 'httpclient'
require 'json'

#require_relative 'api'
require_relative 'sessions'

module Fluffy
  class Client
    include Fluffy::API

    # @return [Fluffy::Sessions] Sessions instance
    attr_reader :sessions

    # Create a new client
    #
    # @param url [String] Fluffy REST API's URL
    # @param version [Integer] API version (defaults to `1`)
    #
    def initialize(url:, version: 1)
      @url = url
      @version = version
      @@api = RESTClient.new(url: URI.join(url, "v#{version}"))
      @sessions = Sessions.new
    end

    # Retrieve the active addressbook
    #
    # @return [Hash] List of addresses
    #
    def addressbook
      @@api.get(endpoint: "addressbook")
    end

    # Retrieve the active rules
    #
    # @return [Hash] List of rules
    #
    def rules
      @@api.get(endpoint: "rules")
    end

    # Retrieve the active chains
    #
    # @return [Hash] List of chains
    #
    def chains
      @@api.get(endpoint: "chains")
    end

    # Retrieve the active interfaces
    #
    # @return [Hash] List of interfaces
    #
    def interfaces
      @@api.get(endpoint: "interfaces")
    end

    # Retrieve the active services
    #
    # @return [Hash] List of services
    #
    def services
      @@api.get(endpoint: "services")
    end

    # Retrieve the active rollback checks
    #
    # @return [Hash] List of rollback checks
    #
    def services
      @@api.get(endpoint: "rollback_checks")
    end
  end
end
