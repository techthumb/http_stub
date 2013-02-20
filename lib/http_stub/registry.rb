module HttpStub

  class Registry

    def initialize
      @stubs = []
    end

    def add(stub, request)
      @stubs.unshift(stub)
      request.logger.info "Stub registered: #{stub}"
    end

    def find_for(request)
      request.logger.info "Finding stub fulfilling: #{request.inspect}"
      @stubs.find { |stub| stub.stubs?(request) }
    end

    def clear(request)
      request.logger.info "Clearing stubs"
      @stubs.clear
    end

  end

end