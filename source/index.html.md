---
title: Timely Internal API doc
language_tabs:
  - shell: cURL

includes:
  - timely_authorization
  - errors

search: true
---

# Accounts



## List all account


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/accounts" -X GET \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6QQNmUtvefwpph5AddSmGkJUgWNtEJl3E3optByPU38" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/accounts`

```plaintext
GET /1.1/accounts
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6QQNmUtvefwpph5AddSmGkJUgWNtEJl3E3optByPU38
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## Retrieve an account


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/accounts/222" -X GET \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer JdqKuSYyKyubQtCH6panFaizybN_DvByigX9ODtaoqs" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/accounts/:id`

```plaintext
GET /1.1/accounts/222
Accept: application/json
Content-Type: application/json
Authorization: Bearer JdqKuSYyKyubQtCH6panFaizybN_DvByigX9ODtaoqs
```

#### Parameters



| Name | Description |
|:-----|:------------|
| id  | The id of the account to be retrieved |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## Retrieve an account


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/accounts/recent" -X GET \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer eAZkSaJb3P4YYw1JILL4bzUzQ1AWH5hlos7pqJkRKg0" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/accounts/recent`

```plaintext
GET /1.1/accounts/recent
Accept: application/json
Content-Type: application/json
Authorization: Bearer eAZkSaJb3P4YYw1JILL4bzUzQ1AWH5hlos7pqJkRKg0
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## Update an account

Using a account's id one can update account details.

### Request

```shell
curl "https://api.timelyapp.com/1.1/accounts/221" -d '{"account":{"company_name":"Updated company name","owner_role":"Team leader","currency_code":"eur"}}' -X PUT \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer kEjzbn1cPo9dJdamd65_aL2S8s7fyuls8VcCWaXYyM0" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/accounts/:id`

```plaintext
PUT /1.1/accounts/221
Accept: application/json
Content-Type: application/json
Authorization: Bearer kEjzbn1cPo9dJdamd65_aL2S8s7fyuls8VcCWaXYyM0
```

#### Parameters


```json
{"account":{"company_name":"Updated company name","owner_role":"Team leader","currency_code":"eur"}}
```

| Name | Description |
|:-----|:------------|
| id *required* | Account id |
| company_name *required* | Specifies the account name |
| currency_code  | Specifies the account currency_code |
| start_of_week  | Specifies the account start_of_week |
| logo  | Specifies the account logo |
| color  | Specifies the account color |
| company_size  | Specifies the account company_size |
| owner_role  | Specifies the account owner_role |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
{
  "id": 221,
  "name": "Updated company name",
  "color": "44505e",
  "currency": {
    "id": "eur",
    "name": "Euro",
    "iso_code": "EUR",
    "symbol": "€",
    "symbol_first": true
  },
  "logo": {
    "large_retina": "/assets/account_thumbs/account_large_retina-9aefd4c1fb903fb750d36f1b1cc64dc01eb578efd2fd0eb5311344082d6d036e.png",
    "medium_retina": "/assets/account_thumbs/account_medium_retina-3e55e5ac5ba6b1d8077c1e329691e55032a5831997c9e712998594192d534fdf.png",
    "small_retina": "/assets/account_thumbs/account_small_retina-1b8bfb705765064d856161ba9daa1d52155f181c330ac6fe9b5e2f366adaf4fe.png"
  },
  "from": "Web",
  "max_users": 0,
  "num_users": 1,
  "max_projects": 0,
  "num_projects": 0,
  "plan_id": 213,
  "plan_name": "Essential",
  "next_charge": "2020-03-27",
  "start_of_week": 0,
  "created_at": 1582772235,
  "payment_mode": "web",
  "paid": true,
  "company_size": "10-49",
  "plan_code": "essential",
  "plan_custom": false,
  "appstore_transaction_id": null,
  "owner_id": 577,
  "capacity": {
    "hours": 40.0,
    "minutes": 0.0,
    "seconds": 0.0,
    "formatted": "40:00",
    "total_hours": 40.0,
    "total_seconds": 144000.0,
    "total_minutes": 2400.0
  },
  "status": "active",
  "beta": false,
  "expired": false,
  "trial": false,
  "days_to_end_trial": 0,
  "features": [
    {
      "name": "control",
      "days": -1
    },
    {
      "name": "memories",
      "days": -1
    },
    {
      "name": "billing",
      "days": -1
    },
    {
      "name": "project_required_fields",
      "days": -1
    },
    {
      "name": "teams",
      "days": -1
    },
    {
      "name": "recurring_budget",
      "days": -1
    },
    {
      "name": "notifications_project_budget",
      "days": -1
    },
    {
      "name": "weekly_user_capacity",
      "days": -1
    },
    {
      "name": "company_view",
      "days": -1
    },
    {
      "name": "anomalies",
      "days": -1
    },
    {
      "name": "log_hours_for_others",
      "days": -1
    },
    {
      "name": "project_budget",
      "days": -1
    },
    {
      "name": "budgets_hourly_rates",
      "days": -1
    },
    {
      "name": "account_branding",
      "days": -1
    },
    {
      "name": "team_lead",
      "days": -1
    },
    {
      "name": "ai_timesheet_creation",
      "days": -1
    },
    {
      "name": "in_app_support",
      "days": -1
    },
    {
      "name": "planning",
      "days": -1
    },
    {
      "name": "people_dashboard",
      "days": -1
    },
    {
      "name": "people_notify",
      "days": -1
    }
  ]
}
```


## returns empty hash


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/accounts/recent" -X GET \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer -emQXAYW3II6Yf6huO1sHYg6-0SdtwXsUv_o8e4TxXY" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/accounts/recent`

```plaintext
GET /1.1/accounts/recent
Accept: application/json
Content-Type: application/json
Authorization: Bearer -emQXAYW3II6Yf6huO1sHYg6-0SdtwXsUv_o8e4TxXY
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# AppObjects



## create calendar


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/47/objects/47" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70337715951520}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer JGoVMkH8Jut__NkTkVvX5_qfyre63fxiJ77TFFSLBG8" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/47/objects/47
Accept: application/json
Content-Type: application/json
Authorization: Bearer JGoVMkH8Jut__NkTkVvX5_qfyre63fxiJ77TFFSLBG8
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"true"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70337715951520}}
```

| Name | Description |
|:-----|:------------|
| app_objects *required* | Object attributes |
| app_objects[objects] *required* | Calendar attributes |
| objects[name] *required* | Object name |
| objects[etag] *required* | Object etag |
| objects[object_id]  | Object id |
| objects[project_id]  | Object project id |
| objects[auto_import]  | Auto import hours |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## delete calendar


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/49/objects/49" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70337683624260}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer RgZ0HpCU7iRdVIVXbmJ9k7F4edgbO0pglSJAz0brIcA" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/49/objects/49
Accept: application/json
Content-Type: application/json
Authorization: Bearer RgZ0HpCU7iRdVIVXbmJ9k7F4edgbO0pglSJAz0brIcA
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","project_id":"2","auto_import":"false"}]},"objects":{"object_id":70337683624260}}
```

| Name | Description |
|:-----|:------------|
| app_objects *required* | Object attributes |
| app_objects[objects] *required* | Calendar attributes |
| objects[name] *required* | Object name |
| objects[etag] *required* | Object etag |
| objects[object_id]  | Object id |
| objects[project_id]  | Object project id |
| objects[auto_import]  | Auto import hours |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## list objects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/45/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer sKg9Zi11cQZuMxVr9oQBDz1vpBcQJrBTC8-m4jJxRG0" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/45/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer sKg9Zi11cQZuMxVr9oQBDz1vpBcQJrBTC8-m4jJxRG0
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## list objects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/46/objects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0haSxlCxtZtAF3TzxxMTVATpWuQ8zi_LkbZXdPKEOAE" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/objects`

```plaintext
GET /1.1/apps/46/objects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0haSxlCxtZtAF3TzxxMTVATpWuQ8zi_LkbZXdPKEOAE
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update calendar


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/48/objects/48" -d '{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70337639420920}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer VacBf38iil3fN5EhUdzVMJAje61VAK03rq4RXIf2cGQ" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/apps/:app_id/objects/:id`

```plaintext
PUT /1.1/apps/48/objects/48
Accept: application/json
Content-Type: application/json
Authorization: Bearer VacBf38iil3fN5EhUdzVMJAje61VAK03rq4RXIf2cGQ
```

#### Parameters


```json
{"app_objects":{"objects":[{"name":"Fixtures","etag":"1482740512308000","object_id":"timelyapp.com_rfldr8c53ov8j3pvmgipg64008@group.calendar.google.com","project_id":"1","auto_import":"false"},{"name":"anup@timelyapp.com","etag":"1457979055759000","object_id":"anup@timelyapp.com","project_id":"2","auto_import":"true"}]},"objects":{"object_id":70337639420920}}
```

| Name | Description |
|:-----|:------------|
| app_objects *required* | Object attributes |
| app_objects[objects] *required* | Calendar attributes |
| objects[name] *required* | Object name |
| objects[etag] *required* | Object etag |
| objects[object_id]  | Object id |
| objects[project_id]  | Object project id |
| objects[auto_import]  | Auto import hours |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Apps



## delete connected app


### Request

```shell
curl "https://api.timelyapp.com/1.1/apps/117/connected/67" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 2XhzzXBxSJGp-yFLCxriCg7t_m1K3rnGDEzw0HaT2VA" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/apps/:app_id/connected/:id`

```plaintext
DELETE /1.1/apps/117/connected/67
Accept: application/json
Content-Type: application/json
Authorization: Bearer 2XhzzXBxSJGp-yFLCxriCg7t_m1K3rnGDEzw0HaT2VA
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## list apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer BzJnAxF-vYCTad5gh5o77efng6kGODnrUug2HK5HxUc" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps`

```plaintext
GET /1.1/apps
Accept: application/json
Content-Type: application/json
Authorization: Bearer BzJnAxF-vYCTad5gh5o77efng6kGODnrUug2HK5HxUc
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "app_id": 103,
    "id": "google_calendar",
    "display_name": "Display name",
    "description": "Get all your calendar events imported directly into Timely as\n    planned time.",
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2020-02-27T03:57:17+01:00",
    "last_imported_at": null,
    "platforms": [
      "ios",
      "android"
    ],
    "summary": "Auto-import recurring and one-off calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Google Calendar entries.",
    "provider": "Google",
    "provider_url": "https://calendar.google.com",
    "screenshots": [
      "screenshots/google_calendar/screenshot1.png"
    ],
    "logo_path": "apps_logo/google_calendar.png",
    "authorize_url": "/auth/google_calendar/authorize",
    "connected_apps_url": "/apps/103/connected",
    "category": "",
    "scope": "user"
  },
  {
    "app_id": 104,
    "id": "office365",
    "display_name": "Display name",
    "description": null,
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2020-02-27T03:57:17+01:00",
    "last_imported_at": null,
    "platforms": [
      "ios",
      "android"
    ],
    "summary": "Auto-import recurring and one-off calendar events into Timely to avoid duplicating effort. We don’t send any data back, so edits you make in Timely won’t change your Office 365 entries.",
    "provider": "Microsoft",
    "provider_url": "https://products.office.com/en-us/business/explore-office-365-for-business",
    "screenshots": [
      "screenshots/office365/screenshot1.png"
    ],
    "logo_path": "apps_logo/office365.png",
    "authorize_url": "/auth/office365/authorize",
    "connected_apps_url": "/apps/104/connected",
    "category": "",
    "scope": "user"
  },
  {
    "app_id": 105,
    "id": "gmail",
    "display_name": "Display name",
    "description": null,
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 0,
    "connected_integrations_count": 1,
    "first_created_at": "2020-02-27T03:57:17+01:00",
    "last_imported_at": null,
    "platforms": [
      "ios",
      "android"
    ],
    "summary": "See exactly how much time you spend managing your Gmail each day. All the emails you send in a day will automatically appear in your private Memory timeline for easy reference.",
    "provider": "Google",
    "provider_url": "https://gmail.com/",
    "screenshots": [
      "screenshots/gmail/screenshot1.png"
    ],
    "logo_path": "apps_logo/gmail.png",
    "authorize_url": "/auth/gmail/authorize",
    "connected_apps_url": "/apps/105/connected",
    "category": "",
    "scope": "user"
  },
  {
    "app_id": 106,
    "id": "todoist",
    "display_name": "Display name",
    "description": null,
    "layout": "list",
    "integrated": true,
    "disconnected_integrations_count": 1,
    "connected_integrations_count": 1,
    "first_created_at": "2020-02-25T03:57:17+01:00",
    "last_imported_at": "2020-02-26T03:57:17+01:00",
    "platforms": [
      "ios",
      "android"
    ],
    "summary": "Track the time you spend managing tasks in Todoist. The tasks you complete each day will automatically appear in your private Memory timeline for quick reference.",
    "provider": "Todoist",
    "provider_url": "https://todoist.com/",
    "screenshots": [
      "screenshots/todoist/screenshot1.png"
    ],
    "logo_path": "apps_logo/todoist.png",
    "authorize_url": "/auth/todoist/authorize",
    "connected_apps_url": "/apps/106/connected",
    "category": "",
    "scope": "user"
  }
]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/107/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer KksK_Fc9_b5MZviwo_1Iwh6ohPZRaThLGjukATX09e0" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/107/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer KksK_Fc9_b5MZviwo_1Iwh6ohPZRaThLGjukATX09e0
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## list connected apps


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/apps/113/connected" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer f5XSfoEQz8f0B9wHSwrhGXMRM_PldpVr1ewy1EkdEeo" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/apps/:app_id/connected`

