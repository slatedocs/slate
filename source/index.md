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

Airbrake uses API keys to restrict access to the API. There are several kinds of keys:

- Project API key (`PROJECT_KEY`) that is used to submit errors and track deploys. This key is what you configure the notifier agent in your app to use.
- User API key (`USER_KEY`) is used to get access to the project data through Airbrake APIs. Each user of a project has her own key.
- User token (`USER_TOKEN`) that is identical to `USER_KEY`, but is valid for less than 24 hours.

Airbrake expects the API key to be included in all API requests to our servers in a query string that looks like the following:

`?key=(PROJECT_KEY|USER_KEY|USER_TOKEN)`

<aside class="notice">
You must replace `(PROJECT_KEY|USER_KEY)` with your personal key.
</aside>

## Create user token v4

```shell
curl -d "email=EMAIL&password=PASSWORD" "https://airbrake.io/api/v4/sessions"
```

```json
{
  "token": "B20koMUuNDO0sep9rIzqomiQHkp4z7YpiN0P2Jmo0p9gElQsJ1z3qQYM23hTtVYY="
}
```

### HTTP Request

`POST https://airbrake.io/api/v4/sessions`

### POST data

The API expects URL-encoded data.

Key | Example
--- | -------
email | User email, e.g. john@airbrake.com.
Password | User password, e.g. qwerty.

### Response

The API returns `200 OK` status code on success and JSON data.

Field | Comment
----- | -------
token | User token that can be passed to the API instead of `USER_KEY`.

# Pagination

Almost all list APIs support pagination if you need access to all items. By default only first 20 items are returned.

```json
{
  "collectionName": [item1, item2, ..., item20],
  "count": 12345
}
```

### HTTP Request

Get first page:

`GET https://airbrake.io/api/v3/collectionName`

Get second page:

`GET https://airbrake.io/api/v3/collectionName?page=2`

Ask for 100 items per page:

`GET https://airbrake.io/api/v3/collectionName?limit=100`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | Page number.
limit | 20 | Number of items per page.

### Response

Field | Example | Comment
----- | ------- | -----------
collectionName | `projects` | Each API has different collection name. Some APIs return multiple collections.
count | 12345 | Total number of available items.
page | 2 | Actual page number that backend used internally.

# Projects v4

## List projects v4

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

## Show project v4

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

# Deploys v4

## Create deploy v4

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

## List deploys v4

