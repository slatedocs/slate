# Users

## The user object

An organization's Greenhouse users.


```json
{
  "id": 112,
  "name": "Juliet Burke",
  "first_name": "Juliet",
  "last_name": "Burke",
  "primary_email_address": "juliet.burke@example.com",
  "updated_at": "2016-11-17T16:13:48.888Z",
  "created_at": "2015-11-18T22:26:32.243Z",  
  "disabled": false,
  "site_admin": true,
  "emails": [
    "juliet.burke@example.com",
    "other.woman@example.com"
  ],
  "employee_id": "221",
  "linked_candidate_ids": [123, 654],
  "offices": [
    {
      "id": 47012,
      "name": "New York",
      "location": {
        "name": "New York, United States"
      },
      "primary_contact_user_id": 150893,
      "parent_id": 50849,
      "parent_office_external_id": "14679",
      "child_ids": [50852, 50891],
      "child_office_external_ids": ["13473", "123473"],
      "external_id": "15679"
    }
  ],
  "departments": [
    {
      "id": 25907,
      "name": "Second-Level department",
      "parent_id": 25908,
      "parent_department_external_id": "13473",
      "child_ids": [50852, 50891],
      "child_department_external_ids": ["13473", "123473"],
      "external_id": "15679"
    }
  ]
}
```

### Noteworthy Attributes

