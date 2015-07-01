# Google+ Local Wizard Reports 

## Get All Reports

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "results":  [
            {
                "report_id": "49",
                "report_name": "Test 1",
                "schedule": "Weekly",
                "is_running": "Yes",
                "running_message": "Identifying your top Google+ Local competitors"
            },
            {
                "report_id": "50",
                "report_name": "Test 2",
                "schedule": "Monthly",
                "is_running": "No",
                "running_message": ""
            }
        ]
    }
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_CLIENT_ID": "Invalid client ID supplied"
  }
}
```

Returns basic details about all reports associated with your account.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/gpw/all`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
client-id |


## Run Report

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "success": true
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_REPORT_ID" : "Report ID missing",
    "NO_CREDITS" : "You don't have any credits left"
  }
}
```

> Failure when report already running (400 Bad Request)

```json
{
    "success": false,
    "errors":  {
      "REPORT_RUNNING": "Report is already running"
    }
}
```

### HTTP Request

`PUT https://tools.brightlocal.com/seo-tools/api/v4/gpw/run`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report-id | <span class="label label-required">Required</span> The unique ID for the report in your account.