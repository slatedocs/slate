---
title: API Documentation

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction to Quintype APIs



# API name


## /api/v1/search/

**Description**

Returns a list of stories.

**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|q| string|  The search string |
|author| string| The author name |
|author-id| integer| The author ID|
|fields| string| The parameters of a story, such as headline, slug, section, author ID, story ID, and so on.|
|limit |integer |The number of stories to display. The default is 20. |
|offset |integer |The distance from the start of the array of stories to the reference point in the array. |
|sort| string| Returns stories based on ascending or descending order|  
|published-before| integer| The date in Epoch format|
|published-after| integer | The date in Epoch format|



```

Example Request

$ curl -X GET "http://sketches.quintype.com/api/v1/search?fields=headline%2C%20tags%2Cslug%2C%20last-published-at%2C&limit=5&q=Indian%20cricket" -H "accept: json"


Example Response

{  
   "results":{  
      "from":0,
      "size":5,
      "total":45,
      "stories":[  
         {  
            "headline":"L&T to build world\u2019s biggest cricket stadium at Motera",
            "tags":[  
               {  
                  "id":275035,
                  "name":"National",
                  "slug":"national"
               }
            ],
            "slug":"national/2016/12/09/storystadiumabc",
            "last-published-at":1482220906320
         },
         {  
            "headline":"When is Tesla entering the Indian market?",
            "tags":[  
               {  
                  "id":331448,
                  "name":"Tesla",
                  "slug":"tesla"
               }
            ],
            "slug":"technology/2017/02/23/When-is-Tesla-entering-the-Indian-market",
            "last-published-at":1487840302541
         },
         {  
            "headline":"9/11 and the unsolvable Afghan drama  \u00A0",
            "tags":[  
               {  
                  "id":17518,
                  "name":"Dhoni",
                  "meta-description":null,
                  "slug":"dhoni"
               },
               {  
                  "id":505844,
                  "name":"indiabq",
                  "meta-description":null,
                  "slug":"indiabq"
               }
            ],
            "slug":"politics/2017/09/13/afghan-drama",
            "last-published-at":1505284207024
         },
         {  
            "headline":"Okuhara reigns at Glasgow",
            "tags":[  
               {  
                  "id":496336,
                  "name":"Sindhu",
                  "meta-description":null,
                  "slug":"sindhu"
               },
               {  
                  "id":496337,
                  "name":"Badminton",
                  "meta-description":null,
                  "slug":"badminton"
               }
            ],
            "slug":"sports/2017/08/30/okuhara-reigns-at-glasgow",
            "last-published-at":1508911796773
         }
      ],
      "term":"Indian cricket"
   }
}

```



## /api/v1/stories/

**Description**

Returns a list of stories and the story details, such as the author name and author ID, story headline, story slug, the list of sections ID and section name that the story belongs to, story template, metadata, and so on.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
| section-id | integer | The section ID of a story |
| section | string | The name of a section |
|fields|string|The parameters of a story, such as headline, slug, section, author ID, story ID, and so on. |
|limit|integer|The number of stories to display. The default is 20. |
|offset|integer|The distance from the start of the array of stories to the reference point in the array. |
|story-order|string|Displays stories in the specified order, such as top, last-updated, and so on. |
|template|string|The name of the story template. For example, video, live-blog, photo-story, and so on. |
|tag|string|The name of the tags. |
|randomize|string|Displays list of random stories. |
|not-story-content-ids | string |The stories other than the mentioned story IDs. |



