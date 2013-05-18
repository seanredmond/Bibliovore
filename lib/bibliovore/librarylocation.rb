module Bibliovore
  # Encapsulates a library location, to BiblioCommons a distinct physical 
  # location in a library system. 
  class LibraryLocation

    # @return [String] The id (a short tag) of the library location. 
    attr_reader :id

    # @return [String] The name of the library location
    attr_reader :name

    def initialize(data)
      @id = data['id']
      @name = data['name']
    end
  end
end
