# Google+ Local Wizard Reports

## Add Report

<span class="label label-info">Account Method</span>

> Success (201 Created)

```json
{
    "success": true,
    "report-id": "1"
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "run": "You don\'t have any credits left",
    "business_names": "Please enter one business name",
    "report_type": "Report type is not available",
    "phone_number": "Please enter a telephone number",
    "postcode": "Please enter a postcode",
    "address1": "Please enter an address",
    "city": "Please enter a city",
    "search_terms": "Please enter at least one search term",
    "country": "Please choose country from the list",
    "report_name": "Please enter a report name",
    "google_location": "The location was not recognized. Please enter a correct location",
    "schedule": "Please select schedule",
    "white_label_profile_id": "Such White Label Profile doesn't exists"
  }
}
```

Adds a new Google+ Local Wizard report to your account.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/gpw/add`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report_name | <span class="label label-required">Required</span>
client_id | Associate this report with a client in your account. This ID needs to correspond to a valid client in your account.
white_label_profile_id | Assign a white label profile to this report. The ID needs to correspond to a valid white label profile in your account.
business_names | <span class="label label-required">Required</span> Supply one business name. For example, Greens Restaurant.
schedule | <span class="label label-required">Required</span> One of Adhoc or Monthly
day_of_month | <span class="label label-required">Required</span> One of 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, -1 (last day of month).
report_type | <span class="label label-required">Required</span> One of with or without. 'with' - the business has a Google+ profile. 'without' - Ignore this business, just display competitor information. Defaults to with.
address1 | <span class="label label-required">Required</span> Optional for report_type=without
address2 |
profile_url |
city | <span class="label label-required">Required</span> Optional for report_type=without
state_code | <span class="label label-required">Required</span> (USA, CAN:EN and AUS)
postcode | <span class="label label-required">Required</span> A valid postcode or ZIP. Optional for report_type=without
phone_number | <span class="label label-required">Required</span> Optional for report_type=without
country | <span class="label label-required">Required</span> One of USA, CAN:EN, GBR or AUS.
search_terms | <span class="label label-required">Required</span> Supply one or more search terms (max 5) as a JSON string. For example, ["restaurant san francisco","cafe san francisco"].
notify | One of Yes or No. If set to yes we will send report alerts to all email addresses specified (see field below). If you include customer email addresses when setting up your report we'll also email them the alerts so please be sure this is what you want before adding their addresses. Default is No.
email_addresses | Supply one or more (max 5) email addresses for us to send report alerts to. This only takes effect if notify is set to Yes. JSON string. For example, ["email1@test.com","email2@test.com"].
google_location | A valid google search location. Please refer to our location check method.
is_public | Determines whether or not to make the report available on a public URL you can give to your customers. One of Yes or No. Defaults to No.
run | One of Yes or No. Runs the report after adding. Defaults to Yes.

## Update Report

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
    "INVALID_REPORT_ID": "Report ID invalid"
  }
}
```


### HTTP Request

`PUT https://tools.brightlocal.com/seo-tools/api/v4/gpw/[reportId]`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report_name |
client_id | Associate this report with a client in your account. This ID needs to correspond to a valid client in your account.
white_label_profile_id | Assign a white label profile to this report. The ID needs to correspond to a valid white label profile in your account.
business_names |  Supply one business name. For example, Greens Restaurant.
schedule |  One of Adhoc or Monthly
day_of_month |  One of 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, -1 (last day of month).
report_type | One of with or without. 'with' - the business has a Google+ profile. 'without' - Ignore this business, just display competitor information. Defaults to with.
address1 |
address2 |
profile_url |
city |
state_code | (USA, CAN:EN and AUS)
postcode | A valid postcode or ZIP.
phone_number |
country | One of USA, CAN:EN, GBR or AUS.
search_terms | Supply one or more search terms (max 5) as a JSON string. For example, ["restaurant san francisco","cafe san francisco"].
notify | One of Yes or No. If set to yes we will send report alerts to all email addresses specified (see field below). If you include customer email addresses when setting up your report we'll also email them the alerts so please be sure this is what you want before adding their addresses. Default is No.
email_addresses | Supply one or more (max 5) email addresses for us to send report alerts to. This only takes effect if notify is set to Yes. JSON string. For example, ["email1@test.com","email2@test.com"].
google_location | A valid google search location. Please refer to our location check method.
is_public | Determines whether or not to make the report available on a public URL you can give to your customers. One of Yes or No. Defaults to No.
run | One of Yes or No. Runs the report after adding. Defaults to Yes.

## Get Report

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
  "success": true,
      "report": {
          "report_id": "1",
          "report_name": "Report name",
          "customer_id": "1",
          "client_id": "1000",
          "schedule": "Adhoc",
          "day_of_month": "0",
          "white_label_profile_id": "24",
          "report_type": "without",
          "business_names": [
              "Business name1"
          ],
          "postcode": "90210",
          "country": "USA",
          "state_code": "IL",
          "address1": "email@test.com",
          "address2": null,
          "city": "Chicago, IL",
          "telephone": null,
          "profile_url": null,
          "search_terms": [
              "search_term1",
              "search_term2",
              "search_term3"
          ],
          "google_location": "Chicago, IL",
          "notify": "No",
          "email_addresses": [
              "email@company.com"
          ],
          "last_run_id": "626",
          "is_public": "Yes",
          "public_key": "9e4356696cadcbc1c3ed87cc8103d4be5d09f04c",
          "status": "Enabled"
      }
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_REPORT_ID" : "Report ID invalid"
  }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/gpw/[reportId]`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

## Delete Report

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
    "INVALID_REPORT_ID": "Report ID invalid"
  }
}
```

### HTTP Request

`DELETE https://tools.brightlocal.com/seo-tools/api/v4/gpw/[reportId]`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

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

`GET https://tools.brightlocal.com/seo-tools/api/v4/gpw`

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
