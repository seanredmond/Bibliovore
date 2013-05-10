module Bibliovore
  # Parent class for all Collectnik errors
  class BibliovoreError < StandardError
  end

  # Indicates a invalid page has been requested from a result set
  class ApiError < BibliovoreError
  end
end