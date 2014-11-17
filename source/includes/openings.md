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
 -u {api_key}:
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
  -u {api_key}:
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
  -u {api_key}:
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

### Field types

Type  | Description
----- | -----------
small_text | Single line text
large_text | Paragraph text
select_one | Applicants choose one option from a list
select_multiple | Applicants can choose multiple options
url | Web-link / URL
email | Email Address
number | Number
date | Date
file | File Upload

## Apply for a Opening


```shell
curl -H "Content-Type: application/json" -X POST -d '{
  "fields": [
    { "key" : "candidate_first_name", "value" : "John"},
    { "key" : "candidate_last_name", "value" : "Doe"},
    { "key" : "candidate_email", "value" : "john.doe@gmail.com"},
    { "key" : "candidate_phone", "value" : 123},
    { "key" : "resume", "value": {
      "encoded_data" : "aGVsbG8gd29ybGQ=",
      "file_name" : "ressume.txt"
      }
    }
  ],
  "source" : "new website"
  }' https://api.recruiterbox.com/v1/openings/a42f3/apply -u {api_key}:
```
> The above command returns None.

This endpoint lets you apply to an opening. The end result is a candidate assigned to this opening.


### HTTP Request

`POST https://api.recruiterbox.com/v1/openings/{id}/apply`

### URL Parameters

Parameter | Description
--------- | -----------
id | ID of the opening

### Post data of fields

Post data is a json with a required attribute `fields` and an optional attribute `source`. `fields` is a list of candidate attributes, while `source` can be (optionally) set to the source of this candidate.

Each item in `fields` has attributes `key` and `value`. The `key` can be ascertained from the [application_form GET api](#get-application-form-fields-of-a-opening) of the opening for that field. The `value` must adhere to the following constraints based on the field `type` in the [application_form GET api](#get-application-form-fields-of-a-opening)


Field Type |  Data
---------- | --------------
small_text | <strong>Plain text with max char length of 200</strong> eg: `{"key":"candidate_first_name", "value":"John" }`
large_text | <strong>Paragraph text</strong> eg: `{"key":"cover_letter", "value":"About me .." }`
select_one | <strong>Applicants choose one option from a list, option selected should be given as a value</strong> eg: `{"key":"age", "value":"18 - 25" }`
select_multiple | <strong>Applicants can choose multiple options, options selected should be given as a list</strong> eg: `{"key":"programming_expertise", "value":["python", "ruby", "js"]}`
url        | <strong>Web-link / URL</strong> eg: `{"key":"github_url", "value":"http://github.com/johndoe"}`
email      | <strong>Email Address</strong> eg: `{"key": "email", "value": "john.doe@gmail.com"}`
number     | <strong>Number</strong> eg: `{"key": "years_of_exp", "value": "5"}`
file       | <strong>File should be in base64 encoded format [Know more here](http://en.wikipedia.org/wiki/Base64)</strong> eg: `{"key": "resume", "value": {"encoded_data": "aGVsbG8gd29ybGQ=", "file_name": "resume.txt" }}`

### Validation errors on Post

Validation errors are a list within the attribute ```errors``` for each field key.


```shell
curl -H "Content-Type: application/json" -X POST -d '{
  "fields": [
    { "key" : "candidate_last_name", "value" : "Doe"},
    { "key" : "candidate_email", "value" : "john.doegmail.com"},
    { "key" : "candidate_phone", "value" : 123},
    { "key" : "resume", "value": {
      "encoded_data" : "wrong data",
      "file_name" : "ressume.txt"
      }
    }
  ],
  "source" : "new website"
  }' https://api.recruiterbox.com/v1/openings/a42f3/apply -u {api_key}:
```

> The above command returns JSON structured like this:

```json
  {
    "errors": [
      {"candidate_first_name": ["This is a required field"]},
      {"candidate_email": ["The email is not valid"]},
      {"resume": ["The file is not in base64 encoded format"]}
    ]
  }
```

Error | Description
------| -----------
This is a disabled field | The field is hidden / disabled, remove this field from post data
This is a required field | This is a required field, candidate has to fill this field
The value is not in small_text format (>200 chars) | -
The url is not valid | -
The email is not valid | -
The number is not valid | -
The date is not in valid timestamp format | -
The file is not in base64 encoded format | The file should be encoded to base64 format. [Know more here](http://en.wikipedia.org/wiki/Base64)
The file_name should be specified with proper extension | A proper extension should be given for file name
Not a valid file format. Allowed formats are ( doc, txt, html, htm, rtf, docx, odt, pdf ) | Resume should be of those allowed formats.
Option should be a value for select_one e.g {'key':'somekey', 'value': '1'} | -
Options should be in a list for select_multiple e.g {'key':'somekey', 'value': ['1', '2']} | -
No option selected | No option was selected for a required select field
{field} is not a valid option | {field} was not one of the choices listed in select_one / select_multiple.