```plaintext
GET /1.1/apps/113/connected
Accept: application/json
Content-Type: application/json
Authorization: Bearer f5XSfoEQz8f0B9wHSwrhGXMRM_PldpVr1ewy1EkdEeo
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# BudgetRecurrences



## month recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/238/projects/252/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer alKd8t6nVBpcRyOPgCODIU3J5G5zsnJ8Jj_Q-KQAtKA" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/238/projects/252/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer alKd8t6nVBpcRyOPgCODIU3J5G5zsnJ8Jj_Q-KQAtKA
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## month recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/239/projects/253/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 31fjEkOqVOCCNu8iv-ODDDS1zjbAyMhAHo--uC3Y9ZQ" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/239/projects/253/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer 31fjEkOqVOCCNu8iv-ODDDS1zjbAyMhAHo--uC3Y9ZQ
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## week recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/236/projects/250/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer C_5pcQo9XACLshNpIMjXg5aFSk8oRkzPL8POA6ZS05Y" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/236/projects/250/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer C_5pcQo9XACLshNpIMjXg5aFSk8oRkzPL8POA6ZS05Y
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## week recurrence list


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/237/projects/251/budget_recurrences" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer rdAJZOAFEPbHYdFM_Nscs0tKSAbkO8zLYgtrDSsUSLI" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/budget_recurrences`

```plaintext
GET /1.1/237/projects/251/budget_recurrences
Accept: application/json
Content-Type: application/json
Authorization: Bearer rdAJZOAFEPbHYdFM_Nscs0tKSAbkO8zLYgtrDSsUSLI
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Calendar Summary



## default


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/240/calendar/summary" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer b18N07m9Q6s0KBb2T2I9AzmXG4TCQWIeO_6R4DWENr0" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/calendar/summary`

```plaintext
GET /1.1/240/calendar/summary
Accept: application/json
Content-Type: application/json
Authorization: Bearer b18N07m9Q6s0KBb2T2I9AzmXG4TCQWIeO_6R4DWENr0
```

#### Parameters

```json
{}: 
```


| Name | Description |
|:-----|:------------|
| since  | Calendar summary form specific date |
| until  | Calendar summary to specific date |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## since and until


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/241/calendar/summary?since=2020-02-15&until=2020-02-27" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer lLSokJzbYE9bUawCEhK6mkrUakHI3L7PmBasQGoNw3s" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/calendar/summary`

```plaintext
GET /1.1/241/calendar/summary?since=2020-02-15&amp;until=2020-02-27
Accept: application/json
Content-Type: application/json
Authorization: Bearer lLSokJzbYE9bUawCEhK6mkrUakHI3L7PmBasQGoNw3s
```

#### Parameters

```json
since: 2020-02-15
until: 2020-02-27
```


| Name | Description |
|:-----|:------------|
| since  | Calendar summary form specific date |
| until  | Calendar summary to specific date |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Categories



## list all categories


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/categories" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer fuy5FldttEoK3IinR9uRY2ipcTN9M6CxA-zoF2jLz2c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/categories`

```plaintext
GET /1.1/categories
Accept: application/json
Content-Type: application/json
Authorization: Bearer fuy5FldttEoK3IinR9uRY2ipcTN9M6CxA-zoF2jLz2c
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Discard Entries



## Ignore entries


### Request

```shell
curl "https://api.timelyapp.com/1.1/246/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[152]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer PRZ8f64sk1QcJHKObCqBZ_h7E3c0HYkESL9YLBkgHiE" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/suggested_entries/discard`

```plaintext
POST /1.1/246/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer PRZ8f64sk1QcJHKObCqBZ_h7E3c0HYkESL9YLBkgHiE
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[152]}}
```

None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## List all ignored entries


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/245/suggested_entries/discarded" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer IOynAGyFgdaxC41uS618Kn0KeAp0lIbxqj0EnwGM7Mw" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries/discarded`

```plaintext
GET /1.1/245/suggested_entries/discarded
Accept: application/json
Content-Type: application/json
Authorization: Bearer IOynAGyFgdaxC41uS618Kn0KeAp0lIbxqj0EnwGM7Mw
```

#### Parameters

```json
{}: 
```


None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## Unignore entries


### Request

```shell
curl "https://api.timelyapp.com/1.1/247/suggested_entries/discard" -d '{"discard_entries":{"entry_ids":[155]}}' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer FPfKFegpHkSRP-x5IEnvjbnD3X4Mm2gLnkDrEk7qJxM" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/suggested_entries/discard`

```plaintext
DELETE /1.1/247/suggested_entries/discard
Accept: application/json
Content-Type: application/json
Authorization: Bearer FPfKFegpHkSRP-x5IEnvjbnD3X4Mm2gLnkDrEk7qJxM
```

#### Parameters


```json
{"discard_entries":{"entry_ids":[155]}}
```

None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Duration



## duration


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=156%2C157" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer uU2qlQ_bNNShHKls-XgajD1gwWM3Y6pja_vJTQhwlPk" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=156%2C157
Accept: application/json
Content-Type: application/json
Authorization: Bearer uU2qlQ_bNNShHKls-XgajD1gwWM3Y6pja_vJTQhwlPk
```

#### Parameters

```json
entry_ids: 156,157
```


| Name | Description |
|:-----|:------------|
| entry_ids  | Comma separated list of entry ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## duration


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=158%2C159" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer hmgVBQu5PPnWHxOqB3ap40DUQr3itB0o-BsxvZCmkYM" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=158%2C159
Accept: application/json
Content-Type: application/json
Authorization: Bearer hmgVBQu5PPnWHxOqB3ap40DUQr3itB0o-BsxvZCmkYM
```

#### Parameters

```json
entry_ids: 158,159
```


| Name | Description |
|:-----|:------------|
| entry_ids  | Comma separated list of entry ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## duration


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries/durations?entry_ids=160%2C161" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer GBO3t-aiojEw4DN8dW_JsaMbNYynOr46rHMfTezWfHA" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/durations`

```plaintext
GET /1.1/entries/durations?entry_ids=160%2C161
Accept: application/json
Content-Type: application/json
Authorization: Bearer GBO3t-aiojEw4DN8dW_JsaMbNYynOr46rHMfTezWfHA
```

#### Parameters

```json
entry_ids: 160,161
```


| Name | Description |
|:-----|:------------|
| entry_ids  | Comma separated list of entry ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Entries



## bulk delete entries


### Request

```shell
curl "https://api.timelyapp.com/1.1/bulk/entries" -d '{"entry_ids":"191,192"}' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer uDR6yz7wbfZvPk1Nx2D9axHeADsRtFFOQwD04ZNHXj4" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/bulk/entries`

```plaintext
DELETE /1.1/bulk/entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer uDR6yz7wbfZvPk1Nx2D9axHeADsRtFFOQwD04ZNHXj4
```

#### Parameters


```json
{"entry_ids":"191,192"}
```

| Name | Description |
|:-----|:------------|
| entry_ids  | Entry ids to delete |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## sanitize titile and notes


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries?entry_ids=174" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer Mswy_GHlhMre0CliESSncfaBblKITcBL4Odjlzgnxfo" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?entry_ids=174
Accept: application/json
Content-Type: application/json
Authorization: Bearer Mswy_GHlhMre0CliESSncfaBblKITcBL4Odjlzgnxfo
```

#### Parameters

```json
entry_ids: 174
```


| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 100) |
| date  | Date to retrieve records (Default current date) |
| order  | Order to retrieve records (Default updated_at DESC) |
| entry_ids  | Retrieve specific entry_ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update deleted


### Request

```shell
curl "https://api.timelyapp.com/1.1/entries/180" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer qHMEooja6Pdn1xEm8A3oCp69i1EY3gbY07MDazdlSgc" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/entries/:id`

```plaintext
DELETE /1.1/entries/180
Accept: application/json
Content-Type: application/json
Authorization: Bearer qHMEooja6Pdn1xEm8A3oCp69i1EY3gbY07MDazdlSgc
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## with date


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries/summary?from=2020-02-27&to=2020-03-04" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer btW28byz2SbKbKFJUkgW8NHVxBchVdykOm7tU2NtGJY" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/summary`

```plaintext
GET /1.1/entries/summary?from=2020-02-27&amp;to=2020-03-04
Accept: application/json
Content-Type: application/json
Authorization: Bearer btW28byz2SbKbKFJUkgW8NHVxBchVdykOm7tU2NtGJY
```

#### Parameters

```json
from: 2020-02-27
to: 2020-03-04
```


| Name | Description |
|:-----|:------------|
| from  | From date to retrieve records (Default current date) |
| to  | To date to retrieve records (Default current date) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## with date


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries?date=2020-02-29" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer TX_GQtn1jNHG-PT5KenN3r7aitb3YezEqZg8F0_tZIE" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?date=2020-02-29
Accept: application/json
Content-Type: application/json
Authorization: Bearer TX_GQtn1jNHG-PT5KenN3r7aitb3YezEqZg8F0_tZIE
```

#### Parameters

```json
date: 2020-02-29
```


| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 100) |
| date  | Date to retrieve records (Default current date) |
| order  | Order to retrieve records (Default updated_at DESC) |
| entry_ids  | Retrieve specific entry_ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 168,
    "type": "google_calendar",
    "uid": "testuid",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "03:57 - 07:27 • Discuss about future",
    "date": "2020-02-29",
    "from": "2020-02-27T03:57:24+01:00",
    "to": "2020-02-27T07:27:24+01:00",
    "entry_type": null,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "at": "2020-02-27T00:00:00+01:00",
    "extra_attributes": [

    ],
    "icon": "google_calendar.png",
    "color": "rgba(86,210,255,0.30)",
    "sub_entries": [

    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "url": "https://calendar_url"
  }
]
```


## with default params


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7xQC38iYqmDB73ukDiWdQ2xtnm2X88WyVuggv7fkcew" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7xQC38iYqmDB73ukDiWdQ2xtnm2X88WyVuggv7fkcew
```

#### Parameters



| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 100) |
| date  | Date to retrieve records (Default current date) |
| order  | Order to retrieve records (Default updated_at DESC) |
| entry_ids  | Retrieve specific entry_ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 162,
    "type": "macOS",
    "uid": "ba055713-d1f2-406a-b205-0c654fbbae51",
    "title": "D&P event with html tags",
    "note": "D&P event with html tags",
    "description": "D&P event with html tags",
    "date": "2020-02-27",
    "from": "2020-02-27T03:57:24+01:00",
    "to": "2020-02-27T07:27:24+01:00",
    "entry_type": null,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "at": "2020-02-27T00:00:00+01:00",
    "extra_attributes": [
      {
        "name": "application",
        "value": "MacVim"
      },
      {
        "name": "detail",
        "value": ""
      }
    ],
    "icon": null,
    "color": null,
    "sub_entries": [

    ],
    "icon_url": "/assets/timeline_app_logos/macvim-59e1023114044c663aef2c8f8061527f94438faa396cc8f4bc5dcbf8c9de5800.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "url": null
  },
  {
    "id": 163,
    "type": "google_calendar",
    "uid": "testuid",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "03:57 - 07:27 • Discuss about future",
    "date": "2020-02-27",
    "from": "2020-02-27T03:57:24+01:00",
    "to": "2020-02-27T07:27:24+01:00",
    "entry_type": null,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "at": "2020-02-27T00:00:00+01:00",
    "extra_attributes": [

    ],
    "icon": "google_calendar.png",
    "color": "rgba(86,210,255,0.30)",
    "sub_entries": [

    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "url": "https://calendar_url"
  }
]
```


## with default params


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries/summary" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer wF0VlB1oAe64bJ3L5Qyd10-_srfdBQ6iAEezQkKKz_E" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries/summary`

```plaintext
GET /1.1/entries/summary
Accept: application/json
Content-Type: application/json
Authorization: Bearer wF0VlB1oAe64bJ3L5Qyd10-_srfdBQ6iAEezQkKKz_E
```

#### Parameters



| Name | Description |
|:-----|:------------|
| from  | From date to retrieve records (Default current date) |
| to  | To date to retrieve records (Default current date) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## with entry_ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/entries?entry_ids=170%2C172" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer x5kW9WkZIN8JW-VdHN5VAbUWEQRlH5gOgtfKG9_P9mc" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/entries`

```plaintext
GET /1.1/entries?entry_ids=170%2C172
Accept: application/json
Content-Type: application/json
Authorization: Bearer x5kW9WkZIN8JW-VdHN5VAbUWEQRlH5gOgtfKG9_P9mc
```

#### Parameters

```json
entry_ids: 170,172
```


| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 100) |
| date  | Date to retrieve records (Default current date) |
| order  | Order to retrieve records (Default updated_at DESC) |
| entry_ids  | Retrieve specific entry_ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "id": 170,
    "type": "macOS",
    "uid": "116949c7-b717-42fb-bde3-9435d1bfc92a",
    "title": "D&P event with html tags",
    "note": "D&P event with html tags",
    "description": "D&P event with html tags",
    "date": "2020-02-27",
    "from": "2020-02-27T03:57:24+01:00",
    "to": "2020-02-27T07:27:24+01:00",
    "entry_type": null,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "at": "2020-02-27T00:00:00+01:00",
    "extra_attributes": [
      {
        "name": "application",
        "value": "MacVim"
      },
      {
        "name": "detail",
        "value": ""
      }
    ],
    "icon": null,
    "color": null,
    "sub_entries": [

    ],
    "icon_url": "/assets/timeline_app_logos/macvim-59e1023114044c663aef2c8f8061527f94438faa396cc8f4bc5dcbf8c9de5800.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "url": null
  },
  {
    "id": 172,
    "type": "google_calendar",
    "uid": "testuid",
    "title": "Meeting",
    "note": "Discuss about future",
    "description": "03:57 - 07:27 • Discuss about future",
    "date": "2020-02-29",
    "from": "2020-02-27T03:57:24+01:00",
    "to": "2020-02-27T07:27:24+01:00",
    "entry_type": null,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "at": "2020-02-27T00:00:00+01:00",
    "extra_attributes": [

    ],
    "icon": "google_calendar.png",
    "color": "rgba(86,210,255,0.30)",
    "sub_entries": [

    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "url": "https://calendar_url"
  }
]
```


# Events



## hour with id


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/272/events/422" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer Z2b0vUnxtdtCSZBbIsCyBFBsblHHlRN29lLlzYCim64" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/272/events/422
Accept: application/json
Content-Type: application/json
Authorization: Bearer Z2b0vUnxtdtCSZBbIsCyBFBsblHHlRN29lLlzYCim64
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## not found


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/273/events/12345" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer _oohiMdKWuGbRpQ9xWR4cJgnXfoCelepnLvRcN8cN7Q" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/events/:id`

```plaintext
GET /1.1/273/events/12345
Accept: application/json
Content-Type: application/json
Authorization: Bearer _oohiMdKWuGbRpQ9xWR4cJgnXfoCelepnLvRcN8cN7Q
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
404 Not Found
```

```json
[binary data]
```


# Forecasts

Forecast resource should allow creating forecast.

## Create a forecast


### Request

```shell
curl "https://api.timelyapp.com/1.1/211/forecasts" -d '{"forecasts":{"from":"2019-05-10","to":"2019-05-16","note":"Note","hours":6,"minutes":0,"user_id":550,"project_id":234}}' -X POST \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer VXf5XJHGcmYZgvP-QHw14N_sUxiA7z7Ek9mjjUF8Sas" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/forecasts`

```plaintext
POST /1.1/211/forecasts
Accept: application/json
Content-Type: application/json
Authorization: Bearer VXf5XJHGcmYZgvP-QHw14N_sUxiA7z7Ek9mjjUF8Sas
```

#### Parameters


```json
{"forecasts":{"from":"2019-05-10","to":"2019-05-16","note":"Note","hours":6,"minutes":0,"user_id":550,"project_id":234}}
```

| Name | Description |
|:-----|:------------|
| forecasts *required* | Forecasts attributes |
| forecasts[user_id] *required* | Specifies the id of the user |
| forecasts[project_id] *required* | Specifies the id of the project |
| forecasts[note] *required* | Note for the forecast |
| forecasts[hours] *required* | Specifies the hours value in integer, max allowed 24 |
| forecasts[minutes] *required* | Specifies the minutes value in integer, max allowed 60 |
| forecasts[from] *required* | Specifies the from date. Example value: 2019-8-21 |
| forecasts[to] *required* | Specifies the to date. Example value: 2019-8-25 |
| forecasts[label_ids]  | Specifies the label ids. Example Values: label_ids:[2,3,4] |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
201 Created
```

```json
[binary data]
```


## Delete a forecast


### Request

```shell
curl "https://api.timelyapp.com/1.1/212/forecasts/9" -d '' -X DELETE \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer SzD56GCc-LNOsNabwpK7FcwHYWqVeTNg7EuMy8VkfRQ" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/forecasts/:id`

```plaintext
DELETE /1.1/212/forecasts/9
Accept: application/json
Content-Type: application/json
Authorization: Bearer SzD56GCc-LNOsNabwpK7FcwHYWqVeTNg7EuMy8VkfRQ
```

#### Parameters



| Name | Description |
|:-----|:------------|
| account_id  | Account id for which forecast to be deleted |
| id  | The id of the forecast to be deleted |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## List all forecasts


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/214/forecasts" -X GET \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer TMY4fEKHGKhPVPhF82lVUdkGQv8wk9tWGfcroeDHJfQ" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/forecasts`

```plaintext
GET /1.1/214/forecasts
Accept: application/json
Content-Type: application/json
Authorization: Bearer TMY4fEKHGKhPVPhF82lVUdkGQv8wk9tWGfcroeDHJfQ
```

#### Parameters



| Name | Description |
|:-----|:------------|
| since  | Retrieve forecasts since date. Example: since=2014-08-18 |
| upto  | Retrieve forecasts upto date. Example: since=2014-08-24 |
| forecast_ids  | Retrieve specific forecasts for passed forecast_ids |
| user_ids  | Retrieve specific forecasts for passed user_ids |
| project_ids  | Retrieve specific forecasts for passed project_ids |
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## Update a forecast


### Request

```shell
curl "https://api.timelyapp.com/1.1/215/forecasts/14" -d '{"forecasts":{"note":"new note","from":"2019-05-10","to":"2019-05-16","hours":2,"minutes":0,"user_id":558,"project_id":238}}' -X PUT \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer QQT1FmYpRMuzi0ZBhi3LP_NQXbTFGzwBAkb9V1OpibM" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/forecasts/:id`

```plaintext
PUT /1.1/215/forecasts/14
Accept: application/json
Content-Type: application/json
Authorization: Bearer QQT1FmYpRMuzi0ZBhi3LP_NQXbTFGzwBAkb9V1OpibM
```

#### Parameters


```json
{"forecasts":{"note":"new note","from":"2019-05-10","to":"2019-05-16","hours":2,"minutes":0,"user_id":558,"project_id":238}}
```

| Name | Description |
|:-----|:------------|
| forecasts *required* | Forecasts attributes |
| forecasts[user_id] *required* | Specifies the id of the user |
| forecasts[project_id] *required* | Specifies the id of the project |
| forecasts[note] *required* | Note for the forecast |
| forecasts[hours] *required* | Specifies the hours value in integer, max allowed 8 |
| forecasts[minutes] *required* | Specifies the minutes value in integer, max allowed 60 |
| forecasts[from] *required* | Specifies the from date. Example value: 2019-8-21 |
| forecasts[to] *required* | Specifies the to date. Example value: 2019-8-25 |
| forecasts[label_ids]  | Specifies the label ids. Example Values: label_ids:[2,3,4] |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# ForecastsBulkImport



## Forecasts Bulk Import


### Request

```shell
curl "https://api.timelyapp.com/1.1/213/bulk/forecasts" -d '{"create":[{"note":"for user one","from":"2020-02-24","to":"2020-02-26","hours":8,"minutes":0,"user_id":555,"project_id":236}],"update":[{"id":10,"note":"updated"}],"delete":[11]}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 8F4VA4NWF8jXSop97bRW_snOYAymAj0FMdJLqsllCnY" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/bulk/forecasts`

```plaintext
POST /1.1/213/bulk/forecasts
Accept: application/json
Content-Type: application/json
Authorization: Bearer 8F4VA4NWF8jXSop97bRW_snOYAymAj0FMdJLqsllCnY
```

#### Parameters


```json
{"create":[{"note":"for user one","from":"2020-02-24","to":"2020-02-26","hours":8,"minutes":0,"user_id":555,"project_id":236}],"update":[{"id":10,"note":"updated"}],"delete":[11]}
```

| Name | Description |
|:-----|:------------|
| create  | Specifies an array of forecast create parameters. Example: [{ "note": "Test", "user_id": 1, "project_id": 1, "from": "2019-8-21", "to": "2019-8-25", "hours": 4, "minutes": 30}] |
| update  | Specifies an array of forecast update parameters. Example: [{ "note": "Updated", "id": 1}] |
| delete  | Specifies an array of forecast delete ids. Example: [1, 2] |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Notifications



## list all notifications


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/users/notifications" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ZhtMieh6OpM-IibmV3AqU4eg-i1xcMa21JlmtNh1AQU" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/users/notifications`

```plaintext
GET /1.1/users/notifications
Accept: application/json
Content-Type: application/json
Authorization: Bearer ZhtMieh6OpM-IibmV3AqU4eg-i1xcMa21JlmtNh1AQU
```

#### Parameters



| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## notification not found


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/users/notifications/12345" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer GjWyprtv1ax-I66MxSSwb_eYG3xXFeOsXVVU70Gu3Zw" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/users/notifications/:id`

```plaintext
GET /1.1/users/notifications/12345
Accept: application/json
Content-Type: application/json
Authorization: Bearer GjWyprtv1ax-I66MxSSwb_eYG3xXFeOsXVVU70Gu3Zw
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
404 Not Found
```

```json
[binary data]
```


## show notification with id


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/users/notifications/9" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer TwXIMw34ZYiKWO0_WOOn2TeS8faAeicmA2mCvCgoGGU" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/users/notifications/:id`

```plaintext
GET /1.1/users/notifications/9
Accept: application/json
Content-Type: application/json
Authorization: Bearer TwXIMw34ZYiKWO0_WOOn2TeS8faAeicmA2mCvCgoGGU
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Notifications Setting



## show notification setting


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/notifications" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer n-rV5Mjn8jNkqbhGTsbBukoIvySrjSpASUlnfokjjSY" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/notifications`

```plaintext
GET /1.1/notifications
Accept: application/json
Content-Type: application/json
Authorization: Bearer n-rV5Mjn8jNkqbhGTsbBukoIvySrjSpASUlnfokjjSY
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## show notification setting


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/notifications/settings" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer TE2VjrWXLLo3EzOqt687Ei3hEd4TWEE6_8ZswZjuG1c" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/notifications/settings`

```plaintext
GET /1.1/notifications/settings
Accept: application/json
Content-Type: application/json
Authorization: Bearer TE2VjrWXLLo3EzOqt687Ei3hEd4TWEE6_8ZswZjuG1c
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update settings


### Request

```shell
curl "https://api.timelyapp.com/1.1/notifications" -d '{"notification_settings":{"invite_project_email":false},"reminders":{"enabled":true}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer VVzcrifl9OT3KvDHGhhBSkAMfY9F1Cj-kF2SmF9SynM" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/notifications`

```plaintext
PUT /1.1/notifications
Accept: application/json
Content-Type: application/json
Authorization: Bearer VVzcrifl9OT3KvDHGhhBSkAMfY9F1Cj-kF2SmF9SynM
```

#### Parameters


```json
{"notification_settings":{"invite_project_email":false},"reminders":{"enabled":true}}
```

| Name | Description |
|:-----|:------------|
| notification_settings *required* | notification settings attributes |
| reminders *required* | reminders settings attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update settings


### Request

```shell
curl "https://api.timelyapp.com/1.1/notifications/settings" -d '{"notification_settings":{"invite_project_email":false},"reminders":{"enabled":true}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer jQ7MXp6LG-z9niBI0-9I6jOz2rxpYGH-EXJwQjUW06Q" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/notifications/settings`

```plaintext
PUT /1.1/notifications/settings
Accept: application/json
Content-Type: application/json
Authorization: Bearer jQ7MXp6LG-z9niBI0-9I6jOz2rxpYGH-EXJwQjUW06Q
```

#### Parameters


```json
{"notification_settings":{"invite_project_email":false},"reminders":{"enabled":true}}
```

| Name | Description |
|:-----|:------------|
| notification_settings *required* | notification settings attributes |
| reminders *required* | reminders settings attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Plans



## plans for appstore


### Request

```shell
curl -g "https://api.timelyapp.com/1.2/private/plans" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer Y49045VAcJc9-MLMg0gOLtI2iqtP1TltnFWEF9a6D-s" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer Y49045VAcJc9-MLMg0gOLtI2iqtP1TltnFWEF9a6D-s
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## plans for playstore


### Request

```shell
curl -g "https://api.timelyapp.com/1.2/private/plans" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer vz90pd-IspqWcR0XnZIqfiPT9df5g1ogRsKU9WsSJYs" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.2/private/plans`

```plaintext
GET /1.2/private/plans
Accept: application/json
Content-Type: application/json
Authorization: Bearer vz90pd-IspqWcR0XnZIqfiPT9df5g1ogRsKU9WsSJYs
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# ProjectSubscriptions



## create project subscribers


### Request

```shell
curl "https://api.timelyapp.com/1.1/293/projects/292/subscribe" -d '' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 79ZH_p3DKeGcI3gwm3KQUWz_MdPEWhnTsAj4iwlQjsM" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
POST /1.1/293/projects/292/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer 79ZH_p3DKeGcI3gwm3KQUWz_MdPEWhnTsAj4iwlQjsM
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## delete project subscribers


