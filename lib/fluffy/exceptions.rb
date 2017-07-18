module Fluffy
  class APIError < Exception
    # @return [Integer] HTTP error code
    attr_reader :code
    # @return [String] Reason for error message
    attr_reader :error

    def initialize(msg, error, code)
      @code = code
      @error = error

      super(msg)
    end
  end
end
