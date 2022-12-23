# Candidates

An organization's candidates.

## The candidate object

```json
{
    "id": 53883394,
    "first_name": "John",
    "last_name": "Locke",
    "company": "The Tustin Box Company",
    "title": "Man of Mystery",
    "created_at": "2017-08-15T03:31:46.591Z",
    "updated_at": "2017-09-28T12:29:30.497Z",
    "last_activity": "2017-09-28T12:29:30.481Z",
    "is_private": false,
    "photo_url": null,
    "attachments": [
        {
            "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "offer_packet",
            "created_at": "2020-09-27T18:45:27.137Z"
        }
    ],
    "application_ids": [
        69102626,
        65153308
    ],
    "phone_numbers": [
        {
            "value": "555-555-5555",
            "type": "mobile"
        }
    ],
    "addresses": [
        {
            "value": "123 City Street\nNew York, Ny 10001",
            "type": "home"
        }
    ],
    "email_addresses": [
        {
            "value": "test@work.com",
            "type": "work"
        },
        {
            "value": "test@example.com",
            "type": "personal"
        }
    ],
    "website_addresses": [
        {
            "value": "mysite.com",
            "type": "personal"
        }
    ],
    "social_media_addresses": [
        {
            "value": "twitter.com/test"
        }
    ],
    "recruiter": {
        "id": 92120,
        "first_name": "Greenhouse",
        "last_name": "Admin",
        "name": "Greenhouse Admin",
        "employee_id": "67890"
        },
    "coordinator": {
        "id": 453636,
        "first_name": "Jane",
        "last_name": "Smith",
        "name": "Jane Smith",
        "employee_id": "12345"
    },
    "can_email": true,
    "tags": [
        "Python",
        "Ruby"
    ],
    "applications": [
        {
            "id": 69102626,
            "candidate_id": 53883394,
            "prospect": false,
            "applied_at": "2017-09-27T12:03:02.728Z",
            "rejected_at": "2017-09-27T12:11:40.877Z",
            "last_activity_at": "2017-09-28T12:29:30.481Z",
            "location": {
                "address": "New York, New York, USA"
            },
            "source": {
                "id": 16,
                "public_name": "LinkedIn (Prospecting)"
            },
            "credited_to": {
                "id": 165372,
                "first_name": "Joel",
                "last_name": "Job Admin",
                "name": "Joel Job Admin",
                "employee_id": null
            },
            "rejection_reason": {
                "id": 9504,
                "name": "Hired another candidate",
                "type": {
                    "id": 1,
                    "name": "We rejected them"
                }
            },
            "rejection_details": {
                "custom_fields": {
                    "custom_rejection_question_field": null
                },
                "keyed_custom_fields": {
                    "custom_rejection_question_field": {
                        "name": "Custom Rejection Question Field",
                        "type": "short_text",
                        "value": null
                    }
                }
            },
            "jobs": [
                {
                    "id": 149995,
                    "name": "DevOps Engineer"
                }
            ],
            "job_post_id": 123,
            "status": "rejected",
            "current_stage": {
                "id": 1073533,
                "name": "Take Home Test"
            },
            "answers": [
                {
                    "question": "How did you hear about this job?",
                    "answer": "A friend"
                },
                {
                    "question": "Website",
                    "answer": "https://example.com"
                },
                {
                    "question": "LinkedIn Profile",
                    "answer": "https://linkedin.com/example"
                }
            ],
            "prospective_office": null,
            "prospective_department": null,
            "prospect_detail": {
                "prospect_pool": null,
                "prospect_stage": null,
                "prospect_owner": null
            },
			"attachments": [
      			{
                    "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
                    "url": "https://prod-heroku.s3.amazonaws.com/...",
                    "type": "offer_packet",
                    "created_at": "2020-09-27T18:45:27.137Z"
      			}
  			]
        },
        {
            "id": 65153308,
            "candidate_id": 53883394,
            "prospect": false,
            "applied_at": "2017-08-15T03:31:46.637Z",
            "rejected_at": null,
            "last_activity_at": "2017-09-28T12:29:30.481Z",
            "location": {
                "address": "New York, New York, United States"
            },
            "source": {
                "id": 12,
                "public_name": "Meetups"
            },
            "credited_to": {
                "id": 566819,
                "first_name": "Bob",
                "last_name": "Smith",
                "name": "Bob Smith",
                "employee_id": null
            },
            "rejection_reason": null,
            "rejection_details": null,
            "jobs": [
                {
                    "id": 299100,
                    "name": "Data Scientist - BK"
                }
            ],
            "job_post_id": 456,
            "status": "active",
            "current_stage": {
                "id": 2966800,
                "name": "Face to Face"
            },
            "answers": [],
            "prospective_office": null,
            "prospective_department": null,
            "prospect_detail": {
                "prospect_pool": null,
                "prospect_stage": null,
                "prospect_owner": null
            },
			"attachments": []
        }
    ],
    "educations": [
        {
            "id": 561227,
            "school_name": "University of Michigan - Ann Arbor",
            "degree": "Bachelor's Degree",
            "discipline": "Computer Science",
            "start_date": "2012-08-15T00:00:00.000Z",
            "end_date": "2016-05-15T00:00:00.000Z"
        }
    ],
    "employments": [
        {
            "id": 8485064,
            "company_name": "Greenhouse",
            "title": "Engineer",
            "start_date": "2012-08-15T00:00:00.000Z",
            "end_date": "2016-05-15T00:00:00.000Z"
        }
    ],
    "linked_user_ids": [
        989604
    ],
    "custom_fields": {
        "desired_salary": "1000000000",
        "work_remotely": true,
        "graduation_year": "2018"
    },
    "keyed_custom_fields": {
        "desired_salary": {
            "name": "Desired Salary",
            "type": "short_text",
            "value": "1000000000"
        },
        "work_remotely": {
            "name": "Work Remotely",
            "type": "boolean",
            "value": true
        },
        "graduation_year_1": {
            "name": "Graduation Year",
            "type": "single_select",
            "value": "2018"
        }
    }
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The candidate's unique identifier |
| company | The company at which the candidate currently works
| title | The candidate's current title
| is_private | Whether the candidate is private or not. One of: ["true", "false"]
| application_ids | Array of [application](#applications) IDs associated with this candidate. Can contain none, one, or several application IDs.
| phone_numbers[].type | One of: ["home", "work", "mobile", "skype", "other"]
| addresses[].type | One of: ["home", "work", "other"]
| email_addresses[].type | One of: ["personal", "work", "other"]
| website_addresses[].type | One of: ["personal", "company", "portfolio", "blog", "other"]
| recruiter | The recruiter [user](#users) who is responsible for this candidate.
| coordinator | The coordinator [user](#users) who is responsible for this candidate.
| attachments[].type | One of: ["resume", "cover_letter", "offer_packet", "offer_letter", "take_home_test", "other"]
| attachments[].url | URLs expire in 30 days.
| custom_fields | Contains a hash of the custom fields configured for this resource. The properties in this hash reflect the active custom fields as of the time this method is called.
| keyed_custom_fields | This contains the same information as custom_fields but formatted in a different way that includes more information.  This will tell you the type of custom field data to expect, the text name of custom field, and the value.  The key of this hash is the custom field's immutable field key, which will not change even if the name of the custom field is changed in Greenhouse.
| linked_user_ids | If the candidate is an internal applicant, this returns the Greenhouse user ID of the candidate.
| photo_url | Note: this field has been removed from Greenhouse and will always be null. For backwards compatibility, the field will remain in API payloads

## GET: List Candidates

```shell
curl 'https://harvest.greenhouse.io/v1/candidates'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
 {
    "id": 53883394,
    "first_name": "John",
    "last_name": "Locke",
    "company": "The Tustin Box Company",
    "title": "Man of Mystery",
    "created_at": "2017-08-15T03:31:46.591Z",
    "updated_at": "2017-09-28T12:29:30.497Z",
    "last_activity": "2017-09-28T12:29:30.481Z",
    "is_private": false,
    "photo_url": null,
    "attachments": [
        {
            "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "offer_packet",
            "created_at": "2020-09-27T18:45:27.137Z"
        }
    ],
    "application_ids": [
        69103370,
        65153308
    ],
    "phone_numbers": [
        {
            "value": "555-555-5555",
            "type": "mobile"
        }
    ],
    "addresses": [
        {
            "value": "123 City Street\nNew York, Ny 10001",
            "type": "home"
        }
    ],
    "email_addresses": [
        {
            "value": "test@work.com",
            "type": "work"
        }
    ],
    "website_addresses": [
        {
            "value": "mysite.com",
            "type": "personal"
        }
    ],
   "social_media_addresses": [],
    "recruiter": {
        "id": 92120,
        "first_name": "Greenhouse",
        "last_name": "Admin",
        "name": "Greenhouse Admin",
        "employee_id": null
    },
    "coordinator": null,
    "can_email": true,
    "tags": [
        "Python",
        "Ruby"
    ],
    "applications": [
        {
            "id": 69103370,
            "candidate_id": 53883394,
            "prospect": true,
            "applied_at": "2017-09-27T12:21:37.234Z",
            "rejected_at": null,
            "last_activity_at": "2017-09-28T12:29:30.481Z",
            "location": {
                "address": "New York, New York, USA"
            },
            "source": {
                "id": 16,
                "public_name": "LinkedIn (Prospecting)"
            },
            "credited_to": {
                "id": 92120,
                "first_name": "Greenhouse",
                "last_name": "Admin",
                "name": "Greenhouse Admin",
                "employee_id": null
            },
            "rejection_reason": null,
            "rejection_details": null,
            "jobs": [
                {
                    "id": 87752,
                    "name": "Full Stack Engineer"
                }
            ],
            "job_post_id": 123,
            "status": "active",
            "current_stage": null,
            "answers": [],
            "prospective_office": null,
            "prospective_department": null,
            "prospect_detail": {
                "prospect_pool": {
                    "id": 224,
                    "name": "Cold Outreach: Sourced"
                },
                "prospect_stage": {
                    "id": 817,
                    "name": "Contacted"
                },
                "prospect_owner": {
                    "id": 92120,
                    "name": "Greenhouse Admin"
                }
            },
			"attachments": [
      			{
                    "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
                    "url": "https://prod-heroku.s3.amazonaws.com/...",
                    "type": "offer_packet",
                    "created_at": "2020-09-27T18:45:27.137Z"
      			}
  			]
        },
        {
            "id": 65153308,
            "candidate_id": 53883394,
            "prospect": false,
            "applied_at": "2017-08-15T03:31:46.637Z",
            "rejected_at": null,
            "last_activity_at": "2017-09-28T12:29:30.481Z",
            "location": null,
            "source": {
                "id": 12,
                "public_name": "Meetups"
            },
            "credited_to": {
                "id": 566819,
                "first_name": "Bob",
                "last_name": "Smith",
                "name": "Bob Smith",
                "employee_id": null
            },
            "rejection_reason": null,
            "rejection_details": null,
            "jobs": [
                {
                    "id": 299100,
                    "name": "Data Scientist - BK"
                }
            ],
            "status": "active",
            "current_stage": {
                "id": 2966800,
                "name": "Face to Face"
            },
            "answers": [],
            "prospective_office": null,
            "prospective_department": null,
            "prospect_detail": {
                "prospect_pool": null,
                "prospect_stage": null,
                "prospect_owner": null
            },
			"attachments": []
        }
    ],
    "educations": [
        {
            "id": 561227,
            "school_name": "University of Michigan - Ann Arbor",
            "degree": "Bachelor's Degree",
            "discipline": "Computer Science",
            "start_date": "2012-08-15T00:00:00.000Z",
            "end_date": "2016-05-15T00:00:00.000Z"
        }
    ],
    "employments": [
        {
            "id": 8485064,
            "company_name": "Greenhouse",
            "title": "Engineer",
            "start_date": "2012-08-15T00:00:00.000Z",
            "end_date": "2016-05-15T00:00:00.000Z"
        }
    ],
    "linked_user_ids": [
            989604
    ],
    "custom_fields": {
        "desired_salary": "1000000000",
        "work_remotely": true,
        "graduation_year": "2018"
    },
    "keyed_custom_fields": {
        "desired_salary": {
            "name": "Desired Salary",
            "type": "short_text",
            "value": "1000000000"
        },
        "work_remotely": {
            "name": "Work Remotely",
            "type": "boolean",
            "value": true
        },
        "graduation_year_1": {
            "name": "Graduation Year",
            "type": "single_select",
            "value": "2018"
        }
     }
  }
]
```

List all of an organization's candidates.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/candidates`

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| per_page | Return up to this number of objects per response. Must be an integer between 1 and 500. Defaults to 100.
| page | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.
| created_before | Return only candidates that were created before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| created_after | Return only candidates that were created at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_before | Return only candidates that were updated before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_after | Return only candidates that were updated at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| job_id | If supplied, only return candidates that have applied to this job. Will return both when a candidate has applied to a job and when they're a prospect for a job.
| email | If supplied, only return candidates who have a matching e-mail address. If supplied with job_id, only return a candidate with a matching e-mail with an application on the job. If email and candidate_ids are included, candidate_ids will be ignored.
| candidate_ids | If supplied, return only the candidates with the given ids. These are supplied as a comma separated string. e.g.: "candidate_ids=123,456,789".  When combined with job_id, only return candidates with an application on the job. A maximum of 50 candidates can be returned this way.