| Attribute              | Description                                                                                                                                                                                                                                                                                                                                                                         |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| id                     | The user's unique identifier                                                                                                                                                                                                                                                                                                                                                        |
| site_admin             | If `true`, this user is a site admin, which means the user has full permissions on all non-private jobs.                                                                                                                                                                                                                                                                            |
| primary_email_address  | The e-mail address this user has designated as his or her primary e-mail address. This value should always also be in the emails array.                                                                                                                                                                                                                                             |
| linked_candidate_ids[] | Contains the IDs of candidate records containing this user's personal applications. In other words, the records containing this user's personal interview records and information.                                                                                                                                                                                                  |
| **offices              | An array containing the [offices](#offices) this job is associated with.                                                                                                                                                                                                                                                                                                            |
| **departments          | 	An array containing the [department](#departments) which this job belongs to.                                                                                                                                                                                                                                                                                                      |
| custom_fields          | 	Contains a hash of the custom fields configured for this resource. The properties in this hash reflect the active custom fields as of the time this method is called.                                                                                                                                                                                                              |
| keyed_custom_fields	   | This contains the same information as custom_fields but formatted in a different way that includes more information. This will tell you the type of custom field data to expect, the text name of custom field, and the value. The key of this hash is the custom field’s immutable field key, which will not change even if the name of the custom field is changed in Greenhouse. |

## GET: List Users

```shell
curl 'https://harvest.greenhouse.io/v1/users'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
[
  {
    "id": 112,
    "name": "Juliet Burke",
    "first_name": "Juliet",
    "last_name": "Burke",
    "primary_email_address": "juliet.burke@example.com",
    "updated_at": "2016-11-17T16:13:48.888Z",
    "created_at": "2015-11-18T22:26:32.243Z",  
    "disabled": false,
    "site_admin": true,
    "emails": [
      "juliet.burke@example.com",
      "other.woman@example.com"
    ],
    "employee_id": "221",
    "linked_candidate_ids": [123, 654],
    "offices": [
      {
        "id": 47012,
        "name": "New York",
        "location": {
          "name": "New York, United States"
        },
        "primary_contact_user_id": 150893,
        "parent_id": 50849,
        "parent_office_external_id": "14679",
        "child_ids": [50852, 50891],
        "child_office_external_ids": ["13473", "123473"],
        "external_id": "15679"
      }
    ],
    "departments": [
      {
        "id": 25907,
        "name": "Research & Development",
        "parent_id": 25908,
        "parent_department_external_id": "13473",
        "child_ids": [50852, 50891],
        "child_department_external_ids": ["13473", "123473"],
        "external_id": "15679"
      }
    ]
  },
  {
    "id": 712,
    "name": "John Doe",
    "first_name": "John",
    "last_name": "Doe",
    "primary_email_address": "john.doe@example.com",
    "updated_at": "2016-11-03T18:05:47.361Z",
    "created_at": "2015-11-18T22:27:11.111Z",
    "disabled": false,
    "site_admin": true,
    "emails": [
      "john.doe@example.com"
    ],
    "employee_id": "700",
    "linked_candidate_ids": [789, 1022],
    "offices": [
      {
        "id": 47013,
        "name": "San Francisco",
        "location": {
          "name": "San Francisco, California"
        },
        "primary_contact_user_id": 150894,
        "parent_id": 50850,
        "parent_office_external_id": "14680",
        "child_ids": [50852, 50891],
        "child_office_external_ids": ["13473", "123473"],
        "external_id": "15679"
      }
    ],
    "departments": [
      {
        "id": 25907,
        "name": "Marketing",
        "parent_id": 25908,
        "parent_department_external_id": "13473",
        "child_ids": [50852, 50891],
        "child_department_external_ids": ["13473", "123473"],
        "external_id": "15679"
      }
    ]
  }
]
```

List all of an organization's Greenhouse users. If the querystring param `user_attributes=true` is passed, the response will also include custom field and keyed custom field values. If the param is not passed, these values will not be displayed.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/users`

### Querystring parameters

| Parameter       | Description |
|-----------------|-------------|
| per_page        | Return up to this number of objects per response. Must be an integer between 1 and 500. Defaults to 100.
| page            | A cursor for use in pagination.  Returns the n-th chunk of `per_page` objects.
| employee_id     | Return only users that match this employee id.
| created_before  | Return only users that were created before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| created_after   | Return only users that were created at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_before  | Return only users that were updated before this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| updated_after   | Return only users that were updated at or after this timestamp. Timestamp must be in in [ISO-8601] (#general-considerations) format.
| email           | Return a single user who has this e-mail address as their primary e-mail or a secondary e-mail.
| user_attributes | Return users along with their `custom_fields` and `keyed_custom_fields` hash values. Must be set to `true` to return user attribute in results.

<br>
[See noteworthy response attributes.] (#the-user-object)

## GET: Retrieve User

```shell
curl 'https://harvest.greenhouse.io/v1/users/{id}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

```json
{
  "id": 112,
  "name": "Juliet Burke",
  "first_name": "Juliet",
  "last_name": "Burke",
  "primary_email_address": "juliet.burke@example.com",
  "updated_at": "2016-11-17T16:13:48.888Z",
  "created_at": "2015-11-18T22:26:32.243Z",  
  "disabled": false,
  "site_admin": true,
  "emails": [
    "juliet.burke@example.com",
    "other.woman@example.com"
  ],
  "employee_id": "221",
  "linked_candidate_ids": [123, 654],
  "offices": [
    {
      "id": 47013,
      "name": "San Francisco",
      "location": {
        "name": "San Francisco, California"
      },
      "primary_contact_user_id": 150894,
      "parent_id": 50850,
      "parent_office_external_id": "14680",
      "child_ids": [50852, 50891],
      "child_office_external_ids": ["13473", "123473"],
      "external_id": "15679"
    }
  ],
  "departments": [
    {
      "id": 25907,
      "name": "Marketing",
      "parent_id": 25908,
      "parent_department_external_id": "13473",
      "child_ids": [50852, 50891],
      "child_department_external_ids": ["13473", "123473"],
      "external_id": "15679"
    }
  ],
  "custom_fields": {
    "equipment": "Laptop",
    "shirt_size": "M",
    "hiring_specialties": [
      "Engineers",
      "Executives"
    ],
    "trained_for_interviews": true,
    "recruiting_partner": {
      "name": "Johnny Recruiter",
      "email": "johnny@example.com",
      "user_id": 4000000000
    }
  },
  "keyed_custom_fields": {
    "equipment": {
      "name": "Equipment",
      "type": "short_text",
      "value": "Laptop"
    },
    "shirt_size": {
      "name": "Shirt Size",
      "type": "single_select",
      "value": "M"
    },
    "hiring_specialties": {
      "name": "Hiring Specialties",
      "type": "multi_select",
      "value": [
        "Engineers",
        "Executives"
      ]
    },
    "trained_for_interviews": {
      "name": "Trained for interviews",
      "type": "boolean",
      "value": true
    },
    "recruiting_partner": {
      "name": "Recruiting Partner",
      "type": "user",
      "value": {
        "name": "Johnny Recruiter",
        "email": "johnny@example.com",
        "user_id": 4000000000
      }
    }
  }
}
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/users/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the user to retrieve

### Querystring Parameters
Parameter | Description
--------- | -----------
employee_id | The Employee ID of the user to retrieve

<br>
[See noteworthy response attributes.] (#the-user-object)

## PATCH: Edit User

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v2/users/'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "user": {
    "email": "test@example.com"
  },
  "payload": {
    "first_name": "Bob",
    "last_name": "Smith",
    "employee_id": "ABC12345",        
    "office_ids": [12345, 67890],
    "department_ids": [12345, 67890],
    "custom_fields": [
      {
        "id": 1234,
        "value": "Some new value"
      },
      {
        "name_key": "custom_field_name_key",
        "value": "Some new value"
      },
      {
        "id": 5678,
        "delete_value": "true"
      }
    ]
  }	
}
```
> The user element must contain one of 'employee_id', 'email', or 'user_id', but not more than one.

> The above command returns a JSON response, structured like this:

```json
{
    "success": "true"
}
```

Edit a user's basic information. You may look up a user via their Greenhouse user id, their internal employee id, or their e-mail address in Greenhouse. Any of the e-mail addresses tied to the user's account can be used. The user information must be provided in a JSON body. Only one of user_id, employee_id (if available), or e-mail address may be provided. Employee id or e-mail address must be a string. User ID must be a number. 

### HTTP Request

`PATCH https://harvest.greenhouse.io/v2/users/`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

| Parameter      | Required | Type         | Description                                                                                                                                 |
|----------------|----------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| first_name     | No       | string       | The user's new first name. If included, this cannot be blank.                                                                               |
| last_name      | No       | string       | The user's new last name. If included, this cannot be blank.                                                                                |
| employee_id*   | No       | string       | The user's external employee id. If included, this cannot be blank, nor can it match any other employee-id for a user in this organization. |
| office_ids     | No       | Array        | Replace the current offices for this user with new offices. An empty array will remove all offices on this user.                            |
| department_ids | No       | Array        | Replace the current departments for this user with new departments. An empty array will remove all departments on this user.                |
| custom_fields  | No       | custom_field | Array of hashes containing new custom field values. Passing an empty array does nothing.                                                    |

\* - If the employee_id feature is not enabled for your organization, attempting to edit this field will raise an API Error. The "employee_id" element exists in both the "user" element as a look-up mechanism and in the "payload" element as a patching mechanism.

### Custom Field Parameters

The custom field parameter structure is different in the PATCH method then in GET methods and responses. Certain type of custom fields require different elements to be included, while deleting a field requires a specific argument. What follows is the description of each item in a custom field element and what is required depending on the type.

| Parameter    | Required for                 | Description                                                                                                                                                                                                                                                                                                       |
| ------------ | ---------------------------- |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| id           | all                          | The custom field id for this particular custom field. One of this or name_key is required.                                                                                                                                                                                                                        |
| name_key     | all                          | The field key for this custom field. This can be found in Greenhouse while editing custom options as "Immutable Field Key". This or id is required for all custom field elements.                                                                                                                                 |
| value        | all                          | The value field contains the new custom field value. In most cases this will be a string or a number. In the case of single-select or multi-select custom fields, this will be a custom field option id or an array of custom field option ids, respectively. |
| delete_value | n/a                          | When this element is included with a value of `"true"` (note, string true, not boolean true) the custom field value will be removed from Greenhouse. Note that updating a custom field value to nil or a blank string will not work, as validations require these to be non-blank values.                           |

\* At this time, user custom fields only supports the following field types: single_select, multi_select, yes_no, and user

### HTTP Request

`PATCH https://harvest.greenhouse.io/v2/users/`

## PATCH: Disable User

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v2/users/disable'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```
> The above command takes a JSON request, structured like this:

```json
{
  "user": {"email": "test@example.com"}
}
```
> or
```json
{
  "user": {"user_id": 11234}
}
```
> or
```json
{
  "user": {"employee_id": "user-123"}
}
```

> The above command returns JSON structured like this:

```json
{
  "id": 11234,
  "name": "Bob Smith",
  "first_name": "Bob",
  "last_name": "Smith",
  "primary_email_address": "test@example.com",
  "updated_at": "2017-03-23T18:58:27.796Z",
  "created_at": "2016-04-28T15:28:16.440Z",
  "disabled": true,
  "site_admin": false,
  "emails": [
    "bob@email.org"
  ],
  "employee_id": "user-123",
  "linked_candidate_ids": [123, 654],
  "departments": [
    {
      "id": 25907,
      "name": "Marketing",
      "parent_id": 25908,
      "parent_department_external_id": "13473",
      "child_ids": [50852, 50891],
      "child_department_external_ids": ["13473", "123473"],
      "external_id": "15679"
    }
  ],
  "custom_fields": {
    "equipment": "Laptop",
    "shirt_size": "M",
    "hiring_specialties": [
      "Engineers",
      "Executives"
    ],
    "trained_for_interviews": true,
    "recruiting_partner": {
      "name": "Johnny Recruiter",
      "email": "johnny@example.com",
      "user_id": 4000000000
    }
  },
  "keyed_custom_fields": {
    "equipment": {
      "name": "Equipment",
      "type": "short_text",
      "value": "Laptop"
    },
    "shirt_size": {
      "name": "Shirt Size",
      "type": "single_select",
      "value": "M"
    },
    "hiring_specialties": {
      "name": "Hiring Specialties",
      "type": "multi_select",
      "value": [
        "Engineers",
        "Executives"
      ]
    },
    "trained_for_interviews": {
      "name": "Trained for interviews",
      "type": "boolean",
      "value": true
    },
    "recruiting_partner": {
      "name": "Recruiting Partner",
      "type": "user",
      "value": {
        "name": "Johnny Recruiter",
        "email": "johnny@example.com",
        "user_id": 4000000000
      }
    }
  }
}
```

Disable a user. This endpoint allows you to disable a user via their Greenhouse user id, their internal employee id, or their e-mail address in Greenhouse. Any of the e-mail addresses tied to the user's account can be used. The user information must be provided in a JSON body. Only one of user_id, employee_id (if available), or e-mail address may be provided. Employee id or e-mail address must be a string. User ID must be a number. It is safe to call this method on a user that is currently disabled. If the user is already disabled, nothing happens.

### HTTP Request

`PATCH https://harvest.greenhouse.io/v2/users/disable`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

## PATCH: Enable User

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v2/users/enable'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```
> The above command takes a JSON request, structured like this:

```json
{
  "user": {"email": "test@example.com"}
}
```
> or
```json
{
  "user": {"user_id": 11234}
}
```
> or
```json
{
  "user": {"employee_id": "user-123"}
}
```
> The above command returns a JSON response, structured like this:

```json
{
  "id": 253528,
  "name": "Bob Smith",
  "first_name": "Bob",
  "last_name": "Smith",
  "primary_email_address": "bob@email.org",
  "updated_at": "2017-03-23T18:58:27.796Z",
  "created_at": "2016-04-28T15:28:16.440Z",
  "disabled": false,
  "site_admin": false,
  "emails": [
    "bob@email.org"
  ],
  "employee_id": "221",
  "linked_candidate_ids": [123, 654],
  "departments": [
    {
      "id": 25907,
      "name": "Marketing",
      "parent_id": 25908,
      "parent_department_external_id": "13473",
      "child_ids": [50852, 50891],
      "child_department_external_ids": ["13473", "123473"],
      "external_id": "15679"
    }
  ],
  "custom_fields": {
    "equipment": "Laptop",
    "shirt_size": "M",
    "hiring_specialties": [
      "Engineers",
      "Executives"
    ],
    "trained_for_interviews": true,
    "recruiting_partner": {
      "name": "Johnny Recruiter",
      "email": "johnny@example.com",
      "user_id": 4000000000
    }
  },
  "keyed_custom_fields": {
    "equipment": {
      "name": "Equipment",
      "type": "short_text",
      "value": "Laptop"
    },
    "shirt_size": {
      "name": "Shirt Size",
      "type": "single_select",
      "value": "M"
    },
    "hiring_specialties": {
      "name": "Hiring Specialties",
      "type": "multi_select",
      "value": [
        "Engineers",
        "Executives"
      ]
    },
    "trained_for_interviews": {
      "name": "Trained for interviews",
      "type": "boolean",
      "value": true
    },
    "recruiting_partner": {
      "name": "Recruiting Partner",
      "type": "user",
      "value": {
        "name": "Johnny Recruiter",
        "email": "johnny@example.com",
        "user_id": 4000000000
      }
    }
  }
}
```

Enable a user. You may enable a user via their Greenhouse user id, their internal employee id, or their e-mail address in Greenhouse. Any of the e-mail addresses tied to the user's account can be used. The user information must be provided in a JSON body. Only one of user_id, employee_id (if available), or e-mail address may be provided. Employee id or e-mail address must be a string. User ID must be a number. It is safe to call this method on a user that is currently enabled. If the user is already enabled, nothing happens.

### HTTP Request

`PATCH https://harvest.greenhouse.io/v2/users/enable`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.


## PATCH: Change user permission level

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v1/users/permission_level'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```
> The above command takes a JSON request, structured like this:

```json
{
  "user": {"email": "test@example.com"},
  "level": "basic"
}
```
> or
```json
{
  "user": {"user_id": 11234},
  "level": "basic"
}
```
> or
```json
{
  "user": {"employee_id": "user-123"},
  "level": "basic"
}
```

> The above command returns JSON structured like this:

```json
{
  "success": true
}
```

Changes the permissions user level, i.e. Site Admin, Job Admin, Basic user

This endpoint will only convert the user to a Basic user. Other permission levels are not supported due to security constraints. This means changing the user permission level is not reversible through this endpoint.

When converting a user’s permission level to Basic, any previously assigned job-based, developer, or user-specific permissions will be removed. Note that this will remove the user from assigned roles on any jobs, e.g. Recruiter or Coordinator. This will also remove the user from any outstanding approval flows.

### HTTP Request

`PATCH https://harvest.greenhouse.io/v1/users/permission_level`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
user | Yes | object | An object containing one of email, user_id, or employee_id fields.
email | No | string | The email address associated with the user. <br> One of email, user_id, or employee_id is required.
user_id | No | string | The ID of the user. <br> One of email, user_id, or employee_id is required.
employee_id | No | string | The external employee_id of the user. <br> One of email, user_id, or employee_id is required.
level | Yes | string | The permission level to be assigned to the user. <br> The only accepted value is “basic”. Other permission levels are not accepted due to security constraints.

Note: This endpoint accepts users with Job Admin or Site Admin permission levels. Basic users will be ignored and will return a 200 response.


## POST: Add User

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/users'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "first_name": "Bob",
  "last_name": "Smith",
  "email": "bob@email.org",
  "send_email_invite": true,
  "employee_id": "ABC12345"
}
```
> The above command returns a JSON response, structured like this:

```json
{
    "id": 253818,
    "name": "Bob Smith",
    "first_name": "Bob",
    "last_name": "Smith",
    "primary_email_address": "bob@email.org",
    "updated_at": "2018-06-07T22:12:31.303Z",
    "created_at": "2016-04-28T19:10:46.688Z",
    "disabled": false,
    "site_admin": false,
    "emails": [
        "bob@email.org"
    ],
    "employee_id": "ABC12345",
    "linked_candidate_ids": [123, 654]
}
```


Create a new user with Basic permissions.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/users`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
first_name | Yes | string | The user's first name
last_name | Yes | string | The user's last name
email | Yes | string | The user's email address. Must be a valid email address.
send_email_invite* | No | boolean | If true, an email will be sent to the user alerting them of any new job permissions that have been assigned to them. Emails are never sent when permissions are removed. If false, nothing happens. Default is false.
employee_id | No | string | The user's external employee id.

\* - A newly created user will not be able to login until they create a password via the invitation link or configured in an SSO system.
\** - The employee_id feature is available only for customers with the Advanced and Expert Greenhouse Recruiting package. Use of this field will return an error for other Greenhouse Recruiting customers.

## POST: Add E-mail Address To User

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/users/{id}/email_addresses'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "email": "bob@email.org",
  "send_verification": true
}
```
> The above command returns a JSON response, structured like this:

```json
{
    "id": 898318,
    "user_id": 253818,
    "email": "bob@email.org",
    "verified": "false"
}
```

Creates a new unverified e-mail address on the given user. The address will not be considered verified until the user receives the verification e-mail and clicks on the link to verify the address. There is no method in the API to verify an e-mail address. This endpoint is also used to re-send a verification e-mail. The request body to do this is exactly the same. If an unverified e-mail is received with send_verification set to true, Greenhouse will attempt to re-send the verification e-mail. If you attempt this with a verified e-mail, nothing occurs.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/users/{id}/email_addresses`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
email | Yes | string | The user's email address. Must be a valid email address.
send_verification | No | boolean | If true, an email will be sent to the user to verify this e-mail address. If false, nothing happens. Default is false.

There are 3 successful response states for this endpoint.

* 201: A new e-mail address was received and created. This will be the response code regardless of the verification setting.
* 200: An e-mail was generated for an unverified e-mail address. This is the case if we attempt to re-send a verification e-mail to an unverified e-mail address.
* 204: A request was made which caused Greenhouse to do nothing. This will occur if you attempt to re-send a verification e-mail to an address that has already been verified or if you make a follow-up request to an unverified e-mail with send_verification set to false.
