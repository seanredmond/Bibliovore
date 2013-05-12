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
        "request": "/libraries/nyplsdjkflsdfd?api_key=abcdefghijklmnopqrstuvwx"
    }
}>

USER_RESPONSE = %q<{
    "count": 1,
    "limit": 1,
    "page": 1,
    "pages": 1,
    "users": [
        {
            "id": "123456789",
            "name": "unittestuser",
            "profile_url": "http://any.bibliocommons.com/collection/show/123456789"
        }
    ]
}>

NOUSER_RESPONSE = %q<{
    "count": 0,
    "limit": 1,
    "page": 1,
    "pages": 1,
    "users": []
}>

USERID_RESPONSE = %q<{
    "user": {
        "id": "123456789",
        "name": "unittestuser",
        "profile_url": "http://any.bibliocommons.com/collection/show/123456789"
    }
}>

NOUSERID_RESPONSE = %q<{
    "error": {
        "message": "No user '123456789' found.",
        "request": "/users/123456789?api_key=abcdefghijklmnopqrstuvwx"
    }
}>