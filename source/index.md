---
title: Airbrake API Reference

language_tabs:
  - shell

toc_footers:
  - <a href="://airbrake.io">Airbrake.io</a>

search: true
---

# Authentication

> To authorize, use this code:

```shell
curl "api_endpoint_here?key=(PROJECT_KEY|USER_KEY)"
```

> Make sure to replace `(PROJECT_KEY|USER_KEY)` with your API key.

Airbrake uses API keys to allow access to the API. There are 2 flavors of the keys:

- Project API key that is used to submit errors and create deploys (`PROJECT_KEY`).
- User API key that is used to get access to the project data (`USER_KEY`).

Airbrake expects the API key to be included in all API requests to the server in a query string that looks like the following:

`?key=(PROJECT_KEY|USER_KEY)`

<aside class="notice">
You must replace `(PROJECT_KEY|USER_KEY)` with your personal key.
</aside>

# V4 API

## Get project activities

```shell
curl "https://airbrake.io/api/v4/projects/PROJECT_ID/activities?key=USER_KEY"
```

> The API returns JSON structured like this:

```json
{
  "activities": [
    {
      "projectId": 1,
      "userId": 1,
      "userName": "Mr. Smith",
      "activity": "group.resolved",
      "trackableId": 1,
      "trackableType": "Group",
      "createdAt": "2014-07-22T11:59:01.791773+03:00",
      "updatedAt": "2014-07-22T11:59:01.791773+03:00"
    },
    {
      "projectId": 1,
      "userId": 1,
      "userName": "Mr. Smith",
      "activity": "group.resolved",
      "trackableId": 2,
      "trackableType": "Group",
      "createdAt": "2014-07-22T12:59:01.791773+03:00",
      "updatedAt": "2014-07-22T12:59:01.791773+03:00"
    }
  ],
  "count": 42
}
```

### HTTP Request

`GET https://airbrake.io/api/v4/projects/PROJECT_ID/activities?key=USER_KEY`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | Used to paginate activities.
limit | 20 | Specifies number of activities per page.
