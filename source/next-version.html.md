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

code goes here

```

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


|author| string| The author name to search|
|author-id| integer| The author ID|
|fields| string| The parameters of a story, such as headline, slug, section, author ID, story ID, and so on.|
|limit |integer |The number of stories to display. The default is 20. |
|offset |integer |The distance from the start of the array of stories to the reference point in the array. |
|sort| string| Returns stories based on ascending or descending order|  
|published-before| integer| The date in Epoch format
|published-after| integer | The date in Epoch format


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



## /api/v1/stories-by-slug/


**Description**

Returns the story by the story slug. The output contains information such as the story author name, author ID, tags, sections, cards, and the metadata associated with that story.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|slug| string| The slug for the desired story|


## /api/v1/stories/{story-id}/related-stories

**Description**
Returns the stories that are related to the mentioned story ID.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|


## /api/v1/collections/

**Description**
Returns the list of collections.


**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|slug| string| The slug for the desired collection|
|item-type| string| |
|exclude-story-ids|integer| The story IDs to be excluded from displaying|





## /api/v1/authors/

**Description**

Returns the list of authors with the author name and author ID, along with details such as the author's biodata, gender, twitter handle and so on.

**Input Parameters**

| Name | Data Type | Description|
|--|--|--|
|author-id| integer| The author ID |





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

