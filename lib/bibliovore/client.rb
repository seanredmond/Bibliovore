module Bibliovore
  class Client
    @@base = 'https://api.bibliocommons.com'
    @@version = 'v1'

    # Create a Bibliovore client
    #
    # @param [String] api_key Your API key. The shirt and shoes of API service
    # @return Client A new instance of Client
    def initialize(api_key)
      @api_key = api_key
      @conn = Faraday.new
    end

    # Get a library by id
    #
    # @param [String] id The library id
    # @return Library A new Library instance
    def library(id)
      Bibliovore::Library.new(
        get_endpoint("libraries/#{id}"), self
      )
    end

    # Retrieve an endpoint
    #
    # @param [String] path The endpoint path
    # @return [Hash] a parsed JSON object
    def get_endpoint(path)
      fullpath = "#{@@base}/#{@@version}/#{path}"
      response = @conn.get fullpath, {"api_key" => @api_key}
      JSON.parse(response.body)
    end
  end
end
