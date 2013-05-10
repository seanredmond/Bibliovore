require "bibliovore"

LIBRARY_RESPONSE = %q<{
    "library": {
        "catalog_url": "http://unittestlibrary.bibliocommons.com",
        "id": "unittestlibrary",
        "name": "Unit Test Library"
    }
}>

NOLIBRARY_RESPONSE = %q<{
    "error": {
        "message": "No library 'nyplsdjkflsdfd' found.",
        "request": "/libraries/nyplsdjkflsdfd?api_key=few2vjhmdnhjhw7xnajj9wxt"
    }
}>
