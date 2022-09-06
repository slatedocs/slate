# Applications

## The application object

Applications associate [candidates](#candidates) with [jobs](#jobs). There are 2 kinds of applications: candidates and prospects. Candidate applications always have exactly 1 job. Prospect applications can have 0 or more jobs.

```json
{
    "id": 985314,
    "candidate_id": 978031,
    "prospect": false,
    "applied_at": "2016-03-26T20:11:39.000Z",
    "rejected_at": "2016-08-17T21:08:29.686Z",
    "last_activity_at": "2016-08-27T16:13:15.000Z",
    "location": { 
        "address": "New York, New York, USA" 
    },
    "source": {
        "id": 1871,
        "public_name": "Happy Hour"
    },
    "credited_to": {
        "id": 4080,
        "first_name": "Kate",
        "last_name": "Austen",
        "name": "Kate Austen",
        "employee_id": "12345"
    },
    "rejection_reason": {
        "id": 8,
        "name": "Lacking skill(s)/qualification(s)",
        "type": {
            "id": 1,
            "name": "We rejected them"
        }
    },
    "rejection_details": {
        "custom_fields": {
            "custom_rejection_question_field": "Not a good fit"
        },
        "keyed_custom_fields": {
            "custom_rejection_question_field": {
                "name": "Was this candidate a good fit?",
                "type": "short_text",
                "value": "Not a good fit."
            }
        }
    },
    "jobs": [
        {
            "id": 123,
            "name": "Accounting Manager"
        }
    ],
    "job_post_id": 123,
    "status": "rejected",
    "current_stage": {
        "id": 62828,
        "name": "Recruiter Phone Screen"
    },
    "answers": [
        {
            "question": "Why do you want to work for us?",
            "answer": "I heard you're awesome!"
        },
        {
            "question": "How did you hear about this job?",
            "answer": "From a former colleague."
        }
    ],
    "prospective_office": null,
    "prospective_department": null,
    "prospect_detail": {
        "prospect_pool": null,
        "prospect_stage": null,
        "prospect_owner": null
    },
    "custom_fields": {
        "bio": "This is a bio",
        "birthday": "1992-01-27"
    },
    "keyed_custom_fields": {
        "date_of_birth": {
            "name": "Birthday",
            "type": "date",
            "value": "1992-01-27"
        },
        "bio": {
            "name": "Bio",
            "type": "long_text",
            "value": "This is a bio"
        }
    },
    "attachments": [
        {
            "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "offer_packet"
        }
    ]

}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | Application ID |
| prospect | If `true`, this is a prospect application which means that the associated person is a prospect and has not yet applied for this job.
| status | One of: `active`, `rejected`, `hired`, `converted`.
| jobs | An array containing the [job](#jobs) that the candidate applied for.
| job_post_id | The ID of the job post through which the candidate applied. This value is null if the application was created through other means, e.g. manually adding candidates or importing candidates through sourcing integrations
| candidate_id | The ID of the [candidate](#candidates) who is applying for this job.
| current_stage | The current [stage](#job-stages) that this application is in.
| credited_to.id | The ID of the user who will receive credit for this application.
| location | The contents of the location question on a job post.
| answers | The answers provided to the questions in the job post for this application. Array contains the text value of the question and answer. Answers are always plaintext strings. Booleans will return `Yes` or `No`.
| custom_fields | Contains a hash of the custom fields configured for this resource. The properties in this hash reflect the active custom fields as of the time this method is called.
| keyed_custom_fields | This contains the same information as custom_fields but formatted in a different way that includes more information.  This will tell you the type of custom field data to expect, the text name of custom field, and the value.  The key of this hash is the custom field's immutable field key, which will not change even if the name of the custom field is changed in Greenhouse.
| prospective_department | The [department](#the-department-object) that this prospect application is being considered for. |
| prospective_office | The [office](#the-office-object) that this prospect application is being considered for. |


## GET: List Applications

```shell
curl -X GET 'https://harvest.greenhouse.io/v1/applications'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
[
  {
    "id": 69306314,
    "candidate_id": 57683957,
    "prospect": false,
    "applied_at": "2017-09-29T12:56:05.244Z",
    "rejected_at": null,
    "last_activity_at": "2017-09-29T13:00:28.038Z",
    "location": { 
        "address": "New York, New York, USA" 
    },
    "source": {
        "id": 2,
        "public_name": "Jobs page on your website"
    },
    "credited_to": {
      "id": 4080,
      "first_name": "Kate",
      "last_name": "Austen",
      "name": "Kate Austen",
      "employee_id": "12345"
    },
    "rejection_reason": null,
    "rejection_details": null,
    "jobs": [
        {
            "id": 107761,
            "name": "UX Designer - Boston"
        }
    ],
    "job_post_id": 123,
    "status": "active",
    "current_stage": {
        "id": 767358,
        "name": "Application Review"
    },
    "answers": [
        {
            "question": "How did you hear about this job?",
            "answer": "Online Research"
        },
        {
            "question": "Website",
            "answer": "mytestwebsite.com"
        }
    ],
    "prospective_office": null,
    "prospective_department": null,
    "prospect_detail": {
        "prospect_pool": null,
        "prospect_stage": null,
        "prospect_owner": null
    },
    "custom_fields": {
        "application_custom_test": "Option 1"
    },
    "keyed_custom_fields": {
        "application_custom_test": {
            "name": "Application Custom Test",
            "type": "single_select",
            "value": "Option 1"
        }
    },
    "attachments": [
        {
            "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "offer_packet"
        }
    ]
},
{
    "id": 69306509,
    "candidate_id": 57683957,
    "prospect": true,
    "applied_at": "2017-09-29T13:00:04.058Z",
    "rejected_at": null,
    "last_activity_at": "2017-09-29T13:08:19.111Z",
    "location": null,
    "source": {
        "id": 100674,
        "public_name": "Campus Job Fair"
    },
    "credited_to": {
        "id": 566819,
        "first_name": "Bob",
        "last_name": "Smith",
        "name": "Bob Smith",
        "employee_id": "ABC12345"
    },
    "rejection_reason": null,
    "rejection_details": null,
    "jobs": [
        {
            "id": 224587,
            "name": "Product Manager "
        },
        {
            "id": 109322,
            "name": "Web Developer "
        }
    ],
    "job_post_id": null,
    "status": "hired",
    "current_stage": null,
    "answers": [
      {
          "question": "How did you hear about this job?",
          "answer": "Online Research"
      },
      {
          "question": "Website",
          "answer": "mytestwebsite.com"
      }
    ],
    "prospective_office": {
      "primary_contact_user_id": null,
      "parent_id": null,
      "name": "New York",
      "location": {
        "name": "New York, NY"
      },
      "id": 59213,
      "external_id": null,
      "child_ids": []
    },
    "prospective_department": {
      "parent_id": null,
      "name": "Marketing",
      "id": 9024,
      "external_id": null,
      "child_ids": []
    },
    "prospect_detail": {
        "prospect_pool": {
            "id": 227,
            "name": "Opted In: In-Person Event"
        },
        "prospect_stage": {
            "id": 826,
            "name": "In Discussion"
        },
        "prospect_owner": {
            "id": 92120,
            "name": "Greenhouse Admin"
        }
    },
    "custom_fields": {
        "application_custom_test": "Option 1"
    },
    "keyed_custom_fields": {
        "application_custom_test": {
            "name": "Application Custom Test",
            "type": "single_select",
            "value": "Option 1"
        }
    },
    "attachments": [
        {
            "filename": "Jack_Smith_Offer_Packet_09_27_2020.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "offer_packet"
        }
    ]
  }
]
```
List all of an organization's applications.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/applications`

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| *per_page | Return up to this number of objects per response. Must be an integer between 1 and 500. Defaults to 100.
| *page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.
| created_before | Return only applications that were created before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| created_after | Return only applications that were created at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| last_activity_after | Return only applications where 'last_activity_at' is at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| job_id | If supplied, only return applications that involve this job. Will return both candidates and prospects.
| status | If supplied, only return applications that match this status. Accepted values are active, converted, hired, and rejected. If anything else is used, an empty response will be returned rather than an error.

<br>
[See noteworthy response attributes.](#the-application-object)

## GET: Retrieve Application

```shell
curl -X GET 'https://harvest.greenhouse.io/v1/applications/{id}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
{
    "id": 69306314,
    "candidate_id": 57683957,
    "prospect": false,
    "applied_at": "2017-09-29T12:56:05.244Z",
    "rejected_at": null,
    "last_activity_at": "2017-09-29T13:00:28.038Z",
    "location": { 
        "address": "New York, New York, USA" 
    },
    "source": {
        "id": 2,
        "public_name": "Jobs page on your website"
    },
    "credited_to": {
      "id": 4080,
      "first_name": "Kate",
      "last_name": "Austen",
      "name": "Kate Austen",
      "employee_id": "12345"
    },
    "rejection_reason": null,
    "rejection_details": null,
    "jobs": [
        {
            "id": 107761,
            "name": "UX Designer - Boston"
        }
    ],
    "job_post_id": 123,
    "status": "active",
    "current_stage": {
        "id": 767358,
        "name": "Application Review"
    },
    "answers": [
        {
            "question": "How did you hear about this job?",
            "answer": "Online Research"
        },
        {
            "question": "Website",
            "answer": "mytestwebsite.com"
        }
    ],
    "prospective_office": null,
    "prospective_department": null,
    "prospect_detail": {
        "prospect_pool": null,
        "prospect_stage": null,
        "prospect_owner": null
    },
    "custom_fields": {
        "application_custom_test": "Option 1"
    },
    "keyed_custom_fields": {
        "application_custom_test": {
            "name": "Application Custom Test",
            "type": "single_select",
            "value": "Option 1"
        }
    },
    "attachments": [
        {
            "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "offer_packet"
        }
    ]
}

```

Retrieve an application by its `id`.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/applications/{id}`

### URL parameters

Parameter | Description
--------- | -----------
id | ID of the application to retrieve

<br>
[See noteworthy response attributes.] (#the-application-object)

## DELETE: Delete Application

```shell
curl -X DELETE 'https://harvest.greenhouse.io/v1/applications/{id}'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above returns a JSON response, structured like this:

```json
{
  "message": "Application 29622362 has been deleted."
}
```

Delete an application by `id`. Note that only candidate applications can be deleted, you cannot delete a prospect application.

### HTTP Request

`DELETE https://harvest.greenhouse.io/v1/applications/{id}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

<br>

[See noteworthy response attributes.] (#the-candidate-object)

## POST: Add Application to Candidate/Prospect

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/candidates/{id}/applications'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> To create a prospect application for jobs 123 and 456:

```json
{
  "prospect": "true",
  "job_ids": [123, 456],
  "prospective_office_id": 58319,
  "prospective_department_id": 9021,
  "prospect_pool_id": 1640,
  "prospect_pool_stage_id": 7594,
  "prospect_owner_id": 107468
}
```

> To create a prospect application on no jobs:

```json
{
  "prospect": "true"
}
```

> To create a candidate application:

```json
{
  "job_id": 266926,
  "source_id": 7,
  "initial_stage_id": 2708728,
  "referrer": {
    "type": "id",
    "value": 770
  },
  "attachments": [{
    "filename": "resume.pdf",
    "type": "resume",
    "content": "MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6...",
    "content_type": "application/pdf"
}
```

> The above command returns a JSON response, structured like this:

```json
{
  "id": 38776620,
  "candidate_id": 15803530,
  "prospect": false,
  "applied_at": "2016-11-08T19:50:49.746Z",
  "rejected_at": null,
  "last_activity_at": "2016-11-04T19:46:40.377Z",
  "source": {
    "id": 7,
    "public_name": "Indeed"
  },
  "credited_to": {
        "id": 770,
        "first_name": "Moon",
        "last_name": "Colorado",
        "name": "Moon Colorado",
        "employee_id": null
    },
  "rejection_reason": null,
  "rejection_details": null,
  "jobs": [
    {
      "id": 266926,
      "name": "Construction Project Manager"
    }
  ],
  "job_post_id": null,
  "status": "active",
  "current_stage": {
    "id": 1945557,
    "name": "Application Review"
  },
  "answers": [],
  "custom_fields": {
    "birthday": "1992-01-27",
    "bio": "This is my bio"
  },
  "prospective_office": null,
  "prospective_department": null,
  "prospect_detail": {
    "prospect_pool": null,
    "prospect_stage": null,
    "prospect_owner": null
  }
}
```


Create a new application for an existing candidate or prospect.

The new application can be a candidate application or a prospect application, depending on the `"prospect"` parameter which defaults to `"false"`.  The JSON body parameters differ depending on whether you are creating a prospect application or a candidate application.  The main difference is that prospect applications can be considered for zero, one, or multiple jobs.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/candidates/{id}/applications`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters for Candidate application

Parameter | Required | Type | Description
--------- | ----------- | ----------- | ----------- | -----------
job_id | Yes | integer | The ID of the job you want to create an application to for this candidate
source_id | No | integer | The id of the source to be credited for this application
initial_stage_id | No | integer | The ID of the job stage this application will be created in.
referrer | No | object | An object representing the referrer
referrer[type] | No | string | A string representing the type of referrer: 'id', 'email', or 'outside'
referrer[value] | No | string | The id of the user who made the referral (not the referrer id)
attachments | No | array | An array of attachments to be uploaded to this application. See [Add Attachment] (#post-add-attachment) for parameters.

### JSON Body Parameters for Prospect application

Parameter | Required | Type | Description
--------- | ----------- | ----------- | ----------- |
prospect | Yes | boolean | Set to `"true"` in order to create a prospect application.
job_ids | No | array | An optional array of Job IDs to consider this prospect for.
source_id | No | integer | The id of the source to be credited for this application
referrer | No | object | An object representing the referrer
referrer[type] | No | string | A string representing the type of referrer: 'id', 'email', or 'outside'
referrer[value] | No | string | The id of the user who made the referral (not the referrer id)
prospect_pool_id | No | integer | Prospect Pool ID.
prospect_pool_stage_id | No | integer | Prospect Pool Stage ID.  `prospect_pool_id` is required, and the prospect pool stage must belong to the given prospect pool.
prospect_owner_id | No | integer |User ID of the prospect owner.
prospective_department_id | No | integer | Department ID to consider this prospect for.
prospective_office_id | No | integer | Office ID to consider this prospect for.  `prospective_department_id` is required in order to set a prospective office.

## PATCH: Update Application

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v1/applications/{id}'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "source_id": 16,
  "referrer": {
    "type": "id",
    "value": 123
  }
}
```

> The above returns a JSON response, structured like this:

```json
{
  "id": 69306314,
  "candidate_id": 57683957,
  "prospect": false,
  "applied_at": "2017-09-29T12:56:05.244Z",
  "rejected_at": null,
  "last_activity_at": "2017-09-29T13:00:28.038Z",
  "location": { 
      "address": "New York, New York, USA" 
  },
  "source": {
      "id": 2,
      "public_name": "Jobs page on your website"
  },
  "credited_to": {
    "id": 4080,
    "first_name": "Kate",
    "last_name": "Austen",
    "name": "Kate Austen",
    "employee_id": "12345"
  },
  "rejection_reason": null,
  "rejection_details": null,
  "jobs": [
      {
          "id": 107761,
          "name": "UX Designer - Boston"
      }
  ],
  "job_post_id": 123,
  "status": "active",
  "current_stage": {
      "id": 767358,
      "name": "Application Review"
  },
  "answers": [
      {
          "question": "How did you hear about this job?",
          "answer": "Online Research"
      },
      {
          "question": "Website",
          "answer": "mytestwebsite.com"
      }
  ],
  "prospective_office": null,
  "prospective_department": null,
  "prospect_detail": {
      "prospect_pool": null,
      "prospect_stage": null,
      "prospect_owner": null
  },
  "custom_fields": {
      "application_custom_test": "Option 1"
  },
  "keyed_custom_fields": {
      "application_custom_test": {
          "name": "Application Custom Test",
          "type": "single_select",
          "value": "Option 1"
      }
  },
  "attachments": [
      {
          "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
          "url": "https://prod-heroku.s3.amazonaws.com/...",
          "type": "offer_packet"
      }
  ]
}
```



Update this application. The response is populated with the application's information which will reflect its new state. You can update applications whose status is `active`, `rejected`, or `hired`.

### HTTP Request

`PATCH https://harvest.greenhouse.io/v1/applications/{id}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | ----------- | -----------
source_id | No | integer | The ID of the application's source
referrer | No | object | An object representing the referrer
referrer[type] | No | string | A string representing the type of referrer: 'id', 'email', or 'outside'
referrer[value] | No | string | The id of the user who made the referral (not the referrer id)
custom_fields[] | No | custom_field | Array of hashes containing new custom field values.  Passing an empty array does nothing. [Click here](#custom-field-parameters) for more information on structuring custom field data for edit requests.
prospect_pool_id | No | integer | The ID of the prospect pool for the application
prospect_stage_id | No | integer | The ID of the prospect pool stage for the application

## POST: Advance Application

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/applications/{id}/advance'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```
> The above command takes a JSON request, structured like this:

```json
{
  "from_stage_id": 123
}
```

> The above returns a JSON response, structured like this:

```json
{
  "id": 69306314,
  "candidate_id": 57683957,
  "prospect": false,
  "applied_at": "2017-09-29T12:56:05.244Z",
  "rejected_at": null,
  "last_activity_at": "2017-09-29T13:00:28.038Z",
  "location": { 
      "address": "New York, New York, USA" 
  },
  "source": {
      "id": 2,
      "public_name": "Jobs page on your website"
  },
  "credited_to": {
    "id": 4080,
    "first_name": "Kate",
    "last_name": "Austen",
    "name": "Kate Austen",
    "employee_id": "12345"
  },
  "rejection_reason": null,
  "rejection_details": null,
  "jobs": [
      {
          "id": 107761,
          "name": "UX Designer - Boston"
      }
  ],
  "job_post_id": null,
  "status": "active",
  "current_stage": {
      "id": 456,
      "name": "Phone Interview"
  },
  "answers": [
      {
          "question": "How did you hear about this job?",
          "answer": "Online Research"
      },
      {
          "question": "Website",
          "answer": "mytestwebsite.com"
      }
  ],
  "prospective_office": null,
  "prospective_department": null,
  "prospect_detail": {
      "prospect_pool": null,
      "prospect_stage": null,
      "prospect_owner": null
  },
  "custom_fields": {
      "application_custom_test": "Option 1"
  },
  "keyed_custom_fields": {
      "application_custom_test": {
          "name": "Application Custom Test",
          "type": "single_select",
          "value": "Option 1"
      }
  },
  "attachments": [
      {
          "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
          "url": "https://prod-heroku.s3.amazonaws.com/...",
          "type": "offer_packet"
      }
  ]
}
```

Move this application to the next stage. The response is populated with the application's information which will reflect its new state. Note that only applications in the `active` state can be advanced.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/applications/{id}/advance`


### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
from_stage_id | Yes | integer | The ID of the job stage this application is currently in.


## POST: Move Application (Different Job)

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/applications/{id}/transfer_to_job'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "new_job_id": 123456,
  "new_stage_id": 234567
}
```

> The above returns a JSON response, structured like this:

```json
{
  "id": 69306314,
  "candidate_id": 57683957,
  "prospect": false,
  "applied_at": "2017-09-29T12:56:05.244Z",
  "rejected_at": null,
  "last_activity_at": "2017-09-29T13:00:28.038Z",
  "location": { 
      "address": "New York, New York, USA" 
  },
  "source": {
      "id": 2,
      "public_name": "Jobs page on your website"
  },
  "credited_to": {
    "id": 4080,
    "first_name": "Kate",
    "last_name": "Austen",
    "name": "Kate Austen",
    "employee_id": "12345"
  },
  "rejection_reason": null,
  "rejection_details": null,
  "jobs": [
      {
          "id": 123456,
          "name": "UX Designer - Boston"
      }
  ],
  "job_post_id": null,
  "status": "active",
  "current_stage": {
      "id": 234567,
      "name": "Application Review"
  },
  "answers": [
      {
          "question": "How did you hear about this job?",
          "answer": "Online Research"
      },
      {
          "question": "Website",
          "answer": "mytestwebsite.com"
      }
  ],
  "prospective_office": null,
  "prospective_department": null,
  "prospect_detail": {
      "prospect_pool": null,
      "prospect_stage": null,
      "prospect_owner": null
  },
  "custom_fields": {
      "application_custom_test": "Option 1"
  },
  "keyed_custom_fields": {
      "application_custom_test": {
          "name": "Application Custom Test",
          "type": "single_select",
          "value": "Option 1"
      }
  },
  "attachments": [
      {
          "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
          "url": "https://prod-heroku.s3.amazonaws.com/...",
          "type": "offer_packet"
      }
  ]
}
```

Move this application to any stage on a different job.  If new_stage_id is omitted, the initial stage of the new job will be selected. Prospect applications can't be moved in this way.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/applications/{id}/transfer_to_job`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | ----------- | -----------
new_job_id | Yes | integer | The ID of the job to which this application should be transferred
new_stage_id | No | integer | The stage on the destination job this application should be placed in. If this is omitted, the application will be sent to the job's initial stage

<br>

[See noteworthy response attributes.] (#the-application-object)

## POST: Move Application (Same Job)

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/applications/{id}/move'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "from_stage_id": 1,
  "to_stage_id": 2
}
```

> The above returns a JSON response, structured like this:

```json
{
  "id": 48206478,
  "candidate_id": 36952451,
  "prospect": false,
  "applied_at": "2017-02-01T14:26:02.282Z",
  "rejected_at": null,
  "last_activity_at": "2017-02-01T14:51:12.670Z",
  "location": { 
    "address": "New York, New York, USA" 
  },
  "source": {
    "id": 33,
    "public_name": "Glassdoor"
  },
  "credited_to": null,
  "rejection_reason": null,
  "rejection_details": null,
  "jobs": [
    {
      "id": 211706,
      "name": "Community Manager - New York"
    }
  ],
  "job_post_id": 123,
  "status": "active",
  "current_stage": {
    "id": 1551142,
    "name": "Offer"
  },
  "answers": [
    {
      "question": "How many years experience do you have?",
      "answer": "2-4"
    },
    {
      "question": "Can do you the travel required for this job?",
      "answer": "Yes"
    }
  ],
  "prospective_office": null,
  "prospective_department": null,
  "prospect_detail": {
    "prospect_pool": null,
    "prospect_stage": null,
    "prospect_owner": null
  },
  "custom_fields": {
    "current_title": "Community Manager",
    "requires_visa_sponsorship?": false
  },
  "keyed_custom_fields": {
    "current_title": {
      "name": "Current Title",
      "type": "short_text",
      "value": "Community Manager"
    },
    "requires_visa_sponsorship_": {
      "name": "Requires visa sponsorship?",
      "type": "boolean",
      "value": false
    }
  },
  "attachments": [
      {
          "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
          "url": "https://prod-heroku.s3.amazonaws.com/...",
          "type": "offer_packet"
      }
  ]
}
```

Move this application from one stage to another. An application can only be moved between stages on the same job. The response is populated with the application’s information which will reflect its new state. Note that only applications in the `active` state can be moved.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/applications/{id}/move`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | ----------- | -----------
from_stage_id | Yes | integer | The ID of the job stage this application is currently in.
to_stage_id | Yes | integer | The ID of the job stage this application should be moved to.

<br>

[See noteworthy response attributes.] (#the-application-object)

## PATCH: Convert Propsect To Candidate

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v1/applications/{id}/convert_prospect'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "job_id": 123456,
  "initial_stage_id": 234567
}
```

> The above returns a JSON response, structured like this:

```json
{
  "success": true,
  "old_application_id": 1234321,
  "new_application_id": 43234323,
  "new_job_id": 123456,
  "new_stage_id": 234567
}
```

Converts a prospect application to a a candidate on a job. If a non-prospect application is provided, an error will be returned.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/applications/{id}/convert_prospect`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | ----------- | -----------
job_id | Yes | integer | The ID of the job this prospect will become a candidate on.
initial_stage_id | No | integer | The stage on the destination job this application should be placed in. If this is omitted, the application will be sent to the job's initial stage

## POST: Add Attachment to Application

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/applications/{id}/attachments'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```
> The above command takes a JSON request, structured like this:

```json
{
  "filename" : "resume.pdf",
  "type" : "resume",
  "content" : "R0lGODlhAQABAIAAAAUEBAAAACwAAAAAAQABAAACAkQBADs...",
  "content_type" : "application/pdf"
}
```

> The above command returns a JSON response, structured like this:

```json
{
  "filename": "resume.pdf",
  "url": "https://prod.s3.amazonaws.com/...",
  "type": "resume",
  "content_type": "application/pdf"
}
```

Post an attachment to an application by the application `id`.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/applications/{id}/attachments`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
filename | Yes | string | Name of the file
type | Yes | string | One of: ["resume", "cover_letter", "other", "take_home_test", "offer_letter", "signed_offer_letter"]. For type `take_home_test`, there must be an outstanding test on the application. For type `offer_letter`, there must be an existing offer on the application, and this action will retrigger the approvals process. For type `signed_offer_letter`, there must be an approved, sent offer letter.
content | No | string | Base64 encoded content of the attachment (if you are providing content, you do not need to provide url). String must be UTF-8 encoded.
url | No | string | Url of the attachment (if you are providing the url, you do not need to provide the content.) _Please note, shareable links from cloud services such as Google Drive will result in a corrupted file. Please use machine accessbile URLs._
visibility | No | string | One of: ["public", "private", "admin_only"]. This only applies when attachment type is "other", and will be ignored for all other attachment types. If not supplied, type "other" documents will default to `admin_only`. Resumes, cover letters, and take home tests will always be `public`. Offer letters and signed offer letters will always be `private`.
content_type | Yes* | string | The content-type of the document you are sending. When using a URL, this generally isn't needed, as the responding server will deliver a content type.  This should be included for encoded content.  Accepted content types are: <ul><li>"application/atom+xml"</li><li>"application/javascript"</li><li>"application/json"</li><li>"application/msgpack"</li><li>"application/msword"</li><li>"application/pdf"</li><li>"application/rss+xml"</li><li>"application/vnd.ms-excel"</li><li>"application/vnd.openxmlformats-<br>officedocument.spreadsheetml.sheet"</li><li>"application/vnd.openxmlformats-<br>officedocument.wordprocessingml.document"</li><li>"application/vnd.ms-powerpoint"</li><li>"application/xml"</li><li>"application/x-www-form-urlencoded"</li><li>"application/x-yaml"</li><li>"application/zip"</li><li>"multipart/form-data"</li><li>"image/bmp"</li><li>"image/gif"</li><li>"image/jpeg"</li><li>"image/png"</li><li>"image/tiff"</li><li>"text/calendar"</li><li>"text/css"</li><li>"text/csv"</li><li>"text/html"</li><li>"text/javascript"</li><li>"text/plain"</li><li>"text/vcard"</li><li>"video/mpeg"</li></ul>

\* \- content_type is required for when uploading a document unless you are uploading using a URL.


## POST: Hire Application

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/applications/{id}/hire'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "start_date": "2017-03-15",
  "opening_id": 454,
  "close_reason_id": 43432
}
```

> The above returns a JSON response, structured like this:

```json
{
  "id": 48206478,
  "candidate_id": 36952451,
  "prospect": false,
  "applied_at": "2017-02-01T14:26:02.282Z",
  "rejected_at": null,
  "last_activity_at": "2017-02-01T14:51:12.670Z",
  "location": { 
    "address": "New York, New York, USA" 
  },
  "source": {
    "id": 33,
    "public_name": "Glassdoor"
  },
  "credited_to": null,
  "rejection_reason": null,
  "rejection_details": null,
  "jobs": [
    {
      "id": 211706,
      "name": "Community Manager - New York"
    }
  ],
  "job_post_id": 123,
  "status": "hired",
  "current_stage": null,
  "answers": [
    {
      "question": "How many years experience do you have?",
      "answer": "2-4"
    },
    {
      "question": "Can do you the travel required for this job?",
      "answer": "Yes"
    }
  ],
  "prospective_office": null,
  "prospective_department": null,
  "prospect_detail": {
    "prospect_pool": null,
    "prospect_stage": null,
    "prospect_owner": null
  },
  "custom_fields": {
    "current_title": "Community Manager",
    "requires_visa_sponsorship?": false
  },
  "keyed_custom_fields": {
    "current_title": {
      "name": "Current Title",
      "type": "short_text",
      "value": "Community Manager"
    },
    "requires_visa_sponsorship_": {
      "name": "Requires visa sponsorship?",
      "type": "boolean",
      "value": false
    }
  },
  "attachments": [
      {
          "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
          "url": "https://prod-heroku.s3.amazonaws.com/...",
          "type": "offer_packet"
      }
  ]
}
```

Hire this application. The application must not be a prospect and all approvals for the job and offer must have occurred. 

### HTTP Request

`POST https://harvest.greenhouse.io/v1/applications/{id}/hire`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | ----------- | -----------
start_date | No* | string | The start_date of the employee. Must be in the format YYYY-MM-DD
opening_id | No | integer | An opening ID to fill with this hire. This is the unique Greenhouse id of the opening (id in the openings endpoint) and not the human readable opening id text. If no opening is provided one will be selected.
close_reason_id | No | integer | The close reason to assign to the opening that will be closed with this hire.

* - Start date may be required if the organization requires offers to have start dates and the application's current offer does not have one set.

<br>

Note that "current_stage" in the response JSON is null. A hired application no longer has a current stage.

[See noteworthy response attributes.] (#the-application-object)

## POST: Reject Application

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/applications/{id}/reject'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "rejection_reason_id": 815,
  "notes": "The prospect is not qualified for this position.",
  "rejection_email": {
    "send_email_at": "2014-03-26T20:11:39Z",
    "email_template_id": 42
  }
}
```

> The above returns a JSON response, structured like this:

```json
{
  "id": 985314,
  "candidate_id": 978031,
  "prospect": false,
  "applied_at": "2016-03-26T20:11:39.000Z",
  "rejected_at": "2016-08-17T21:08:29.686Z",
  "last_activity_at": "2016-08-27T16:13:15.000Z",
  "location": {
    "address": "New York, New York, USA"
  },
  "source": {
    "id": 1871,
    "public_name": "Happy Hour"
  },
  "credited_to": {
    "id": 4080,
    "first_name": "Kate",
    "last_name": "Austen",
    "name": "Kate Austen",
    "employee_id": "12345"
  },
  "rejection_reason": {
    "id": 815,
    "name": "The prospect is not qualified for this position.",
    "type": {
      "id": 1,
      "name": "We rejected them"
    }
  },
  "rejection_details": {
    "custom_fields": {
      "custom_rejection_question_field": "Not a good fit"
    },
    "keyed_custom_fields": {
      "custom_rejection_question_field": {
        "name": "Was this candidate a good fit?",
        "type": "short_text",
        "value": "This candidate wasn't a good fit."
      }
    }
  },
  "jobs": [
    {
      "id": 123,
      "name": "Accounting Manager"
    }
  ],
  "job_post_id": 456,
  "status": "rejected",
  "current_stage": {
    "id": 62828,
    "name": "Recruiter Phone Screen"
  },
  "answers": [
    {
      "question": "Why do you want to work for us?",
      "answer": "I heard you're awesome!"
    },
    {
      "question": "How did you hear about this job?",
      "answer": "From a former colleague."
    }
  ],
  "prospective_office": null,
  "prospective_department": null,
  "prospect_detail": {
    "prospect_pool": null,
    "prospect_stage": null,
    "prospect_owner": null
  },
  "custom_fields": {
    "bio": "This is a bio",
    "birthday": "1992-01-27"
  },
  "keyed_custom_fields": {
    "date_of_birth": {
      "name": "Birthday",
      "type": "date",
      "value": "1992-01-27"
    },
    "bio": {
      "name": "Bio",
      "type": "long_text",
      "value": "This is a bio"
    }
  },
  "attachments": [
      {
          "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
          "url": "https://prod-heroku.s3.amazonaws.com/...",
          "type": "offer_packet"
      }
  ]
}
```

Reject this application. The response is populated with the application's information which will reflect its new state. Note that only applications in the `active` state can be rejected.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/applications/{id}/reject`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | ----------- | -----------
rejection_reason_id | No | integer | The ID of the reason why this application was rejected.
notes | No | string | Notes on why this application was rejected. These will be added to the activity feed.
rejection_email | No | hash | An email will be sent to the candidate notifying them of this rejection.
rejection_email.send_email_at | No | string | The rejection email will be delayed until this time.
rejection_email.email_template_id | Yes, if sending rejection_email | string | The template to use for the rejection email. Template must be an organization wide email template.

## PATCH: Update Rejection Reason

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v1/applications/{id}/reject'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "rejection_reason_id": 815
}
```

> The above returns a JSON response, structured like this:
```json
{
    "id": 12345,
    "message": "Rejection reason updated to 815 (Higher Salary Offer Made)",
    "success": true
}
```

This endpoint updates the rejection reason on a currently rejected application. An application in any other state will return an error. The rejection reason id may be either a custom rejection reason for your organization or a Greenhouse default rejection reason.

### HTTP Request

`PATCH https://harvest.greenhouse.io/v1/applications/{id}/reject`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### URL parameters

Parameter | Description
--------- | -----------
id | ID of the application to update

### JSON Body Parameters

Parameter | Required | Description
--------- | ----------- | -----------
rejection_reason_id | yes | The ID of the new rejection reason


## POST: Unreject Application

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/applications/{id}/unreject'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command requires an empty JSON body:

```json
{}
```

> The above returns a JSON response, structured like this:

```json
{
  "id": 69306314,
  "candidate_id": 57683957,
  "prospect": false,
  "applied_at": "2017-09-29T12:56:05.244Z",
  "rejected_at": null,
  "last_activity_at": "2017-09-29T13:00:28.038Z",
  "location": { 
    "address": "New York, New York, USA" 
  },
  "source": {
    "id": 2,
    "public_name": "Jobs page on your website"
  },
  "credited_to": {
    "id": 4080,
    "first_name": "Kate",
    "last_name": "Austen",
    "name": "Kate Austen",
    "employee_id": "12345"
  },
  "rejection_reason": null,
  "rejection_details": null,
  "jobs": [
    {
      "id": 107761,
      "name": "UX Designer - Boston"
    }
  ],
  "job_post_id": 123,
  "status": "active",
  "current_stage": {
    "id": 767358,
    "name": "Application Review"
  },
  "answers": [
    {
      "question": "How did you hear about this job?",
      "answer": "Online Research"
    },
    {
      "question": "Website",
      "answer": "mytestwebsite.com"
    }
  ],
  "prospective_office": null,
  "prospective_department": null,
  "prospect_detail": {
    "prospect_pool": null,
    "prospect_stage": null,
    "prospect_owner": null
  },
  "custom_fields": {
    "application_custom_test": "Option 1"
  },
  "keyed_custom_fields": {
    "application_custom_test": {
      "name": "Application Custom Test",
      "type": "single_select",
      "value": "Option 1"
    }
  },
  "attachments": [
      {
          "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
          "url": "https://prod-heroku.s3.amazonaws.com/...",
          "type": "offer_packet"
      }
  ]
```

> An unsuccessful response:

```json
{
  "errors": [
    {
      "message": "Application must be 'rejected', is currently 'active'"
    }
  ]
}
```

Unreject this application. The response is populated with the application in its new state. Note that only applications in the `rejected` state can be unrejected.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/applications/{id}/unreject`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### URL parameters

Parameter | Description
--------- | -----------
id | ID of the application to unreject

### JSON Body Parameters

No JSON body parameters
