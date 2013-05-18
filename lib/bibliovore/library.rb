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
  end
end
