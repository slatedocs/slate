# Jobs

## The job object

An organization's jobs.

```json
{
  "id": 6404,
  "name": "Archaeologist",
  "requisition_id": "abc123",
  "notes": "<p>Resistance to electro-magnetic radiation a plus!</p>",
  "confidential": false,
  "status": "closed",
  "created_at": "2013-12-10T14:42:58Z",
  "opened_at": "2013-12-11T14:42:58Z",
  "closed_at": "2013-12-12T14:42:58Z",
  "updated_at": "2013-12-12T14:42:58Z",
  "is_template": false,
  "copied_from_id": 2345,
  "departments": [
    {
      "id": 25907,
      "name": "Second-Level department",
      "parent_id": 25908,
      "child_ids": [14510],
      "external_id": "12345"
    }
  ],
  "offices": [
    {
      "id": 47012,
      "name": "New York",
      "location": {
        "name": "New York, United States"
      },
      "primary_contact_user_id": 150893,
      "parent_id": 50849,
      "child_ids": [50852, 50891],
      "external_id": "15679"
    }
  ],
  "custom_fields": {
    "employment_type": "Full-Time",
    "maximum_budget": "$81.5k",
    "salary_range": {
      "min_value": 70000,
      "max_value": 90000,
      "unit": "USD"
    }
  },
  "keyed_custom_fields": {
    "employment_type": {
      "name": "Time type",
      "type": "single_select",
      "value": "Full-Time"
    },
    "budget": {
      "name": "Maximum Budget",
      "type": "short_text",
      "value": "Full-Time"
    },
    "salary_range": {
      "name": "Salary Range",
      "type": "currency_range",
      "value": {
        "min_value": 70000,
        "max_value": 90000,
        "unit": "USD"
      }
    }
  },
  "hiring_team": {
    "hiring_managers": [
      {
        "id": 84275,
        "first_name": "Kaylee",
        "last_name": "Prime",
        "name": "Kaylee Prime",
        "employee_id": "13636"
      },
      {
        "id": 169779,
        "first_name": "Hank",
        "last_name": "Hollandaise",
        "name": "Hank Hollandaise",
        "employee_id": "34537"
      }
    ],
    "recruiters": [
      {
        "id": 81111,
        "first_name": "Samuel",
        "last_name": "Skateboard",
        "name": "Samuel Skateboard",
        "employee_id": "34531",
        "responsible": false
      },
      {
        "id": 153448,
        "first_name": "Stegosaurus",
        "last_name": "Heels",
        "name": "Stegosaurus Heels",
        "employee_id": "45748",
        "responsible": true
      }
    ],
    "coordinators": [
      {
        "id": 122635,
        "first_name": "Teddy",
        "last_name": "Pizzazz",
        "name": "Teddy Pizzazz",
        "employee_id": "47327",
        "responsible": true
      },
      {
        "id": 177046,
        "first_name": "Mirandella",
        "last_name": "Lager",
        "name": "Mirandella Lager",
        "employee_id": "43626",
        "responsible": false
      }
    ],
    "sourcers": [
      {
        "id": 122635,
        "first_name": "Teddy",
        "last_name": "Pizzazz",
        "name": "Teddy Pizzazz",
        "employee_id": "47327"
      }
    ]
  },
  "openings": [
    {
      "id": 123,
      "opening_id": "3-1",
      "status": "open",
      "opened_at": "2015-11-20T23:14:14.736Z",
      "closed_at": "2017-11-20T23:14:14.736Z",
      "application_id": 45678,
      "close_reason": {
        "id": 678,
        "name": "Hired - Backfill"
      }
    },
    {
      "id": 124,
      "opening_id": "3-2",
      "status": "open",
      "opened_at": "2015-11-20T23:14:14.739Z",
      "closed_at": null,
      "application_id": null,
      "close_reason": null
    },
    {
      "id": 125,
      "opening_id": null,
      "status": "open",
      "opened_at": "2016-02-03T20:00:00.000Z",
      "closed_at": null,
      "application_id": null
    },
    {
      "id": 126,
      "opening_id": "2-4",
      "status": "closed",
      "opened_at": "2016-02-03T16:38:46.985Z",
      "closed_at": "2016-02-03T16:39:09.811Z",
      "application_id": 1232,
      "close_reason": {
        "id": 689,
        "name": "Hired"
      }
    }
  ]
}
```

### Noteworthy attributes

