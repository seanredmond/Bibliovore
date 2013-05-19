module Bibliovore
  class Client
    @@base = 'https://api.bibliocommons.com'
    @@version = 'v1'

    # @return [Faraday::Connection] The connection object
    attr_reader :conn

    # Create a Bibliovore client
    #
    # @param [String] api_key Your API key. The shirt and shoes of API service
    # @return Client A new instance of Client
    def initialize(api_key)
      @api_key = api_key
      @conn = Faraday.new
    end

    # def conn
    #   @conn
    # end

    # Get a library by id
    #
    # @param [String] id The library id
    # @return Library A new Library instance
    def library(id)
      Bibliovore::Library.new(
        get_endpoint("libraries/#{id}", 'library'), self
      )
    end

    # Get the most recently created lists. Currently this only return the four
    # most recently created lists.
    #
    # @return [Array] an Array of {List} objects
    def lists
      get_endpoint('lists')["lists"].map{|l| 
        Bibliovore::List.new(l, self)
      }
    end

    # Retrieve a list by id
    #
    # @param [Fixnum] id The id of the list to retrieve
    # @return {List} A new List instance
    def list(id)
      Bibliovore::List.new(
        get_endpoint("lists/#{id}", 'list'), self
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
      get_endpoint('users', nil, {'q' => query})["users"].map{|u| 
        Bibliovore::User.new(u, self)
      }
    end

    # Retrieve a user by id
    #
    # @param [Fixnum] id The id of the user to retrieve
    # @returns User A new User instance
    def user(id)
      Bibliovore::User.new(
        get_endpoint("users/#{id}", 'user'), self
      )
    end

    # Retrieve an endpoint
    #
    # @param [String] path The endpoint path
    # @raise [Bibliovore::ApiError] if asd dsa dsad
    # @return [Hash] a parsed JSON object
    def get_endpoint(path, key = nil, params = {})
      fullpath = "#{@@base}/#{@@version}/#{path}"
      response = @conn.get fullpath, params.merge({"api_key" => @api_key})
      data = JSON.parse(response.body)

      # This an error response
      if data.keys.include?('error')
        raise Bibliovore::ApiError, data['error']['message']
      end

      # If we aren't looking for a particular field in the JSON response, just
      # return the whole thing
      if key == nil
        return data
      end

      # If we are looking for a particular field ('library', 'users') check
      # that the field is there and return its value
      if data.keys.include?(key)
        return data[key]
      end

      # Well, we were looking for a particular field, but we didn't find it
      raise Bibliovore::UnrecognizableJSON, 
        "Couldn't interpret response: #{data.inspect}"
    end
  end
end