<br>

[See noteworthy response attributes.] (#the-candidate-object)

## GET: Retrieve Candidate

```shell
curl 'https://harvest.greenhouse.io/v1/candidates/{id}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
    "id": 53883394,
    "first_name": "John",
    "last_name": "Locke",
    "company": "The Tustin Box Company",
    "title": "Man of Mystery",
    "created_at": "2017-08-15T03:31:46.591Z",
    "updated_at": "2017-09-28T12:29:30.497Z",
    "last_activity": "2017-09-28T12:29:30.481Z",
    "is_private": false,
    "photo_url": null,
    "attachments": [
        {
            "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "offer_packet",
            "created_at": "2020-09-27T18:45:27.137Z"
        }
    ],
    "application_ids": [
        69102626,
        65153308
    ],
    "phone_numbers": [
        {
            "value": "555-555-5555",
            "type": "mobile"
        }
    ],
    "addresses": [
        {
            "value": "123 City Street\nNew York, Ny 10001",
            "type": "home"
        }
    ],
    "email_addresses": [
        {
            "value": "test@work.com",
            "type": "work"
        },
        {
            "value": "test@example.com",
            "type": "personal"
        }
    ],
    "website_addresses": [
        {
            "value": "mysite.com",
            "type": "personal"
        }
    ],
    "social_media_addresses": [
        {
            "value": "twitter.com/test"
        }
    ],
    "recruiter": {
        "id": 92120,
        "first_name": "Greenhouse",
        "last_name": "Admin",
        "name": "Greenhouse Admin",
        "employee_id": "67890"
        },
    "coordinator": {
        "id": 453636,
        "first_name": "Jane",
        "last_name": "Smith",
        "name": "Jane Smith",
        "employee_id": "12345"
    },
    "can_email": true,
    "tags": [
        "Python",
        "Ruby"
    ],
    "applications": [
        {
            "id": 69102626,
            "candidate_id": 53883394,
            "prospect": false,
            "applied_at": "2017-09-27T12:03:02.728Z",
            "rejected_at": "2017-09-27T12:11:40.877Z",
            "last_activity_at": "2017-09-28T12:29:30.481Z",
            "location": {
                "address": "New York, New York, USA"
            },
            "source": {
                "id": 16,
                "public_name": "LinkedIn (Prospecting)"
            },
            "credited_to": {
                "id": 165372,
                "first_name": "Joel",
                "last_name": "Job Admin",
                "name": "Joel Job Admin",
                "employee_id": null
            },
            "rejection_reason": {
                "id": 9504,
                "name": "Hired another candidate",
                "type": {
                    "id": 1,
                    "name": "We rejected them"
                }
            },
            "rejection_details": {
                "custom_fields": {
                    "custom_rejection_question_field": null
                },
                "keyed_custom_fields": {
                    "custom_rejection_question_field": {
                        "name": "Custom Rejection Question Field",
                        "type": "short_text",
                        "value": null
                    }
                }
            },
            "jobs": [
                {
                    "id": 149995,
                    "name": "DevOps Engineer"
                }
            ],
            "job_post_id": 123,
            "status": "rejected",
            "current_stage": {
                "id": 1073533,
                "name": "Take Home Test"
            },
            "answers": [
                {
                    "question": "How did you hear about this job?",
                    "answer": "A friend"
                },
                {
                    "question": "Website",
                    "answer": "https://example.com"
                },
                {
                    "question": "LinkedIn Profile",
                    "answer": "https://linkedin.com/example"
                }
            ],
            "prospective_office": null,
            "prospective_department": null,
            "prospect_detail": {
                "prospect_pool": null,
                "prospect_stage": null,
                "prospect_owner": null
            },
			"attachments": [
      			{
                    "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
                    "url": "https://prod-heroku.s3.amazonaws.com/...",
                    "type": "offer_packet",
                    "created_at": "2020-09-27T18:45:27.137Z"
      			}
  			]
        },
        {
            "id": 65153308,
            "candidate_id": 53883394,
            "prospect": false,
            "applied_at": "2017-08-15T03:31:46.637Z",
            "rejected_at": null,
            "last_activity_at": "2017-09-28T12:29:30.481Z",
            "location": {
                "address": "New York, New York, United States"
            },
            "source": {
                "id": 12,
                "public_name": "Meetups"
            },
            "credited_to": {
                "id": 566819,
                "first_name": "Bob",
                "last_name": "Smith",
                "name": "Bob Smith",
                "employee_id": null
            },
            "rejection_reason": null,
            "rejection_details": null,
            "jobs": [
                {
                    "id": 299100,
                    "name": "Data Scientist - BK"
                }
            ],
            "job_post_id": 456,
            "status": "active",
            "current_stage": {
                "id": 2966800,
                "name": "Face to Face"
            },
            "answers": [],
            "prospective_office": null,
            "prospective_department": null,
            "prospect_detail": {
                "prospect_pool": null,
                "prospect_stage": null,
                "prospect_owner": null
            },
			"attachments": []
        }
    ],
    "educations": [
        {
            "id": 561227,
            "school_name": "University of Michigan - Ann Arbor",
            "degree": "Bachelor's Degree",
            "discipline": "Computer Science",
            "start_date": "2012-08-15T00:00:00.000Z",
            "end_date": "2016-05-15T00:00:00.000Z"
        }
    ],
    "employments": [
        {
            "id": 8485064,
            "company_name": "Greenhouse",
            "title": "Engineer",
            "start_date": "2012-08-15T00:00:00.000Z",
            "end_date": "2016-05-15T00:00:00.000Z"
        }
    ],
    "linked_user_ids": [
            989604
    ],
    "custom_fields": {
        "desired_salary": "1000000000",
        "work_remotely": true,
        "graduation_year": "2018"
    },
    "keyed_custom_fields": {
        "desired_salary": {
            "name": "Desired Salary",
            "type": "short_text",
            "value": "1000000000"
        },
        "work_remotely": {
            "name": "Work Remotely",
            "type": "boolean",
            "value": true
        },
        "graduation_year_1": {
            "name": "Graduation Year",
            "type": "single_select",
            "value": "2018"
        }
    }
}
```

Retrieve a candidate by its `id`.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/candidates/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the candidate to retrieve

<br>

[See noteworthy response attributes.] (#the-candidate-object)

## DELETE: Delete Candidate

```shell
curl -X DELETE 'https://harvest.greenhouse.io/v1/candidates/{id}'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above returns a JSON response, structured like this:

```json
{
  "message": "Person 29622362 has been deleted."
}
```

Delete a candidate by `id`.

### HTTP Request

`DELETE https://harvest.greenhouse.io/v1/candidates/{id}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


## PATCH: Edit Candidate

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v1/candidates/{id}'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "first_name": "New",
  "last_name": "Name",
  "company": "The Tustin Box Company",
  "title": "Man of Mystery",
  "is_private": true,
  "phone_numbers": [
    {
      "value": "555-1212",
      "type": "mobile"
    }
  ],
  "addresses": [
    {
      "value": "123 Fake St.",
      "type": "home"
    }
  ],
  "email_addresses": [
    {
      "value": "john.locke+work@example.com",
      "type": "work"
    },
    {
      "value": "john.locke@example.com",
      "type": "personal"
    }
  ],
  "website_addresses": [
    {
      "value": "johnlocke.example.com",
      "type": "personal"
    }
  ],
  "social_media_addresses": [
    {
      "value": "linkedin.example.com/john.locke"
    },
    {
      "value": "@johnlocke"
    }
  ],
  "recruiter": { "user_id": 4354 },
  "coordinator": { "email": "coordinator@example.com" },
  "tags": [
    "Walkabout",
    "Orientation"
  ],
  "custom_fields": [
    {
        "id": 1234,
        "value": "Some new value"
    },
    {
        "name_key": "single_select_field_name",
        "value": 12345
   },
   {
        "id": 5678,
        "delete_value": "true"
   }
  ]
}
```
> The above returns a JSON response, structured like this:

```json
[
  {
      "id": 53883394,
      "first_name": "New",
      "last_name": "Name",
      "company": "The Tustin Box Company",
      "title": "Man of Mystery",
      "created_at": "2017-08-15T03:31:46.591Z",
      "updated_at": "2017-09-28T12:54:34.257Z",
      "last_activity": "2017-09-28T12:54:34.243Z",
      "is_private": true,
      "photo_url": null,
      "attachments": [
          {
              "filename": "John_Locke_Offer_Packet_09_28_2017.pdf",
              "url": "https://prod-heroku.s3.amazonaws.com/...",
              "type": "offer_packet"
          }
      ],
      "application_ids": [
          65153308
      ],
      "phone_numbers": [
          {
              "value": "555-1212",
              "type": "mobile"
          }
      ],
      "addresses": [
          {
              "value": "123 Fake Street",
              "type": "home"
          }
      ],
      "email_addresses": [
          {
              "value": "john.locke+work@example.com",
              "type": "work"
          },
          {
              "value": "john.locke@example.com",
              "type": "personal"
          }
      ],
      "website_addresses": [
          {
              "value": "johnlocke.example.com",
              "type": "personal"
          }
      ],
       "social_media_addresses": [
          {
            "value": "linkedin.example.com/john.locke"
          },
          {
            "value": "@johnlocke"
          }
      ],
      "recruiter": {
          "id": 92120,
          "first_name": "Greenhouse",
          "last_name": "Admin",
          "name": "Greenhouse Admin",
          "employee_id": null
      },
      "coordinator": null,
      "can_email": true,
      "tags": [
          "Walkabout",
          "Orientation"
      ],
      "applications": [
          {
              "id": 65153308,
              "candidate_id": 53883394,
              "prospect": false,
              "applied_at": "2017-08-15T03:31:46.637Z",
              "rejected_at": null,
              "last_activity_at": "2017-09-28T12:54:34.243Z",
              "location": {
                  "address": "New York, New York, USA"
              },
              "source": {
                  "id": 12,
                  "public_name": "Meetups"
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
                      "id": 299100,
                      "name": "Data Scientist - BK"
                  }
              ],
              "job_post_id": 123,
              "status": "active",
              "current_stage": {
                  "id": 2966800,
                  "name": "Face to Face"
              },
              "answers": [],
              "prospective_office": null,
              "prospective_department": null,
              "prospect_detail": {
                  "prospect_pool": null,
                  "prospect_stage": null,
                  "prospect_owner": null
              },
			  "attachments": [
      			  {
                      "filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
                      "url": "https://prod-heroku.s3.amazonaws.com/...",
                      "type": "offer_packet",
                      "created_at": "2020-09-27T18:45:27.137Z"
      			  }
  			  ]
          }
      ],
      "educations": [],
      "employments": [],
      "custom_fields": {
        "current_salary": "$23k",
        "desired_salary": "$42k"
      },
      "keyed_custom_fields": {
        "current_salary": {
          "name": "Current salary",
          "type": "short_text",
          "value": "$23k"
        },
        "desired_salary": {
          "name": "Desired salary",
          "type": "short_text",
          "value": "$42k"
        }
     }
  }     
]
```

Update or `patch` a single candidate by its `id`.

### HTTP Request

`PATCH https://harvest.greenhouse.io/v1/candidates/{id}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
first_name | No | string | The candidate's first name
last_name | No | string | The candidate's last name
company | No | string | The candidate's company
title | No | string | The candidate's title
is_private | Whether the candidate is private or not. One of: ["true", "false"]
phone_numbers[] | No | phone_number | Array of phone numbers. Passing an empty array will clear all.
addresses[] | No | address | Array of addresses. Passing an empty array will clear all.
email_addresses[] | No | email_address | Array of email addresses. Passing an empty array will clear all.
website_addresses[] | No | website_address | Array of website addresses. Passing an empty array will clear all.
social_media_addresses[] | No | social_media_address | Array of social media addresses. Passing an empty array will clear all.
tags[] | No | string | Array of tags as strings. Passing an empty array will clear all.
custom_fields[] | No |  custom_field | Array of hashes containing new custom field values.  Passing an empty array does nothing.
recruiter | No | Hash | An object representing the candidate's new recruiter
recruiter[id] | No | Integer | The ID of the new recruiter - either id or email must be present.
recruiter[email] | No | String | The email of the new recruiter - either id or email must be present.
coordinator | No | Hash | An object representing the candidate's new coordinator
coordinator[id] | No | Integer | The ID of the new coordinator - either id or email must be present.
coordinator[email] | No | String | The email of the new coordinator - either id or email must be present.