| Attribute                 | Description                                                                                                                                                                                                                                                                                                                                                                         |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id                        | The job's unique identifier                                                                                                                                                                                                                                                                                                                                                         |
| requisition_id            | An arbitrary ID provided by an external source; does not map to another entity within Greenhouse.                                                                                                                                                                                                                                                                                   |
| status                    | One of `open`, `closed`, `draft`.                                                                                                                                                                                                                                                                                                                                                   |
| confidential              | One of `true`, `false`. If the job is confidential or not.                                                                                                                                                                                                                                                                                                                          |
| departments               | An array containing the [department](#departments) which this job belongs to.                                                                                                                                                                                                                                                                                                       |
| offices                   | An array containing the [offices](#offices) this job is associated with.                                                                                                                                                                                                                                                                                                            |
| hiring_team               | Lists the names and User IDs of the hiring managers, recruiters, coordinators and sourcers associated with this job. For recruiters and coordinators, there is a `responsible` boolean flag which indicates that the user is the responsible recruiter or coordinator for this job.                                                                                                 |
| custom_fields             | Contains any custom job fields which have been defined by your organization.                                                                                                                                                                                                                                                                                                        |
| keyed_custom_fields       | This contains the same information as custom_fields but formatted in a different way that includes more information. This will tell you the type of custom field data to expect, the text name of custom field, and the value. The key of this hash is the custom field's immutable field key, which will not change even if the name of the custom field is changed in Greenhouse. |
| openings                  | Lists the openings associated with this job.                                                                                                                                                                                                                                                                                                                                        |
| openings[].opening_id     | Custom identifier set by an organization. Can be `null`.                                                                                                                                                                                                                                                                                                                            |
| openings[].status         | One of: `["open", "closed"]`                                                                                                                                                                                                                                                                                                                                                        |
| openings[].opened_at      | Timestamp when the opening was created.                                                                                                                                                                                                                                                                                                                                             |
| openings[].closed_at      | Timestamp when the opening was closed. An opening is closed when it is filled or removed.                                                                                                                                                                                                                                                                                           |
| openings[].application_id | If the opening is closed and a candidate was hired to fill the opening, this is the ID of the candidate's application. Otherwise, null.                                                                                                                                                                                                                                             |
| openings[].close_reason   | If the opening is closed, it may or may not have a reason for the closure. This contains the id and name of the close reason.                                                                                                                                                                                                                                                       |
| is_template | Is this job designated as a template used to create other jobs. This may be true, false, or null. Null is an indication this job was created before template job feature.
|
| copied_from_id | If this job was copied from another job, this field contains the id of the source job.

## GET: List Jobs

```shell
curl 'https://harvest.greenhouse.io/v1/jobs'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns a JSON response, structured like this:

```json
[
  {
    "id": 6404,
    "name": "Archaeologist",
    "requisition_id": "abc123",
    "notes": "<p>Resistance to electro-magnetic radiation a plus!</p>",
    "confidential": false,
    "status": "closed",
    "created_at": "2013-12-10T14:42:58Z",
    "opened_at": "2013-12-11T14:42:58Z",
    "closed_at": "2013-12-12T14:42:58Z",
    "updated_at": "2013-12-12T14:42:58Z",
    "is_template": false,
    "copied_from_id": 2345,
    "departments": [
      {
        "id": 25907,
        "name": "Second-Level department",
        "parent_id": 25908,
        "child_ids": [14510],
        "external_id": "12345"
      }
    ],
    "offices": [
      {
        "id": 47012,
        "name": "New York",
        "location": {
          "name": "New York, United States"
        },
        "primary_contact_user_id": 150893,
        "parent_id": 50849,
        "child_ids": [50852, 50891],
        "external_id": "15679"
      }
    ],
    "custom_fields": {
      "employment_type": "Full-Time",
      "maximum_budget": "$81.5k",
      "salary_range": {
        "min_value": 70000,
        "max_value": 90000,
        "unit": "USD"
      }
    },
    "keyed_custom_fields": {
      "employment_type": {
        "name": "Time type",
        "type": "single_select",
        "value": "Full-Time"
      },
      "budget": {
        "name": "Maximum Budget",
        "type": "short_text",
        "value": "Full-Time"
      },
      "salary_range": {
        "name": "Salary Range",
        "type": "currency_range",
        "value": {
          "min_value": 70000,
          "max_value": 90000,
          "unit": "USD"
        }
      }
    },
    "hiring_team": {
      "hiring_managers": [
        {
          "id": 84275,
          "first_name": "Kaylee",
          "last_name": "Prime",
          "name": "Kaylee Prime",
          "employee_id": "13636"
        },
        {
          "id": 169779,
          "first_name": "Hank",
          "last_name": "Hollandaise",
          "name": "Hank Hollandaise",
          "employee_id": "34537"
        }
      ],
      "recruiters": [
        {
          "id": 81111,
          "first_name": "Samuel",
          "last_name": "Skateboard",
          "name": "Samuel Skateboard",
          "employee_id": "34531",
          "responsible": false
        },
        {
          "id": 153448,
          "first_name": "Stegosaurus",
          "last_name": "Heels",
          "name": "Stegosaurus Heels",
          "employee_id": "45748",
          "responsible": true
        }
      ],
      "coordinators": [
        {
          "id": 122635,
          "first_name": "Teddy",
          "last_name": "Pizzazz",
          "name": "Teddy Pizzazz",
          "employee_id": "47327",
          "responsible": true
        },
        {
          "id": 177046,
          "first_name": "Mirandella",
          "last_name": "Lager",
          "name": "Mirandella Lager",
          "employee_id": "43626",
          "responsible": false
        }
      ],
      "sourcers": [
        {
          "id": 122635,
          "first_name": "Teddy",
          "last_name": "Pizzazz",
          "name": "Teddy Pizzazz",
          "employee_id": "47327"
        }
      ]
    },
    "openings": [
      {
        "id": 123,
        "opening_id": "3-1",
        "status": "open",
        "opened_at": "2015-11-20T23:14:14.736Z",
        "closed_at": "2017-11-20T23:14:14.736Z",
        "application_id": 45678,
        "close_reason": {
          "id": 678,
          "name": "Hired - Backfill"
        }
      },
      {
        "id": 124,
        "opening_id": "3-2",
        "status": "open",
        "opened_at": "2015-11-20T23:14:14.739Z",
        "closed_at": null,
        "application_id": null,
        "close_reason": null
      },
      {
        "id": 125,
        "opening_id": null,
        "status": "open",
        "opened_at": "2016-02-03T20:00:00.000Z",
        "closed_at": null,
        "application_id": null
      },
      {
        "id": 126,
        "opening_id": "2-4",
        "status": "closed",
        "opened_at": "2016-02-03T16:38:46.985Z",
        "closed_at": "2016-02-03T16:39:09.811Z",
        "application_id": 1232,
        "close_reason": {
          "id": 689,
          "name": "Hired"
        }
      }
    ]
  }
]
```

List all of an organization's jobs.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/jobs`

### Querystring parameters

| Parameter              | Description                                                                                                                                                                            |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| per_page               | Return up to this number of objects per response. Must be an integer between 1 and 500. Defaults to 100.                                                                               |
| page                   | A cursor for use in pagination. Returns the n-th chunk of `per_page` objects.                                                                                                          |
| created_before         | Return only jobs that were created before this timestamp. Timestamp must be in in [ISO-8601](#general-considerations) format.                                                          |
| created_after          | Return only jobs that were created at or after this timestamp. Timestamp must be in in [ISO-8601](#general-considerations) format.                                                     |
| updated_before         | Return only jobs that were updated before this timestamp. Timestamp must be in in [ISO-8601](#general-considerations) format.                                                          |
| updated_after          | Return only jobs that were updated at or after this timestamp. Timestamp must be in in [ISO-8601](#general-considerations) format.                                                     |
| requisition_id         | If included, will return only the jobs that match the given requisition_id                                                                                                             |
| opening_id             | If included, will return only the jobs that contain at least one opening with the given opening_id.                                                                                    |
| status                 | One of 'open', 'closed', or 'draft'. If included, will only return jobs with that status.                                                                                              |
| department_id          | If included, will return only the jobs in this specific department.                                                                                                                    |
| external_department_id | This may be used instead of department_id and represents the ID of the department in an external system.                                                                               |
| office_id              | If included, will return only the jobs in this specific office.                                                                                                                        |
| external_office_id     | This may be used instead of office_id and represents the ID of the office in an external system.                                                                                       |
| custom_field_option_id | The job contains a custom field with this custom_field_option_id selected. Option IDs can be retrieved from the [GET Custom Field Options endpoint](#the-custom-field-options-object). |

<br>
[See noteworthy response attributes.](#the-job-object)

## GET: Retrieve Job

```shell
curl 'https://harvest.greenhouse.io/v1/jobs/{id}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns a JSON response, structured like this:

```json
{
  "id": 6404,
  "name": "Archaeologist",
  "requisition_id": "abc123",
  "notes": "<p>Resistance to electro-magnetic radiation a plus!</p>",
  "confidential": false,
  "status": "closed",
  "created_at": "2013-12-10T14:42:58Z",
  "opened_at": "2013-12-11T14:42:58Z",
  "closed_at": "2013-12-12T14:42:58Z",
  "updated_at": "2013-12-12T14:42:58Z",
  "is_template": false,
  "copied_from_id": 2345,
  "departments": [
    {
      "id": 25907,
      "name": "Second-Level department",
      "parent_id": 25908,
      "child_ids": [14510],
      "external_id": "12345"
    }
  ],
  "offices": [
    {
      "id": 47012,
      "name": "New York",
      "location": {
        "name": "New York, United States"
      },
      "primary_contact_user_id": 150893,
      "parent_id": 50849,
      "child_ids": [50852, 50891],
      "external_id": "15679"
    }
  ],
  "custom_fields": {
    "employment_type": "Full-Time",
    "maximum_budget": "$81.5k",
    "salary_range": {
      "min_value": 70000,
      "max_value": 90000,
      "unit": "USD"
    }
  },
  "keyed_custom_fields": {
    "employment_type": {
      "name": "Time type",
      "type": "single_select",
      "value": "Full-Time"
    },
    "budget": {
      "name": "Maximum Budget",
      "type": "short_text",
      "value": "Full-Time"
    },
    "salary_range": {
      "name": "Salary Range",
      "type": "currency_range",
      "value": {
        "min_value": 70000,
        "max_value": 90000,
        "unit": "USD"
      }
    }
  },
  "hiring_team": {
    "hiring_managers": [
      {
        "id": 84275,
        "first_name": "Kaylee",
        "last_name": "Prime",
        "name": "Kaylee Prime",
        "employee_id": "13636"
      },
      {
        "id": 169779,
        "first_name": "Hank",
        "last_name": "Hollandaise",
        "name": "Hank Hollandaise",
        "employee_id": "34537"
      }
    ],
    "recruiters": [
      {
        "id": 81111,
        "first_name": "Samuel",
        "last_name": "Skateboard",
        "name": "Samuel Skateboard",
        "employee_id": "34531",
        "responsible": false
      },
      {
        "id": 153448,
        "first_name": "Stegosaurus",
        "last_name": "Heels",
        "name": "Stegosaurus Heels",
        "employee_id": "45748",
        "responsible": true
      }
    ],
    "coordinators": [
      {
        "id": 122635,
        "first_name": "Teddy",
        "last_name": "Pizzazz",
        "name": "Teddy Pizzazz",
        "employee_id": "47327",
        "responsible": true
      },
      {
        "id": 177046,
        "first_name": "Mirandella",
        "last_name": "Lager",
        "name": "Mirandella Lager",
        "employee_id": "43626",
        "responsible": false
      }
    ],
    "sourcers": [
      {
        "id": 122635,
        "first_name": "Teddy",
        "last_name": "Pizzazz",
        "name": "Teddy Pizzazz",
        "employee_id": "47327"
      }
    ]
  },
  "openings": [
    {
      "id": 123,
      "opening_id": "3-1",
      "status": "open",
      "opened_at": "2015-11-20T23:14:14.736Z",
      "closed_at": "2017-11-20T23:14:14.736Z",
      "application_id": 45678,
      "close_reason": {
        "id": 678,
        "name": "Hired - Backfill"
      }
    },
    {
      "id": 124,
      "opening_id": "3-2",
      "status": "open",
      "opened_at": "2015-11-20T23:14:14.739Z",
      "closed_at": null,
      "application_id": null,
      "close_reason": null
    },
    {
      "id": 125,
      "opening_id": null,
      "status": "open",
      "opened_at": "2016-02-03T20:00:00.000Z",
      "closed_at": null,
      "application_id": null
    },
    {
      "id": 126,
      "opening_id": "2-4",
      "status": "closed",
      "opened_at": "2016-02-03T16:38:46.985Z",
      "closed_at": "2016-02-03T16:39:09.811Z",
      "application_id": 1232,
      "close_reason": {
        "id": 689,
        "name": "Hired"
      }
    }
  ]
}
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/jobs/{id}`

### URL Parameters

| Parameter | Description                   |
| --------- | ----------------------------- |
| id        | The ID of the job to retrieve |

<br>
[See noteworthy response attributes.](#the-job-object)

## PATCH: Update Job

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v1/jobs/{id}'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "name": "New job name",
  "requisition_id": "1",
  "notes": "Here are some notes",
  "team_and_responsibilities": "Info",
  "how_to_sell_this_job": "the snacks",
  "office_ids": [1556],
  "external_office_ids": ["office-1"],
  "department_id": 74,
  "external_department_id": "dept-1",
  "custom_fields": [
    {
      "id": 1234,
      "value": "Some new value"
    },
    {
      "name_key": "salary_range",
      "min_value": 100000,
      "max_value": 150000,
      "unit": "USD"
    },
    {
      "id": 5678,
      "delete_value": "true"
    }
  ]
}
```

> The above command returns a JSON response, structured like this:

```json
{
  "id": 6404,
  "name": "New job name",
  "requisition_id": "1",
  "notes": "Here are some notes",
  "confidential": false,
  "status": "closed",
  "created_at": "2013-12-10T14:42:58Z",
  "opened_at": "2013-12-11T14:42:58Z",
  "closed_at": "2013-12-12T14:42:58Z",
  "updated_at": "2013-12-12T14:42:58Z",
  "is_template": false,
  "copied_from_id": 2345,
  "departments": [
    {
      "id": 74,
      "name": "Second-Level department",
      "parent_id": 25908,
      "child_ids": [14510],
      "external_id": "dept-1"
    }
  ],
  "offices": [
    {
      "id": 1556,
      "name": "San Francisco",
      "location": {
        "name": "San Francisco, United States"
      },
      "primary_contact_user_id": 150893,
      "parent_id": 50849,
      "child_ids": [50852, 50891],
      "external_id": "office-1"
    }
  ],
  "custom_fields": {
    "employment_type": "Full-Time",
    "maximum_budget": "$81.5k",
    "salary_range": {
      "min_value": 70000,
      "max_value": 90000,
      "unit": "USD"
    }
  },
  "keyed_custom_fields": {
    "employment_type": {
      "name": "Time type",
      "type": "single_select",
      "value": "Full-Time"
    },
    "budget": {
      "name": "Maximum Budget",
      "type": "short_text",
      "value": "Full-Time"
    },
    "salary_range": {
      "name": "Salary Range",
      "type": "currency_range",
      "value": {
        "min_value": 70000,
        "max_value": 90000,
        "unit": "USD"
      }
    }
  },
  "hiring_team": {
    "hiring_managers": [
      {
        "id": 84275,
        "first_name": "Kaylee",
        "last_name": "Prime",
        "name": "Kaylee Prime",
        "employee_id": "13636"
      },
      {
        "id": 169779,
        "first_name": "Hank",
        "last_name": "Hollandaise",
        "name": "Hank Hollandaise",
        "employee_id": "34537"
      }
    ],
    "recruiters": [
      {
        "id": 81111,
        "first_name": "Samuel",
        "last_name": "Skateboard",
        "name": "Samuel Skateboard",
        "employee_id": "34531",
        "responsible": false
      },
      {
        "id": 153448,
        "first_name": "Stegosaurus",
        "last_name": "Heels",
        "name": "Stegosaurus Heels",
        "employee_id": "45748",
        "responsible": true
      }
    ],
    "coordinators": [
      {
        "id": 122635,
        "first_name": "Teddy",
        "last_name": "Pizzazz",
        "name": "Teddy Pizzazz",
        "employee_id": "47327",
        "responsible": true
      },
      {
        "id": 177046,
        "first_name": "Mirandella",
        "last_name": "Lager",
        "name": "Mirandella Lager",
        "employee_id": "43626",
        "responsible": false
      }
    ],
    "sourcers": [
      {
        "id": 122635,
        "first_name": "Teddy",
        "last_name": "Pizzazz",
        "name": "Teddy Pizzazz",
        "employee_id": "47327"
      }
    ]
  },
  "openings": [
    {
      "id": 123,
      "opening_id": "3-1",
      "status": "open",
      "opened_at": "2015-11-20T23:14:14.736Z",
      "closed_at": "2017-11-20T23:14:14.736Z",
      "application_id": 45678,
      "close_reason": {
        "id": 678,
        "name": "Hired - Backfill"
      },
      "custom_fields": {
      	"employment_type": "Full-Time",
        "maximum_budget": "$81.5k"
      },
      "keyed_custom_fields": {
        "employment_type": {
      	  "name": "Time type",
      	  "type": "single_select",
      	  "value": "Full-Time"
    	},
    	"budget": {
      	  "name": "Maximum Budget",
      	  "type": "short_text",
      	  "value": "$81.5k"
    	}
      }
    },
    {
      "id": 124,
      "opening_id": "3-2",
      "status": "open",
      "opened_at": "2015-11-20T23:14:14.739Z",
      "closed_at": null,
      "application_id": null,
      "close_reason": null,
      "custom_fields": {
      	"employment_type": "Full-Time",
        "maximum_budget": "$81.5k"
      },
      "keyed_custom_fields": {
        "employment_type": {
      	  "name": "Time type",
      	  "type": "single_select",
      	  "value": "Full-Time"
    	},
    	"budget": {
      	  "name": "Maximum Budget",
      	  "type": "short_text",
      	  "value": "$81.5k"
    	}
      }
    },
    {
      "id": 125,
      "opening_id": null,
      "status": "open",
      "opened_at": "2016-02-03T20:00:00.000Z",
      "closed_at": null,
      "application_id": null,
      "custom_fields": {
      	"employment_type": "Full-Time",
        "maximum_budget": "$81.5k"
      },
      "keyed_custom_fields": {
        "employment_type": {
      	  "name": "Time type",
      	  "type": "single_select",
      	  "value": "Full-Time"
    	},
    	"budget": {
      	  "name": "Maximum Budget",
      	  "type": "short_text",
      	  "value": "$81.5k"
    	}
      }
    },
    {
      "id": 126,
      "opening_id": "2-4",
      "status": "closed",
      "opened_at": "2016-02-03T16:38:46.985Z",
      "closed_at": "2016-02-03T16:39:09.811Z",
      "application_id": 1232,
      "close_reason": {
        "id": 689,
        "name": "Hired"
      },
      "custom_fields": {
      	"employment_type": "Full-Time",
        "maximum_budget": "$81.5k"
      },
      "keyed_custom_fields": {
        "employment_type": {
      	  "name": "Time type",
      	  "type": "single_select",
      	  "value": "Full-Time"
    	},
    	"budget": {
      	  "name": "Maximum Budget",
      	  "type": "short_text",
      	  "value": "$81.5k"
    	}
      }
    }
  ]
}
```

### HTTP Request

`PATCH https://harvest.greenhouse.io/v1/jobs/{id}`

### Headers

| Header       | Description                                                          |
| ------------ | -------------------------------------------------------------------- |
| On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes. |

### URL Parameters

| Parameter | Description                   |
| --------- | ----------------------------- |
| id        | The ID of the job to retrieve |

### JSON Body Parameters

| Parameter                 | Required | Type         | Description                                                                                                                                                     |
| ------------------------- | -------- | ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| name                      | No       | string       | The job's name                                                                                                                                                  |
| notes                     | No       | string       | Notes on the hiring plan                                                                                                                                        |
| anywhere                  | No       | boolean      | Boolean value indicating where the job can be done anywhere                                                                                                     |
| requisition_id\*          | No       | string       | The id of the requisition corresponding to this job posting, if applicable                                                                                      |
| team_and_responsibilities | No       | string       | A description of the team the candidate would join and their responsibilities                                                                                   |
| how_to_sell_this_job      | No       | string       | A description for the recruiter of the desirable aspects of the job                                                                                             |
| custom_fields             | No       | custom_field | Array of hashes containing new custom field values. Passing an empty array does nothing.                                                                        |
| office_ids                | No       | Array        | Replace the current offices for this job with new offices. If your organization requires at least one office, trying to set this to blank will return an error. |
| external_office_ids       | No       | Array        | This may be used instead of office_ids and represents the ID of the office in an external system. If this is used, office_id must be blank and vice versa.      |
| department_id\*           | No       | number       | Replace the current department for this job with a different department.                                                                                        |
| external_department_id\*  | No       | string       | This may be used instead of department_id and represents the ID of the department in an external system. If used, department_id must be blank and vice versa.   |

- - Updates to these fields may re-trigger approvals. For approvals to start recruiting, this will reset approvals only if the job is in draft mode. If the job is open for hiring, these approvals will not reset. For official job approvals, this will reset approvals only if the job is open.

### Custom Field Parameters

The custom field parameter structure is different in the PATCH method than in GET methods and responses. Certain type of custom fields require different elements to be included, while deleting a field requires a specific argument. What follows is the description of each item in a custom field element and what is required depending on the type.

| Parameter    | Required for                 | Description                                                                                                                                                                                                                                                                                                        |
| ------------ | ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| id           | all                          | The custom field id for this particular custom field. One of this or name_key is required.                                                                                                                                                                                                                         |
| name_key     | all                          | The field key for this custom field. This can be found in Greenhouse while editing custom options as "Immutable Field Key" This or id is required for all custom field elements.                                                                                                                                   |
| value        | all                          | The value field contains the new custom field value. In most cases this will be a string or a number. In the case of single-select or multi-select custom fields, this will be a custom field option id or an array of custom field option ids, respectively. Value is only not used for range type custom fields. |
| min_value    | number_range, currency range | This contains the minimum value that is allowable for this custom field. Must be less than max_value                                                                                                                                                                                                               |
| max_value    | number_range, currency_range | This contains the maximum value that is allowable for this custom field. Must be greater than min_value                                                                                                                                                                                                            |
| unit         | currency, currency_range     | This contains the currency unit for a currency custom field. It is only required when updating a currency custom field. This should accept any 3-character currency code from the ISO-4217 standard.                                                                                                               |
| delete_value | n/a                          | When this element is included with a value of "true" (note, string true, not boolean true) the custom field value will be removed from Greenhouse. Note that updating a custom field value to nil or a blank string will not work, as validations require these to be non-blank values.                            |

> The above command returns a JSON response, structured like this:

```json
{
  "id": 112746,
  "name": "new name",
  "requisition_id": 2,
  "notes": "Looking for the best!",
  "confidential": false,
  "status": "open",
  "is_template": false,
  "copied_from_id": 2345,
  "created_at": "2015-09-10T19:01:46.078Z",
  "opened_at": "2015-09-10T19:01:46.078Z",
  "updated_at": "2018-12-12T14:42:58Z",
  "closed_at": null,
  "departments": [
    {
      "id": 74,
      "name": "Guideshops",
      "parent_id": null,
      "child_ids": [],
      "external_id": "EXTERNAL_ID_1234"
    }
  ],
  "offices": [
    {
      "id": 1556,
      "name": "San Diego",
      "location": {
        "name": "San Diego, CA, United States"
      },
      "primary_contact_user_id": 12345,
      "parent_id": null,
      "child_ids": [],
      "external_id": "ABC456"
    }
  ],
  "hiring_team": {
    "hiring_managers": [
      {
        "id": 84275,
        "first_name": "Kaylee",
        "last_name": "Prime",
        "name": "Kaylee Prime",
        "employee_id": "13636"
      },
      {
        "id": 169779,
        "first_name": "Hank",
        "last_name": "Hollandaise",
        "name": "Hank Hollandaise",
        "employee_id": "34537"
      }
    ],
    "recruiters": [
      {
        "id": 81111,
        "first_name": "Samuel",
        "last_name": "Skateboard",
        "name": "Samuel Skateboard",
        "employee_id": "34531",
        "responsible": false
      },
      {
        "id": 153448,
        "first_name": "Stegosaurus",
        "last_name": "Heels",
        "name": "Stegosaurus Heels",
        "employee_id": "45748",
        "responsible": true
      }
    ],
    "coordinators": [
      {
        "id": 122635,
        "first_name": "Teddy",
        "last_name": "Pizzazz",
        "name": "Teddy Pizzazz",
        "employee_id": "47327",
        "responsible": true
      },
      {
        "id": 177046,
        "first_name": "Mirandella",
        "last_name": "Lager",
        "name": "Mirandella Lager",
        "employee_id": "43626",
        "responsible": false
      }
    ],
    "sourcers": [
      {
        "id": 122635,
        "first_name": "Teddy",
        "last_name": "Pizzazz",
        "name": "Teddy Pizzazz",
        "employee_id": "47327"
      }
    ]
  },
  "openings": [
    {
      "id": 123,
      "opening_id": "3-1",
      "status": "open",
      "opened_at": "2015-11-20T23:14:14.736Z",
      "closed_at": "2017-11-20T23:14:14.736Z",
      "application_id": 45678,
      "close_reason": {
        "id": 678,
        "name": "Hired - Backfill"
      },
      "custom_fields": {
      	"employment_type": "Full-Time",
        "maximum_budget": "$81.5k"
      },
      "keyed_custom_fields": {
        "employment_type": {
      	  "name": "Time type",
      	  "type": "single_select",
      	  "value": "Full-Time"
    	},
    	"budget": {
      	  "name": "Maximum Budget",
      	  "type": "short_text",
      	  "value": "$81.5k"
    	}
      }
    },
    {
      "id": 124,
      "opening_id": "3-2",
      "status": "open",
      "opened_at": "2015-11-20T23:14:14.739Z",
      "closed_at": null,
      "application_id": null,
      "close_reason": null,
      "custom_fields": {
      	"employment_type": "Full-Time",
        "maximum_budget": "$81.5k"
      },
      "keyed_custom_fields": {
        "employment_type": {
      	  "name": "Time type",
      	  "type": "single_select",
      	  "value": "Full-Time"
    	},
    	"budget": {
      	  "name": "Maximum Budget",
      	  "type": "short_text",
      	  "value": "$81.5k"
    	}
      }
    },
    {
      "id": 125,
      "opening_id": null,
      "status": "open",
      "opened_at": "2016-02-03T20:00:00.000Z",
      "closed_at": null,
      "application_id": null,
      "custom_fields": {
      	"employment_type": "Full-Time",
        "maximum_budget": "$81.5k"
      },
      "keyed_custom_fields": {
        "employment_type": {
      	  "name": "Time type",
      	  "type": "single_select",
      	  "value": "Full-Time"
    	},
    	"budget": {
      	  "name": "Maximum Budget",
      	  "type": "short_text",
      	  "value": "$81.5k"
    	}
      }
    },
    {
      "id": 126,
      "opening_id": "2-4",
      "status": "closed",
      "opened_at": "2016-02-03T16:38:46.985Z",
      "closed_at": "2016-02-03T16:39:09.811Z",
      "application_id": 1232,
      "close_reason": {
        "id": 689,
        "name": "Hired"
      },
      "custom_fields": {
      	"employment_type": "Full-Time",
        "maximum_budget": "$81.5k"
      },
      "keyed_custom_fields": {
        "employment_type": {
      	  "name": "Time type",
      	  "type": "single_select",
      	  "value": "Full-Time"
    	},
    	"budget": {
      	  "name": "Maximum Budget",
      	  "type": "short_text",
      	  "value": "$81.5k"
    	}
      }
    }
  ]
}
```

<br>
[See noteworthy response attributes.](#the-job-object)

## POST: Create Job

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/jobs'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "template_job_id": 12345,
  "number_of_openings": 2,
  "job_post_name": "External Name That Appears On Job Boards",
  "job_name": "Internal Name That Appears On Hiring Plans",
  "department_id": 123,
  "office_ids": [234, 345],
  "requisition_id": "abc-123",
  "opening_ids": ["abc-123-1", "abc-123-2"]
}
```

> The above command returns a JSON response, structured like this:

```json
{
  "id": 112746,
  "name": "Internal Name That Appears On Hiring Plans",
  "requisition_id": "abc-123",
  "notes": "Looking for the best!",
  "confidential": false,
  "status": "open",
  "is_template": false,
  "copied_from_id": 12345,
  "created_at": "2015-09-10T19:01:46.078Z",
  "opened_at": "2015-09-10T19:01:46.078Z",
  "updated_at": "2015-09-10T19:01:46.078Z",
  "closed_at": null,
  "departments": [
    {
      "id": 123,
      "name": "Guideshops",
      "parent_id": null,
      "child_ids": [52461, 34065, 25908],
      "external_id": "EXTERNAL_ID_1234"
    }
  ],
  "offices": [
    {
      "id": 234,
      "name": "San Diego",
      "location": {
        "name": "San Diego, CA, United States"
      },
      "primary_contact_user_id": 25463,
      "parent_id": 50850,
      "child_ids": [24719],
      "external_id": "abc13425"
    },
    {
      "id": 345,
      "name": "New York",
      "location": {
        "name": "New York, NY, United States"
      },
      "parent_id": null,
      "child_ids": [],
      "external_id": "13432"
    }
  ],
  "hiring_team": {
    "hiring_managers": [
      {
        "id": 84275,
        "first_name": "Kaylee",
        "last_name": "Prime",
        "name": "Kaylee Prime",
        "employee_id": "13636"
      },
      {
        "id": 169779,
        "first_name": "Hank",
        "last_name": "Hollandaise",
        "name": "Hank Hollandaise",
        "employee_id": "34537"
      }
    ],
    "recruiters": [
      {
        "id": 81111,
        "first_name": "Samuel",
        "last_name": "Skateboard",
        "name": "Samuel Skateboard",
        "employee_id": "34531",
        "responsible": false
      },
      {
        "id": 153448,
        "first_name": "Stegosaurus",
        "last_name": "Heels",
        "name": "Stegosaurus Heels",
        "employee_id": "45748",
        "responsible": true
      }
    ],
    "coordinators": [
      {
        "id": 122635,
        "first_name": "Teddy",
        "last_name": "Pizzazz",
        "name": "Teddy Pizzazz",
        "employee_id": "47327",
        "responsible": true
      },
      {
        "id": 177046,
        "first_name": "Mirandella",
        "last_name": "Lager",
        "name": "Mirandella Lager",
        "employee_id": "43626",
        "responsible": false
      }
    ],
    "sourcers": [
      {
        "id": 122635,
        "first_name": "Teddy",
        "last_name": "Pizzazz",
        "name": "Teddy Pizzazz",
        "employee_id": "47327"
      }
    ]
  },
  "openings": [
    {
      "id": 123,
      "opening_id": "3-1",
      "status": "open",
      "opened_at": "2015-11-20T23:14:14.736Z",
      "closed_at": "2017-11-20T23:14:14.736Z",
      "application_id": 45678,
      "close_reason": {
        "id": 678,
        "name": "Hired - Backfill"
      }
    },
    {
      "id": 124,
      "opening_id": "3-2",
      "status": "open",
      "opened_at": "2015-11-20T23:14:14.739Z",
      "closed_at": null,
      "application_id": null,
      "close_reason": null
    },
    {
      "id": 125,
      "opening_id": null,
      "status": "open",
      "opened_at": "2016-02-03T20:00:00.000Z",
      "closed_at": null,
      "application_id": null
    },
    {
      "id": 126,
      "opening_id": "2-4",
      "status": "closed",
      "opened_at": "2016-02-03T16:38:46.985Z",
      "closed_at": "2016-02-03T16:39:09.811Z",
      "application_id": 1232,
      "close_reason": {
        "id": 689,
        "name": "Hired"
      }
    }
  ]
}
```

### HTTP Request

`POST https://harvest.greenhouse.io/v1/jobs`

### Headers

| Header       | Description                                                          |
| ------------ | -------------------------------------------------------------------- |
| On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes. |

### JSON Body Parameters

| Parameter              | Required | Type           | Description                                                                                                                                                                                                                                                                                                                                                            |
| ---------------------- | -------- | -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| template_job_id        | Yes      | Number         | This is the job we will use to generate the new job. The new job will receive most of the settings of the template job. The On-Behalf-Of user must have access to this job.                                                                                                                                                                                            |
| number_of_openings     | Yes      | Number         | The number of openings that will be created for this job.                                                                                                                                                                                                                                                                                                              |
| job_post_name          | No       | String         | This will be the name on the new job post. If this is not included, the job post names in the base job will be copied.                                                                                                                                                                                                                                                 |
| job_name               | No       | String         | This is the internal name of the new job. If this is not included, the name of the new job will be "Copy Of (the template job's name)"                                                                                                                                                                                                                                 |
| department_id          | No       | Number         | The department of the new job. This should be a department id from the Departments endpoint. If this element is omitted, the new job will receive the department of the template job. If this element is included but blank, it will create the job with no departments. If the organization requires jobs to have a department, this case will return a 422 response. |
| external_department_id | No       | String         | This may be used instead of department_id and represents the ID of the department in an external system. If this is used, department_id must be blank and vice versa.                                                                                                                                                                                                  |
| office_ids             | No       | Array[Numbers] | The offices of the new job. These should be office ids from the Offices endpoint. If this element is omitted, the new job will receive the offices of the template job. If this element is included but blank, it will create the job with no offices. If the organization requires jobs to have an office, this case will return a 422 response.                      |
| external_office_ids    | No       | Array[Srings]  | This may be used instead of office_ids and represents the IDs of the offices in an external system. If this is used, office_ids must be blank and vice versa.                                                                                                                                                                                                          |
| requisition_id         | No       | String         | A requisition id for this job.                                                                                                                                                                                                                                                                                                                                         |
| opening_ids            | No       | Array[Strings] | An array of opening ids for the new job. If this is included, the number of opening ids in this array must match the number_of_openings element.                                                                                                                                                                                                                       |

## GET: Hiring Team

```shell
curl 'https://harvest.greenhouse.io/v1/jobs/{id}/hiring_team'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns a JSON response, structured like this:

```json
{
  "hiring_managers": [
    { "user_id": 11, "active": true },
    { "user_id": 12, "active": false }
  ],
  "recruiters": [
    { "user_id": 13, "active": false, "responsible": false },
    { "user_id": 14, "active": true, "responsible": false },
    { "user_id": 15, "active": true, "responsible": true }
  ],
  "coordinators": [
    { "user_id": 16, "active": false, "responsible": false },
    { "user_id": 17, "active": true, "responsible": false },
    { "user_id": 18, "active": true, "responsible": true }
  ],
  "sourcers": [
    { "user_id": 19, "active": true },
    { "user_id": 20, "active": false }
  ]
}
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/jobs/{id}/hiring_team`

### URL Parameters

| Parameter | Description                   |
| --------- | ----------------------------- |
| id        | The ID of the job to retrieve |

### Notable Response Parameters

| Parameter   | Type    | Description                                                                                                                                                                                                                                                                                                                                                                                                   |
| ----------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| active      | boolean | This flag informs you if the user still has access to the job in question. In the case where a former hiring team member loses permission to the job, that member may still have historical information related to the job so the relationship is maintained.                                                                                                                                                 |
| responsible | boolean | This flag only exists for recruiters or coordinators and tells you if the team member has been designated as the "responsible" member for future candidates on the job. This is analogous to the "responsible_for_future_candidates" field on the PUT hiring team endpoint. It is unrelated to active or inactive candidates, which trigger an in the moment migration and are not stored on the hiring team. |

<br>

## PUT: Replace Hiring Team

```shell
curl -X PUT 'https://harvest.greenhouse.io/v1/jobs/{id}'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "hiring_managers": [
    {
      "user_id": 1234
    },
    {
      "user_id": 2345
    }
  ],
  "sourcers": [
    {
      "user_id": 3456
    },
    {
      "user_id": 4567
    }
  ],
  "recruiters": [
    {
      "user_id": 5678,
      "responsible_for_future_candidates": true,
      "responsible_for_active_candidates": true,
      "responsible_for_inactive_candidates": true
    },
    {
      "user_id": 6789,
      "responsible_for_future_candidates": false,
      "responsible_for_active_candidates": false,
      "responsible_for_inactive_candidates": false
    }
  ],
  "coordinators": [
    {
      "user_id": 7890,
      "responsible_for_future_candidates": true,
      "responsible_for_active_candidates": false,
      "responsible_for_inactive_candidates": false
    },
    {
      "user_id": 8901,
      "responsible_for_future_candidates": false,
      "responsible_for_active_candidates": false,
      "responsible_for_inactive_candidates": false
    }
  ]
}
```

> The above command returns a JSON response, structured like this:

```json
{
  "success": true
}
```

### HTTP Request

`PUT https://harvest.greenhouse.io/v1/jobs/{id}/hiring_team`

### JSON Body Parameters

There are four types of hiring team members, represented by the four hashes sent in the JSON body. If any of these types are not included, hiring team members of that type will not be changed. If an empty list is provided for any of the four types, all users will be removed.

Note that this PUT method REPLACES the existing members of the hiring team. For each element included in the JSON request body, the existing hiring team members in Greenhouse will be removed and replaced with the current members. _This includes the removal of disabled and inactive users, who can never be re-added._ For more granular control over additions and removals, use the POST or DELETE methods on this endpoint. Also, this process is transactional: if there is one failure, no elements will be updated. Finally, if you have a Hiring Team Updated web hook configured, you will receive one web hook notification per element, so you may receive up to four web hook notifications when this endpoint is used.

| Parameter                           | Required                         | Type    | Description                                                                                                                           |
| ----------------------------------- | -------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| responsible_for_future_candidates   | Yes for coordinator or recruiter | boolean | The user becomes the responsible person for all new candidates. Only one user in the group of users may be designated as responsible. |
| responsible_for_active_candidates   | Yes for coordinator or recruiter | boolean | The user becomes the responsible person for all existing candidates with active applications                                          |
| responsible_for_inactive_candidates | Yes for coordinator or recruiter | boolean | The user becomes the responsible person for all hired and rejected candidates                                                         |

On success, this will return a 200 response code with a success message in the JSON body.

## POST: Add Hiring Team Members

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/jobs/{id}'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "hiring_managers": [
    {
      "user_id": 1234
    },
    {
      "user_id": 2345
    }
  ],
  "sourcers": [
    {
      "user_id": 3456
    },
    {
      "user_id": 4567
    }
  ],
  "recruiters": [
    {
      "user_id": 5678,
      "responsible_for_future_candidates": true,
      "responsible_for_active_candidates": true,
      "responsible_for_inactive_candidates": true
    },
    {
      "user_id": 6789,
      "responsible_for_future_candidates": false,
      "responsible_for_active_candidates": false,
      "responsible_for_inactive_candidates": false
    }
  ],
  "coordinators": [
    {
      "user_id": 7890,
      "responsible_for_future_candidates": true,
      "responsible_for_active_candidates": false,
      "responsible_for_inactive_candidates": false
    },
    {
      "user_id": 8901,
      "responsible_for_future_candidates": false,
      "responsible_for_active_candidates": false,
      "responsible_for_inactive_candidates": false
    }
  ]
}
```

> The above command returns a JSON response, structured like this:

```json
{
  "success": true
}
```

### HTTP Request

`POST https://harvest.greenhouse.io/v1/jobs/{id}/hiring_team`

### JSON Body Parameters

This method adds new hiring team members. If a user is designated as "responsible_for_future_candites" and a responsible user already exists, the new user will become the responsible user and the old user will no longer be responsible. This endpoint is transactional, if any items fail to add, the entire request will fail and no changes will be made. Finally, if you have a Hiring Team Updated web hook configured, you will receive one web hook notification per element, so you may receive up to four web hook notifications when this endpoint is used.

| Parameter                           | Required                         | Type    | Description                                                                                                                           |
| ----------------------------------- | -------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| responsible_for_future_candidates   | Yes for coordinator or recruiter | boolean | The user becomes the responsible person for all new candidates. Only one user in the group of users may be designated as responsible. |
| responsible_for_active_candidates   | Yes for coordinator or recruiter | boolean | The user becomes the responsible person for all existing candidates with active applications                                          |
| responsible_for_inactive_candidates | Yes for coordinator or recruiter | boolean | The user becomes the responsible person for all hired and rejected candidates                                                         |

On success, this will return a 200 response code with a success message in the JSON body.

## DELETE: Remove Hiring Team Member

```shell
curl -X DELETE 'https://harvest.greenhouse.io/v1/jobs/{id}'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "hiring_managers": [1234, 2345],
  "sourcers": [3456, 4567],
  "recruiters": [5678, 6789],
  "coordinators": [7890, 8901]
}
```

> The above command returns a JSON response, structured like this:

```json
{
  "success": true
}
```

### HTTP Request

`DELETE https://harvest.greenhouse.io/v1/jobs/{id}/hiring_team`

### JSON Body Parameters

This method removes hiring team members with the designated user ids from the designated type. If a user id is provided that does not exist in the hiring team of that type, it will be ignored and no error will be raised. Disabled and inactive users can be removed with this endpoint, but you will be unable to re-add them. If you have a Hiring Team Updated web hook configured, you will receive one web hook notification per element, so you may receive up to four web hook notifications when this endpoint is used.

On success, this will return a 200 response code with a success message in the JSON body.
