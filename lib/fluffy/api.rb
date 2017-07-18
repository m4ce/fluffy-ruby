module Fluffy
  module API
    @@api = nil

    def self.api
      @@api
    end

    # @return [HTTPClient] HTTP client instance
    attr_reader :http
    # @return [String] Fluffy REST API's URL
    attr_reader :url

    # Create a Fluffy Client API object
    #
    # @param url [String] Fluffy REST API's URL
    #
    def initialize(url:)
      @http = HTTPClient.new
      @url = url
    end

    # Perform a HTTP GET request
    #
    # @param endpoint [Array[String], String] HTTP API endpoint
    # @param query [String] HTTP API query parameters
    # @return [Array[Hash], Hash] API JSON response
    #
    def get(endpoint:, query: nil)
      resp = self.http.get([self.url, endpoint.is_a?(Array) ? endpoint.join('/') : endpoint].join('/'), query, {'Content-Type' => 'application/json', 'Accept' => 'application/json'})
      JSON.parse(resp.body)
    end

    # Perform a HTTP POST request
    #
    # @param endpoint [Array[String], String] HTTP API endpoint
    # @param params [Hash] HTTP API body
    # @return [Hash, nil] API JSON response
    #
    def post(endpoint:, params: {})
      puts [self.url, endpoint.is_a?(Array) ? endpoint.join('/') : endpoint].join('/')
      resp = self.http.post([self.url, endpoint.is_a?(Array) ? endpoint.join('/') : endpoint].join('/'), params.to_json, {'Content-Type' => 'application/json', 'Accept' => 'application/json'})
      JSON.parse(resp.body)
    end

    # Perform a HTTP DELETE request
    #
    # @param endpoint [Array[String], String] HTTP API endpoint
    # @return [Hash, nil] API JSON response
    #
    def delete(endpoint:)
      resp = self.http.delete([self.url, endpoint.is_a?(Array) ? endpoint.join('/') : endpoint].join('/'), {'Content-Type' => 'application/json', 'Accept' => 'application/json'})
      JSON.parse(resp.body)
    end
  end
end