The API returns list of project deploys. See [Pagination](#pagination) section for supported query parameters and response fields.

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

### Response

The API returns `200 OK` status code on success.

## Show deploy v4

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

# Groups v4

## List groups v4

The API returns list of groups. See [Pagination](#pagination) section for supported query parameters and response fields.

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
  ],
  "count": 1
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
muted | | When set to `true` returns muted groups.
start_time | | Returns groups created after `start_time`.
end_time | | Returns groups created before `ned_time`.
order | last_notice | Sorts groups by `last_notice`, `notice_count`, `weight` and `created` fields.

### Response

The API returns `200 OK` status code on success

## Show group v4

```shell
curl "https://airbrake.io/api/v4/projects/PROJECT_ID/groups/GROUP_ID?key=USER_KEY"
```

```json
{
  "group": {
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

## Mute group v4

This API removes group from the default list and disables all notifications.

```shell
curl -X PUT "https://airbrake.io/api/v4/projects/PROJECT_ID/groups/GROUP_ID/muted?key=USER_KEY"
```

### HTTP Request

`PUT https://airbrake.io/api/v4/projects/PROJECT_ID/groups/GROUP_ID/muted?key=USER_KEY`

### Response

The API returns `204 No Content` status code on success.

## Unmute group v4

Opposite of the mute group.

```shell
curl -X PUT "https://airbrake.io/api/v4/projects/PROJECT_ID/groups/GROUP_ID/unmuted?key=USER_KEY"
```

### HTTP Request

`PUT https://airbrake.io/api/v4/projects/PROJECT_ID/groups/GROUP_ID/unmuted?key=USER_KEY`

### Response

The API returns `204 No Content` status code on success.

## List group environments v4

The API returns list of group environments. See [Pagination](#pagination) section for supported query parameters and response fields.

```shell
curl "https://airbrake.io/api/v4/projects/PROJECT_ID/group-environments?key=USER_KEY"
```

```json
{
  "groupEnvironments": [
    {
      "environment": "production",
      "projectId": 1,
      "groupResolvedCount": 1,
      "groupUnresolvedCount": 1
    }
  ],
  "count": 1
}
```

### HTTP Request

`GET https://airbrake.io/api/v4/projects/PROJECT_ID/group-environments?key=USER_KEY`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
environment | | Searches for similar environments.

### Response

The API returns `200 OK` status code on success.

## List group components v4

The API returns list of group components. See [Pagination](#pagination) section for supported query parameters and response fields.

```shell
curl "https://airbrake.io/api/v4/projects/PROJECT_ID/group-components?key=USER_KEY"
```

```json
{
  "groupComponents": [
    {
      "component": "projects",
      "projectId": 1,
      "groupResolvedCount": 1,
      "groupUnresolvedCount": 1
    }
  ],
  "count": 1
}
```

### HTTP Request

`GET https://airbrake.io/api/v4/projects/PROJECT_ID/group-components?key=USER_KEY`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
component | | Searches for similar components.

### Response

The API returns `200 OK` status code on success.

## List group actions v4

The API returns list of group actions. See [Pagination](#pagination) section for supported query parameters and response fields.

```shell
curl "https://airbrake.io/api/v4/projects/PROJECT_ID/group-actions?key=USER_KEY"
```

```json
{
  "groupActions": [
    {
      "action": "show",
      "projectId": 1,
      "groupResolvedCount": 1,
      "groupUnresolvedCount": 1
    }
  ],
  "count": 1
}
```

### HTTP Request

`GET https://airbrake.io/api/v4/projects/PROJECT_ID/group-actions?key=USER_KEY`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
action | | Searches for similar actions.

### Response

The API returns `200 OK` status code on success.

# Notices v4

## List notices v4

The API returns list of group notices. See [Pagination](#pagination) section for supported query parameters and response fields.

```shell
curl "https://airbrake.io/api/v4/projects/PROJECT_ID/groups/GROUP_ID/notices?key=USER_KEY"
```

```json
{
  "notices": [
    {
      "id": "1272072008639432675",
      "projectId": 1,
      "groupId": "1272072008639432676",
      "createdAt": "2014-10-22T03:00:00.407Z"
    }
  ],
  "count": 1
}
```

### HTTP Request

`GET https://airbrake.io/api/v4/projects/PROJECT_ID/groups/GROUP_ID/notices?key=USER_KEY`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
version | | Filters notices by version, e.g. `version=1.0`.

### Response

The API returns `200 OK` status code on success.

## Delete notice v4

The API permanently deletes notice.

<aside class="warning">This operation can not be undone. Use it with care.</aside>

```shell
curl -X DELETE "https://airbrake.io/api/v4/projects/PROJECT_ID/groups/GROUP_ID/notices/NOTICE_ID?key=USER_KEY"
```

### HTTP Request

`DELETE https://airbrake.io/api/v4/projects/PROJECT_ID/groups/GROUP_ID/notices/NOTICE_ID?key=USER_KEY`

### Response

The API returns `204 NO CONTENT` status code on success.

## List versions v4

The API returns list of notice versions. See [Pagination](#pagination) section for supported query parameters and response fields.

```shell
curl "https://airbrake.io/api/v4/projects/PROJECT_ID/groups/GROUP_ID/versions?key=USER_KEY"
```

```json
{
  "versions": [
    {
      "version": "1.0",
      "groupId": "1",
      "noticeTotalCount": 10,
      "createdAt": "2014-09-26T17:37:33.638348Z",
      "updatedAt": "2014-09-26T17:37:33.638348Z"
    },
    {
      "version": "1.1",
      "groupId": "1",
      "noticeTotalCount": 20,
      "createdAt": "2014-09-26T17:37:33.638348Z",
      "updatedAt": "2014-09-26T17:37:33.638348Z"
    }
  ],
  "count": 2
}
```

### HTTP Request

`GET https://airbrake.io/api/v4/projects/PROJECT_ID/groups/GROUP_ID/versions?key=USER_KEY`

### Response

The API returns `200 OK` status code on success.

# Project activities v4

The API returns list of project activities. See [Pagination](#pagination) section for supported query parameters and response fields.

## List project activities v4

```shell
curl "https://airbrake.io/api/v4/projects/PROJECT_ID/activities?key=USER_KEY"
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

`GET https://airbrake.io/api/v4/projects/PROJECT_ID/activities?key=USER_KEY`

### Response

The API returns `200 OK` status code on success.

# iOS crash reports v3

## Create iOS crash report v3

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

# Grouping

Airbrake supports 4 grouping rules: default, global, distinct and strict.

## Default grouping

By default errors are grouped by:

- environment
- component and action
- error type
- file, line and column

## Global grouping

Global grouping rule groups errors by:

- environment
- error type

## Distinct grouping

Distinct grouping rule groups errors by:

- environment
- component and action
- error type and message
- file, line and column

## Strict grouping

Strict grouping rule groups errors by:

- environment
- component and action
- error type
- backtrace
