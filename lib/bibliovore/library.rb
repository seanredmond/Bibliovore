module Bibliovore
  class Library
    def initialize(data, client)
      @client = client
      @data = data['library']
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
      Hash[@client.get_endpoint("libraries/#{id}/locations")['locations'].
        map(&:values).map(&:flatten)]
    end
  end
end
