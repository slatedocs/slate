# Activity Feed

## The activity feed object
The activity feed is the list of activities on a candidate's profile, including interviews, notes, and emails.

```json
{
  "notes": [
    {
      "id": 123456,
      "created_at": "2014-03-26T20:11:40Z",
      "body": "Very mysterious.",
      "user": {
        "id": 512,
        "first_name": "Sayid",
        "last_name": "Jarrah",
        "name": "Sayid Jarrah",
        "employee_id": "12345"
      },
      "private": false,
      "visiblity": "public",
      "visibility": "public"
    }
  ],
  "emails": [
    {
      "id": 234675,
      "created_at": "2014-04-01T15:55:06Z",
      "subject": "Regarding your application",
      "body": "Hey John,  just wanted to touch base!",
      "to": "john.locke@example.com",
      "from": "boone.carlyle@example.com",
      "cc": "sam.smith@example.com",
      "user": {
        "id": 214,
        "first_name": "Boone",
        "last_name": "Carlyle",
        "name": "Boone Carlyle",
        "employee_id": "67890"
      }
    }
  ],
  "activities": [
    {
      "id": 6756789,
      "created_at": "2014-04-01T15:55:29Z",
      "subject": "Candidate Rejected",
      "body": "Reason: Lacking hustle\n\nThis candidate turned out to be problematic for us...",
      "user": {
        "id": 214,
        "first_name": "Boone",
        "last_name": "Carlyle",
        "name": "Boone Carlyle",
        "employee_id": "67890"
      }
    },
    {
      "id": 6757869,
      "created_at": "2014-03-26T20:26:38Z",
      "subject": "Candidate Stage Change",
      "body": "John Locke was moved into Recruiter Phone Screen for Accounting Manager on 03/27/2014 by Boone Carlyle",
      "user": {
        "id": 214,
        "first_name": "Boone",
        "last_name": "Carlyle",
        "name": "Boone Carlyle",
        "employee_id": "67890"
      }
    }
  ]
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The internal Greenhouse ID of the activity feed note.
| note | An array of notes associated with this candidate.
| email | An array of emails sent to and from this candidate.
| activity | An array of events associated with this candidate.
| visibility* | The visibility setting on the note.  One of `admin_only`, `public`, or `private`.

\* - Due to a legacy typo, the response includes the same value as `visiblity`. It is safe to ignore this value, but it is maintained for backward compatibility.



## GET: Retrieve Activity Feed

```shell
curl 'https://harvest.greenhouse.io/v1/candidates/{id}/activity_feed' 
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "notes": [
    {
      "id": 12345,
      "created_at": "2014-03-26T20:11:40Z",
      "body": "Very mysterious.",
      "user": {
        "id": 512,
        "first_name": "Sayid",
        "last_name": "Jarrah",
        "name": "Sayid Jarrah",
        "employee_id": "12345"
      },
      "private": false,
      "visiblity": "public",
      "visibility": "public"
    }
  ],
  "emails": [
    {
      "id": 234675,
      "created_at": "2014-04-01T15:55:06Z",
      "subject": "Regarding your application",
      "body": "Hey John,  just wanted to touch base!",
      "to": "john.locke@example.com",
      "from": "boone.carlyle@example.com",
      "cc": "sam.smith@example.com",
      "user": {
        "id": 214,
        "first_name": "Boone",
        "last_name": "Carlyle",
        "name": "Boone Carlyle",
        "employee_id": "67890"
      }
    }
  ],
  "activities": [
    {
      "id": 6756789,
      "created_at": "2014-04-01T15:55:29Z",
      "subject": "Candidate Rejected",
      "body": "Reason: Lacking hustle\n\nThis candidate turned out to be problematic for us...",
      "user": {
        "id": 214,
        "first_name": "Boone",
        "last_name": "Carlyle",
        "name": "Boone Carlyle",
        "employee_id": "67890"
      }
    },
    {
      "id": 6757869,
      "created_at": "2014-03-26T20:26:38Z",
      "subject": "Candidate Stage Change",
      "body": "John Locke was moved into Recruiter Phone Screen for Accounting Manager on 03/27/2014 by Boone Carlyle",
      "user": {
        "id": 214,
        "first_name": "Boone",
        "last_name": "Carlyle",
        "name": "Boone Carlyle",
        "employee_id": "67890"
      }
    }
  ]
}
```

Retrieve a candidate's activity feed.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/candidates/{id}/activity_feed`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the candidate whose activity feed you want to retrieve.

<br>
[See noteworthy response attributes.](#the-activity-feed-object)