### Request

```shell
curl "https://api.timelyapp.com/1.1/294/projects/293/subscribe" -d '' -X DELETE \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer mUVYdP-EqBtxBBVnGaPGVttgO95q24TyPU4fQbcs_Ok" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/projects/:project_id/subscribe`

```plaintext
DELETE /1.1/294/projects/293/subscribe
Accept: application/json
Content-Type: application/json
Authorization: Bearer mUVYdP-EqBtxBBVnGaPGVttgO95q24TyPU4fQbcs_Ok
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## list subscribed users


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/290/projects/289/subscribers" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer rAZxuQoSi8CYS0RerdfWfkBHbnUYVdJeLCMxD4fochU" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscribers`

```plaintext
GET /1.1/290/projects/289/subscribers
Accept: application/json
Content-Type: application/json
Authorization: Bearer rAZxuQoSi8CYS0RerdfWfkBHbnUYVdJeLCMxD4fochU
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## show project subscription


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/291/projects/290/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer nUv3TNEglJ_W0SHQ9h0BVJwcTgaz0SKKUu9gs3UZCXY" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/291/projects/290/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer nUv3TNEglJ_W0SHQ9h0BVJwcTgaz0SKKUu9gs3UZCXY
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## show project subscription


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/292/projects/291/subscription" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 7A_yWv7VMUasXGtSmrFh0CgSqzOXZrPR5Z_J4OxeeNA" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/:project_id/subscription`

```plaintext
GET /1.1/292/projects/291/subscription
Accept: application/json
Content-Type: application/json
Authorization: Bearer 7A_yWv7VMUasXGtSmrFh0CgSqzOXZrPR5Z_J4OxeeNA
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Projects



## Projects permissions


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/299/users/735/projects_permissions" -X GET \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer myGeV5EYHNR5gTGJpjqV2m1jvZWsJV9Ph8HillvO4OQ" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/users/:user_id/projects_permissions`

```plaintext
GET /1.1/299/users/735/projects_permissions
Accept: application/json
Content-Type: application/json
Authorization: Bearer myGeV5EYHNR5gTGJpjqV2m1jvZWsJV9Ph8HillvO4OQ
```

#### Parameters



| Name | Description |
|:-----|:------------|
| account_id  | The id of the account to be retrieved |
| id  | The id of the user |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## Search all projects with query


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/308/projects/search" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer YQnBvF-YiAwh3HT-id7rr8gOKMiScyef9tAQZpLL4kQ" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/search`

```plaintext
GET /1.1/308/projects/search
Accept: application/json
Content-Type: application/json
Authorization: Bearer YQnBvF-YiAwh3HT-id7rr8gOKMiScyef9tAQZpLL4kQ
```

#### Parameters



| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |
| q  | Search query (min 2 characters) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## Search all projects with query


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/309/projects/search?user_id=765" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 6dmjRXPNFkfoWB2f_pQsKuWX1gDzQnruX_bUK0Ff8wg" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/search`

```plaintext
GET /1.1/309/projects/search?user_id=765
Accept: application/json
Content-Type: application/json
Authorization: Bearer 6dmjRXPNFkfoWB2f_pQsKuWX1gDzQnruX_bUK0Ff8wg
```

#### Parameters

```json
user_id: 765
```


| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |
| q  | Search query (min 2 characters) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## Search all projects with query


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/310/projects/search?q=Max" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer Ai6W26EsyNxSgZ_pkIJI_YNAAkusuJMcCvgJQraYG3s" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects/search`

```plaintext
GET /1.1/310/projects/search?q=Max
Accept: application/json
Content-Type: application/json
Authorization: Bearer Ai6W26EsyNxSgZ_pkIJI_YNAAkusuJMcCvgJQraYG3s
```

#### Parameters

```json
q: Max
```


| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |
| q  | Search query (min 2 characters) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## active


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/304/projects?filter=active" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer lFjJbDrKbj-6FJch59MtdzXhppfq7Dc9hgbIgep4eVw" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/304/projects?filter=active
Accept: application/json
Content-Type: application/json
Authorization: Bearer lFjJbDrKbj-6FJch59MtdzXhppfq7Dc9hgbIgep4eVw
```

#### Parameters

```json
filter: active
```


| Name | Description |
|:-----|:------------|
| offset  | Retrieve projects from offset |
| limit  | Retrieve number of projects |
| order  | Sorting order on updated_at |
| filter  | Filter projects - Ex: filter=active or filter=archived or filter=all |
| updated_after  | Retrieve records updated after a certain timestamp |
| project_ids  | Retrieve specific projects |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## all


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/303/projects?filter=all" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer TNU9vG3Tyqm4Dw7VXsg3X-rP-zLUCY-jNx3D0gJuiNE" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/303/projects?filter=all
Accept: application/json
Content-Type: application/json
Authorization: Bearer TNU9vG3Tyqm4Dw7VXsg3X-rP-zLUCY-jNx3D0gJuiNE
```

#### Parameters

```json
filter: all
```


| Name | Description |
|:-----|:------------|
| offset  | Retrieve projects from offset |
| limit  | Retrieve number of projects |
| order  | Sorting order on updated_at |
| filter  | Filter projects - Ex: filter=active or filter=archived or filter=all |
| updated_after  | Retrieve records updated after a certain timestamp |
| project_ids  | Retrieve specific projects |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## archived


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/305/projects?filter=archived" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer TZ1aGGqyCV4TX6_NJqKtxDQkKYg4vPwK1IctmCvyYP8" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/305/projects?filter=archived
Accept: application/json
Content-Type: application/json
Authorization: Bearer TZ1aGGqyCV4TX6_NJqKtxDQkKYg4vPwK1IctmCvyYP8
```

#### Parameters

```json
filter: archived
```


