module Bibliovore
  class User
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
  end
end
