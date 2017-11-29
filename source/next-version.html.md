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
|q| string|  The search string, for example |
|author| string| The author name to search|
|author-id| integer| The author ID|
|fields| string| The parameters of a story, such as headline, slug, section, author ID, story ID, and so on.|
|limit |integer |The number of stories to display. The default is 20. |
|offset |integer |The distance from the start of the array of stories to the reference point in the array. |
|sort| string| Returns stories based on ascending or descending order|  
|published-before| integer| The date in Epoch format|
|published-after| integer | The date in Epoch format|



```

Example Request

http://sketches.quintype.com/api/v1/search?fields=headline%2C%20tags%2Cslug%2C%20last-published-at%2C&limit=5&q=Indian%20cricket" -H "accept: json"


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
                  "meta-description":null,
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
                  "meta-description":null,
                  "slug":"tesla"
               }
            ],
            "slug":"technology/2017/02/23/When-is-Tesla-entering-the-Indian-market",
            "last-published-at":1487840302541
         },
         {  
            "headline":"Viewpoint: How a \u2018breaking\u2019 murder has exposed Indian media",
            "tags":[  
               {  
                  "id":15158,
                  "name":"Murder",
                  "meta-description":null,
                  "slug":"murder"
               },
               {  
                  "id":15496,
                  "name":"Peter Mukherjea",
                  "meta-description":null,
                  "slug":"peter-mukherjea"
               },
               {  
                  "id":15495,
                  "name":"Indrani Mukherjea",
                  "meta-description":null,
                  "slug":"indrani-mukherjea"
               }
            ],
            "slug":"current-affairs/2015/09/03/viewpoint-how-a-breaking-murder-has-exposed-indian-media",
            "last-published-at":1441254770109
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

Example Response

{  
   "stories":[  
      {  
         "author-name":"Michele Maguire",
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
               "parent-id":null,
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
         "author-name":"Sriram Krishnaswamy",
         "headline":"9/11 and the unsolvable Afghan drama  \u00A0",
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



```


## /api/v1/stories/{story-id}

Returns the story details having the mentioned story ID.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|story-id | string| The story ID |

