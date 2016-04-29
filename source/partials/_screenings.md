# Screening
After a user account has been created, the user is then required to take a screening to determine
their current sleep health.  A screening consists of questions that can be grouped together.
These groupings are referred to as question_groups in the API.

## Creating a Screening for a User
A screening can be created for a user with this request

`GET https://partner_abc.optisom.com/api/v2/users{user_id}/screenings

The response will return the next question_qroup_id which can be used to request the next set of questions.

```json
{
  "screening": "API::V2::Screening",
  "meta": {
    "completed": false,
    "next_group_id": 0,
    "progress": {
      "percent_complete": 0
    }
  }
}
```

## Showing a Question Group

```json
{
  "question_group": {
    "id": 1,
    "header": "About You",
    "description": "Let's start by gathering some basic information about you.",
    "handle": "demographics",
    "questions": [
      {
        "id": 1,
        "prompt": "Gender",
        "required": true,
        "type": "select",
        "subtype": "gender",
        "position": 2,
        "default_demo_answer": null,
        "max_allowed_selections": 1,
        "min_allowed_selections": 1,
        "possible_answers": [
          {
            "value": "1",
            "content": "Male",
            "position": 1
          },
          {
            "value": "2",
            "content": "Female",
            "position": 2
          }
        ]
      },
      {
        "id": 2,
        "prompt": "Date of birth",
        "required": true,
        "type": "date",
        "subtype": "dob",
        "position": 3,
        "default_demo_answer": null,
        "max_allowed_value": "1997-11-08",
        "min_allowed_value": "1915-11-08"
      },
      {
        "id": 3,
        "prompt": "Height",
        "required": true,
        "type": "integer",
        "subtype": "height",
        "position": 4,
        "default_demo_answer": null,
        "max_allowed_value": 95,
        "min_allowed_value": 36,
        "units": "inches"
      }
    ]
  },
  "meta": {
    "progress": {
      "percent_represented": 11
    }
  }
}
```

`GET https://partner_abc.optisom.com/api/v2/users{user_id}/screenings/{screening_id}/groups/{id}`

The response will return the questions that are contained in that question group, along with
metadata.


### Question Group

Attribute   |Type      |Description
------------|----------|------------
id          |integer   |ID for instance of object
header      |string    |Title for Question Group
description |string    |Description for Question Group
handle      |string    |human readable identifier
percent_represented|integer|Current percent complete to display to user

### Question

Attribute   |Type      |Description
------------|----------|------------
id          |integer   |ID for instance of object
prompt      |string    |Text of question
required    |boolean   |Must be answered or not
type        |string    |Format of question
max_allowed_selections|integer|Maximum number of answer values
min_allowed_selections|integer|Minimum number of answer values
units       |string|unit of measurement for question


### Possible Answers

Attribute   |Type      |Description
------------|----------|------------
value       |integer   |Numerical representation of answer choice
content     |string    |Text representation of answer choice to be displayed
position    |integer   |Order of answer choice with respect to other answer choices



<aside class="notice">
The "handle" attribute is used often in the Optisom Service as a unique,
immutable identifier for specific objects, such as question group.
</aside>