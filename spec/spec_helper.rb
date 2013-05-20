require "bibliovore"

RSpec.configure do |config|
  config.before(:each) {
    @client = Bibliovore::Client.new('12345')   
    @client.conn.stub!(:get).and_return('Generic stub needs to be overriden') 
  }
end

LIBRARY_RESPONSE = %q<{
    "library": {
        "id": "examplepl",
        "name": "Example Public Library",
        "catalog_url": "http://examplepl.bibliocommons.com"
    }
}>

NOLIBRARY_RESPONSE = %q<{
    "error": {
        "message": "No library 'nyplsdjkflsdfd' found.",
        "request": "/libraries/nyplsdjkflsdfd?api_key=abcdefghijklmnopqrstuvwx"
    }
}>

LOCATIONS_RESPONSE = %q<{
    "locations": [
        {
            "id": "MA",
            "name": "Main Branch"
        },
        {
            "id": "JP",
            "name": "Johnson Park"
        },
        {
            "id": "RH",
            "name": "Riverdale Heights"
        }
    ] 
}>

LISTS_RESPONSE = %q<{
    "count": 4, 
    "limit": 4, 
    "lists": [
        {
            "created": "2013-03-12T11:14:42Z", 
            "description": null, 
            "details_url": "http://any.bibliocommons.com/list/show/112211221/111111111",
                                                                    
            "id": "111111111", 
            "item_count": 2, 
            "language": "en-US", 
            "list_type": {
                "id": "TOPIC_GUIDE", 
                "name": "Topic Guide"
            }, 
            "name": "My Favorite Science and Nature Books", 
            "updated": "2013-03-12T11:16:51Z", 
            "user": {
                "id": "112211221", 
                "name": "user_1", 
                "profile_url": "http://any.bibliocommons.com/collection/show/112211221"
            }
        }, 
        {
            "created": "2012-11-12T20:26:39Z", 
            "description": null, 
            "details_url": "http://any.bibliocommons.com/list/show/223322332/222222222", 
            "id": "222222222", 
            "item_count": 14, 
            "language": "en-US", 
            "list_type": {
                "id": "TOP_10", 
                "name": "Top 10 List"
            }, 
            "name": "My favourite vampire books", 
            "updated": "2012-11-12T20:29:51Z", 
            "user": {
                "id": "223322332", 
                "name": "user_2", 
                "profile_url": "http://any.bibliocommons.com/collection/show/223322332"
            }
        }, 
        {
            "created": "2012-11-12T19:30:02Z", 
            "description": null, 
            "details_url": "http://any.bibliocommons.com/list/show/334433443/333333333", 
            "id": "333333333", 
            "item_count": 6, 
            "language": "en-US", 
            "list_type": {
                "id": "TOPIC_GUIDE", 
                "name": "Topic Guide"
            }, 
            "name": "My Favorite Stories", 
            "updated": "2012-11-12T19:31:11Z", 
            "user": {
                "id": "334433443", 
                "name": "user_3", 
                "profile_url": "http://any.bibliocommons.com/collection/show/334433443"
            }
        }, 
        {
            "created": "2012-11-12T19:17:06Z", 
            "description": null, 
            "details_url": "http://any.bibliocommons.com/list/show/334433443/444444444", 
            "id": "444444444", 
            "item_count": 8, 
            "language": "en-US", 
            "list_type": {
                "id": "TOP_10", 
                "name": "Top 10 List"
            }, 
            "name": "My Favorite Fairy Tales", 
            "updated": "2012-11-12T19:25:25Z", 
            "user": {
                "id": "334433443", 
                "name": "user_3", 
                "profile_url": "http://any.bibliocommons.com/collection/show/334433443"
            }
        }
    ], 
    "page": 1, 
    "pages": 1
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

TITLES_RESPONSE = %q<{
    "count": 412,
    "limit": 10,
    "page": 1,
    "pages": 42,
    "titles": [
        {
            "authors": [
                {
                    "name": "Melville, Herman"
                }
            ],
            "availability": {
                "id": "AVAILABLE",
                "name": "Available to borrow"
            },
            "details_url": "http://nypl.bibliocommons.com/item/show/18708779052907",
            "format": {
                "id": "PAPERBACK",
                "name": "Paperback"
            },
            "id": "18708779052907",
            "isbns": [
                "0553213113",
                "9780553213119"
            ],
            "primary_language": {
                "name": "English"
            },
            "publication_date": "2003",
            "sub_title": "",
            "title": "Moby-Dick"
        },
        {
            "authors": [
                {
                    "name": "Melville, Herman"
                }
            ],
            "availability": {
                "id": "AVAILABLE",
                "name": "Available to borrow"
            },
            "details_url": "http://nypl.bibliocommons.com/item/show/17230484052907",
            "format": {
                "id": "BK",
                "name": "Book"
            },
            "id": "17230484052907",
            "primary_language": {
                "name": "English"
            },
            "publication_date": "1981",
            "sub_title": "",
            "title": "Moby-Dick"
        },
        {
            "authors": [
                {
                    "name": "Melville, Herman"
                }
            ],
            "availability": null,
            "details_url": "http://nypl.bibliocommons.com/item/show/19655776052907",
            "format": {
                "id": "EBOOK",
                "name": "eBook"
            },
            "id": "19655776052907",
            "isbns": [
                "9781620117002",
                "1620117002"
            ],
            "primary_language": {
                "name": "English"
            },
            "publication_date": "2012",
            "sub_title": "Or, The Whale",
            "title": "Moby Dick"
        },
        {
            "authors": [
                {
                    "name": "Kimmel, Eric A."
                }
            ],
            "availability": {
                "id": "AVAILABLE",
                "name": "Available to borrow"
            },
            "details_url": "http://nypl.bibliocommons.com/item/show/19668330052907",
            "format": {
                "id": "BK",
                "name": "Book"
            },
            "id": "19668330052907",
            "isbns": [
                "9780312662974",
                "0312662971"
            ],
            "primary_language": {
                "name": "English"
            },
            "publication_date": "2012",
            "sub_title": "Chasing the Great White Whale",
            "title": "Moby Dick"
        },
        {
            "authors": [
                {
                    "name": "Wang, Jack"
                }
            ],
            "availability": {
                "id": "AVAILABLE",
                "name": "Available to borrow"
            },
            "details_url": "http://nypl.bibliocommons.com/item/show/19723692052907",
            "format": {
                "id": "BK",
                "name": "Book"
            },
            "id": "19723692052907",
            "isbns": [
                "9781927018118",
                "1927018110"
            ],
            "primary_language": {
                "name": "English"
            },
            "publication_date": "2012",
            "sub_title": "",
            "title": "Moby Dick"
        },
        {
            "authors": [
                {
                    "name": "Melville, Herman"
                }
            ],
            "availability": null,
            "details_url": "http://nypl.bibliocommons.com/item/show/19528936052907",
            "format": {
                "id": "EBOOK",
                "name": "eBook"
            },
            "id": "19528936052907",
            "isbns": [
                "9780062130068",
                "0062130064"
            ],
            "primary_language": {
                "name": "English"
            },
            "publication_date": "2011",
            "sub_title": "",
            "title": "Moby Dick"
        },
        {
            "authors": [],
            "availability": {
                "id": "AVAILABLE_BY_REQUEST",
                "name": "Available by request"
            },
            "details_url": "http://nypl.bibliocommons.com/item/show/18537237052907",
            "format": {
                "id": "BK",
                "name": "Book"
            },
            "id": "18537237052907",
            "isbns": [
                "9780980205527",
                "0980205522"
            ],
            "primary_language": {
                "name": "English"
            },
            "publication_date": "2009",
            "sub_title": "",
            "title": "Moby Dick"
        },
        {
            "authors": [
                {
                    "name": "Stahlberg, Lance"
                }
            ],
            "availability": {
                "id": "AVAILABLE",
                "name": "Available to borrow"
            },
            "details_url": "http://nypl.bibliocommons.com/item/show/18532923052907",
            "format": {
                "id": "PAPERBACK",
                "name": "Paperback"
            },
            "id": "18532923052907",
            "isbns": [
                "9789380028224",
                "9380028229"
            ],
            "primary_language": {
                "name": "English"
            },
            "publication_date": "2010",
            "sub_title": "",
            "title": "Moby Dick"
        },
        {
            "authors": [
                {
                    "name": "Rouaud, Jean"
                }
            ],
            "availability": {
                "id": "AVAILABLE",
                "name": "Available to borrow"
            },
            "details_url": "http://nypl.bibliocommons.com/item/show/19605251052907",
            "format": {
                "id": "BK",
                "name": "Book"
            },
            "id": "19605251052907",
            "isbns": [
                "9788496867659",
                "849686765X"
            ],
            "primary_language": {
                "name": "Spanish"
            },
            "publication_date": "2010",
            "sub_title": "",
            "title": "Moby Dick"
        },
        {
            "authors": [
                {
                    "name": "Melville, Herman"
                }
            ],
            "availability": null,
            "details_url": "http://nypl.bibliocommons.com/item/show/19376808052907",
            "format": {
                "id": "AB",
                "name": "Downloadable Audiobook"
            },
            "id": "19376808052907",
            "isbns": [
                "9781101193648",
                "1101193646"
            ],
            "primary_language": {
                "name": "English"
            },
            "publication_date": "2007",
            "sub_title": "",
            "title": "Moby-Dick"
        }
    ]
}>

COPIES_RESPONSE  = %q<{
    "copies": [
        {
            "call_number": "CLASSICS FIC M",
            "collection": "Countee Cullen Fiction",
            "library_status": "AVAILABLE",
            "location": {
                "id": "52-HT",
                "name": "Countee Cullen"
            },
            "status": {
                "id": "AVAILABLE",
                "name": "Available"
            }
        },
        {
            "call_number": "CLASSICS FIC M",
            "collection": "Muhlenberg Fiction",
            "library_status": "DUE",
            "location": {
                "id": "52-MU",
                "name": "Muhlenberg"
            },
            "status": {
                "id": "UNAVAILABLE",
                "name": "All copies in use"
            }
        },
        {
            "call_number": "CLASSICS FIC M",
            "collection": "Mosholu Fiction",
            "library_status": "AVAILABLE",
            "location": {
                "id": "52-MO",
                "name": "Mosholu"
            },
            "status": {
                "id": "AVAILABLE",
                "name": "Available"
            }
        },
        {
            "call_number": "CLASSICS FIC M",
            "collection": "Inwood Fiction",
            "library_status": "DUE",
            "location": {
                "id": "52-IN",
                "name": "Inwood"
            },
            "status": {
                "id": "UNAVAILABLE",
                "name": "All copies in use"
            }
        },
        {
            "call_number": "CLASSICS FIC M",
            "collection": "Jefferson Market Fiction",
            "library_status": "DUE",
            "location": {
                "id": "52-JM",
                "name": "Jefferson Market"
            },
            "status": {
                "id": "UNAVAILABLE",
                "name": "All copies in use"
            }
        }
    ]
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
                "annotation": "An annotation",
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
                "list_item_type": "url",
                "annotation": "Check out this cool online version of Oliver Twist.",
                "url": {
                  "title": "Oliver Twist by Charles Dickens.",
                  "url": "http://www.online-literature.com/dickens/olivertwist/"
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

GIBBERISH_RESPONSE = %q<{
"finnegan": "riverrun, past Eve and Adam's, from swerve of shore to bend of bay, brings us by a commodius vicus of recirculation back to Howth Castle and Environs."
}>