```
Example Request

$ curl -X GET "http://sketches.quintype.com/api/v1/stories?limit=2  -H "accept: json"

Example Response

{  
   "stories":[  
      {  
         "author-name":"Michele Mag",
         "headline":"Dangal reviews: Aamir Khan gets a salute from all of Bollywood",
         "slug":"entertainment/2016/12/23/storyabcphoto",
         "last-published-at":1504268716413,
         "alternative":{  

         },
         "sections":[  
            {  
               "id":81,
               "name":"Entertainment",
               "display-name":"Entertainment",
               "slug":"entertainment",
               "collection":null
            }
         ],
         "hero-image-metadata":{  
            "width":640,
            "height":480,
            "mime-type":"image/jpeg",
            "focus-point":[  
               326,
               240
            ]
         },
         "published-at":1504268716413,
         "id":"01436fae-fb15-42e5-9b3b-e57b93de21f0",
         "hero-image-s3-key":"quintype-demo/2016-12/f6c8408d-0d2d-46e8-8818-6c481f13365e/dangal.jpg",
         "author-id":5278,
         "first-published-at":1482482240320,
         "story-template":"photo",
         "metadata":{  
            "card-share":{  
               "shareable":true
            }
         }
      },
      {  
         "author-name":"Sriram K",
         "headline":"9/11 and the unsolvable Afghan drama",
         "slug":"politics/2017/09/13/afghan-drama",
         "last-published-at":1505284207024,
         "alternative":{  

         },
         "sections":[  
            {  
               "id":83,
               "name":"Politics",
               "display-name":null,
               "slug":"politics",
               "parent-id":null,
               "collection":{  
                  "id":4364,
                  "name":"The Quint",
                  "slug":"the-quint"
               }
            },
            {  
               "id":98,
               "name":"Current Affairs",
               "display-name":null,
               "slug":"current-affairs",
               "parent-id":null,
               "collection":null
            }
         ],
         "hero-image-metadata":{  
            "width":5120,
            "height":3620,
            "focus-point":[  
               3977,
               737
            ]
         },
         "published-at":1505284207024,
         "id":"8339b599-3eab-4428-9486-9139d28bb1ba",
         "hero-image-s3-key":"quintype-demo/2016-07/1910bb30-b118-475c-aced-9304968c69c8/G-1.jpg",
         "author-id":61657,
         "first-published-at":1505284207024,
         "story-template":null,
         "metadata":{  
            "card-share":{  
               "shareable":true
            }
         }
      }
   ]
}

```


## /api/v1/stories-by-slug/


**Description**

Returns the story having the mentioned slug. The output contains information such as the story author name, author ID, tags, sections, cards, and the metadata associated with that story.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|slug| string| The slug for the desired story|


```
Example Request

$ curl -X GET "http://sketches.quintype.com/api/v1/stories-by-slug?slug=columns/2017/12/05/what-we-do"  -H "accept: json"

Example Response

{  
   "story":{  
      "updated-at":1512455351309,
      "assignee-id":181082,
      "author-name":"Mohan",
      "headline":"What we do",
      "story-content-id":"d0cd42fd-43dd-45b9-8f72-b0e8bfe5fed5",
      "slug":"columns/2017/12/05/test-what-we-do",
      "last-published-at":1512455358961,
      "content-created-at":1512455051337,
      "owner-name":"Mohan",
      "publisher-id":78,
      "published-at":1512455358961,
      "status":"published",
      "cards":[  
         {  
            "story-elements":[  
               {  
                  "description":"",
                  "page-url":"/story/d0cd42fd-43dd-45b9-8f72-b0e8bfe5fed5/element/8cce4630-31d7-4ea0-8950-82aad9c8d33a",
                  "type":"text",
                  "id":"8cce4630-31d7-4ea0-8950-82aad9c8d33a",
                  "metadata":{  
                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer feugiat nisi sed elementum egestas. Duis ut pretium neque. Mauris vestibulum suscipit purus vestibulum semper. Donec elementum augue sem. Sed id eros accumsan, elementum ipsum eu, mattis arcu. Vestibulum eget ipsum est. Proin dapibus ornare odio, eget placerat justo placerat eu."
                  },
                  "subtype":"blurb",
                  "text":"<blockquote>This is a note.</blockquote>",

               },
               {  
                  "description":"",
                  "page-url":"/story/d0cd42fd-43dd-45b9-8f72-b0e8bfe5fed5/element/3aef7afc-83a3-42ae-b41a-efe2896c5a2f",
                  "type":"text",
                  "id":"3aef7afc-83a3-42ae-b41a-efe2896c5a2f",

               },
               "card-updated-at":1512455301695,
               "content-version-id":"da0ed0a6-c26a-46cc-b185-8e2f3fe2f128",
               "card-added-at":1512455301695,
               "status":"draft",
               "id":"de9aa0cf-0d3c-4fcf-86d6-4a25bac857fe",
               "version":1,
               "story-version-id":"e06cef66-0926-4652-9358-b7c27b5f44f3",
               "content-type":"story",
               "author-id":181082,
               "version":4,
               "created-at":1512455344038,
               "assignee-name":"Mohan",

            ]
         }
      ]
   }
}

```


