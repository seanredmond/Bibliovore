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

USERLISTS_RESPONSE = %q<{
    "count": 2,
    "limit": 10,
    "lists": [
        {
            "created": "2012-11-12T19:30:02Z",
            "description": "First list description",
            "details_url": "http://any.bibliocommons.com/list/show/123456789/987654321",
            "id": "987654321",
            "item_count": 6,
            "language": "en-US",
            "list_type": {
                "id": "TOPIC_GUIDE",
                "name": "Topic Guide"
            },
            "name": "First list name",
            "updated": "2012-11-12T19:31:11Z"
        },
        {
            "created": "2012-11-12T19:17:06Z",
            "description": "Second list description",
            "details_url": "http://any.bibliocommons.com/list/show/138443571/876543210",
            "id": "876543210",
            "item_count": 8,
            "language": "en-US",
            "list_type": {
                "id": "TOP_10",
                "name": "Top 10 List"
            },
            "name": "Second list name",
            "updated": "2012-11-12T19:25:25Z"
        }
    ],
    "page": 1,
    "pages": 1
}>

TITLE_RESPONSE = %q<{
    "authors": [
        {
            "name": "Lastname, Firstname"
        }
    ],
    "availability": {
        "id": "AVAILABLE",
        "name": "Available to borrow"
    },
    "details_url": "http://nypl.bibliocommons.com/item/show/12345678901234",
    "format": {
        "id": "BK",
        "name": "Book"
    },
    "id": "12345678901234",
    "isbns": [
        "0987654321098",
        "5678901234"
    ],
    "primary_language": {
        "name": "English"
    },
    "publication_date": "2010",
    "sub_title": "The Book Subtitle",
    "title": "The Book Title"
}>