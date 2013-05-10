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

    # Retrieve users by name search.
    #
    # @param [String] query The string to search for
    # @return Array An array of User objects matching the query string
    #
    # This will return an empty array if there is no match, or at most one 
    # exact match. The format of the users endpoint implies that it might 
    # someday allow for multiple results.
    def users(query)
      get_endpoint('users', {'q' => query})["users"].map{|u| 
        Bibliovore::User.new(u, self)
      }
    end

    # Retrieve a user by id
    #
    # @param [Fixnum] id The id of the user to retrieve
    # @returns User A new User instance
    def user(id)
      Bibliovore::User.new(
        get_endpoint("users/#{id}")['user'], self
      )
    end

    # Retrieve an endpoint
    #
    # @param [String] path The endpoint path
    # @return [Hash] a parsed JSON object
    def get_endpoint(path, params = {})
      fullpath = "#{@@base}/#{@@version}/#{path}"
      response = @conn.get fullpath, params.merge({"api_key" => @api_key})
      JSON.parse(response.body)
    end
  end
end