## /api/v1/stories/{story-id}

Returns the story details having the mentioned story ID.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|story-id | string| The story ID |

```
$ curl -X GET "http://sketches.quintype.com/api/v1/stories/ef91900e-2a7d-42c6-8ccc-fb75db2a4504"  -H "accept: json"

Example Response

{  
   "story":{  
      "updated-at":1505384172777,
      "seo":{  
         "meta-description":"comparison between iphone X and galaxy s8",
         "meta-title":"smartphone, apple vs samsung",
         "meta-keywords":[  

         ],
         "meta-google-news-standout":false,
         "claim-reviews":{  
            "story":null
         }
      },
      "assignee-id":323432,
      "author-name":"Vineet",
      "tags":[  
         {  
            "id":257701,
            "name":"iphone;",
            "meta-description":null,
            "slug":"iphone"
         },
         {  
            "id":506781,
            "name":"smartphone",
            "meta-description":null,
            "slug":"smartphone"
         }
      ],
      "headline":"iPhone X vs Samsung Galaxy Note 8",
      "storyline-id":null,
      "votes":{  

      },
      "story-content-id":"ef91900e-2a7d-42c6-8ccc-fb75db2a4504",
      "slug":"technology/2017/09/14/iphone-x-vs-samsung-galaxy-note-8",
      "last-published-at":1505384184330,
      "subheadline":"A battle for smartphone dominance",
      "alternative":{  

      },
      "sections":[  
         {  
            "id":84,
            "name":"Technology",
            "display-name":null,
            "slug":"technology",
            "parent-id":null,
            "collection":null
         }
      ],
      "content-created-at":1505383805868,
      "owner-name":"Vineet Panjabi",
      "custom-slug":null,
      "push-notification":null,
      "publisher-id":15,
      "hero-image-metadata":{  
         "width":616,
         "height":347,
         "mime-type":"image/jpeg",
         "focus-point":[  
            418,
            169
         ]
      },
      "comments":null,
      "entities":{  

      },
      "published-at":1505384184330,
      "breaking-news-linked-story-id":null,
      "storyline-title":null,
      "summary":"Iphone vs Samsung",
      "canonical-url":null,
      "autotags":[  

      ],
      "linked-entities":[  

      ],
      "status":"published",
      "hero-image-attribution":null,
      "bullet-type":"123",
      "id":"ef91900e-2a7d-42c6-8ccc-fb75db2a4504",
      "hero-image-s3-key":"quintype-demo/2016-11/20d960e9-cbb4-46c0-a6cc-3819c326f766/pixelxl-iphone7plus-30.jpg",
      "cards":[  
         {  
            "story-elements":[  
               {  
                  "description":"",
                  "page-url":"/story/ef91900e-2a7d-42c6-8ccc-fb75db2a4504/element/690b7304-d875-484a-9850-33c9eb360537",
                  "type":"youtube-video",
                  "family-id":"7267f6e8-808c-455b-81aa-6bd0dd8c7ad5",
                  "title":"",
                  "id":"690b7304-d875-484a-9850-33c9eb360537",
               },
            ],
            "card-updated-at":1505384055361,
            "content-version-id":"6445d74d-1079-4244-a5a1-5b8403cf88cc",
            "card-added-at":1505383805931,
            "status":"draft",
            "id":"afce3ef4-1036-4c1f-9d0e-997cde4dda4d",
            "content-id":"afce3ef4-1036-4c1f-9d0e-997cde4dda4d",
            "version":3,
            "metadata":{  
               "social-share":{  
                  "shareable":true,
                  "title":"iPhone X vs Samsung Galaxy Note 8",
                  "message":"Iphone vs Samsung",
                  "image":{  
                     "key":"pixelxl-iphone7plus-30.jpg",
                     "url":null,
                     "attribution":null,
                     "caption":"Best in class.",
                     "metadata":{  
                        "width":616,
                        "height":347,
                        "mime-type":"image/jpeg",
                        "focus-point":[  
                           418,
                           169
                        ]
                     }
                  }
               }
            }
         }
      ],
      "story-version-id":"1603c682-699e-48ea-9354-7e265ca7c1f8",
      "content-type":"story",
      "content-updated-at":1509011137120,
      "author-id":323432,
      "owner-id":323432,
      "access":null,
      "first-published-at":1505384184330,
      "hero-image-caption":"Best in class.",
      "version":4,
      "story-template":"video",
      "sequence-no":null,
      "created-at":1505384127930,
      "authors":null,
      "metadata":{  
         "card-share":{  
            "shareable":true
         }
      },
      "publish-at":null,
      "assignee-name":"Vineet
   }
}

```


