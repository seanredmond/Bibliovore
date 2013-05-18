module Bibliovore
  # Parent class for all Collectnik errors
  class BibliovoreError < StandardError
  end

  # Indicates a invalid page has been requested from a result set
  class ApiError < BibliovoreError
  end

  # Indicates that the response couldn't be interpreted as a BiblioCommons API
  # object or a proper error reponse
  class UnrecognizableJSON < BibliovoreError
  end
end