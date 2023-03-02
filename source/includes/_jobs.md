# Print Jobs

## Get Print Jobs

```shell
curl https://api.simplyprint.io/{id}/jobs/GetPaginatedPrintJobs \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
  "page": 1,
  "page_size": 10,
  "printer_ids": [385],
  "status": ["cancelled", "finished"],
  "start_date": "2023-02-28"
}
```

> Success response

```json
{
  "status": true,
  "message": null,
  "data": [
    {
        "id": 549145,
        "uid": "7df103aa-b12c-4b33-8305-b55f91c11a4d",
        "status": "cancelled",
        "cancelReasonType": "5",
        "rating": -2,
        "filename": "Benchy.gcode",
        "startDate": "2023-02-28T21:05:50+00:00",
        "endDate": "2023-02-28T21:06:07+00:00",
        "user": 5933,
        "printer": 385,
        "filament": "{\"e0\": {\"usage\": 60}}",
        "filUsage": 60,
        "filUsageGram": 0,
        "currentPercentage": 48,
        "printTime": 17
    },
    ...
  ],
  "page_amount": 1
}
```

Get paginated data about ongoing or finished print jobs.

### Request

`POST /{id}/jobs/GetPaginatedPrintJobs`

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page` | integer | yes | The page number to get. |
| `page_size` | integer | yes | The number of items per page. (Between 1 and 100) |
| `printer_types[]` | integer[] | no | Array of printer type ids to filter on. |
| `printer_ids[]` | integer[] | no | Array of printer ids to filter on. |
| `user_ids[]` | integer[] | no | Array of user ids to filter on. |
| `accepted_statuses[]` | string[] | no | Array of job statuses to filter on. One of `ongoing`, `cancelled`, `failed`, `done`. |
| `start_date` | string | no | The start date to filter on. In unix timestamp format. Can be set without `end_date`. |
| `end_date` | string | no | The end date to filter on. In unix timestamp format. Can be set without `start_date`. |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `data` | array | The jobs. |
| `data[].id` | integer | The job id. |
| `data[].uid` | string | The job uid. |
| `data[].status` | string | The job status. One of `ongoing`, `cancelled`, `failed`, `done`. |
| `data[].cancelReasonType` | string | The job cancel reason type. |
| `data[].rating` | integer | The job rating. |
| `data[].filename` | string | The job filename. |
| `data[].startDate` | string | The job start date. |
| `data[].endDate` | string/null | The job end date. Is null if the job is ongoing. |
| `data[].user` | integer | The user id of the user who started the job. |
| `data[].printer` | integer | The printer id that was used to print the job. |
| `data[].filament` | string | The filament usage. JSON encoded string with usage per extruder. |
| `data[].filUsage` | integer | The filament usage in mm. |
| `data[].filUsageGram` | integer | The filament usage in grams. |
| `data[].currentPercentage` | integer | The current percentage of the job. |
| `page_amount` | integer | The total number of pages for the given parameters. |
