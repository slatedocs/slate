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

Airbrake uses API keys to allow access to the API. There are 2 kinds of keys:

- Project API key (`PROJECT_KEY`) that is used to submit errors and create track deploys. This key is what you configure the notifier agent in your app to use.
- User API key (`USER_KEY`) that is used to get access to the project data through our APIs. Each user of a Project has her own key.

Airbrake expects the API key to be included in all API requests to our servers in a query string that looks like the following:

`?key=(PROJECT_KEY|USER_KEY)`

<aside class="notice">
You must replace `(PROJECT_KEY|USER_KEY)` with your personal key.
</aside>

# Projects (v3)

## List projects

```shell
curl "https://airbrake.io/api/v3/projects?key=USER_KEY"
```

```json
{
  "projects": [
    {
      "id": 1,
      "name": "Airbrake project name",
      "deployId": 1,
      "deployAt": "2014-09-26T17:37:33.638348Z",
      "noticeTotalCount": 1,
      "rejectionCount": 1,
      "fileCount": 1,
      "deployCount": 1,
      "groupResolvedCount": 1,
      "groupUnresolvedCount": 1
    }
  ]
}
```

### HTTP Request

`GET https://airbrake.io/api/v3/projects?key=USER_KEY`

### Response

The API returns `200 OK` status code on success.

## Show project

```shell
curl "https://airbrake.io/api/v3/projects/PROJECT_ID?key=USER_KEY"
```

```json
{
  "project": {
    "id": 1,
    "name": "Airbrake project name",
    "deployId": 1,
    "deployAt": "2014-09-26T17:37:33.638348Z",
    "noticeTotalCount": 1,
    "rejectionCount": 1,
    "fileCount": 1,
    "deployCount": 1,
    "groupResolvedCount": 1,
    "groupUnresolvedCount": 1
  }
}
```

### HTTP Request

`GET https://airbrake.io/api/v3/projects/PROJECT_ID?key=USER_KEY`

### Response

The API returns `200 OK` status code on success.

# Groups (v4)

## List groups

```shell
curl "https://airbrake.io/api/v4/projects/PROJECT_ID/groups?key=USER_KEY"
```

```json
{
  "groups": [
    {
      "id": 1,
      "projectId": 1,
      "resolved": false,
      "errors": [
        {
          "type": "error type",
          "message": "error message",
          "backtrace": [
            {
              "file": "/path/to/file",
              "function": "func_name",
              "line": 1,
              "column": 0
            }
          ]
        }
      ],
      "context": {
        "environment": "production"
      },
      "lastDeployId": 1,
      "lastDeployAt": "2014-09-26T17:37:33.638348Z",
      "lastNoticeId": "1",
      "lastNoticeAt": "2014-09-26T17:37:33.638348Z",
      "noticeCount": 1,
      "noticeTotalCount": 1,
      "createdAt": "2014-09-26T17:37:33.638348Z"
    }
  ]
}
```

### HTTP Request

`GET https://airbrake.io/api/v4/projects/PROJECT_ID/groups?key=USER_KEY`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
deploy_id | | Filters groups by deploy id.
environment | | Filters groups by environment.
component | | Filters groups by component.
action | | Filters groups by action.
archived | | When set to `true` returns archived groups.
start_time | | Returns groups created after `start_time`.
end_time | | Returns groups created before `ned_time`.
page | 1 | Used to paginate groups.
limit | 20 | Specifies number of groups per page.
order | last_notice_id | Sorts groups by `last_notice_id`, `notice_total_count` or `created_at`.

### Response

The API returns `200 OK` status code on success

## Show group

```shell
curl "https://airbrake.io/api/v4/projects/PROJECT_ID/groups/GROUP_ID?key=USER_KEY"
```

