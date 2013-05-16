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

LIST_RESPONSE = %q<{
    "list": {
        "created": "2012-11-12T20:26:39Z",
        "description": null,
        "details_url": "http://any.bibliocommons.com/list/show/137981261/138453972",
        "id": "138453972",
        "item_count": 14,
        "language": "en-US",
        "list_items": [
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [
                        {
                            "name": "Meyer, Stephenie"
                        }
                    ],
                    "details_url": "http://any.bibliocommons.com/item/show/2518461073",
                    "format": {
                        "id": "BK",
                        "name": "Book"
                    },
                    "id": "2518461073",
                    "isbns": [
                        "9780316067935",
                        "9780316067928",
                        "031606792X"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2008",
                    "sub_title": "",
                    "title": "Breaking Dawn"
                }
            },
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [
                        {
                            "name": "Meyer, Stephenie"
                        }
                    ],
                    "details_url": "http://any.bibliocommons.com/item/show/2494676073",
                    "format": {
                        "id": "BK",
                        "name": "Book"
                    },
                    "id": "2494676073",
                    "isbns": [
                        "0316024961",
                        "9780316024969"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2008",
                    "sub_title": "",
                    "title": "New Moon"
                }
            },
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [
                        {
                            "name": "Larbalestier, Justine"
                        }
                    ],
                    "details_url": "http://any.bibliocommons.com/item/show/2797139073",
                    "format": {
                        "id": "BK",
                        "name": "Book"
                    },
                    "id": "2797139073",
                    "isbns": [
                        "9780062089649",
                        "0062089641"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2012",
                    "sub_title": "",
                    "title": "Team Human"
                }
            },
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [
                        {
                            "name": "Harrison, Kim"
                        }
                    ],
                    "details_url": "http://any.bibliocommons.com/item/show/2771526073",
                    "format": {
                        "id": "BK",
                        "name": "Book"
                    },
                    "id": "2771526073",
                    "isbns": [
                        "9780061957895",
                        "0061957895"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2012",
                    "sub_title": "",
                    "title": "A Perfect Blood"
                }
            },
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [
                        {
                            "name": "Smith, L. J."
                        }
                    ],
                    "details_url": "http://any.bibliocommons.com/item/show/2820039073",
                    "format": {
                        "id": "EBOOK",
                        "name": "eBook"
                    },
                    "id": "2820039073",
                    "isbns": [
                        "0062113992",
                        "9780062113993"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2012",
                    "sub_title": "",
                    "title": "The Compelled"
                }
            },
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [
                        {
                            "name": "Grahame-Smith, Seth"
                        }
                    ],
                    "details_url": "http://any.bibliocommons.com/item/show/2635817073",
                    "format": {
                        "id": "BK",
                        "name": "Book"
                    },
                    "id": "2635817073",
                    "isbns": [
                        "0446563080",
                        "9780446563086"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2010",
                    "sub_title": "Vampire Hunter",
                    "title": "Abraham Lincoln"
                }
            },
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [
                        {
                            "name": "Harris, Charlaine"
                        }
                    ],
                    "details_url": "http://any.bibliocommons.com/item/show/2802584073",
                    "format": {
                        "id": "BK",
                        "name": "Book"
                    },
                    "id": "2802584073",
                    "isbns": [
                        "9781937007447",
                        "1937007448"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2012",
                    "sub_title": "",
                    "title": "Deadlocked"
                }
            },
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [
                        {
                            "name": "Clare, Cassandra"
                        }
                    ],
                    "details_url": "http://any.bibliocommons.com/item/show/2767288073",
                    "format": {
                        "id": "BK",
                        "name": "Book"
                    },
                    "id": "2767288073",
                    "isbns": [
                        "9781442416864",
                        "1442416866"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2012",
                    "sub_title": "",
                    "title": "City of Lost Souls"
                }
            },
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [
                        {
                            "name": "Feehan, Christine"
                        }
                    ],
                    "details_url": "http://any.bibliocommons.com/item/show/2845811073",
                    "format": {
                        "id": "BK",
                        "name": "Book"
                    },
                    "id": "2845811073",
                    "isbns": [
                        "9780425255803",
                        "0425255808"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2012",
                    "sub_title": "",
                    "title": "Dark Storm"
                }
            },
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [
                        {
                            "name": "Cronin, Justin"
                        }
                    ],
                    "details_url": "http://any.bibliocommons.com/item/show/2850690073",
                    "format": {
                        "id": "BK",
                        "name": "Book"
                    },
                    "id": "2850690073",
                    "isbns": [
                        "9780345504982",
                        "0345504984"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2012",
                    "sub_title": "A Novel",
                    "title": "The Twelve"
                }
            },
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [
                        {
                            "name": "Harkness, Deborah E."
                        }
                    ],
                    "details_url": "http://any.bibliocommons.com/item/show/2774725073",
                    "format": {
                        "id": "BK",
                        "name": "Book"
                    },
                    "id": "2774725073",
                    "isbns": [
                        "9780670023486",
                        "0670023485"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2012",
                    "sub_title": "",
                    "title": "Shadow of Night"
                }
            },
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [
                        {
                            "name": "Meyer, Stephenie"
                        }
                    ],
                    "details_url": "http://any.bibliocommons.com/item/show/2635165073",
                    "format": {
                        "id": "BK",
                        "name": "Book"
                    },
                    "id": "2635165073",
                    "isbns": [
                        "9780759529434",
                        "0759529434"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2010",
                    "sub_title": "The Graphic Novel. Volume 1",
                    "title": "Twilight"
                }
            },
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [
                        {
                            "name": "Cronin, Justin"
                        }
                    ],
                    "details_url": "http://any.bibliocommons.com/item/show/2645413073",
                    "format": {
                        "id": "BK",
                        "name": "Book"
                    },
                    "id": "2645413073",
                    "isbns": [
                        "9780345504968",
                        "0345504968"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2010",
                    "sub_title": "A Novel",
                    "title": "The Passage"
                }
            },
            {
                "annotation": "",
                "list_item_type": "title",
                "title": {
                    "authors": [],
                    "details_url": "http://any.bibliocommons.com/item/show/2722869073",
                    "format": {
                        "id": "BK",
                        "name": "Book"
                    },
                    "id": "2722869073",
                    "isbns": [
                        "9781607012542",
                        "1607012545"
                    ],
                    "primary_language": {
                        "name": "English"
                    },
                    "publication_date": "2011",
                    "sub_title": "The Recent Undead",
                    "title": "Vampires"
                }
            }
        ],
        "list_type": {
            "id": "TOP_10",
            "name": "Top 10 List"
        },
        "name": "My favourite vampire books",
        "updated": "2012-11-12T20:29:51Z",
        "user": {
            "id": "137981261",
            "name": "natasha47",
            "profile_url": "http://any.bibliocommons.com/collection/show/137981261"
        }
    }
}>