### Custom Field Parameters

The custom field parameter structure is different in the PATCH method then in GET methods and responses.  Certain type of custom fields require different elements to be included, while deleting a field requires a specific argument.  What follows is the description of each item in a custom field element and what is required depending on the type.

Parameter | Required for | Description
---------- | -------------- | ----------------
id | all | The custom field id for this particular custom field.  One of this or name_key is required.
name_key | all | The field key for this custom field. This can be found in Greenhouse while editing custom options as "Immutable Field Key"  This or id is required for all custom field elements.
value | all | The value field contains the new custom field value.  In most cases this will be a string or a number.  In the case of single-select or multi-select custom fields, this will be a custom field option id or an array of custom field option ids, respectively. In the case of single-select fields, this can also be a string that matches an existing option value name exactly.
unit | currency | This contains the currency unit for a currency custom field. It is only required when updating a currency custom field.  This should accept any 3-character currency code from the ISO-4217 standard.
delete_value  | n/a | When this element is included with a value of "true" (note, string true, not boolean true) the custom field value will be removed from Greenhouse.  Note that updating a custom field value to nil or a blank string will not work, as validations require these to be non-blank values.

<br>

[See noteworthy response attributes.] (#the-candidate-object)


<aside class="notice">
    There may be a delay between when Greenhouse receives the POST: Add Candidate Application request and when Greenhouse creates the full application record, which will result in a truncated API response. The truncated response body will contain the Application ID of the newly created application. You can retrieve the full application record by requesting the Application ID with the GET: Retrieve Application endpoint. If you receive a 404 error from the GET: Retrieve Application endpoint, this indicates that the full application record is still not available. Until the application record has been made fully-available in the API, please continue to request the record until the API returns a successful response. Our recommendation is to perform this check every 30 seconds until the data becomes available.
</aside>

## POST: Add Attachment

<aside class="warning">As of July 2019, we introduced the ability to add attachments to an individual application and to upload new types of attachments. Documentation can be found <a href="#post-add-attachment-to-application">here</a>.</aside>

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/candidates/{id}/attachments'
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
  "url": "https://prod-heroku.s3.amazonaws.com/...",
  "type": "resume",
  "content_type": "application/pdf"
}
```

Post an attachment to a candidate's profile by the candidate `id`.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/candidates/{id}/attachments`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
filename | Yes | string | Name of the file
type | Yes | string | One of: ["resume", "cover_letter", "admin_only"]
content | No | string | Base64 encoded content of the attachment (if you are providing content, you do not need to provide url). String must be UTF-8 encoded.
url | No | string | Url of the attachment (if you are providing the url, you do not need to provide the content.) _Please note, shareable links from cloud services such as Google Drive will result in a corrupted file. Please use machine accessbile URLs._
content_type | Yes* | string | The content-type of the document you are sending. When using a URL, this generally isn't needed, as the responding server will deliver a content type.  This should be included for encoded content.  Accepted content types are: <ul><li>"application/atom+xml"</li><li>"application/javascript"</li><li>"application/json"</li><li>"application/msgpack"</li><li>"application/msword"</li><li>"application/pdf"</li><li>"application/rss+xml"</li><li>"application/vnd.ms-excel"</li><li>"application/vnd.openxmlformats-<br>officedocument.spreadsheetml.sheet"</li><li>"application/vnd.openxmlformats-<br>officedocument.wordprocessingml.document"</li><li>"application/vnd.ms-powerpoint"</li><li>"application/xml"</li><li>"application/x-www-form-urlencoded"</li><li>"application/x-yaml"</li><li>"application/zip"</li><li>"multipart/form-data"</li><li>"image/bmp"</li><li>"image/gif"</li><li>"image/jpeg"</li><li>"image/png"</li><li>"image/tiff"</li><li>"text/calendar"</li><li>"text/css"</li><li>"text/csv"</li><li>"text/html"</li><li>"text/javascript"</li><li>"text/plain"</li><li>"text/vcard"</li><li>"video/mpeg"</li></ul>