## /api/v1/stories/{story-id}/related-stories

**Description**
Returns the stories that are related to the mentioned story ID.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|story-id |string | The story ID|
|section-id |string | The section ID of a story|
|fields| string | The parameters of a story, such as headline, slug, sections, author ID, and so on.|


```
Example Request

$ curl -X GET "http://sketches.quintype.com/api/v1/stories/db09a326-3af2-4286-a92b-8ffbc9bb3c4f/related-stories?fields=headline,id,slug,author-name"  -H "accept: json"

Example Response
{  
   "related-stories":[  
      {  
         "headline":"Okuhara reigns at Glasgow",
         "id":"496b653b-cb45-4843-9f1d-273b7a81900b",
         "slug":"sports/2017/08/30/okuhara-reigns-at-glasgow",
         "author-name":"Tapan"
      },ff
      {  
         "headline":"iPhone X vs Samsung Galaxy Note 8",
         "id":"ef91900e-2a7d-42c6-8ccc-fb75db2a4504",
         "slug":"technology/2017/09/14/iphone-x-vs-samsung-galaxy-note-8",
         "author-name":"Vineet"
      },
      {  
         "headline":"9/11 and the unsolvable Afghan drama",
         "id":"8339b599-3eab-4428-9486-9139d28bb1ba",
         "slug":"politics/2017/09/13/afghan-drama",
         "author-name":"Sriram"
      }
   ]
}

```



## /api/v1/collections/{slug}

**Description**
Returns the collection based on the slug.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|slug| string| The slug for the desired collection|
|item-type| string| Possible values are story and collection|
|exclude-story-ids|integer| The story IDs to be excluded from displaying|

```
Example Request

$ curl -X GET "http://sketches.quintype.com/api/v1/collections/history-trails  -H "accept: json"

Example Response

{
   "updated-at": 1506933499956,
   "slug": "history-trails",
   "name": "History Trails",
   "automated": false,
   "template": "default",
   "rules": {
      "content-type": "story",
      "collection-id": 7587
   },
   "summary": "History Trails",
   "id": 7587,
   "total-count": 1,
   "items": [
      {
         "id": 7584,
         "type": "collection",
         "name": "History Trails Main",
         "slug": "history-trails-main",
         "template": "default"
      }
   ],
   "created-at": 1493208539891,
   "metadata": {
   "cover-image": {}
   }
}
```

## /api/v1/authors/

**Description**

Returns the list of authors with the author name and author ID, along with details such as the author's biodata, gender, twitter handle and so on.

**Input Parameters**

None.


