module Bibliovore
  class Library
    def initialize(data, client)
      @client = client
      @data = data
    end

    def id
      @data['id']
    end

    def name
      @data['name']
    end

    def catalog
      @data['catalog_url']
    end

    def locations
      @client.get_endpoint("libraries/#{id}/locations")['locations'].
        map{|a| LibraryLocation.new(a)}
    end

    # Retrieve titles matching a search term
    #
    # @param [String] query The term to search for
    # @param [String] search_type
    # @param [Hash] options Extra options to be passed to the API endpoint
    # @return [TitleResults] A {TitleResults} objects
    #
    # This method simply calls {Client#titles} with its own id as the library
    # parameter.
    def titles(query, search_type='keyword', options={})
      @client.titles(query, id, search_type, options)
    end
  end
end
