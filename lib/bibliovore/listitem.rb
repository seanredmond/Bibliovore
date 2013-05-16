module Bibliovore
  class ListItem

    # @return [Bibliovore::Client] The Client object
    attr_reader :client

    def initialize(data, client)
      @client = client
      @data = data
    end

    def type
      @data['list_item_type']
    end

    def annotation
      @data['annotation']
    end

    def title
      if type == 'title'
        return Bibliovore::Title.new(@data['title'], @client)
      end

      return nil
    end

    def url
      if type == 'url'
        return OpenStruct.new(@data['url'])
      end

      return nil
    end
  end
end