```
Example Request

$ curl -X GET "http://sketches.quintype.com/api/v1/authors -H "accept: json"

Example Response

{  
   "limit":4,
   "offset":0,
   "total":67
},
"authors":[  
   {  
      "id":2038,
      "name":"Dinjas,
      "avatar-url":"https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50",
      "avatar-s3-key":null,
      "twitter-handle":null,
      "bio":null,
      "metadata":{  

      },
      "slug":"dinjas"
   },
   {  
      "id":2039,
      "name":"Ramit",
      "avatar-url":"https://lh5.googleusercontent.com/-nXlfvt-YsVw/AAAAAAAAAAI/AAAAAAAAAI0/uo5Y2_mFdWc/photo.jpg?sz=50",
      "avatar-s3-key":null,
      "twitter-handle":null,
      "bio":null,
      "metadata":{  

      },
      "slug":"ramit"
   },
   {  
      "id":2040,
      "name":"Villackal",
      "avatar-url":null,
      "avatar-s3-key":null,
      "twitter-handle":null,
      "bio":null,
      "metadata":{  

      },
      "slug":"villackal"
   },
   {  
      "id":2041,
      "name":"Tapan",
      "avatar-url":null,
      "avatar-s3-key":null,
      "twitter-handle":null,
      "bio":null,
      "metadata":{  

      },
      "slug":"tapan"
   }
]
}

```

## /api/v1/authors/{author-id}

**Description**

Returns the list of authors with the author name and author ID, along with details such as the author's biodata, gender, twitter handle and so on.

**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|author-id| integer| The author ID |


```

Example Request

$ curl -X GET "http://sketches.quintype.com/api/v1/authors/20294 -H "accept: json"

Example Response
{  
   "author":{  
      "id":20294,
      "name":"Abhishek Sharma",
      "slug":"abhishek-sharma",
      "avatar-s3-key":null,
      "twitter-handle":null,
      "bio":null,
      "metadata":{  

      }
   }
}
```


## /api/v1/config


**Description**

Displays the publisher's configurations, such as the publisher name and ID, SEO metadata, the sections and menu items, and so on.

**Input Parameters**

None.


## /api/v1/breaking-news

**Description**

Returns the list of breaking news.

**Input Parameters**

None.

```
Example Request

$ curl -X GET "http://sketches.quintype.com/api/v1/breaking-news" -H "accept: json"

Example Response

{
  "stories": [
    {
      "author-name": "Pragati Saxena",
      "headline": "7 killed in Kabul suicide bombing  ",
      "slug": "{{section}}/{{slug}}",
      "last-published-at": 1510830370210,
      "alternative": {},
      "sections": [],
      "hero-image-metadata": null,
      "published-at": 1510830370210,
      "id": "f3932791-c827-4e88-be67-6e9af6505e3c",
      "hero-image-s3-key": null,
      "author-id": 117631,
      "first-published-at": 1510830370210,
      "story-template": "breaking-news",
      "metadata": {
        "card-share": {
          "shareable": false
        }
    },
      "author-name": "Pragati Saxena",
      "headline": "Notorious cult leader Charles Manson dead  ",
      "slug": "{{section}}/{{slug}}",
      "last-published-at": 1511164690641,
      "alternative": {},
      "sections": [],
      "hero-image-metadata": null,
      "published-at": 1511164690641,
      "id": "83b5d292-31ae-452f-98e7-5d7b05a06f2a",
      "hero-image-s3-key": null,
      "author-id": 117631,
      "first-published-at": 1511164690641,
      "story-template": "breaking-news",
      "metadata": {
        "card-share": {
         "shareable": false
       }
    }
  ]
}

```

##/api/v1/entities/

**Description**

Lists all entities.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|q| string|  The search string, for example |
|limit|integer|The number of stories to display. The default is 20. |
|offset|integer|The distance from the start of the array of stories to the reference point in the array. |
|id | integer| The ID of an entity|
|ids| string | A list of entity IDs |


```
Example Request

curl -X GET "http://sketches.quintype.com/api/v1/entities?limit=2&type=book" -H "accept: json"


Example Response

{  
   "entities":[  
      {  
         "updated-at":1494924456440,
         "publisher-id":15,
         "name":"Five Point Someone",
         "type":"book",
         "entity-type-id":1,
         "deleted-at":null,
         "created-by":61657,
         "id":12,
         "last-updated-by":61657,
         "created-at":1494924456440
      },
      {  
         "updated-at":1494921231049,
         "publisher-id":15,
         "name":"The Old Man and the Sea",
         "type":"book",
         "entity-type-id":1,
         "deleted-at":null,
         "created-by":94890,
         "last-updated-by":94890,
         "created-at":1494921231049
      }
   ],
   "total":7
}


```

