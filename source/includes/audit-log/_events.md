# Events
## The events object
The events object is the audit log’s collected record of important events in Greenhouse Recruiting from the previous thirty days. A single event may return multiple results. For instance, an event and its resulting changes will return individual results that can be linked by `request.id`.
### Attributes
Attribute | Definition
--------- | -----------
organization_id | Your organization’s unique Greenhouse Recruiting ID
event_time | The exact time of the event, represented in `ISO-8601` format like `2024-02-03T16:38:46.985Z`
request.id | The ID of the request
request.type | The name of the action taken in Greenhouse Recruiting, or the request URL if from Harvest API
performer.id | The Greenhouse Recruiting user ID of the person who performed the change or the API key if performed via [Greenhouse API](http://developers.greenhouse.io)
performer.type | One of the following values: `user`, `api_key`, or `greenhouse_internal`
performer.meta | The Greenhouse Recruiting email address of the person who performed the change or the exact type of API key that performed the change
performer.ip_address | The IP address of the person or integration that performed the change
event.type | One of the following values: `data_change_update`, `data_change_create`, `data_change_destroy`, `harvest_access`, or `action`
event.target_id | The ID of the element that was edited or accessed; this may be blank if the action does not target one particular ID
event.target_type | The resource name for data changes, Harvest access, or the event action type for other actions
event.meta | The before and after values from data change events, or other relevant data for the event such as the title of a report
### GET: Retrieve events
```shell
HTTP request

curl -X GET 'https://auditlog.greenhouse.io/events'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Bearer MeyJhbGci.eyJhdWQiO"

{
    "paging": {
        "pit_id": "cmFuZG9tX3ZhbHVl",
        "search_after": null,
        "size": "100",
        "next_search_after": "1685989175"
    },
    "hits": 2,
    "results": [
        {
            "request": {
                "id": "1234zID",
                "type": "email_settings#create_organization_email"
            },
            "performer": {
                "meta": {
                    "name": "Allison Jamie",
                    "username": "allison.j@omniva-corp.com"
                },
                "id": 12345,
                "ip_address": "192.168.0.1",
                "type": "user"
            },
            "organization_id": 123,
            "event": {
                "meta": null,
                "target_type": "Global Email Added",
                "type": "action"
            },
            "event_time": "2023-06-02T16:06:19.217Z"
        },
        {
            "request": {
                "id": "1234zID",
                "type": "email_settings#create_organization_email"
            },
            "performer": {
                "meta": {
                    "name": "Allison Jamie",
                    "username": "allison.j@omniva-corp.com"
                },
                "id": 12345,
                "ip_address": "192.168.0.1",
                "type": "user"
            },
            "organization_id": 123,
            "event": {
                "meta": {
                    "id": [
                        null,
                        1234
                    ],
                    "value": [
                        null,
                        "johnny.c@omniva-corp.com"
                    ]
                },
                "target_type": "OrganizationEmail",
                "target_id": 1234,
                "type": "data_change_create"
            },
            "event_time": "2023-06-02T16:06:19.137Z"
        }
    ]
}
```
#### HTTP request

`GET https://auditlog.greenhouse.io/events/`
#### URL Parameters
Parameter | Definition
--------- | -----------
before_time (optional) | Use this parameter to retrieve audit log before a certain point in time, represented in `ISO-8601` format like `2024-02-03T16:38:46.985Z`. This parameter can be combined with after_time for a date range.
after_time (optional) | Use this parameter to retrieve audit log after a certain point in time, represented in `ISO-8601` format like `2024-02-03T16:38:46.985Z`. This parameter can be combined with before_time for a date range.
date (optional) | Use this parameter to retrieve audit log from a specific date, represented in `ISO-8601` format like `2024-02-03`.
magic_time (optional) | Use the magic time parameter to retrieve audit log details from a trailing range in time. This parameter takes a value in `last_{#x}` where `#` is a number and `X` is `seconds`, `minutes`, `hours`, `days`, or `weeks`, like `last_7days` or `last_15minutes`.