| Name | Description |
|:-----|:------------|
| offset  | Retrieve projects from offset |
| limit  | Retrieve number of projects |
| order  | Sorting order on updated_at |
| filter  | Filter projects - Ex: filter=active or filter=archived or filter=all |
| updated_after  | Retrieve records updated after a certain timestamp |
| project_ids  | Retrieve specific projects |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/312/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":235,"users":[{"user_id":773}],"labels":[{"label_id":42},{"label_id":43,"budget":0,"required":false}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer EzIhTEtUqVVdG5TrU-z5clMkf5k2f0IwCntaUJSXsD8" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/312/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer EzIhTEtUqVVdG5TrU-z5clMkf5k2f0IwCntaUJSXsD8
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":235,"users":[{"user_id":773}],"labels":[{"label_id":42},{"label_id":43,"budget":0,"required":false}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |
| project[name] *required* | Project name |
| project[company_id] *required* | Company id |
| project[color] *required* | Project color |
| project[hour_rate]  | Project hour_rate |
| project[rate_type]  | Project rate_type |
| project[budget]  | Project budget |
| project[budget_type]  | Project budget type |
| project[billable]  | Project billable |
| project[active]  | Project active/archived |
| project[external_id]  | Project external_id |
| project[budget_scope]  | Project budget scope |
| project[users] *required* | Project users |
| project[labels]  | Project labels |
| project[budget_recurrence]  | Project budget recurrence rule |
| project[send_invite]  | Send project invite, should be true or false |
| project[required_notes]  | Project hours notes to be required for logging |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
201 Created
```

```json
[binary data]
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/315/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":238,"budget_type":"M","budget":300,"users":[{"user_id":782}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer azRFnw4aTjkGVuz-V8_2j43winnUw47o3B3Cmoqo25A" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/315/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer azRFnw4aTjkGVuz-V8_2j43winnUw47o3B3Cmoqo25A
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":238,"budget_type":"M","budget":300,"users":[{"user_id":782}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |
| project[name] *required* | Project name |
| project[company_id] *required* | Company id |
| project[color] *required* | Project color |
| project[hour_rate]  | Project hour_rate |
| project[rate_type]  | Project rate_type |
| project[budget]  | Project budget |
| project[budget_type]  | Project budget type |
| project[billable]  | Project billable |
| project[active]  | Project active/archived |
| project[external_id]  | Project external_id |
| project[budget_scope]  | Project budget scope |
| project[users] *required* | Project users |
| project[labels]  | Project labels |
| project[budget_recurrence]  | Project budget recurrence rule |
| project[send_invite]  | Send project invite, should be true or false |
| project[required_notes]  | Project hours notes to be required for logging |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
201 Created
```

```json
[binary data]
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/314/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":237,"budget_type":"M","budget":300,"users":[{"user_id":779}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer -rlF70jTdGPSFGft-neG0NtrU13UFmzDfEwr02wuQSM" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/314/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer -rlF70jTdGPSFGft-neG0NtrU13UFmzDfEwr02wuQSM
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":237,"budget_type":"M","budget":300,"users":[{"user_id":779}],"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |
| project[name] *required* | Project name |
| project[company_id] *required* | Company id |
| project[color] *required* | Project color |
| project[hour_rate]  | Project hour_rate |
| project[rate_type]  | Project rate_type |
| project[budget]  | Project budget |
| project[budget_type]  | Project budget type |
| project[billable]  | Project billable |
| project[active]  | Project active/archived |
| project[external_id]  | Project external_id |
| project[budget_scope]  | Project budget scope |
| project[users] *required* | Project users |
| project[labels]  | Project labels |
| project[budget_recurrence]  | Project budget recurrence rule |
| project[send_invite]  | Send project invite, should be true or false |
| project[required_notes]  | Project hours notes to be required for logging |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
201 Created
```

```json
[binary data]
```


## create project


### Request

```shell
curl "https://api.timelyapp.com/1.1/313/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":236,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":776}],"labels":[{"label_id":44,"budget":100,"required":false},{"label_id":45,"budget":200,"required":true}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer qXc9x9zifydxEpEwF28jA2J-QoLTwldvZTtjbASqj_A" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/313/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer qXc9x9zifydxEpEwF28jA2J-QoLTwldvZTtjbASqj_A
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":236,"budget_type":"M","budget_scope":"tag","budget":300,"users":[{"user_id":776}],"labels":[{"label_id":44,"budget":100,"required":false},{"label_id":45,"budget":200,"required":true}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |
| project[name] *required* | Project name |
| project[company_id] *required* | Company id |
| project[color] *required* | Project color |
| project[hour_rate]  | Project hour_rate |
| project[rate_type]  | Project rate_type |
| project[budget]  | Project budget |
| project[budget_type]  | Project budget type |
| project[billable]  | Project billable |
| project[active]  | Project active/archived |
| project[external_id]  | Project external_id |
| project[budget_scope]  | Project budget scope |
| project[users] *required* | Project users |
| project[labels]  | Project labels |
| project[budget_recurrence]  | Project budget recurrence rule |
| project[send_invite]  | Send project invite, should be true or false |
| project[required_notes]  | Project hours notes to be required for logging |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
201 Created
```

```json
[binary data]
```


## dont send project invite


### Request

```shell
curl "https://api.timelyapp.com/1.1/317/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":240,"send_invite":"false","users":[{"user_id":788},{"user_id":789}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer FR7EBByxx9e0fOf2ycsTN0lIVOFqam_elB4EnRPXThU" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/317/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer FR7EBByxx9e0fOf2ycsTN0lIVOFqam_elB4EnRPXThU
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":240,"send_invite":"false","users":[{"user_id":788},{"user_id":789}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |
| project[name] *required* | Project name |
| project[company_id] *required* | Company id |
| project[color] *required* | Project color |
| project[hour_rate]  | Project hour_rate |
| project[rate_type]  | Project rate_type |
| project[budget]  | Project budget |
| project[budget_type]  | Project budget type |
| project[billable]  | Project billable |
| project[active]  | Project active/archived |
| project[external_id]  | Project external_id |
| project[budget_scope]  | Project budget scope |
| project[users] *required* | Project users |
| project[labels]  | Project labels |
| project[budget_recurrence]  | Project budget recurrence rule |
| project[send_invite]  | Send project invite, should be true or false |
| project[required_notes]  | Project hours notes to be required for logging |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
201 Created
```

```json
[binary data]
```


## dont send project invite


### Request

```shell
curl "https://api.timelyapp.com/1.1/330/projects/367" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":253,"send_invite":"false","users":[{"user_id":827},{"user_id":828}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer OtmsCP5Mo7UWvWmM8GXAqxv1EigVWST8cz6VJEncriI" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/330/projects/367
Accept: application/json
Content-Type: application/json
Authorization: Bearer OtmsCP5Mo7UWvWmM8GXAqxv1EigVWST8cz6VJEncriI
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":253,"send_invite":"false","users":[{"user_id":827},{"user_id":828}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## mine with projects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/301/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer MpHcOjpstoox2lDqs_MMoU5d_uTk_zJLR809I-P87Bs" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/301/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer MpHcOjpstoox2lDqs_MMoU5d_uTk_zJLR809I-P87Bs
```

#### Parameters



| Name | Description |
|:-----|:------------|
| offset  | Retrieve projects from offset |
| limit  | Retrieve number of projects |
| order  | Sorting order on updated_at |
| filter  | Filter projects - Ex: filter=active or filter=archived or filter=all |
| updated_after  | Retrieve records updated after a certain timestamp |
| project_ids  | Retrieve specific projects |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## mine without projects


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/302/projects" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ajTSAQ_F8-DQZ4HFLJ4UfCcntfJFB0xm-NNDBgP_4ag" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/302/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer ajTSAQ_F8-DQZ4HFLJ4UfCcntfJFB0xm-NNDBgP_4ag
```

#### Parameters



| Name | Description |
|:-----|:------------|
| offset  | Retrieve projects from offset |
| limit  | Retrieve number of projects |
| order  | Sorting order on updated_at |
| filter  | Filter projects - Ex: filter=active or filter=archived or filter=all |
| updated_after  | Retrieve records updated after a certain timestamp |
| project_ids  | Retrieve specific projects |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## project_ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/307/projects?project_ids=314%2C316" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1fUJ_KUbDI6QqWy4fLLLP0hC5fDmE4f4xP40ky0v1MY" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/projects`

```plaintext
GET /1.1/307/projects?project_ids=314%2C316
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1fUJ_KUbDI6QqWy4fLLLP0hC5fDmE4f4xP40ky0v1MY
```

#### Parameters

```json
project_ids: 314,316
```


| Name | Description |
|:-----|:------------|
| offset  | Retrieve projects from offset |
| limit  | Retrieve number of projects |
| order  | Sorting order on updated_at |
| filter  | Filter projects - Ex: filter=active or filter=archived or filter=all |
| updated_after  | Retrieve records updated after a certain timestamp |
| project_ids  | Retrieve specific projects |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## required notes


### Request

```shell
curl "https://api.timelyapp.com/1.1/331/projects/368" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":254,"required_notes":true,"users":[{"user_id":830}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer FSwVrx4-iu2zGWNZG10BnwdUjUypqFrl8zXBXOTAyxw" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/331/projects/368
Accept: application/json
Content-Type: application/json
Authorization: Bearer FSwVrx4-iu2zGWNZG10BnwdUjUypqFrl8zXBXOTAyxw
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":254,"required_notes":true,"users":[{"user_id":830}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## required notes


### Request

```shell
curl "https://api.timelyapp.com/1.1/318/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":241,"required_notes":true,"users":[{"user_id":791}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9vxnAT9arsV9KTC1W8YOzutREZmNqa71_gT9XbXaobI" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/318/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9vxnAT9arsV9KTC1W8YOzutREZmNqa71_gT9XbXaobI
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":241,"required_notes":true,"users":[{"user_id":791}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |
| project[name] *required* | Project name |
| project[company_id] *required* | Company id |
| project[color] *required* | Project color |
| project[hour_rate]  | Project hour_rate |
| project[rate_type]  | Project rate_type |
| project[budget]  | Project budget |
| project[budget_type]  | Project budget type |
| project[billable]  | Project billable |
| project[active]  | Project active/archived |
| project[external_id]  | Project external_id |
| project[budget_scope]  | Project budget scope |
| project[users] *required* | Project users |
| project[labels]  | Project labels |
| project[budget_recurrence]  | Project budget recurrence rule |
| project[send_invite]  | Send project invite, should be true or false |
| project[required_notes]  | Project hours notes to be required for logging |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
201 Created
```

```json
[binary data]
```


## send project invite


### Request

```shell
curl "https://api.timelyapp.com/1.1/316/projects" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":239,"users":[{"user_id":785},{"user_id":786}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer tH-OvTKTBNlUowyB9465LWFklYWqCA3k-1Pb5kF5FoQ" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/projects`

```plaintext
POST /1.1/316/projects
Accept: application/json
Content-Type: application/json
Authorization: Bearer tH-OvTKTBNlUowyB9465LWFklYWqCA3k-1Pb5kF5FoQ
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":239,"users":[{"user_id":785},{"user_id":786}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |
| project[name] *required* | Project name |
| project[company_id] *required* | Company id |
| project[color] *required* | Project color |
| project[hour_rate]  | Project hour_rate |
| project[rate_type]  | Project rate_type |
| project[budget]  | Project budget |
| project[budget_type]  | Project budget type |
| project[billable]  | Project billable |
| project[active]  | Project active/archived |
| project[external_id]  | Project external_id |
| project[budget_scope]  | Project budget scope |
| project[users] *required* | Project users |
| project[labels]  | Project labels |
| project[budget_recurrence]  | Project budget recurrence rule |
| project[send_invite]  | Send project invite, should be true or false |
| project[required_notes]  | Project hours notes to be required for logging |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
201 Created
```

```json
[binary data]
```


## send project invite


### Request

```shell
curl "https://api.timelyapp.com/1.1/329/projects/366" -d '{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":252,"users":[{"user_id":824},{"user_id":825}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer -EkLHTDBdFF8bUQ0kpU2MIK8aF3s7aYDi1tUqObqZ84" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/329/projects/366
Accept: application/json
Content-Type: application/json
Authorization: Bearer -EkLHTDBdFF8bUQ0kpU2MIK8aF3s7aYDi1tUqObqZ84
```

#### Parameters


```json
{"project":{"name":"Timely","rate_type":"project","hour_rate":50.0,"active":true,"deleted":false,"currency_code":"usd","color":"67a3bc","company_id":252,"users":[{"user_id":824},{"user_id":825}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/321/projects/358" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":50,"budget":100,"required":true},{"label_id":51,"budget":100,"required":true},{"label_id":52,"budget":200,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer zUn97IQ10djp4WYvktafdM8Is_bdvr336HrIzAeyLqY" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/321/projects/358
Accept: application/json
Content-Type: application/json
Authorization: Bearer zUn97IQ10djp4WYvktafdM8Is_bdvr336HrIzAeyLqY
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":50,"budget":100,"required":true},{"label_id":51,"budget":100,"required":true},{"label_id":52,"budget":200,"required":true}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/323/projects/360" -d '{"project":{"budget_type":"M","budget":400,"labels":[]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 9EQhGK1IClRdlDjyLq6qeOO1IekQSW-1utVHIWIpxsE" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/323/projects/360
Accept: application/json
Content-Type: application/json
Authorization: Bearer 9EQhGK1IClRdlDjyLq6qeOO1IekQSW-1utVHIWIpxsE
```

#### Parameters


```json
{"project":{"budget_type":"M","budget":400,"labels":[]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/324/projects/361" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer oupu_nkg_cQ9_wAqbJKgb8P956UPzzoMD49VFS-iALc" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/324/projects/361
Accept: application/json
Content-Type: application/json
Authorization: Bearer oupu_nkg_cQ9_wAqbJKgb8P956UPzzoMD49VFS-iALc
```

#### Parameters


```json
{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"week","start_date":"2018-09-21","end_date":"2019-09-21","recur_until":"end_date"}}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/325/projects/362" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer awbru363HU1axhvqYKX6kqS_Z1J6AQLe-0KpKZ4gxMg" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/325/projects/362
Accept: application/json
Content-Type: application/json
Authorization: Bearer awbru363HU1axhvqYKX6kqS_Z1J6AQLe-0KpKZ4gxMg
```

#### Parameters


```json
{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"start_date":"2018-09-21","end_date":"","recur_until":"archived"}}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/326/projects/363" -d '{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"month"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer KdrA425_XkJeVjneYAEtqy2aoZZFaO5CfVWtSR27ieU" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/326/projects/363
Accept: application/json
Content-Type: application/json
Authorization: Bearer KdrA425_XkJeVjneYAEtqy2aoZZFaO5CfVWtSR27ieU
```

#### Parameters


```json
{"project":{"budget_type":"M","budget":300,"budget_recurrence":{"recur":"month"}}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
422 Unprocessable Entity
```

```json
[binary data]
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/327/projects/364" -d '{"project":{"budget_type":"M","budget":400,"budget_recurrence":{"recur":"week"}}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer YLvoDanNtf-onLrMmNMm9XOckbATZ3dD-9xmnRWcLDY" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/327/projects/364
Accept: application/json
Content-Type: application/json
Authorization: Bearer YLvoDanNtf-onLrMmNMm9XOckbATZ3dD-9xmnRWcLDY
```

#### Parameters


```json
{"project":{"budget_type":"M","budget":400,"budget_recurrence":{"recur":"week"}}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
422 Unprocessable Entity
```

```json
[binary data]
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/328/projects/365" -d '{"project":{"budget_type":"M","budget":300}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer BFsud-1D0urcWBLuIwVgu7Jrau-YjLJi6eyeGpwsqnw" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/328/projects/365
Accept: application/json
Content-Type: application/json
Authorization: Bearer BFsud-1D0urcWBLuIwVgu7Jrau-YjLJi6eyeGpwsqnw
```

#### Parameters


```json
{"project":{"budget_type":"M","budget":300}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/319/projects/356" -d '{"project":{"labels":[{"label_id":46},{"label_id":47,"budget":0,"required":false}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer GUTXE0LAijW86z2cucbfkCUBlDwze_8nprzrCgJZbNg" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/319/projects/356
Accept: application/json
Content-Type: application/json
Authorization: Bearer GUTXE0LAijW86z2cucbfkCUBlDwze_8nprzrCgJZbNg
```

#### Parameters


```json
{"project":{"labels":[{"label_id":46},{"label_id":47,"budget":0,"required":false}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/320/projects/357" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":48,"budget":100,"required":true},{"label_id":49,"budget":100,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer YzD3eqqubqwoDPjTl1TFUFWcVJiH5IMJAItb-bZCv3E" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/320/projects/357
Accept: application/json
Content-Type: application/json
Authorization: Bearer YzD3eqqubqwoDPjTl1TFUFWcVJiH5IMJAItb-bZCv3E
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":200,"labels":[{"label_id":48,"budget":100,"required":true},{"label_id":49,"budget":100,"required":true}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update project


### Request

```shell
curl "https://api.timelyapp.com/1.1/322/projects/359" -d '{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":55,"budget":400,"required":true}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 1OIZ2-y6kYyQsFLHp8PCvZAjfOqBCKtGU1NYAPUx61M" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/projects/:id`

```plaintext
PUT /1.1/322/projects/359
Accept: application/json
Content-Type: application/json
Authorization: Bearer 1OIZ2-y6kYyQsFLHp8PCvZAjfOqBCKtGU1NYAPUx61M
```

#### Parameters


```json
{"project":{"budget_type":"M","budget_scope":"tag","budget":400,"labels":[{"label_id":55,"budget":400,"required":true}]}}
```

| Name | Description |
|:-----|:------------|
| project *required* | Project attributes |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Suggested Entries



## index


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/334/suggested_entries?date=2020-02-27" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer c9NbMNQaDPcQmBtozQqPTqOiDaTn5pzc1bkfTXlgL50" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries`

```plaintext
GET /1.1/334/suggested_entries?date=2020-02-27
Accept: application/json
Content-Type: application/json
Authorization: Bearer c9NbMNQaDPcQmBtozQqPTqOiDaTn5pzc1bkfTXlgL50
```

#### Parameters

```json
date: 2020-02-27
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "title": "gps entry",
    "note": "",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": "03:57 - 07:27",
    "entry_ids": [
      194
    ],
    "icon_url": "/assets/apps_logo/gps_tracker-f46211e557b1b91fd96b7600793e7acc8bed24ae732fa14463eda948f96b4a03.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [

    ],
    "importance": 0,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "entries": [
      {
        "id": 194,
        "type": "gps_tracker",
        "uid": "test-gps-uid",
        "title": "gps entry",
        "note": "",
        "description": "03:57 - 07:27",
        "date": "2020-02-27",
        "from": "2020-02-27T03:57:49+01:00",
        "to": "2020-02-27T07:27:49+01:00",
        "entry_type": null,
        "duration": {
          "hours": 3,
          "minutes": 30,
          "seconds": 0,
          "formatted": "03:30",
          "total_hours": 3.5,
          "total_seconds": 12600,
          "total_minutes": 210
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [
          {
            "name": "latitude",
            "value": "18.572856"
          },
          {
            "name": "longitude",
            "value": "73.978501"
          }
        ],
        "icon": "gps_tracker.png",
        "color": "rgba(98,223,93,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/gps_tracker-f46211e557b1b91fd96b7600793e7acc8bed24ae732fa14463eda948f96b4a03.png",
        "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": null,
        "importance": 0,
        "spam": false
      }
    ]
  },
  {
    "title": "Meeting",
    "note": "Discuss about future",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": "14:00 - 15:00 • Discuss about future",
    "entry_ids": [
      195
    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [

    ],
    "importance": 0,
    "duration": {
      "hours": 1,
      "minutes": 0,
      "seconds": 0,
      "formatted": "01:00",
      "total_hours": 1.0,
      "total_seconds": 3600,
      "total_minutes": 60
    },
    "entries": [
      {
        "id": 195,
        "type": "google_calendar",
        "uid": "testuid",
        "title": "Meeting",
        "note": "Discuss about future",
        "description": "14:00 - 15:00 • Discuss about future",
        "date": "2020-02-27",
        "from": "2020-02-27T14:00:00+01:00",
        "to": "2020-02-27T15:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 1,
          "minutes": 0,
          "seconds": 0,
          "formatted": "01:00",
          "total_hours": 1.0,
          "total_seconds": 3600,
          "total_minutes": 60
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [

        ],
        "icon": "google_calendar.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
        "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": "https://calendar_url",
        "importance": 0,
        "spam": false
      }
    ]
  },
  {
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "entry_ids": [
      196,
      197
    ],
    "icon_url": "/assets/timeline_app_logos/macvim-59e1023114044c663aef2c8f8061527f94438faa396cc8f4bc5dcbf8c9de5800.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [
      {
        "project_id": 371,
        "accuracy": 0.8,
        "count": 2
      }
    ],
    "importance": 0.8,
    "duration": {
      "hours": 7,
      "minutes": 0,
      "seconds": 0,
      "formatted": "07:00",
      "total_hours": 7.0,
      "total_seconds": 25200,
      "total_minutes": 420
    },
    "entries": [
      {
        "id": 196,
        "type": "macOS",
        "uid": "e08a428a-d89c-46c7-9c49-a24bedb10baf",
        "title": "MacVim",
        "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "date": "2020-02-27",
        "from": "2020-02-27T10:00:00+01:00",
        "to": "2020-02-27T12:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 2,
          "minutes": 0,
          "seconds": 0,
          "formatted": "02:00",
          "total_hours": 2.0,
          "total_seconds": 7200,
          "total_minutes": 120
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [
          {
            "name": "application",
            "value": "MacVim"
          },
          {
            "name": "detail",
            "value": ""
          }
        ],
        "icon": null,
        "color": null,
        "sub_entries": [

        ],
        "icon_url": "/assets/timeline_app_logos/macvim-59e1023114044c663aef2c8f8061527f94438faa396cc8f4bc5dcbf8c9de5800.png",
        "icon_fallback_url": "/assets/timeline_app_logos/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": null,
        "importance": 0.8,
        "spam": false
      },
      {
        "id": 197,
        "type": "macOS",
        "uid": "869565cd-8da4-4f16-a079-79ee0dc85717",
        "title": "MacVim",
        "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "date": "2020-02-27",
        "from": "2020-02-27T14:00:00+01:00",
        "to": "2020-02-27T15:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 1,
          "minutes": 0,
          "seconds": 0,
          "formatted": "01:00",
          "total_hours": 1.0,
          "total_seconds": 3600,
          "total_minutes": 60
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [
          {
            "name": "application",
            "value": "MacVim"
          },
          {
            "name": "detail",
            "value": ""
          }
        ],
        "icon": null,
        "color": null,
        "sub_entries": [

        ],
        "icon_url": "/assets/timeline_app_logos/macvim-59e1023114044c663aef2c8f8061527f94438faa396cc8f4bc5dcbf8c9de5800.png",
        "icon_fallback_url": "/assets/timeline_app_logos/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": null,
        "importance": 0.8,
        "spam": false
      }
    ]
  },
  {
    "title": "Congratulations on winning $100000",
    "note": "You won $100000, share your netbanking details",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": " • You won $100000, share your netbanking details",
    "entry_ids": [
      198
    ],
    "icon_url": "/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [
      {
        "project_id": 371,
        "accuracy": 0.8,
        "count": 1
      }
    ],
    "importance": 0,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "entries": [
      {
        "id": 198,
        "type": "gmail",
        "uid": "46ca229a-1e6f-4cd8-9946-731e5112790e",
        "title": "Congratulations on winning $100000",
        "note": "You won $100000, share your netbanking details",
        "description": " • You won $100000, share your netbanking details",
        "date": "2020-02-27",
        "from": "2020-02-27T18:10:00+01:00",
        "to": "2020-02-27T18:10:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 0,
          "minutes": 0,
          "seconds": 0,
          "formatted": "00:00",
          "total_hours": 0.0,
          "total_seconds": 0,
          "total_minutes": 0
        },
        "at": "2020-02-27T18:10:00+01:00",
        "extra_attributes": [

        ],
        "icon": null,
        "color": null,
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png",
        "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": null,
        "importance": 0,
        "spam": false
      }
    ]
  }
]
```


## index


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/337/suggested_entries?date=2020-02-27&spam=true" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer B6ycbV61a25VvjhjJ5AoSmrtjZ6SZYdF_fkY1DJAsck" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries`

```plaintext
GET /1.1/337/suggested_entries?date=2020-02-27&amp;spam=true
Accept: application/json
Content-Type: application/json
Authorization: Bearer B6ycbV61a25VvjhjJ5AoSmrtjZ6SZYdF_fkY1DJAsck
```

#### Parameters

```json
date: 2020-02-27
spam: true
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "title": "gps entry",
    "note": "",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": "03:57 - 07:27",
    "entry_ids": [
      212
    ],
    "icon_url": "/assets/apps_logo/gps_tracker-f46211e557b1b91fd96b7600793e7acc8bed24ae732fa14463eda948f96b4a03.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [

    ],
    "importance": 0,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "entries": [
      {
        "id": 212,
        "type": "gps_tracker",
        "uid": "test-gps-uid",
        "title": "gps entry",
        "note": "",
        "description": "03:57 - 07:27",
        "date": "2020-02-27",
        "from": "2020-02-27T03:57:51+01:00",
        "to": "2020-02-27T07:27:51+01:00",
        "entry_type": null,
        "duration": {
          "hours": 3,
          "minutes": 30,
          "seconds": 0,
          "formatted": "03:30",
          "total_hours": 3.5,
          "total_seconds": 12600,
          "total_minutes": 210
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [
          {
            "name": "latitude",
            "value": "18.572856"
          },
          {
            "name": "longitude",
            "value": "73.978501"
          }
        ],
        "icon": "gps_tracker.png",
        "color": "rgba(98,223,93,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/gps_tracker-f46211e557b1b91fd96b7600793e7acc8bed24ae732fa14463eda948f96b4a03.png",
        "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": null,
        "importance": 0,
        "spam": false
      }
    ]
  },
  {
    "title": "Meeting",
    "note": "Discuss about future",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": "14:00 - 15:00 • Discuss about future",
    "entry_ids": [
      213
    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [

    ],
    "importance": 0,
    "duration": {
      "hours": 1,
      "minutes": 0,
      "seconds": 0,
      "formatted": "01:00",
      "total_hours": 1.0,
      "total_seconds": 3600,
      "total_minutes": 60
    },
    "entries": [
      {
        "id": 213,
        "type": "google_calendar",
        "uid": "testuid",
        "title": "Meeting",
        "note": "Discuss about future",
        "description": "14:00 - 15:00 • Discuss about future",
        "date": "2020-02-27",
        "from": "2020-02-27T14:00:00+01:00",
        "to": "2020-02-27T15:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 1,
          "minutes": 0,
          "seconds": 0,
          "formatted": "01:00",
          "total_hours": 1.0,
          "total_seconds": 3600,
          "total_minutes": 60
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [

        ],
        "icon": "google_calendar.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
        "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": "https://calendar_url",
        "importance": 0,
        "spam": false
      }
    ]
  },
  {
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "entry_ids": [
      214,
      215
    ],
    "icon_url": "/assets/timeline_app_logos/macvim-59e1023114044c663aef2c8f8061527f94438faa396cc8f4bc5dcbf8c9de5800.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [
      {
        "project_id": 374,
        "accuracy": 0.8,
        "count": 2
      }
    ],
    "importance": 0.8,
    "duration": {
      "hours": 7,
      "minutes": 0,
      "seconds": 0,
      "formatted": "07:00",
      "total_hours": 7.0,
      "total_seconds": 25200,
      "total_minutes": 420
    },
    "entries": [
      {
        "id": 214,
        "type": "macOS",
        "uid": "1797dbc8-31dd-473d-b7b5-0157d7deab8b",
        "title": "MacVim",
        "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "date": "2020-02-27",
        "from": "2020-02-27T10:00:00+01:00",
        "to": "2020-02-27T12:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 2,
          "minutes": 0,
          "seconds": 0,
          "formatted": "02:00",
          "total_hours": 2.0,
          "total_seconds": 7200,
          "total_minutes": 120
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [
          {
            "name": "application",
            "value": "MacVim"
          },
          {
            "name": "detail",
            "value": ""
          }
        ],
        "icon": null,
        "color": null,
        "sub_entries": [

        ],
        "icon_url": "/assets/timeline_app_logos/macvim-59e1023114044c663aef2c8f8061527f94438faa396cc8f4bc5dcbf8c9de5800.png",
        "icon_fallback_url": "/assets/timeline_app_logos/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": null,
        "importance": 0.8,
        "spam": false
      },
      {
        "id": 215,
        "type": "macOS",
        "uid": "bbfb2125-d53b-47da-b7dc-e15acdd9693f",
        "title": "MacVim",
        "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "date": "2020-02-27",
        "from": "2020-02-27T14:00:00+01:00",
        "to": "2020-02-27T15:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 1,
          "minutes": 0,
          "seconds": 0,
          "formatted": "01:00",
          "total_hours": 1.0,
          "total_seconds": 3600,
          "total_minutes": 60
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [
          {
            "name": "application",
            "value": "MacVim"
          },
          {
            "name": "detail",
            "value": ""
          }
        ],
        "icon": null,
        "color": null,
        "sub_entries": [

        ],
        "icon_url": "/assets/timeline_app_logos/macvim-59e1023114044c663aef2c8f8061527f94438faa396cc8f4bc5dcbf8c9de5800.png",
        "icon_fallback_url": "/assets/timeline_app_logos/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": null,
        "importance": 0.8,
        "spam": false
      }
    ]
  },
  {
    "title": "Congratulations on winning $100000",
    "note": "You won $100000, share your netbanking details",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": " • You won $100000, share your netbanking details",
    "entry_ids": [
      216
    ],
    "icon_url": "/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [
      {
        "project_id": 374,
        "accuracy": 0.8,
        "count": 1
      }
    ],
    "importance": 0,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "entries": [
      {
        "id": 216,
        "type": "gmail",
        "uid": "0f340fa4-f1e2-4ff2-b27a-77c8c7bb5a62",
        "title": "Congratulations on winning $100000",
        "note": "You won $100000, share your netbanking details",
        "description": " • You won $100000, share your netbanking details",
        "date": "2020-02-27",
        "from": "2020-02-27T18:10:00+01:00",
        "to": "2020-02-27T18:10:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 0,
          "minutes": 0,
          "seconds": 0,
          "formatted": "00:00",
          "total_hours": 0.0,
          "total_seconds": 0,
          "total_minutes": 0
        },
        "at": "2020-02-27T18:10:00+01:00",
        "extra_attributes": [

        ],
        "icon": null,
        "color": null,
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png",
        "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": null,
        "importance": 0,
        "spam": false
      }
    ]
  },
  {
    "title": "D&P event time Meeting",
    "note": "D&P event time Meeting",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": "10:00 - 12:00 • D&P event time Meeting",
    "entry_ids": [
      217
    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [

    ],
    "importance": 0.8,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "entries": [
      {
        "id": 217,
        "type": "google_calendar",
        "uid": "testuid",
        "title": "D&P event time Meeting",
        "note": "D&P event time Meeting",
        "description": "10:00 - 12:00 • D&P event time Meeting",
        "date": "2020-02-27",
        "from": "2020-02-27T10:00:00+01:00",
        "to": "2020-02-27T12:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 2,
          "minutes": 0,
          "seconds": 0,
          "formatted": "02:00",
          "total_hours": 2.0,
          "total_seconds": 7200,
          "total_minutes": 120
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [

        ],
        "icon": "google_calendar.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
        "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": "https://calendar_url",
        "importance": 0.8,
        "spam": true
      }
    ]
  }
]
```


## sanitize titile and notes


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/335/suggested_entries?date=2020-02-27&entry_ids=205&spam=true" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer _3Qx8ISbkWvDifPAfD7yoI_Pn_eUzpHCI7t8iNJWAyY" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries`

```plaintext
GET /1.1/335/suggested_entries?date=2020-02-27&amp;entry_ids=205&amp;spam=true
Accept: application/json
Content-Type: application/json
Authorization: Bearer _3Qx8ISbkWvDifPAfD7yoI_Pn_eUzpHCI7t8iNJWAyY
```

#### Parameters

```json
date: 2020-02-27
entry_ids: 205
spam: true
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "title": "D&P event time Meeting",
    "note": "D&P event time Meeting",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": "10:00 - 12:00 • D&P event time Meeting",
    "entry_ids": [
      205
    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [

    ],
    "importance": 0.8,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "entries": [
      {
        "id": 205,
        "type": "google_calendar",
        "uid": "testuid",
        "title": "D&P event time Meeting",
        "note": "D&P event time Meeting",
        "description": "10:00 - 12:00 • D&P event time Meeting",
        "date": "2020-02-27",
        "from": "2020-02-27T10:00:00+01:00",
        "to": "2020-02-27T12:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 2,
          "minutes": 0,
          "seconds": 0,
          "formatted": "02:00",
          "total_hours": 2.0,
          "total_seconds": 7200,
          "total_minutes": 120
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [

        ],
        "icon": "google_calendar.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
        "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": "https://calendar_url",
        "importance": 0.8,
        "spam": true
      }
    ]
  }
]
```


## should have description


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/336/suggested_entries?date=2020-02-27" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ulzKGBtT9P9NBJZAos0U9KP1SACXtF2Q3fU23zUL0uA" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_entries`

```plaintext
GET /1.1/336/suggested_entries?date=2020-02-27
Accept: application/json
Content-Type: application/json
Authorization: Bearer ulzKGBtT9P9NBJZAos0U9KP1SACXtF2Q3fU23zUL0uA
```

#### Parameters

```json
date: 2020-02-27
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[
  {
    "title": "gps entry",
    "note": "",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": "03:57 - 07:27",
    "entry_ids": [
      206
    ],
    "icon_url": "/assets/apps_logo/gps_tracker-f46211e557b1b91fd96b7600793e7acc8bed24ae732fa14463eda948f96b4a03.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [

    ],
    "importance": 0,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "entries": [
      {
        "id": 206,
        "type": "gps_tracker",
        "uid": "test-gps-uid",
        "title": "gps entry",
        "note": "",
        "description": "03:57 - 07:27",
        "date": "2020-02-27",
        "from": "2020-02-27T03:57:50+01:00",
        "to": "2020-02-27T07:27:50+01:00",
        "entry_type": null,
        "duration": {
          "hours": 3,
          "minutes": 30,
          "seconds": 0,
          "formatted": "03:30",
          "total_hours": 3.5,
          "total_seconds": 12600,
          "total_minutes": 210
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [
          {
            "name": "latitude",
            "value": "18.572856"
          },
          {
            "name": "longitude",
            "value": "73.978501"
          }
        ],
        "icon": "gps_tracker.png",
        "color": "rgba(98,223,93,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/gps_tracker-f46211e557b1b91fd96b7600793e7acc8bed24ae732fa14463eda948f96b4a03.png",
        "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": null,
        "importance": 0,
        "spam": false
      }
    ]
  },
  {
    "title": "Meeting",
    "note": "Discuss about future",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": "14:00 - 15:00 • Discuss about future",
    "entry_ids": [
      207
    ],
    "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [

    ],
    "importance": 0,
    "duration": {
      "hours": 1,
      "minutes": 0,
      "seconds": 0,
      "formatted": "01:00",
      "total_hours": 1.0,
      "total_seconds": 3600,
      "total_minutes": 60
    },
    "entries": [
      {
        "id": 207,
        "type": "google_calendar",
        "uid": "testuid",
        "title": "Meeting",
        "note": "Discuss about future",
        "description": "14:00 - 15:00 • Discuss about future",
        "date": "2020-02-27",
        "from": "2020-02-27T14:00:00+01:00",
        "to": "2020-02-27T15:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 1,
          "minutes": 0,
          "seconds": 0,
          "formatted": "01:00",
          "total_hours": 1.0,
          "total_seconds": 3600,
          "total_minutes": 60
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [

        ],
        "icon": "google_calendar.png",
        "color": "rgba(86,210,255,0.30)",
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/google_calendar-cf4817a3d9bb86a0f2371b67fc49106074b36e8ee05a1932c595181dbd9aecd0.png",
        "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": "https://calendar_url",
        "importance": 0,
        "spam": false
      }
    ]
  },
  {
    "title": "MacVim",
    "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
    "entry_ids": [
      208,
      209
    ],
    "icon_url": "/assets/timeline_app_logos/macvim-59e1023114044c663aef2c8f8061527f94438faa396cc8f4bc5dcbf8c9de5800.png",
    "icon_fallback_url": "/assets/timeline_app_logos/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [
      {
        "project_id": 373,
        "accuracy": 0.8,
        "count": 2
      }
    ],
    "importance": 0.8,
    "duration": {
      "hours": 7,
      "minutes": 0,
      "seconds": 0,
      "formatted": "07:00",
      "total_hours": 7.0,
      "total_seconds": 25200,
      "total_minutes": 420
    },
    "entries": [
      {
        "id": 208,
        "type": "macOS",
        "uid": "edcfbdcd-bf09-4c41-b6ec-9cf23d8c4247",
        "title": "MacVim",
        "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "date": "2020-02-27",
        "from": "2020-02-27T10:00:00+01:00",
        "to": "2020-02-27T12:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 2,
          "minutes": 0,
          "seconds": 0,
          "formatted": "02:00",
          "total_hours": 2.0,
          "total_seconds": 7200,
          "total_minutes": 120
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [
          {
            "name": "application",
            "value": "MacVim"
          },
          {
            "name": "detail",
            "value": ""
          }
        ],
        "icon": null,
        "color": null,
        "sub_entries": [

        ],
        "icon_url": "/assets/timeline_app_logos/macvim-59e1023114044c663aef2c8f8061527f94438faa396cc8f4bc5dcbf8c9de5800.png",
        "icon_fallback_url": "/assets/timeline_app_logos/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": null,
        "importance": 0.8,
        "spam": false
      },
      {
        "id": 209,
        "type": "macOS",
        "uid": "13a9752c-be7f-42c7-8ae8-ec1f75f88af2",
        "title": "MacVim",
        "note": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "description": "hour.rb (~/code/github/timely/app/models) - VIM1",
        "date": "2020-02-27",
        "from": "2020-02-27T14:00:00+01:00",
        "to": "2020-02-27T15:00:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 1,
          "minutes": 0,
          "seconds": 0,
          "formatted": "01:00",
          "total_hours": 1.0,
          "total_seconds": 3600,
          "total_minutes": 60
        },
        "at": "2020-02-27T00:00:00+01:00",
        "extra_attributes": [
          {
            "name": "application",
            "value": "MacVim"
          },
          {
            "name": "detail",
            "value": ""
          }
        ],
        "icon": null,
        "color": null,
        "sub_entries": [

        ],
        "icon_url": "/assets/timeline_app_logos/macvim-59e1023114044c663aef2c8f8061527f94438faa396cc8f4bc5dcbf8c9de5800.png",
        "icon_fallback_url": "/assets/timeline_app_logos/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": null,
        "importance": 0.8,
        "spam": false
      }
    ]
  },
  {
    "title": "Congratulations on winning $100000",
    "note": "You won $100000, share your netbanking details",
    "date": "2020-02-27",
    "from": null,
    "to": null,
    "description": " • You won $100000, share your netbanking details",
    "entry_ids": [
      210
    ],
    "icon_url": "/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png",
    "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
    "projects": [
      {
        "project_id": 373,
        "accuracy": 0.8,
        "count": 1
      }
    ],
    "importance": 0,
    "duration": {
      "hours": 3,
      "minutes": 30,
      "seconds": 0,
      "formatted": "03:30",
      "total_hours": 3.5,
      "total_seconds": 12600,
      "total_minutes": 210
    },
    "entries": [
      {
        "id": 210,
        "type": "gmail",
        "uid": "3b33c757-fac6-4938-b827-9f44e37ba99a",
        "title": "Congratulations on winning $100000",
        "note": "You won $100000, share your netbanking details",
        "description": " • You won $100000, share your netbanking details",
        "date": "2020-02-27",
        "from": "2020-02-27T18:10:00+01:00",
        "to": "2020-02-27T18:10:00+01:00",
        "entry_type": null,
        "duration": {
          "hours": 0,
          "minutes": 0,
          "seconds": 0,
          "formatted": "00:00",
          "total_hours": 0.0,
          "total_seconds": 0,
          "total_minutes": 0
        },
        "at": "2020-02-27T18:10:00+01:00",
        "extra_attributes": [

        ],
        "icon": null,
        "color": null,
        "sub_entries": [

        ],
        "icon_url": "/assets/apps_logo/gmail-507255a1d62e38cfb7bcc5a531337868c05cd6924f1183cdd4f08b0cb4d7efdf.png",
        "icon_fallback_url": "/assets/apps_logo/default-0cf39e306f2798e5720981bcd9c5d11c3075c52220e99eb443c2cb1d44c1e52b.png",
        "url": null,
        "importance": 0,
        "spam": false
      }
    ]
  }
]
```


## shows error message


### Request

```shell
curl "https://api.timelyapp.com/1.1/339/suggested_entries" -d '{"suggested_entries":{"entries":[{"entry_id":226,"project_id":378}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer Yx9Or-bNc2sIyfXsTinz1j8mSdD3uUKIIPeQP6Hq52E" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_entries`

```plaintext
PUT /1.1/339/suggested_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer Yx9Or-bNc2sIyfXsTinz1j8mSdD3uUKIIPeQP6Hq52E
```

#### Parameters


```json
{"suggested_entries":{"entries":[{"entry_id":226,"project_id":378}]}}
```

| Name | Description |
|:-----|:------------|
| suggested_entries  | Suggested Entries to update |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
403 Forbidden
```

```json
[binary data]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/338/suggested_entries" -d '{"suggested_entries":{"entries":[{"entry_id":220,"project_id":376}]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer zBnB_shT3HuuZ7duY-m8cEUoRDEzdScalBAxZn1TPo4" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_entries`

```plaintext
PUT /1.1/338/suggested_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer zBnB_shT3HuuZ7duY-m8cEUoRDEzdScalBAxZn1TPo4
```

#### Parameters


```json
{"suggested_entries":{"entries":[{"entry_id":220,"project_id":376}]}}
```

| Name | Description |
|:-----|:------------|
| suggested_entries  | Suggested Entries to update |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Suggested Hours



## add suggested hour entries


### Request

```shell
curl "https://api.timelyapp.com/1.1/348/suggested_hours/445" -d '{"suggested_hour":{"entry_ids":[262,263,264]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer Pf_Q9pSOP6S7db2QaszGn-VzdwfHvfKuUNeqoratsD0" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
PUT /1.1/348/suggested_hours/445
Accept: application/json
Content-Type: application/json
Authorization: Bearer Pf_Q9pSOP6S7db2QaszGn-VzdwfHvfKuUNeqoratsD0
```

#### Parameters


```json
{"suggested_hour":{"entry_ids":[262,263,264]}}
```

| Name | Description |
|:-----|:------------|
| suggested_hour_id  | Suggested hour id |
| entry_ids  | Entry ids to associate with suggested hour |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## default


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/340/suggested_hours?date=2020-02-27" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer cGokhfIdS1X4nX9Y3JgNaQ0gAIvrx76L8lTSiPknZwc" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/340/suggested_hours?date=2020-02-27
Accept: application/json
Content-Type: application/json
Authorization: Bearer cGokhfIdS1X4nX9Y3JgNaQ0gAIvrx76L8lTSiPknZwc
```

#### Parameters

```json
date: 2020-02-27
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |
| since  | Suggested entries form specific date to until |
| until  | Suggested entries until specific date from since |
| suggested_hour_ids  | Suggested hours for specific ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## delete suggested hour entries


### Request

```shell
curl "https://api.timelyapp.com/1.1/347/suggested_hours/443" -d '{"suggested_hour":{"entry_ids":[258]}}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer Ko5R8Bs1nxCDp68aPNg0xj7cNTOlibw9gwlTPwJ6xSw" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
PUT /1.1/347/suggested_hours/443
Accept: application/json
Content-Type: application/json
Authorization: Bearer Ko5R8Bs1nxCDp68aPNg0xj7cNTOlibw9gwlTPwJ6xSw
```

#### Parameters


```json
{"suggested_hour":{"entry_ids":[258]}}
```

| Name | Description |
|:-----|:------------|
| suggested_hour_id  | Suggested hour id |
| entry_ids  | Entry ids to associate with suggested hour |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## show


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/346/suggested_hours/441" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer okb0F6lt2Jffru5V-O0aGltJ73X8g4JN4ajNQIajOZo" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
GET /1.1/346/suggested_hours/441
Accept: application/json
Content-Type: application/json
Authorization: Bearer okb0F6lt2Jffru5V-O0aGltJ73X8g4JN4ajNQIajOZo
```

#### Parameters

```json
{}: 
```


None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## since and until


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/342/suggested_hours?date=2020-02-27&since=2020-02-25&until=2020-02-27" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer Jj4pe4RJpYY568FsASxw2RMfJjqBXbO1256AZyWbCGE" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/342/suggested_hours?date=2020-02-27&amp;since=2020-02-25&amp;until=2020-02-27
Accept: application/json
Content-Type: application/json
Authorization: Bearer Jj4pe4RJpYY568FsASxw2RMfJjqBXbO1256AZyWbCGE
```

#### Parameters

```json
date: 2020-02-27
since: 2020-02-25
until: 2020-02-27
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |
| since  | Suggested entries form specific date to until |
| until  | Suggested entries until specific date from since |
| suggested_hour_ids  | Suggested hours for specific ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## suggested hour ids


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/343/suggested_hours?date=2020-02-27&suggested_hour_ids=435" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0WLUxkeIPg7Rl_io9CnB2t1f-PyVlfMdqgLGUaA8q4Y" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/343/suggested_hours?date=2020-02-27&amp;suggested_hour_ids=435
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0WLUxkeIPg7Rl_io9CnB2t1f-PyVlfMdqgLGUaA8q4Y
```

#### Parameters

```json
date: 2020-02-27
suggested_hour_ids: 435
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |
| since  | Suggested entries form specific date to until |
| until  | Suggested entries until specific date from since |
| suggested_hour_ids  | Suggested hours for specific ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/344/suggested_hours/437" -d '{}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer 0OulGWbBsJMmbNIDh_OJe5z6Afcp3WwZv74fS3IYJzA" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/:suggested_hour_id`

```plaintext
PUT /1.1/344/suggested_hours/437
Accept: application/json
Content-Type: application/json
Authorization: Bearer 0OulGWbBsJMmbNIDh_OJe5z6Afcp3WwZv74fS3IYJzA
```

#### Parameters


```json
{}
```

None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/345/suggested_hours/decline" -d '{"suggested_hour_ids":[439]}' -X PUT \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer pf-DxNpPnZPUq3nz_tVFUODPZI5O-6mhlwOJgE2YjMc" \
	-H "Cookie: "
```

#### Endpoint

`PUT /1.1/:account_id/suggested_hours/decline`

```plaintext
PUT /1.1/345/suggested_hours/decline
Accept: application/json
Content-Type: application/json
Authorization: Bearer pf-DxNpPnZPUq3nz_tVFUODPZI5O-6mhlwOJgE2YjMc
```

#### Parameters


```json
{"suggested_hour_ids":[439]}
```

| Name | Description |
|:-----|:------------|
| suggested_hour_ids  | Suggested hour ids to decline |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## with date


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/341/suggested_hours?date=2020-02-25" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer AwIw7t5sV53pyw3HJCg-H-oUoArgjyZabAFyh3KPdco" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggested_hours`

```plaintext
GET /1.1/341/suggested_hours?date=2020-02-25
Accept: application/json
Content-Type: application/json
Authorization: Bearer AwIw7t5sV53pyw3HJCg-H-oUoArgjyZabAFyh3KPdco
```

#### Parameters

```json
date: 2020-02-25
```


| Name | Description |
|:-----|:------------|
| date  | Suggested entries for date (Default today) |
| since  | Suggested entries form specific date to until |
| until  | Suggested entries until specific date from since |
| suggested_hour_ids  | Suggested hours for specific ids |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Timesheet Requests



## send request to complete timesheet


### Request

```shell
curl "https://api.timelyapp.com/1.1/216/users/562/timesheet_requests" -d '{}' -X POST \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer uFAtGBkfCj_IWAGvoeXq7OYONKo9gDqjOicTIG-7MuU" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/users/:id/timesheet_requests`

```plaintext
POST /1.1/216/users/562/timesheet_requests
Accept: application/json
Content-Type: application/json
Authorization: Bearer uFAtGBkfCj_IWAGvoeXq7OYONKo9gDqjOicTIG-7MuU
```

#### Parameters


```json
{}
```

| Name | Description |
|:-----|:------------|
| account_id  | The id of the account |
| id  | The id of the user to receive notification |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## send request to complete timesheet


### Request

```shell
curl "https://api.timelyapp.com/1.1/217/users/timesheet_requests" -d '{"user_ids":"566,567"}' -X POST \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer MTW8syEHGB4PIX5Rfpm5mdI60aB1Gt4b0U068boLF4I" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/users/timesheet_requests`

```plaintext
POST /1.1/217/users/timesheet_requests
Accept: application/json
Content-Type: application/json
Authorization: Bearer MTW8syEHGB4PIX5Rfpm5mdI60aB1Gt4b0U068boLF4I
```

#### Parameters


```json
{"user_ids":"566,567"}
```

| Name | Description |
|:-----|:------------|
| account_id  | The id of the account |
| user_ids  | Comma separated list with ids of users to receive notification |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Training Entries



## create


### Request

```shell
curl "https://api.timelyapp.com/1.1/357/training_entries" -d '{"training_entries":{"entries":[{"entry_id":281,"project_id":395}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer w68ahPMMHa1Ld5o8eQka8mAUFcZmxt196L-9gEKl7WI" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/357/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer w68ahPMMHa1Ld5o8eQka8mAUFcZmxt196L-9gEKl7WI
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":281,"project_id":395}]}}
```

| Name | Description |
|:-----|:------------|
| training_entries  | Training Entries to create/update |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## list training entries


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/356/training_entries" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer ggJ2zr2CImW8naUBWCuxo4ONUqEe0G89gbVRSfVzrWs" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/training_entries`

```plaintext
GET /1.1/356/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer ggJ2zr2CImW8naUBWCuxo4ONUqEe0G89gbVRSfVzrWs
```

#### Parameters



| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## update


### Request

```shell
curl "https://api.timelyapp.com/1.1/358/training_entries" -d '{"training_entries":{"entries":[{"entry_id":284,"project_id":396},{"entry_id":285,"project_id":396}]}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer sApb-_p3v6yfGuSLdw5iySSXabD4wE4iNctVzPAf5VE" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.1/:account_id/training_entries`

```plaintext
POST /1.1/358/training_entries
Accept: application/json
Content-Type: application/json
Authorization: Bearer sApb-_p3v6yfGuSLdw5iySSXabD4wE4iNctVzPAf5VE
```

#### Parameters


```json
{"training_entries":{"entries":[{"entry_id":284,"project_id":396},{"entry_id":285,"project_id":396}]}}
```

| Name | Description |
|:-----|:------------|
| training_entries  | Training Entries to create/update |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Upgrade



## if subscription was already paid by stripe


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/370/upgrade" -d '{"account":{"next_charge":"2020-03-27","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer _S-st3eTUnwxnvA1P6WrISw836OkTwbMWeT-9se9u5w" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/370/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer _S-st3eTUnwxnvA1P6WrISw836OkTwbMWeT-9se9u5w
```

#### Parameters


```json
{"account":{"next_charge":"2020-03-27","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
```

| Name | Description |
|:-----|:------------|
| next_charge  | Next charge date |
| plan  | plan code |
| appstore_transaction_id  | Appstore original transaction id |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
422 Unprocessable Entity
```

```json
[binary data]
```


## if there is more than one user


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/372/upgrade" -d '{"account":{"next_charge":"2020-03-27","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer xnoR-n-Ied7IZ_zTpEkhoTlfmT_G590rSnaNexnFiO0" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/372/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer xnoR-n-Ied7IZ_zTpEkhoTlfmT_G590rSnaNexnFiO0
```

#### Parameters


```json
{"account":{"next_charge":"2020-03-27","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
```

| Name | Description |
|:-----|:------------|
| next_charge  | Next charge date |
| plan  | plan code |
| appstore_transaction_id  | Appstore original transaction id |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
422 Unprocessable Entity
```

```json
[binary data]
```


## upgrade account plan to essential


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/369/upgrade" -d '{"account":{"next_charge":"2020-03-27","appstore_transaction_id":"some-appstore-id","plan":"essential"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer xrBp4PTHBNUudr1nldOyjcfTHWhZD2R8TCxp0uvfzU0" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/369/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer xrBp4PTHBNUudr1nldOyjcfTHWhZD2R8TCxp0uvfzU0
```

#### Parameters


```json
{"account":{"next_charge":"2020-03-27","appstore_transaction_id":"some-appstore-id","plan":"essential"}}
```

| Name | Description |
|:-----|:------------|
| next_charge  | Next charge date |
| plan  | plan code |
| appstore_transaction_id  | Appstore original transaction id |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## upgrade account plan to solo


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/368/upgrade" -d '{"account":{"next_charge":"2020-03-27","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer GxXBNjPXb-Zc5W9wLKRz8q2tgQ_d-kHqM8bXtPrscDg" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/368/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer GxXBNjPXb-Zc5W9wLKRz8q2tgQ_d-kHqM8bXtPrscDg
```

#### Parameters


```json
{"account":{"next_charge":"2020-03-27","appstore_transaction_id":"some-appstore-id","plan":"solo_v1"}}
```

| Name | Description |
|:-----|:------------|
| next_charge  | Next charge date |
| plan  | plan code |
| appstore_transaction_id  | Appstore original transaction id |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## upgrade for duplicate appstore_transaction_id


### Request

```shell
curl "https://api.timelyapp.com/1.2/private/accounts/374/upgrade" -d '{"account":{"next_charge":"2020-03-27","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}' -X POST \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer MhDyD4ENWuF8kQdgmj1od01Vq-KvxK2Zn03uww2ie5g" \
	-H "Cookie: "
```

#### Endpoint

`POST /1.2/private/accounts/:account_id/upgrade`

```plaintext
POST /1.2/private/accounts/374/upgrade
Accept: application/json
Content-Type: application/json
Authorization: Bearer MhDyD4ENWuF8kQdgmj1od01Vq-KvxK2Zn03uww2ie5g
```

#### Parameters


```json
{"account":{"next_charge":"2020-03-27","appstore_transaction_id":"duplicate-transaction-id","plan":"solo_v1"}}
```

| Name | Description |
|:-----|:------------|
| next_charge  | Next charge date |
| plan  | plan code |
| appstore_transaction_id  | Appstore original transaction id |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
422 Unprocessable Entity
```

```json
[binary data]
```


# User Onboarding



## create or update properties


### Request

```shell
curl "https://api.timelyapp.com/user_onboarding" -d '{"user_onboarding":{"user_onboarding_properties":[{"property":"has_seen_calendar_day","value":"yes"},{"property":"has_seen_calendar_week","value":"no"}]}}' -X PUT \
	-H "Host: app.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Cookie: "
```

#### Endpoint

`PUT /user_onboarding`

```plaintext
PUT /user_onboarding
Accept: application/json
Content-Type: application/json
```

#### Parameters


```json
{"user_onboarding":{"user_onboarding_properties":[{"property":"has_seen_calendar_day","value":"yes"},{"property":"has_seen_calendar_week","value":"no"}]}}
```

| Name | Description |
|:-----|:------------|
| user_onboarding *required* | User onboarding |
| user_onboarding[user_onboarding_properties] *required* | Array of multiple property and valyes |
| user_onboarding_properties[property] *required* | Onboarding property name |
| user_onboarding_properties[value] *required* | Onboarding property value |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## list properties


### Request

```shell
curl -g "https://api.timelyapp.com/user_onboarding" -X GET \
	-H "Host: app.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Cookie: "
```

#### Endpoint

`GET /user_onboarding`

```plaintext
GET /user_onboarding
Accept: application/json
Content-Type: application/json
```

#### Parameters

```json
{}: 
```


None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# UserTeams



## Retrieve user teams


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/359/users/887/teams" -X GET \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer lk1QDunMQcl1PzVA-9PmDCWnLS7Ol84ypOrAPvbqazo" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/users/:id/teams`

```plaintext
GET /1.1/359/users/887/teams
Accept: application/json
Content-Type: application/json
Authorization: Bearer lk1QDunMQcl1PzVA-9PmDCWnLS7Ol84ypOrAPvbqazo
```

#### Parameters



| Name | Description |
|:-----|:------------|
| account_id *required* | Account id |
| id *required* | The id of the user whose teams to be retrieved |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# Users



## Search all users with query


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/366/users/search?q=Ivelisse+O%27Keefe" -X GET \
	-H "Host: api.timelyapp.test" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer OZ1ofsmQx_GhhJ67RZJ904pDZJRU5uYWqWy6aZUDwp4" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/users/search`

```plaintext
GET /1.1/366/users/search?q=Ivelisse+O%27Keefe
Accept: application/json
Content-Type: application/json
Authorization: Bearer OZ1ofsmQx_GhhJ67RZJ904pDZJRU5uYWqWy6aZUDwp4
```

#### Parameters

```json
q: Ivelisse O&#39;Keefe
```


| Name | Description |
|:-----|:------------|
| page  | Page number (Default 1) |
| per_page  | Records per page (Default 50) |
| q *required* | Search query (min 2 characters) |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


# V1::SuggestionsScore



## reset suggestions


### Request

```shell
curl "https://api.timelyapp.com/1.1/349/suggestions/reset" -d '' -X DELETE \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer OU2EK5SR9aXr964T8v0cCoKTd5uNclemy1tzwgs242s" \
	-H "Cookie: "
```

#### Endpoint

`DELETE /1.1/:account_id/suggestions/reset`

```plaintext
DELETE /1.1/349/suggestions/reset
Accept: application/json
Content-Type: application/json
Authorization: Bearer OU2EK5SR9aXr964T8v0cCoKTd5uNclemy1tzwgs242s
```

#### Parameters



None known.

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


## show suggestion scores


### Request

```shell
curl -g "https://api.timelyapp.com/1.1/350/suggestions/score" -X GET \
	-H "Host: api.timelyapp.com" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer IEeb1ZfZkOSRDo5Vz29n4uvlaDrDCSuR1Kx6hVV0iow" \
	-H "Cookie: "
```

#### Endpoint

`GET /1.1/:account_id/suggestions/score`

```plaintext
GET /1.1/350/suggestions/score
Accept: application/json
Content-Type: application/json
Authorization: Bearer IEeb1ZfZkOSRDo5Vz29n4uvlaDrDCSuR1Kx6hVV0iow
```

#### Parameters



| Name | Description |
|:-----|:------------|
| start_date  | Start date to retrieve score (Default current date), The score will be calculated from start_date - 5.days |

### Response


```plaintext
Content-Type: application/json; charset=utf-8
200 OK
```

```json
[binary data]
```