##/api/v1/entities/{id}

**Description**

Lists the entity having the specified ID.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
| ID | integer| The entity ID|


```

Example Request

curl -X GET "http://sketches.quintype.com/api/v1/entities/12" -H "accept: json"


Example Response
{  
   "entity":{  
      "updated-at":1494924456440,
      "publisher-id":15,
      "name":"Five Point Someone",
      "type":"book",
      "entity-type-id":1,
      "deleted-at":null,
      "created-by":61657,
      "id":12,
      "last-updated-by":61657,
      "created-at":1494924456440
   }
}

```


##/api/v1/entities/{id}/{subentity+}

**Description**

Lists the subentity details in relation to the entity ID.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
| ID | integer| The entity ID|
|subentity |string | A nested entity name|


```

The following request fetches the list of companies established in the year 2015. A relationship had been created between the entities (entity-type) `year` and `companies` 

Example Request
curl -X GET "http://sketches.quintype.com/api/v1/entities/15557/companies-established-year

Example Response

{
   "relationships": {
      "self": [
         {
            "entity-type": "year",
            "name": "2015",
            "rank": 1,
            "relationship": "self",
            "deleted-at": null,
            "created-by": 232469,
            "id": 15557,
            "last-updated-by": 232469,
            "created-at": 1498647361780
         }
      ],
      "companies-year": [
         {
            "entity-type": "companies-established",
            "name": "The companies established in 2015",
            "rank": 2,
            "relationship": "companies-established-year",
            "id": 21697,
            "companies-established-year": [
               ....  // A list of companies established in 2015
            ],
            "companies-established-year": {
               "id": 15557,
               "name": "2015"
            },
         "last-updated-by": 232469,
         "created-at": 1498648880350,
         }
      ]
   }
}

``` 

##/api/v1/bulk

**Description**

Sends a batch of API requests. 


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|



##/api/stories/{story-id}/votes

**Description**

 Adds vote to the specified story. Note that the user has to be logged in.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|story-id | String| The story ID|



##/api/stories/{story-id}/votes

**Description**

Fetches the total number of votes for the specified ID. Note that the user has to be logged in.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|story-id | String| The story ID|



##/stories.rss

**Description**




**Input Parameters**

| Name | Data Type | Description|
|--|--|--|


