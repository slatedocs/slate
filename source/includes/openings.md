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
curl https://api.recruiterbox.com/v1/openings \
 -u {key}:
```
> The above command returns JSON structured like this:

```json
{
    "objects": [
      {
        "id": "a42f3",
        "title": "UX - Engineer",
        "description": "UX - Engineer",
        "location": {
          "city": "San Jose",
          "state": "CA",
          "country": "USA"
        },
        "tags": ["Dev","UX"],
        "is_private": false,
        "is_archived": false,
        "application_email": "demoaccount-DMCC0203@app.recruiterbox.com",
        "hosted_url": "https://demoaccount.recruiterbox.com/jobs/ad3e",
        "created_on": 1413437038,
        "modified_on": 1413445073
      }
    ],
    "meta": {
      "total_count":1,
      "limit": 20,
      "offset": 0
    }
}
```

This endpoint retrieves all openings.

### HTTP Request

`GET https://api.recruiterbox.com/v1/openings/`

### Query Parameters

Parameter | Description
--------- | -------------
tags | Filter by tags
city | Filter by city
state | Filter by state
country | Filter by country
title | Filter by title
description | Filter by description
is_archived | Filter by archived openings
is_private | Filter by private / public openings
created_on__gt |  Filter by created date greater than a given timestamp
modified_on__gt | Filter by modified date greater than a given timestamp
created_on__lt |  Filter by created date lesser than a given timestamp
modified_on__lt | Filter by modified date lesser than a given timestamp
order_by | Sort by created_on, modified_on attributes. Use "-" to sort in descending order


## Get a specific Opening


```shell
curl https://api.recruiterbox.com/v1/openings/a42f3 \
  -u {key}:
```
> The above command returns JSON structured like this:

```json
{
  "id": "a42f3",
  "title": "UX - Engineer",
  "description": "UX - Engineer",
  "location": { "city": "San Jose", "state": "CA", "country": "USA"},
  "tags": ["Dev","UX"],
  "is_private": false,
  "is_archived": false,
  "application_email": "demoaccount-DMCC0203@app.recruiterbox.com",
  "hosted_url": "https://demoaccount.recruiterbox.com/jobs/ad3e",
  "created_on": 1413437038,
  "modified_on": 1413445073
}
```

This endpoint retrieves a specific opening.


### HTTP Request

`GET https://api.recruiterbox.com/v1/openings/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | ID of the opening to retrieve


## Get application form fields of a Opening


```shell
curl https://api.recruiterbox.com/v1/openings/a42f3/application_form \
  -u {key}:
```
> The above command returns JSON structured like this:

```json
{
    "objects": [
        {
            "is_disabled": false,
            "label": "First Name",
            "choices": [],
            "key": "candidate_first_name",
            "position": 0,
            "is_required": true,
            "type": "small_text"
        },
        {
            "is_disabled": false,
            "label": "Last Name",
            "choices": [],
            "key": "candidate_last_name",
            "position": 1,
            "is_required": false,
            "type": "small_text"
        },
        {
            "is_disabled": false,
            "label": "Email",
            "choices": [],
            "key": "candidate_email",
            "position": 2,
            "is_required": true,
            "type": "email"
        },
        {
            "is_disabled": true,
            "label": "Phone",
            "choices": [],
            "key": "candidate_phone",
            "position": 3,
            "is_required": true,
            "type": "small_text"
        },
        {
            "is_disabled": false,
            "label": "Resume",
            "choices": [],
            "key": "resume",
            "position": 4,
            "is_required": false,
            "type": "file"
        },
        {
            "is_disabled": false,
            "label": "Age",
            "choices": [
                "18 - 25",
                "26 - 32",
                "33+"
            ],
            "key": "age",
            "position": 5,
            "is_required": false,
            "type": "select_one"
        }
    ],
    "meta": {
        "total": 6,
        "limit": 6,
        "offset": 0
    }
}
```

This endpoint retrieves all application form fields of a specific opening.


### HTTP Request

`GET https://api.recruiterbox.com/v1/openings/{id}/appication_form`

### Attributes

Attribute   | Description
----------- | -----------
key          | <strong>string</strong> A unique key for the field.
type | <strong>string</strong> Type of the field, can be either of `small_text`, `large_text`, `select_one`, `select_multiple`, `url`, `email`, `number`, `date` & `file`.
is_disabled       | <strong>boolean</strong> Is a disabled field ?
is_required       | <strong>boolean</strong> Is a required field ?
label | <strong>string</strong> Field label
choices | <strong>list</strong> Choices for field, if either of type `select_one` or `select_multiple`

### URL Parameters

Parameter | Description
--------- | -----------
id | ID of the opening

