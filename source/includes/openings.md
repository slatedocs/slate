# Openings

The Openings API lets you retrieve all openings.

### Attributes 

Attribute   | Description
----------- | -----------
id          | <strong>string</strong> 
title       | <strong>string</strong>  
description | <strong>string</strong>  
location.city | <strong>string</strong>  
location.state | <strong>string</strong>  
location.country | <strong>string</strong>  
tags | <strong>list</strong>  
is_private | <strong>boolean</strong>
is_archived | <strong>boolean</strong>
application_email | <strong>string</strong>
hosted_url | <strong>string</strong>
created_on | <strong>timestamp</strong>
modified_on | <strong>timestamp</strong>

## List of all Openings


```shell
curl "https://api.recruiterbox.com/v1/openings" \
  -u "{key}:"
```

> The above command returns JSON structured like this:

```json
{
  "openings": [
  {
    "id": 42075,
    "title": "UX - Engineer",
    "description": "UX - Engineer",
    "location": { "city": "Bangalore", "state": "KA", "country": "India"},
    "tags": ["Dev","UX"],
    "is_private": false,
    "is_archived": false,
    "application_email": "demoaccount-DMCC0203@applications.recruiterbox.com",
    "hosted_url": "https://demoaccount.recruiterbox.com/jobs/ad3e",
    "created_on": 1413437038,
    "modified_on": 1413445073 
  }],
  "meta": { "total_count":1, "limit": 20, "offset": 0}
}
```

This endpoint retrieves all openings.

### HTTP Request

`GET https://api.recruiterbox.com/v1/openings/`

### Filter Query Parameters

Parameter | Description
--------- | -------------
tags | 
city |
state | 
country |
title | 
description | 
is_archived |
is_private |
created_on |
modified_on |

## Get a specific Opening


```shell
curl "https://api.recruiterbox.com/v1/openings/42075"
  -u "{key}:"
```

> The above command returns JSON structured like this:

```json
{
  "opening": {
    "id": 42075,
    "title": "UX - Engineer",
    "description": "UX - Engineer",
    "location": { "city": "Bangalore", "state": "KA", "country": "India"},
    "tags": ["Dev","UX"],
    "is_private": false,
    "is_archived": false,
    "application_email": "demoaccount-DMCC0203@applications.recruiterbox.com",
    "hosted_url": "https://demoaccount.recruiterbox.com/jobs/ad3e",
    "created_on": 1413437038,
    "modified_on": 1413445073 
  }
}
```

This endpoint retrieves a specific opening.


### HTTP Request

`GET https://api.recruiterbox.com/v1/openings/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the opening to retrieve

