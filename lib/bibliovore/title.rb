require 'ostruct'

module Bibliovore
  class Title

    # @return [Bibliovore::Client] The Client object
    attr_reader :client

    def initialize(data, client)
      @client = client
      @data = data
    end

    def id
      @data['id']
    end

    def isbns
      @data['isbns']
    end

    def title
      @data['title']
    end

    def subtitle
      @data['sub_title']
    end


    def details
      @data['details_url']
    end

    def authors
      @data['authors'].map{|a| OpenStruct.new(a)}
    end

    def availability
      OpenStruct.new(@data['availability'])
    end

    def available?
      return @data['availability']['id'] === 'AVAILABLE'
    end

    def format
      OpenStruct.new(@data['format'])
    end

    def language
      @data['primary_language']['name']
    end

    def publication_date
      @data['publication_date']
    end
  end
end
