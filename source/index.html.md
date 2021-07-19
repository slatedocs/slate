---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - php

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true
---

# Introduction

Welcome to FluentCRM API doc. This doc will describe the REST API Endpoints of FluentCRM.

This example API documentation page was created with [Slate](https://github.com/slatedocs/slate). If you find any typo or would like contribute please send a pull request with improvments.

# Authentication

FluentCRM use WordPress REST API. So you can use any authorization method that supports Wordpress.

### Basic Authorization
Once you create your Application Password in WordPress, Add Authorization Header to every request.

> Example API Call for contacts

```shell
# With shell, you can just pass the correct header with each request
curl "https://yourdomain.com/wp-json/fluent-crm/v2/subscribers" \
  -H "Authorization: BASIC API_USERNAME:API_PASSWORD"
```

### Basic Informations

**API Base URL:** `https://yourdomain.com/wp-json/fluent-crm/v2`


> Make sure to replace `API_USERNAME` & `API_PASSWORD` with your UserName & API Password.


# Contacts

## Get All Contacts

```shell
curl "https://yourdomain.com/wp-json/fluent-crm/v2/subscribers" \
  -H "Authorization: BASIC API_USERNAME:API_PASSWORD"
```
> The above command returns JSON structured like this:

```json
{
  "current_page": 1,
  "per_page": 10,
  "from": 1,
  "to": 10,
  "last_page": 493,
  "total": 9860,
  "data": [
    {
      "id": "9860",
      "user_id": "5984",
      "hash": "4a6f1ed89704814c100a954ec403cd2f",
      "contact_owner": "string",
      "company_id": "string",
      "prefix": "string",
      "first_name": "Kelli",
      "last_name": "Hand",
      "email": "sonny.pacocha@example.net",
      "timezone": "string",
      "address_line_1": "string",
      "address_line_2": "string",
      "postal_code": "string",
      "city": "string",
      "state": "string",
      "country": "string",
      "ip": "string",
      "latitude": "string",
      "longitude": "string",
      "total_points": "0",
      "life_time_value": "0",
      "phone": "string",
      "status": "subscribed",
      "contact_type": "lead",
      "source": "wp_users",
      "avatar": "string",
      "date_of_birth": "string",
      "created_at": {},
      "last_activity": "string",
      "updated_at": "string",
      "photo": "https://www.gravatar.com/avatar/4a6f1ed89704814c100a954ec403cd2f?s=128",
      "full_name": "Kelli Hand",
      "tags": [
        {
          "id": "2",
          "title": "Fluent Forms Users",
          "slug": "fluent-forms-users",
          "description": "string",
          "created_at": {},
          "updated_at": {},
          "pivot": {
            "subscriber_id": "9860",
            "object_id": "2",
            "object_type": "FluentCrm\\App\\Models\\Tag",
            "created_at": {},
            "updated_at": {}
          }
        }
      ],
      "lists": [
        {
          "id": "1",
          "title": "List Item 1",
          "slug": "list-item-1",
          "description": "string",
          "is_public": "0",
          "created_at": {},
          "updated_at": {},
          "pivot": {
            "subscriber_id": "9860",
            "object_id": "1",
            "object_type": "FluentCrm\\App\\Models\\Lists",
            "created_at": {},
            "updated_at": {}
          }
        }
      ]
    }
  ]
}
```

This endpoint retrieves all Contact.

### HTTP Request

`GET https://yourdomain.com/wp-json/fluent-crm/v2/subscribers`

### Query Parameters

Parameter | Type | Description | Default
--------- | ------- | ----------- | -------
| per_page |  int | Records per page | 10 |
| page |    int   | Page Number for Pagination | 1 |
| search | string | Search Parameter for filtering contacts | |
| tags | array | Tag Ids to filter contacts | |
| lists | array | List Ids to filter contacts | |
| statuses | array | Status slugs to filter contacts | |
| order_by | string | Order By contact column Value to sort contacts | id |
| order_type | string | Order Type contact column Value to sort contacts | DESC |
| __with_custom_fields | boolean | Flag to get custom contact field values too |  |

***Possible statuses values:***
- subscribed
- unsubscribed
- pending
- bounced
- complained

<aside class="success">
Remember — Use authentication Headers
</aside>

## Get a Specific Contact


```shell
curl "https://yourdomain.com/wp-json/fluent-crm/v2/subscribers/<ID>" \
  -H "Authorization: BASIC API_USERNAME:API_PASSWORD"
```

> The above command returns JSON structured like this:

```json
{
   "subscriber":{
      "id":"7743",
      "user_id":"1",
      "hash":"5acfbfb0e8135fe5a1e36bb40d90ad69",
      "contact_owner":null,
      "company_id":null,
      "prefix":null,
      "first_name":"JeweldddXXX",
      "last_name":"JewelZZZ",
      "email":"cep.jewel@gmail.com",
      "timezone":null,
      "address_line_1":"283ddd",
      "address_line_2":"sda",
      "postal_code":"34521",
      "city":"New",
      "state":"ME",
      "country":"US",
      "ip":"127.0.0.1",
      "latitude":null,
      "longitude":null,
      "total_points":"0",
      "life_time_value":"0",
      "phone":"01723371621",
      "status":"subscribed",
      "contact_type":"lead",
      "source":"woocommerce",
      "avatar":null,
      "date_of_birth":null,
      "created_at":"2021-07-17 21:08:30",
      "last_activity":"2021-07-18 13:45:42",
      "updated_at":"2021-07-18 20:22:48",
      "user_edit_url":"https:\/\/wp.lab\/wp-admin\/profile.php",
      "stats":{
         "emails":0,
         "opens":0,
         "clicks":0
      },
      "custom_values":{
         "some_number_field":"10",
         "checkbox":[
            "Value Option 1"
         ]
      },
      "photo":"https:\/\/www.gravatar.com\/avatar\/5acfbfb0e8135fe5a1e36bb40d90ad69?s=128",
      "full_name":"JeweldddXXX JewelZZZ",
      "tags":[
         {
            "id":"1",
            "title":"FluentCRM Users",
            "slug":"fluentcrm-users",
            "description":null,
            "created_at":"2021-07-17 21:06:25",
            "updated_at":"2021-07-17 21:06:25",
            "pivot":{
               "subscriber_id":"7743",
               "object_id":"1",
               "object_type":"FluentCrm\\App\\Models\\Tag",
               "created_at":"2021-07-19 17:30:52",
               "updated_at":"2021-07-19 17:30:52"
            }
         }
      ],
      "lists":[
         {
            "id":"1",
            "title":"List Item 1",
            "slug":"list-item-1",
            "description":null,
            "is_public":"0",
            "created_at":"2021-07-17 21:01:59",
            "updated_at":"2021-07-17 21:01:59",
            "pivot":{
               "subscriber_id":"7743",
               "object_id":"1",
               "object_type":"FluentCrm\\App\\Models\\Lists",
               "created_at":"2021-07-17 21:08:30",
               "updated_at":"2021-07-17 21:08:30"
            }
         }
      ]
   }
}
```

This endpoint retrieves a specific contact.

### HTTP Request

`GET https://yourdomain.com/wp-json/fluent-crm/v2/subscribers/<ID>`

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
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

