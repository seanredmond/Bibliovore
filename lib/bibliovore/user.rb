module Bibliovore
  class User

    # @return [Bibliovore::Client] The Client object
    attr_reader :client

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

    def profile
      @data['profile_url']
    end

    def lists
      @client.get_endpoint("users/#{id}/lists")["lists"].map{|l| 
        Bibliovore::List.new(l, self)
      }
    end
  end
end