\* \- content_type is required for when uploading a document unless you are uploading using a URL.


## POST: Add Candidate

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/candidates'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "first_name": "John",
  "last_name": "Locke",
  "company": "The Tustin Box Company",
  "title": "Man of Mystery",
  "is_private": false,
  "phone_numbers": [
    {
      "value": "555-1212",
      "type": "mobile"
    }
  ],
  "addresses": [
    {
      "value": "123 Fake St.",
      "type": "home"
    }
  ],
  "email_addresses": [
    {
      "value": "john.locke+work@example.com",
      "type": "work"
    },
    {
      "value": "john.locke@example.com",
      "type": "personal"
    }
  ],
  "website_addresses": [
    {
      "value": "johnlocke.example.com",
      "type": "personal"
    }
  ],
  "social_media_addresses": [
    {
      "value": "linkedin.example.com/john.locke"
    },
    {
      "value": "@johnlocke"
    }
  ],
  "educations": [
    {
      "school_id": 459,
      "discipline_id": 940,
      "degree_id": 1230,
      "start_date": "2001-09-15T00:00:00.000Z",
      "end_date": "2004-05-15T00:00:00.000Z"
    }
  ],
  "employments": [
      {
          "company_name": "Greenhouse",
          "title": "Engineer",
          "start_date": "2012-08-15T00:00:00.000Z",
          "end_date": "2016-05-15T00:00:00.000Z"
      }
  ],
  "tags": [
    "Walkabout",
    "Orientation"
  ],
  "applications": [
    {
      "job_id": 215725
    },
     {
      "job_id": 185289
    }
  ]
}
```
> The above returns a JSON response, structured like this:

```json
{
    "id": 57683957,
    "first_name": "John",
    "last_name": "Locke",
    "company": "The Tustin Box Company",
    "title": "Man of Mystery",
    "created_at": "2017-09-28T13:27:54.735Z",
    "updated_at": "2017-09-28T13:27:55.229Z",
    "last_activity": "2017-09-28T13:27:55.213Z",
    "is_private": false,
    "photo_url": null,
    "attachments": [],
    "application_ids": [
        69201605,
        69201604
    ],
    "phone_numbers": [
        {
            "value": "555-1212",
            "type": "mobile"
        }
    ],
    "addresses": [
        {
            "value": "123 Fake St.",
            "type": "home"
        }
    ],
    "email_addresses": [
        {
            "value": "john.locke@example.com",
            "type": "personal"
        },
        {
            "value": "john.locke+work@example.com",
            "type": "work"
        }
    ],
    "website_addresses": [
        {
            "value": "johnlocke.example.com",
            "type": "personal"
        }
    ],
    "social_media_addresses": [
        {
            "value": "@johnlocke"
        },
        {
            "value": "linkedin.example.com/john.locke"
        }
    ],
    "recruiter": null,
    "coordinator": null,
    "can_email": true,
    "tags": [
        "Orientation",
        "Walkabout"
    ],
    "applications": [
        {
            "id": 69201605,
            "candidate_id": 57683957,
            "prospect": false,
            "applied_at": "2017-09-28T13:27:54.873Z",
            "rejected_at": null,
            "last_activity_at": "2017-09-28T13:27:55.213Z",
            "location": {
                "address": "New York, New York, USA"
            },
            "source": null,
            "credited_to": null,
            "rejection_reason": null,
            "rejection_details": null,
            "jobs": [
                {
                    "id": 185289,
                    "name": "Product Specialist"
                }
            ],
            "job_post_id": 123,
            "status": "active",
            "current_stage": {
                "id": 1355395,
                "name": "Application Review"
            },
            "answers": [],
            "prospective_office": null,
            "prospective_department": null,
            "prospect_detail": {
                "prospect_pool": null,
                "prospect_stage": null,
                "prospect_owner": null
            },
			"attachments": []
        },
        {
            "id": 69201604,
            "candidate_id": 57683957,
            "prospect": false,
            "applied_at": "2017-09-28T13:27:54.812Z",
            "rejected_at": null,
            "last_activity_at": "2017-09-28T13:27:55.213Z",
            "location": null,
            "source": null,
            "credited_to": null,
            "rejection_reason": null,
            "rejection_details": null,
            "jobs": [
                {
                    "id": 215725,
                    "name": "Operations Manger "
                }
            ],
            "job_post_id": 456,
            "status": "active",
            "current_stage": {
                "id": 1579673,
                "name": "Application Review"
            },
            "answers": [],
            "prospective_office": null,
            "prospective_department": null,
            "prospect_detail": {
                "prospect_pool": null,
                "prospect_stage": null,
                "prospect_owner": null
            },
			"attachments": []
        }
    ],
    "educations": [
        {
            "id": 561226,
            "school_name": "Siena College",
            "discipline": "Computer Science",
            "degree": "Bachelor's Degree"
        }
    ],
    "employments": [
        {
            "id": 8485064,
            "company_name": "Greenhouse",
            "title": "Engineer",
            "start_date": "2012-08-15T00:00:00.000Z",
            "end_date": "2016-05-15T00:00:00.000Z"
        }
    ],
    "custom_fields": {
        "desired_salary": null,
        "work_remotely": null,
        "graduation_year": null
    },
    "keyed_custom_fields": {
        "desired_salary": null,
        "work_remotely": null,
        "graduation_year_1": null
    }
}
```

Create a new candidate.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/candidates`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
first_name | Yes | string | The candidate's first name
last_name | Yes | string | The candidate's last name
company | No | string | The candidate's company
title | No | string | The candidate's title
phone_numbers[] | No | phone_number | Array of phone numbers. Passing an empty array will clear all.
addresses[] | No | address | Array of addresses. Passing an empty array will clear all.
email_addresses[] | No | email_address | Array of email addresses. Passing an empty array will clear all.
website_addresses[] | No | website_address | Array of website addresses. Passing an empty array will clear all.
social_media_addresses[] | No | social_media_address | Array of social media addresses. Passing an empty array will clear all.
educations | No | Array | An array of education records. See [Add Education] (#post-add-education) for parameters.
employments | No | Array | An array of employment records. See [Add Employment] (#post-add-employment) for parameters.
tags[] | No | string | Array of tags as strings. Passing an empty array will clear all.
custom_fields[] | No |  custom_field | Array of hashes containing new custom field values.  Passing an empty array does nothing.
recruiter | No | Object | An object representing the candidate's recruiter
recruiter[id] | No | Integer | The ID of the recruiter - either id or email must be present.
recruiter[email] | No | String | The email of the recruiter - either id or email must be present.
coordinator | No | Object | An object representing the candidate's coordinator
coordinator[id] | No | Integer | The ID of the coordinator - either id or email must be present.
coordinator[email] | No | String | The email of the coordinator - either id or email must be present.
custom_fields | No | Array | Array of custom field value objects - See "Custom Field Parameters" under [Edit candidate] (#patch-edit-candidate) for parameters.
activity_feed_notes | No | Array | An array of activity feed objects. See [Add Note] (#post-add-note) for parameters.
applications | Yes | Array | An array of application objects. At least one required. See [Add Application] (#post-add-application-to-candidate-prospect) for parameters.

<aside class="notice">
    There may be a delay between when Greenhouse receives the POST: Add Candidate request and when Greenhouse creates the full candidate record, which will result in a truncated API response. The truncated response body will contain the Candidate ID and the Application ID(s) of the newly created candidate. You can retrieve the full candidate record by requesting the Candidate ID with the GET: Retrieve Candidate endpoint. If you receive a 404 error from the GET: Retrieve Candidate endpoint, this indicates that the full candidate record is still not available. Until the candidate record has been made fully-available in the API, please continue to request the record until the API returns a successful response. Our recommendation is to perform this check every 30 seconds until the data becomes available.
</aside>

[See noteworthy response attributes.] (#the-candidate-object)



## POST: Add Note

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/candidates/{id}/activity_feed/notes'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```
{
  "user_id": "158108",
  "body": "John Locke was moved into Recruiter Phone Screen for Accounting Manager on 03/27/2014 by Boone Carlyle",
  "visibility": "admin_only"
}
```

> The above command returns a JSON response, structured like this:

```json
{
  "id": 226809052,
  "created_at": "2015-07-17T16:29:31Z",
  "body": "John Locke was moved into Recruiter Phone Screen for Accounting Manager on 03/27/2014 by Boone Carlyle",
  "user": {
     "id": 214,
        "first_name": "Boone",
        "last_name": "Carlyle",
        "name": "Boone Carlyle",
        "employee_id": null
  },
  "private": false,
  "visiblity": "admin_only",
  "visibility": "admin_only"
}
```

Create a candidate note.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/candidates/{id}/activity_feed/notes`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
user_id | Yes | integer |   The ID of the user creating the note
body | Yes | string | Note body
visibility* | Yes | string | One of: `"admin_only"`, `"private"`, `"public"`

\* - Due to a legacy typo, the response includes the same value as `visiblity`. It is safe to ignore this value, but it is maintained for backward compatibility.


## POST: Add E-mail Note

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/candidates/{id}/activity_feed/emails'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```
{
  "user_id": "214",
  "to": "candidate@example.com",
  "from": "recruiter@example.com",
  "cc": ["manager@example.com"],
  "subject": "Interview Scheduled",
  "body": "An interview has been scheduled for tomorrow."
}
```

> The above command returns a JSON response, structured like this:

```json
{
  "id": 226809053,
  "created_at": "2015-07-17T16:29:31Z",
  "subject": "Interview Scheduled",
  "body": "An interview has been scheduled for tomorrow.",
  "to": "candidate@example.com",
  "from": "recruiter@example.com",
  "cc": [
    "manager@example.com"
    ],
  "user": {
    "id": 214,
    "first_name": "Donald",
    "last_name": "Johnson",
    "name": "Donald Johnson",
    "employee_id": "12345"
  }
}
```

Create a candidate e-mail note.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/candidates/{id}/activity_feed/emails`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
user_id | Yes | integer |   The ID of the user creating the note
to | Yes | string | This is a free text field that is meant to be an e-mail address. E-mail format will not be validated.
from | Yes | string | This is a free text field that is meant to be an e-mail address. E-mail format will not be validated.
cc | No | Array | This is meant to be an array of e-mail addresses. E-mail format will not be validated.
subject | Yes | string | The subject line of the e-mail.
body | Yes | string | The body of the e-mail.


## POST: Add Education

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/candidates/{id}/educations'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "school_id": 459,
  "discipline_id": 940,
  "degree_id": 1230,
  "start_date": "2001-09-15T00:00:00.000Z",
  "end_date": "2004-05-15T00:00:00.000Z"
}
```

> The above command returns a JSON response with a 201 status, structured like this:

```json
{
  "id": 5690098,
  "school_name": "Siena College",
  "discipline": "Computer Science",
  "degree": "Bachelor's Degree",
  "start_date": "2001-09-15T00:00:00.000Z",
  "end_date": "2004-05-15T00:00:00.000Z"
}
```

Create a new education record

### HTTP Request

`POST https://harvest.greenhouse.io/v1/candidates/{id}/educations`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
school_id | No | integer |  The ID of the college attended; from the GET schools endpoint
discipline_id | No | integer | The ID of the discipline of the candidate's education; from the GET disciplines endpoint.
degree_id | No | integer | The type of degree received; from the GET degrees endpoint
start_month | No | integer | The month the candidate began attendance. Must be between 1-12.
start_year | No | integer | The year the candidate began attendance. Must be between 1900-2100.
start_date | No | DateTime | The date the candidate began attendance. Timestamp must be in in [ISO-8601] (#general-considerations) format.*
end_month | No | integer | The month the candidate finished attendance. Must be between 1-12.
end_year | No | integer | The year the candidate finished attendance. Must be between 1900-2100.
end_date | No | DateTime | The date the candidate finished attendance. Timestamp must be in in [ISO-8601] (#general-considerations) format.*

* - Note that start_date and end_date accept an [ISO-8601] (#general-considerations) timestamp in accordance with Harvest's standard timestamp rules, but only Month and Year will be displayed on the candidate profile in Greenhouse. The "latest education" will be updated automatically. Day and time information in these timestamps will be recorded but not referenced in Greenhouse.
* - Note that you can either have start_date, or start_month and start_year.
* - Note that you can either have end_date, or end_month and end_year.

## DELETE: Remove Education From Candidate

```shell
curl -X DELETE 'https://harvest.greenhouse.io/v1/candidates/{candidate_id}/educations/{education_id}'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above returns a JSON response, structured like this:

```json
{
    "success": true,
    "message": "Education ID 2002247 destroyed."
}
```

Delete an education record by candidate and education id.

### HTTP Request

`DELETE https://harvest.greenhouse.io/v1/candidates/{candidate_id}/educations/{education_id}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


## POST: Add Employment

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/candidates/{id}/employments'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```
{
  "company_name": "Greenhouse",
  "title": "Engineer",
  "start_date": "2001-09-15T00:00:00.000Z",
  "end_date": "2004-05-15T00:00:00.000Z"
}
```

> The above command returns a JSON response with a 201 status, structured like this:

```json
{
  "id": 5690098,
  "company_name": "Greenhouse",
  "title": "Engineer",
  "start_date": "2001-09-15T00:00:00.000Z",
  "end_date": "2004-05-15T00:00:00.000Z"
}
```

Create a new employment record

### HTTP Request

`POST https://harvest.greenhouse.io/v1/candidates/{id}/employments`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
company_name | Yes | String |  A free text field indicating an employer's name
title | Yes | String | A free text field indicating the candidate's title while at the employer.
start_date | Yes | DateTime | The date the candidate began at employer. Timestamp must be in in [ISO-8601] (#general-considerations) format.*
end_date | No | DateTime | The date the candidate finished at employer. Timestamp must be in in [ISO-8601] (#general-considerations) format.* An empty end_date indicates current employment.

* - Note that start_date and end_date accept an [ISO-8601] (#general-considerations) timestamp in accordance with Harvest's standard timestamp rules, but time will be ignored in the context of employment. The "latest employment" will be updated automatically.


## DELETE: Remove Employment From Candidate

```shell
curl -X DELETE 'https://harvest.greenhouse.io/v1/candidates/{candidate_id}/employments/{employment_id}'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above returns a JSON response, structured like this:

```json
{
    "success": true,
    "message": "Employment ID 823384 destroyed."
}
```

Delete an employment record by candidate and employment id.

### HTTP Request

`DELETE https://harvest.greenhouse.io/v1/candidates/{candidate_id}/employments/{employment_id}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


## POST: Add Prospect

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/prospects'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "first_name": "John",
  "last_name": "Locke",
  "company": "The Tustin Box Company",
  "title": "Man of Mystery",
  "is_private": false,
  "phone_numbers": [
    {
      "value": "555-1212",
      "type": "mobile"
    }
  ],
  "addresses": [
    {
      "value": "123 Fake St.",
      "type": "home"
    }
  ],
  "email_addresses": [
    {
      "value": "john.locke+work@example.com",
      "type": "work"
    },
    {
      "value": "john.locke@example.com",
      "type": "personal"
    }
  ],
  "website_addresses": [
    {
      "value": "johnlocke.example.com",
      "type": "personal"
    }
  ],
  "social_media_addresses": [
    {
      "value": "linkedin.example.com/john.locke"
    },
    {
      "value": "@johnlocke"
    }
  ],
  "educations": [
    {
      "school_id": 459,
      "discipline_id": 940,
      "degree_id": 1230,
      "start_date": "2001-09-15T00:00:00.000Z",
      "end_date": "2004-05-15T00:00:00.000Z"
    }
  ],
  "employments": [
      {
          "company_name": "Greenhouse",
          "title": "Engineer",
          "start_date": "2012-08-15T00:00:00.000Z",
          "end_date": "2016-05-15T00:00:00.000Z"
      }
  ],
  "tags": [
    "Walkabout",
    "Orientation"
  ],
  "application": {
    "job_ids": [123, 456, 789],
    "source_id": 1234,
    "referrer": {
      "type": "id",
      "value": 770
    },
    "custom_fields": [],
    "attachments": []
  }
}
```
> The above returns a JSON response, structured like this:

```json
{
  "id": 29843268,
  "first_name": "John",
  "last_name": "Locke",
  "company": "The Tustin Box Company",
  "title": "Man of Mystery",
  "is_private": false,
  "created_at": "2016-12-21T19:45:01.467Z",
  "updated_at": "2016-12-21T19:45:01.907Z",
  "last_activity": "2016-12-21T19:45:01.867Z",
  "photo_url": null,
  "attachments": [],
  "application_ids": [
    38776657
  ],
  "phone_numbers": [
    {
      "value": "555-1212",
      "type": "mobile"
    }
  ],
  "addresses": [
    {
      "value": "123 Fake St.",
      "type": "home"
    }
  ],
  "email_addresses": [
    {
      "value": "john.locke@example.com",
      "type": "personal"
    },
    {
      "value": "john.locke+work@example.com",
      "type": "work"
    }
  ],
  "website_addresses": [
    {
      "value": "johnlocke.example.com",
      "type": "personal"
    }
  ],
  "social_media_addresses": [
    {
      "value": "@johnlocke"
    },
    {
      "value": "linkedin.example.com/john.locke"
    }
  ],
  "recruiter": null,
  "coordinator": null,
  "can_email": true,
  "tags": [
    "Orientation",
    "Walkabout"
  ],
  "applications": [
    {
      "id": 38776657,
      "candidate_id": 29843268,
      "prospect": true,
      "applied_at": "2016-12-21T19:45:01.757Z",
      "rejected_at": null,
      "last_activity_at": "2016-12-21T19:45:01.867Z",
      "source": null,
      "location": null,
      "credited_to": null,
      "rejection_reason": null,
      "rejection_details": null,
      "jobs": [],
      "job_post_id": null,
      "status": "active",
      "current_stage": null,
      "answers": [],
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
        "test": "A test value"
      },
      "keyed_custom_fields": {
         "test": {
            "name": "Test",
            "type": "long_text",
            "value": "A test value"
          }
        }
     }
  ],
  "educations": [
    {
      "id": 561226,
      "school_name": "Siena College",
      "discipline": "Computer Science",
      "degree": "Bachelor's Degree"
    }
  ],
  "employments": [
      {
          "id": 8485064,
          "company_name": "Greenhouse",
          "title": "Engineer",
          "start_date": "2012-08-15T00:00:00.000Z",
          "end_date": "2016-05-15T00:00:00.000Z"
      }
  ],
  "custom_fields": {
    "current_salary": "$123,000",
    "desired_salary": "$150,000"
  },
  "keyed_custom_fields": {
    "current_salary": {
      "name": "Current salary",
      "type": "short_text",
      "value": "$123,000"
    },
    "desired_salary": {
      "name": "Desired salary",
      "type": "short_text",
      "value": "$150,000"
    }
  }
}
```

Create a new prospect. The difference between a prospect and a candidate is that a prospect can be on no jobs or many jobs. A prospect application cannot be added to a job stage. When a prospect is ready to be added to a job stage, they can be converted to a candidate in Greenhouse. Alternatively, you can add a candidate application to a prospect's profile by using the [Add Candidate Application] (#post-add-candidate-application) endpoint. The organization must be able to create prospects to set this field.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/prospects`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
first_name | Yes | string | The prospect's first name
last_name | Yes | string | The prospect's last name
company | No | string | The prospect's company
title | No | string | The prospect's title
phone_numbers[] | No | phone_number | Array of phone numbers. Passing an empty array will clear all.
addresses[] | No | address | Array of addresses. Passing an empty array will clear all.
email_addresses[] | No | email_address | Array of email addresses. Passing an empty array will clear all.
website_addresses[] | No | website_address | Array of website addresses. Passing an empty array will clear all.
social_media_addresses[] | No | social_media_address | Array of social media addresses. Passing an empty array will clear all.
tags[] | No | string | Array of tags as strings. Passing an empty array will clear all.
custom_fields[] | No |  custom_field | Array of hashes containing new custom field values.  Passing an empty array does nothing.
recruiter | No | Object | An object representing the prospect's recruiter
recruiter[id] | No | Integer | The ID of the recruiter - either id or email must be present.
recruiter[email] | No | String | The email of the recruiter - either id or email must be present.
coordinator | No | Object | An object representing the prospect's coordinator
coordinator[id] | No | Integer | The ID of the coordinator - either id or email must be present.
coordinator[email] | No | String | The email of the coordinator - either id or email must be present.
custom_fields | No | Array | Array of custom field value objects - See "Custom Field Parameters" under [Edit candidate] (#patch-edit-candidate) for parameters.
activity_feed_notes | No | Array | An array of activity feed objects. See [Add Note] (#post-add-note) for parameters.
application | No | Hash | As opposed to candidate, a prospect is a single application object that contains multiple job ids.  A prospect in Greenhouse can be attached to zero or many jobs.  If the request does not contain an application object, the person will be created as a jobless prospect.  The source_id, referrer, custom_fields, and attachments parameters in this object match the format of the [Add Application] (#post-add-application) endpoint.
application[job_ids] | No | Array | This element is unique to the prospects endpoint. This contains an array of job ids to which the prospect will be assigned.  Note that even if the application object is included, this may still be blank or omitted and the request will create a jobless prospect. A normal use case for this would be creating a jobless prospect but still wanting to attach their resume or identify their source.

<aside class="notice">
    There may be a delay between when Greenhouse receives the POST: Add Prospect request and when Greenhouse creates the full prospect record, which will result in a truncated API response. The truncated response body will contain the Prospect ID. You can retrieve the full prospect record by requesting the Prospect ID with the GET: Retrieve Candidate endpoint. If you receive a 404 error from the GET: Retrieve Candidate endpoint, this indicates that the full prospect record is still not available. Until the prospect record has been made fully-available in the API, please continue to request the record until the API returns a successful response. Our recommendation is to perform this check every 30 seconds until the data becomes available.
</aside>

[See noteworthy response attributes.] (#the-candidate-object)

## PUT: Anonymize Candidate

```shell
curl -X PUT 'https://harvest.greenhouse.io/v1/candidates/{id}/anonymize?fields={field_names}'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns a JSON response, structured like this:

```json
{
    "id": 53883394,
    "first_name": "Anonymized",
    "last_name": "53883394",
    "company": null,
    "title": null,
    "created_at": "2017-08-15T03:31:46.591Z",
    "updated_at": "2017-09-28T13:36:04.725Z",
    "last_activity": "2017-09-28T13:31:37.929Z",
    "is_private": false,
    "photo_url": null,
    "attachments": [
        {
            "filename": "John_Locke_Offer_Packet_09_28_2017.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "offer_packet"
        }
    ],
    "application_ids": [
        69201279
    ],
    "phone_numbers": [],
    "addresses": [
        {
            "value": "123 City Street\nNew York, Ny 10001",
            "type": "home"
        }
    ],
    "email_addresses": [],
    "website_addresses": [
        {
            "value": "mysite.com",
            "type": "personal"
        }
    ],
    "social_media_addresses": [],
    "recruiter": {
        "id": 92120,
        "first_name": "Greenhouse",
        "last_name": "Admin",
        "name": "Greenhouse Admin",
        "employee_id": null
    },
    "coordinator": null,
    "can_email": true,
    "tags": [
        "Python",
        "Ruby"
    ],
    "applications": [
        {
            "id": 69201279,
            "candidate_id": 53883394,
            "prospect": false,
            "applied_at": "2017-09-28T13:21:22.749Z",
            "rejected_at": null,
            "last_activity_at": "2017-09-28T13:31:37.929Z",
            "location": null,
            "source": {
                "id": 7,
                "public_name": "Indeed"
            },
            "credited_to": {
                "id": 566993,
                "first_name": "Jane",
                "last_name": "Smith",
                "name": "Jane Smith",
                "employee_id": null
            },
            "rejection_reason": null,
            "rejection_details": null,
            "jobs": [
                {
                    "id": 213967,
                    "name": "Head of Product"
                }
            ],
            "job_post_id": 123,
            "status": "active",
            "current_stage": {
                "id": 1567309,
                "name": "Application Review"
            },
            "answers": [],
            "prospective_office": null,
            "prospective_department": null,
            "prospect_detail": {
                "prospect_pool": null,
                "prospect_stage": null,
                "prospect_owner": null
            },
			"attachments": [
      			{
          			"filename": "John_Locke_Offer_Packet_09_27_2017.pdf",
          			"url": "https://prod-heroku.s3.amazonaws.com/...",
                    "type": "offer_packet",
                    "created_at": "2020-09-27T18:45:27.137Z"
      			}
  			]
        }
    ],
    "educations": [
        {
            "id": 561227,
            "school_name": "University of Michigan - Ann Arbor",
            "degree": "Bachelor's Degree",
            "discipline": "Computer Science"
        }
    ],
    "employments": [
        {
            "id": 8485064,
            "company_name": "Greenhouse",
            "title": "Engineer",
            "start_date": "2012-08-15T00:00:00.000Z",
            "end_date": "2016-05-15T00:00:00.000Z"
        }
    ],
    "custom_fields": {
        "desired_salary": null,
        "work_remotely": null,
        "graduation_year": null
    },
    "keyed_custom_fields": {
        "desired_salary": null,
        "work_remotely": null,
        "graduation_year_1": null
    }
}
```

Anonymize the data associated with a candidate. Please note that this endpoint is only available to customers with Expert-level accounts.

### HTTP Request

`PUT https://harvest.greenhouse.io/v1/candidates/{id}/anonymize?fields={field_names}`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


### Querystring Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
fields | Yes | comma-delimited string | The set of field names that should be anonymized on the candidate from the following list: full_name, current_company, current_title, tags, phone_numbers, emails, social_media_links, websites, addresses, location, custom_candidate_fields, source, recruiter, coordinator, attachments, application_questions, referral_questions, notes, rejection_notes, email_addresses, activity_items, innotes, inmails, rejection_reason, scorecards_and_interviews, offers, credited_to, headline, all_offer_versions, follow_up_reminders, custom_application_fields, education, employment, candidate_stage_data, prospect_owner, custom_rejection_question_fields, touchpoints, prospect_pool_and_stage, prospect_jobs, prospect_offices, prospect_offices_and_departments, and third_party_integrations


## PUT: Merge Candidates

```shell
curl -X PUT 'https://harvest.greenhouse.io/v1/candidates/merge'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
    "primary_candidate_id": 73821,
    "duplicate_candidate_id": 839283
}
```

> The above command returns a JSON response, structured like this:

```json
{
    "id": 55961742,
    "first_name": "Justin",
    "last_name": "Locke",
    "company": "The Tustin Box Company",
    "title": "Man of Mystery",
    "created_at": "2017-09-07T22:54:06.629Z",
    "updated_at": "2017-09-28T13:41:43.655Z",
    "last_activity": "2017-09-28T13:41:43.631Z",
    "is_private": false,
    "photo_url": null,
    "attachments": [
        {
            "filename": "Justin Locke resume.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "resume"
        },
         {
            "filename": "Justin Locke cover leter.pdf",
            "url": "https://prod-heroku.s3.amazonaws.com/...",
            "type": "cover_letter"
        }
    ],
    "application_ids": [
        67398864
    ],
    "phone_numbers": [
        {
            "value": "222-555-4608",
            "type": "home"
        }
    ],
    "addresses": [],
    "email_addresses": [
        {
            "value": "justin.locke@example.com",
            "type": "personal"
        }
    ],
    "website_addresses": [
        {
            "value": "example.com",
            "type": "other"
        }
    ],
    "social_media_addresses": [],
    "recruiter": null,
    "coordinator": null,
    "can_email": true,
    "tags": [
        "Comp Sci"
    ],
    "applications": [
        {
            "id": 67398864,
            "candidate_id": 55961742,
            "prospect": false,
            "applied_at": "2017-09-07T23:00:25.746Z",
            "rejected_at": null,
            "last_activity_at": "2017-09-28T13:41:43.631Z",
            "location": {
                "address": "New York, New York, USA"
            },
            "source": {
                "id": 7,
                "public_name": "Indeed"
            },
            "credited_to": {
                "id": 92121,
                "first_name": "Jane",
                "last_name": "Smith",
                "name": "Jane Smith",
                "employee_id": "456"
            },
            "rejection_reason": null,
            "rejection_details": null,
            "jobs": [
                {
                    "id": 213967,
                    "name": "Product Manager"
                }
            ],
            "job_post_id": 123,
            "status": "active",
            "current_stage": {
                "id": 1567309,
                "name": "Application Review"
            },
            "answers": [],
            "prospective_office": null,
            "prospective_department": null,
            "prospect_detail": {
                "prospect_pool": null,
                "prospect_stage": null,
                "prospect_owner": null
            },
    		"attachments": [
        		{
            		"filename": "Justin Locke resume.pdf",
            		"url": "https://prod-heroku.s3.amazonaws.com/...",
            		"type": "resume"
        		},
         		{
            		"filename": "Justin Locke cover leter.pdf",
            		"url": "https://prod-heroku.s3.amazonaws.com/...",
            		"type": "cover_letter"
        		}
    		]
        }
    ],
    "educations": [
        {
            "id": 561227,
            "school_name": "University of Michigan - Ann Arbor",
            "degree": "Bachelor's Degree",
            "discipline": "Computer Science"
        }
    ],
    "employments": [
        {
            "id": 8485064,
            "company_name": "Greenhouse",
            "title": "Engineer",
            "start_date": "2012-08-15T00:00:00.000Z",
            "end_date": "2016-05-15T00:00:00.000Z"
        }
    ],
    "custom_fields": {
        "desired_salary": "120K",
        "work_remotely": true,
        "graduation_year": "2018"
    },
    "keyed_custom_fields": {
        "desired_salary": {
            "name": "Desired Salary",
            "type": "short_text",
            "value": "120K"
        },
        "work_remotely": {
            "name": "Work Remotely",
            "type": "boolean",
            "value": true
        },
        "graduation_year_1": {
            "name": "Graduation Year",
            "type": "single_select",
            "value": "2018"
        }
    }
}
```

Merge two candidates into one.

### HTTP Request

`PUT https://harvest.greenhouse.io/v1/candidates/merge`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
primary\_candidate\_id | Yes | integer | The id of the first candidate that will be merged. This candidate will also be the result of the merge.
duplicate\_candidate\_id | Yes | integer | The id of the second candidate that will be merged. ***This candidate will cease to exist after the merge is complete.***
