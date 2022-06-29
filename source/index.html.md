---
title: Vendor Review

language_tabs: # must be one of https://git.io/vQNgJ

  - shell
  - ruby
  - javascript
  - cURL
  -JSON


toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/wc-marketplace/wc-marketplace.github.io'>Contribute to WCMp REST API Docs</a>
  - <a href='https://wc-marketplace.com/knowledgebase/wcmp-hooks-filters/'>WCMp Hooks & Filters</a>
  - <a href='https://wc-marketplace.com/support-forum/forum/wcmp-core/'>WCMp Support</a>
  - <a href='https://wc-marketplace.com/'>WCMp Official Website</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true

meta:
  - name: Vendors Review 
    content: Documentation for the Vendors Review API
---

# VENDORS - REVIEWS


This API request help you retrieve all the vendor's review



<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# Get all reviews from a vendor 


> The above command returns JSON structured like this:

```json
[
  
{
    "id": 6,
    "rating_count": 3,
    "avg_rating": "2.0",
    "reviews_list": [
        {
            "id": 471,
            "review_content": "Nice album!",
            "review_rating": 2,
            "reviewer_id": "11",
            "reviewer_name": "abc",
            "reviewer_email": "abc@gmail.com",
            "reviewer_verified": false,
            "date_created": "2022-03-04T12:08:14",
            "_links": {
                "self": [
                    {
                        "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6/reviews/471"
                    }
                ],
                "collection": [
                    {
                        "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6/reviews"
                    }
                ],
                "up": [
                    {
                        "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6"
                    }
                ]
            }
        },
        {
            "id": 299,
            "review_content": "Nice vendor!",
            "review_rating": 2,
            "reviewer_id": "1",
            "reviewer_name": "superadmin",
            "reviewer_email": "neda@dualcube.com",
            "reviewer_verified": false,
            "date_created": "2022-02-28T10:19:55",
            "_links": {
                "self": [
                    {
                        "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6/reviews/299"
                    }
                ],
                "collection": [
                    {
                        "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6/reviews"
                    }
                ],
                "up": [
                    {
                        "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6"
                    }
                ]
            }
        },
        {
            "id": 469,
            "review_content": "Nice album!",
            "review_rating": 2,
            "reviewer_id": "11",
            "reviewer_name": "abc",
            "reviewer_email": "abc@gmail.com",
            "reviewer_verified": false,
            "date_created": "2022-02-28T10:05:59",
            "_links": {
                "self": [
                    {
                        "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6/reviews/469"
                    }
                ],
                "collection": [
                    {
                        "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6/reviews"
                    }
                ],
                "up": [
                    {
                        "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6"
                    }
                ]
            }
        }
    ]
}


]
```

list of all the vendors reviews created on your site by calling the WCMp vendors API and using the GET method.

### HTTP Request

`GET [site_url]/wp-json/wcmp/v1/vendors/[vendor_id]/reviews`

### Query Parameters

Parameter |  Description
--------- | -----------
Id  | Unique identifier for the resource  
rating_count | The total rating of a vendor   
avg_rating | Shows the average rating of the vendor 
reviews_list| The list of vendor review 
vendor_id | Unique identifier for the vendor  
review_id | Unique identifier for a review 
reviewer_id   | The data that the reviewer has created 


<aside class="success">
Remember — insert correct site URL and vendor ID !
</aside>

# Get single review of a vendor 

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
curl "http://example.com/api/kittens/2" \
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
    "id": 471,
    "review_content": "Nice album!",
    "review_rating": 2,
    "reviewer_id": "11",
    "reviewer_name": "abc",
    "reviewer_email": "abc@gmail.com",
    "reviewer_verified": false,
    "date_created": "2022-03-04T12:08:14",
    "_links": {
        "self": [
            {
                "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6/reviews/471"
            }
        ],
        "collection": [
            {
                "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6/reviews"
            }
        ],
        "up": [
            {
                "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6"
            }
        ]
    }
}


```


List of of a single  vendors reviews created on your site by calling the WCMp vendors API and using the GET method.


<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`POST [site_url]/wp-json/wcmp/v1/vendors/[vendor_id]/reviews/[review_id]`

### URL Parameters

Parameter | Description
--------- | -----------
vendor_id | Unique identifier for the vendor 
reviews_id | Unique identifier for a review 
review_content | Displays the particular review posted 
review_rating | Displays the particular review 
reviewer_name | Displays the name of the reviewer 
reviewer_email | Displays  the reviewers email  address
reviewer_verified | Displays the verified status of the reviewer  
date_created | Displays the verified status of the reviewer  


# Create a new vendor review: 

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
curl "http://example.com/api/kittens/2" \
  -X DELETE \
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
    "id": 3,
    "review_content": "HAPPY CUSTOMER!",
    "review_rating": 2,
    "reviewer_id": "4",
    "reviewer_name": "abc",
    "reviewer_email": "abc@gmail.com",
    "reviewer_verified": false,
    "date_created": "2022-05-13T06:44:44",
    "_links": {
        "self": [
            {
                "href": "http://wcmpdemos.com/demo1/wp-json/wcmp/v1/vendors/2/reviews/3"
            }
        ],
        "collection": [
            {
                "href": "http://wcmpdemos.com/demo1/wp-json/wcmp/v1/vendors/2/reviews"
            }
        ],
        "up": [
            {
                "href": "http://wcmpdemos.com/demo1/wp-json/wcmp/v1/vendors/2"
            }
        ]
    }
}

```


A new vendor review can be created by calling this MultivenorX API and by using the POST method


### HTTP Request

`POST [site_url]/wp-json/wcmp/v1/vendors/[vendor_id]/reviews`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

# Update a single vendor review: 


> The above command returns JSON structured like this:

```json
{
    "id": 474,
    "review_content": "Nice vendor!",
    "review_rating": 2,
    "reviewer_id": "11",
    "reviewer_name": "abc",
    "reviewer_email": "abc@gmail.com",
    "reviewer_verified": false,
    "date_created": "2022-03-16T06:28:10",
    "_links": {
        "self": [
            {
                "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6/reviews/474"
            }
        ],
        "collection": [
            {
                "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6/reviews"
            }
        ],
        "up": [
            {
                "href": "http://wcmpdemos.com/neda/wp-json/wcmp/v1/vendors/6"
            }
        ]
    }
}


```

A single vendor review can be created by calling this MultivenorX API and by using the POST method :

### HTTP Request

`POST [site_url]/wp-json/wcmp/v1/vendors/[vendor_id]/reviews/[review_id]`


# Delete  a  vendor review: 


Remove a vendor review  by calling this MultivendorX vendors API and using the DELETE method.

### HTTP Request

`DELETE [site_url]/wp-json/wcmp/v1/vendors/[vendor_id]/reviews/[review_id]`