```
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:media="http://search.yahoo.com/mrss/" xmlns:sy="http://purl.org/rss/1.0/modules/syndication/">
    <channel> 
        <title>Platform</title> 
        <link>http://platform.rio.staging.quintype.io</link> 
        <description>Platform</description> 
        <atom:link href="http://platform.rio.staging.quintype.io/stories.rss?time-period=last-1-month" rel="self" type="application/rss+xml"></atom:link> 
        <language>en-US</language> 
        <lastBuildDate>Tue,
19Dec 2017 04:40:45+0000</lastBuildDate> 
        <sy:updatePeriod>hourly</sy:updatePeriod> 
        <sy:updateFrequency>1</sy:updateFrequency> 
        <item> 
    <title>Indian opener Rohit Sharma’s record-setting third career double hundred.</title> 
    <link>http://platform.rio.staging.quintype.io/southnews/2017/12/18/indian-opener-rohit-sharmas-record-setting-third-career-double-hundred</link> 
    <comments>http://platform.rio.staging.quintype.io/southnews/2017/12/18/indian-opener-rohit-sharmas-record-setting-third-career-double-hundred#comments</comments> 
    <guid isPermaLink="false">d6cde3a3-eb2b-4eb3-8fff-cd746a4f0d19</guid> 
    <pubDate>Mon,
18Dec 2017 11:31:48+0000</pubDate> 
    <atom:updated>2017-12-18T11:31:48.852Z</atom:updated> 
    <atom:author> 
        <atom:name>tester</atom:name> 
        <atom:uri>/api/author/178214</atom:uri> 
    </atom:author> 
    <description></description> 
    <media:keywords></media:keywords> 
    <category>SouthNews</category> 
    <category>cricket</category> 
    <content:encoded> 
        <![  
   CDATA   [  
      <p>Indian opener Rohit Sharma’s record-setting third career double hundred.</p>
   ]
]> 
    </content:encoded> 
</item> 
<item> 
<title> 
GST Network Brings In Option For Filing Of Forms On Monthly Or Quarterly Basis 
</title> 
<link> 
https://swarajyamag.com/insta/gst-network-brings-in-option-for-filing-of-forms-on-monthly-or-quarterly-basis 
</link> 
<comments> 
https://swarajyamag.com/insta/gst-network-brings-in-option-for-filing-of-forms-on-monthly-or-quarterly-basis#comments 
</comments> 
<guid isPermaLink="false">20a996a0-80ba-4bed-b961-a3d5064bff40</guid> 
<pubDate>Tue,
19Dec 2017 03:13:36+0000</pubDate> 
<atom:updated>2017-12-19T03:13:36.812Z</atom:updated> 
<atom:author> 
<atom:name>Swarajya Staff</atom:name> 
<atom:uri>/api/author/17513</atom:uri> 
</atom:author> 
<description> 
<![  
   CDATA   [  
      Taxpayers with annual aggregate turnover up to Rs1.5 crore in the previous financial year can avail the option of filing quarterly returns.
   ]
]> 
</description> 
<media:keywords>GSTN,
GST Return,
Quarterly</media:keywords> 
<media:content height="249" url="https://images.assettype.com/swarajya/2017-11/8b4f08c4-c333-4953-b649-330641d1b341/unnamed.jpg" width="448"> 
<media:title type="html"> 
<![  
   CDATA   [  
      GSTN logo
   ]
]> 
</media:title> 
</media:content> 
<media:thumbnail url="https://images.assettype.com/swarajya/2017-11/8b4f08c4-c333-4953-b649-330641d1b341/unnamed.jpg?w=280" width="280"/> 
<category>Insta</category> 
<content:encoded> 
<![  
   CDATA   [  
      <p>Goods and services tax network (GSTN),
      the IT backbone of the new tax regime,
      on Monday said it has put a new function on its portal to allow taxpayers choose the frequency of filing GSTR 1 form on quarterly or monthly basis.</p><p>Taxpayers with annual aggregate turnover up to Rs1.5 crore in the previous financial year or anticipated in the current financial year can avail the option of filing quarterly returns. Form GSTR 1 summarises all the sales of a taxpayer.</p><p>This has been done as per decision taken in the 23rd GST Council meeting. After giving their option,
      taxpayers can file GSTR 1 for the relevant return periods,
      the GSTN said in a statement.</p><p>It further said that taxpayers who opt for quarterly filing will have to select the last month of the quarter from the drop down menu. Further,
      all taxpayers who opt for monthly filing can now file GSTR 1 from August onwards till November. Filing of return of previous month is mandatory.</p><p>GSTN has been set up to provide IT infrastructure and services to the central as well as state governments,
      taxpayers and other stakeholders for implementation of the GST,
      which came into force on 1 July this year. <strong>(PTI)</strong></p>
   ]
]> 
</content:encoded> 
</item> 
</channel> 
</rss>

```


##/api/v1/bulk

**Description**




**Input Parameters**

| Name | Data Type | Description|
|--|--|--|



##/api/v1/bulk

**Description**




**Input Parameters**

| Name | Data Type | Description|
|--|--|--|

#(H1) this is testing only

* open in new tab

<a href="https://github.com/gja/rack-delete_cookies_from_public_requests" target="_blank">PHP </a>in GitHub

<!--Welcome to the Kittn API! You can use our API to access Kittn API endpoints, which can get information on various cats, kittens, and breeds in our database.

We have language bindings in Shell, Ruby, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](https://github.com/tripit/slate). Feel free to edit it and use it as a base for your own API's documentation. 

# Authentication using name

> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint retrieves a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete-->

