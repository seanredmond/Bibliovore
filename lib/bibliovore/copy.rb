module Bibliovore

  # Circulation information for copies of titles in individual library 
  # locations
  class Copy

    # @return [Bibliovore::LibraryLocation] The location of the copies
    attr_reader :location
    attr_reader :status

    def initialize(data)
      @data = data
      @location = LibraryLocation.new(@data['location'])
      @status = Status.new(@data['status'])
    end

    # @return [String] The collection to which the copies belong
    def collection
      @data['collection']
    end

    # @return [String] The call number
    def call_number
      @data['call_number']
    end

    # @return [String] Circulation status of the copies
    def library_status
      @data['library_status']
    end
  end
end