```json
{
  "groups": {
    "id": 1,
    "projectId": 1,
    "resolved": false,
    "errors": [
      {
        "type": "error type",
        "message": "error message",
        "backtrace": [
          {
            "file": "/path/to/file",
            "function": "func_name",
            "line": 1,
            "column": 0
          }
        ]
      }
    ],
    "context": {
      "environment": "production"
    },
    "lastDeployId": 1,
    "lastDeployAt": "2014-09-26T17:37:33.638348Z",
    "lastNoticeId": "1",
    "lastNoticeAt": "2014-09-26T17:37:33.638348Z",
    "noticeCount": 1,
    "noticeTotalCount": 1,
    "createdAt": "2014-09-26T17:37:33.638348Z"
  }
}
```

### HTTP Request

`GET https://airbrake.io/api/v4/projects/PROJECT_ID/groups/GROUP_ID?key=USER_KEY`

### Response

The API returns `200 OK` status code on success

# Deploys (v4)

## Create deploy

```shell
curl -X POST -H "Content-Type: application/json" -d '{"environment":"production","username":"john","repository":"https://github.com/airbrake/airbrake","revision":"38748467ea579e7ae64f7815452307c9d05e05c5",version:"v2.0"}' "https://airbrake.io/api/v4/projects/PROJECT_ID/deploys?key=PROJECT_KEY"
```

### HTTP Request

`POST https://airbrake.io/api/v4/projects/PROJECT_ID/deploys?key=PROJECT_KEY`

### POST data

The API expects JSON data.

Key | Example
--- | -------
environment | production
username | john
repository | https://github.com/airbrake/airbrake
revision | 38748467ea579e7ae64f7815452307c9d05e05c5
version | v2.0

### Response

The API returns `201 Created` status code on success.

## List deploys

```shell
curl "https://airbrake.io/api/v4/projects/PROJECT_ID/deploys?key=USER_KEY"
```

```json
{
  "deploys": [
    {
      "environment": "production",
      "username": "john",
      "repository": "https://github.com/airbrake/airbrake",
      "revision": "38748467ea579e7ae64f7815452307c9d05e05c5",
      "version": "v2.0"
    }
  ],
  "count": 1
}
```

### HTTP Request

`GET https://airbrake.io/api/v4/projects/PROJECT_ID/deploys?key=USER_KEY`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | Used to paginate deploys.
limit | 20 | Specifies number of deploys per page.

### Response

The API returns `200 OK` status code on success.

## Show deploy

```shell
curl "https://airbrake.io/api/v4/projects/PROJECT_ID/deploys/DEPLOY_ID?key=USER_KEY"
```

```json
{
  "deploy": {
    "environment": "production",
    "username": "john",
    "repository": "https://github.com/airbrake/airbrake",
    "revision": "38748467ea579e7ae64f7815452307c9d05e05c5",
    "version": "v2.0"
  }
}
```

### HTTP Request

`GET https://airbrake.io/api/v4/projects/PROJECT_ID/deploys/DEPLOY_ID?key=USER_KEY`

### Response

The API returns `200 OK` status code.

# Project activities (experimental)

## Get project activities

```shell
curl "https://airbrake.io/api/experimental/projects/PROJECT_ID/activities?key=USER_KEY"
```

```json
{
  "activities": [
    {
      "projectId": 1,
      "userId": 1,
      "userName": "Mr. Smith",
      "userGravatarId": "8b7d4e7f9fddecc8d93d73b2c01c0549",
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
      "userGravatarId": "8b7d4e7f9fddecc8d93d73b2c01c0549",
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

`GET https://airbrake.io/api/experimental/projects/PROJECT_ID/activities?key=USER_KEY`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | Used to paginate activities.
limit | 20 | Specifies number of activities per page.

### Response

The API returns `200 OK` status code on success.

# iOS crash reports (v3)

## Create iOS crash report

```shell
curl -X POST -H "Content-Type: application/json" -d '{"report":"REPORT_TEXT"}' "https://airbrake.io/api/v3/projects/PROJECT_ID/ios-reports?key=PROJECT_KEY"
```

### HTTP Request

`POST https://airbrake.io/api/v3/projects/PROJECT_ID/ios-reports?key=PROJECT_KEY`

### POST data

The API expects JSON data.

Key | Example
--- | -------
report |
context | Same as in create notice API.

### Response

The API returns `201 Created` status code on success.
