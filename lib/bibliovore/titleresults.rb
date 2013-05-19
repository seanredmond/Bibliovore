module Bibliovore
  class TitleResults

    # @return [Bibliovore::Client] The Client object
    attr_reader :client

    def initialize(data, client)
      @client = client
      @data = data
      @titles = @data['titles'].map{|t| Bibliovore::Title.new(t, @client)}
    end

    def count
      @data['count']
    end

    def limit
      @data['limit']
    end

    def page
      @data['page']
    end

    def pages
      @data['pages']
    end

    def titles
      @titles
    end
  end
end

