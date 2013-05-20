module Bibliovore
  # Circulation status of a title or copy
  class Status
    # @return [String] The id (a short tag) of the status. 
    attr_reader :id

    # @return [String] The name (human-readable) status
    attr_reader :name

    def initialize(data)
      @id = data['id']
      @name = data['name']
    end
  end
end