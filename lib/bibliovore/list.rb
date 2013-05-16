module Bibliovore
  class List

    # @return [Bibliovore::Client] The Client object
    attr_reader :client

    def initialize(data, client)
      @client = client
      @data = data
    end

    def created
      @data['created']
    end

    def description
      @data['description']
    end

    def details
      @data['details_url']
    end

    def id
      @data['id']
    end

    def item_count
      @data['item_count']
    end

    def type
      OpenStruct.new(@data['list_type'])
    end

    def name
      @data['name']
    end

    def updated
      @data['updated']
    end

    def user
      Bibliovore::User.new(@data['user'], @client)
    end

    def items
      @data['list_items'].map{|i| Bibliovore::ListItem.new(i, @client)}
    end
  end
end