```

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
      "author-name":"Vineet Panjabi",
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
                  "url":"https://www.youtube.com/watch?v=iGpVs3wFKF0#action=share",
                  "embed-url":"https://www.youtube.com/embed/iGpVs3wFKF0#action=share",
                  "metadata":{  

                  },
                  "subtype":null
               },
               {  
                  "description":"",
                  "embed-js":"PGJsb2NrcXVvdGUgY2xhc3M9InR3aXR0ZXItdHdlZXQiPjxwIGxhbmc9ImVuIiBkaXI9Imx0ciI+U2F5IGhlbGxvIHRvIHRoZSBmdXR1cmUuIGlQaG9uZSBYLjwvcD4mbWRhc2g7IEFwcGxlIChAQXBwbGUpIDxhIGhyZWY9Imh0dHBzOi8vdHdpdHRlci5jb20vQXBwbGUvc3RhdHVzLzkwNzcwMDk0MjcxNTIyODE2MCI+U2VwdGVtYmVyIDEyLCAyMDE3PC9hPjwvYmxvY2txdW90ZT4KPHNjcmlwdCBhc3luYyBzcmM9Ii8vcGxhdGZvcm0udHdpdHRlci5jb20vd2lkZ2V0cy5qcyIgY2hhcnNldD0idXRmLTgiPjwvc2NyaXB0Pg==",
                  "page-url":"/story/ef91900e-2a7d-42c6-8ccc-fb75db2a4504/element/f693466d-2c8f-49fa-9d10-d26ff4f05ae3",
                  "type":"jsembed",
                  "family-id":"93146ad5-d1d1-4302-84aa-270696ba144c",
                  "title":"",
                  "id":"f693466d-2c8f-49fa-9d10-d26ff4f05ae3",
                  "metadata":{  
                     "tweet-url":"https://twitter.com/Apple/status/907700942715228160",
                     "provider":"twitter",
                     "tweet-id":"907700942715228160"
                  },
                  "subtype":"tweet"
               }
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
                     "key":"quintype-demo/2016-11/20d960e9-cbb4-46c0-a6cc-3819c326f766/pixelxl-iphone7plus-30.jpg",
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
      "linked-story-ids":[  

      ],
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
      "assignee-name":"Vineet Panjabi"
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
|section ID |string | The section ID of a story|
|fields| string | The parameters of a story, such as headline, slug, sections, author ID, and so on.|


```
Example Response
{  
   "related-stories":[  
      {  
         "headline":"Okuhara reigns at Glasgow",
         "id":"496b653b-cb45-4843-9f1d-273b7a81900b",
         "slug":"sports/2017/08/30/okuhara-reigns-at-glasgow",
         "author-name":"Tapan Bhat"
      },ff
      {  
         "headline":"iPhone X vs Samsung Galaxy Note 8",
         "id":"ef91900e-2a7d-42c6-8ccc-fb75db2a4504",
         "slug":"technology/2017/09/14/iphone-x-vs-samsung-galaxy-note-8",
         "author-name":"Vineet Panjabi"
      },
      {  
         "headline":"9/11 and the unsolvable Afghan drama  \u00A0",
         "id":"8339b599-3eab-4428-9486-9139d28bb1ba",
         "slug":"politics/2017/09/13/afghan-drama",
         "author-name":"Sriram Krishnaswamy"
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
|item-type| string| POssible values are story and collection|
|exclude-story-ids|integer| The story IDs to be excluded from displaying|



## /api/v1/authors/

**Description**

Returns the list of authors with the author name and author ID, along with details such as the author's biodata, gender, twitter handle and so on.

**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|author-id| integer| The author ID |


```

Example Response

{  
   "limit":4,
   "offset":0,
   "total":67
},
"authors":[  
   {  
      "id":2038,
      "name":"Tejas Dinkar",
      "avatar-url":"https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50",
      "avatar-s3-key":null,
      "twitter-handle":null,
      "bio":null,
      "metadata":{  

      },
      "slug":"tejas-dinkar"
   },
   {  
      "id":2039,
      "name":"Amit Rathore",
      "avatar-url":"https://lh5.googleusercontent.com/-nXlfvt-YsVw/AAAAAAAAAAI/AAAAAAAAAI0/uo5Y2_mFdWc/photo.jpg?sz=50",
      "avatar-s3-key":null,
      "twitter-handle":null,
      "bio":null,
      "metadata":{  

      },
      "slug":"amit-rathore"
   },
   {  
      "id":2040,
      "name":"Kuruvilla Choolackal",
      "avatar-url":null,
      "avatar-s3-key":null,
      "twitter-handle":null,
      "bio":null,
      "metadata":{  

      },
      "slug":"kuruvilla-choolackal"
   },
   {  
      "id":2041,
      "name":"Tapan Bhat",
      "avatar-url":null,
      "avatar-s3-key":null,
      "twitter-handle":null,
      "bio":null,
      "metadata":{  

      },
      "slug":"tapan-bhat"
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

Example Response
{  
   "author":{  
      "id":20294,
      "name":"Abhishek Sharma",
      "slug":"abhishek-sharma",
      "avatar-url":"https://lh3.googleusercontent.com/--u4t1uGUkrY/AAAAAAAAAAI/AAAAAAAAABI/i-YkR_YtYio/photo.jpg?sz=50",
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

| Name | Data Type | Description|
|--|--|--|
|


```

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
         "link":"https://www.amazon.in/Five-Point-Someone-Chetan-Bhagat-ebook/dp/B013VO02QI?_encoding=UTF8&keywords=3%20idiots%20book&portal-device-attributes=desktop&qid=1494914950&ref_=sr_1_2&sr=8-2",
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
         "link":"http://www.amazon.in/Old-Man-Sea-Ernest-Hemingway/dp/0099908409/ref=pd_sim_14_6?_encoding=UTF8&psc=1&refRID=1V1575WNWBBDZ9X7PBFK",
         "id":11,
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

