# Citation Tracker

## Add Report

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "status": "added",
        "report-id": 682
    }
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/ct/add`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id | You can specify location ID or unique reference to create report for a location
report-name | <span class="label label-required">Required</span>	
business-name | <span class="label label-required">Required</span>	
business-location | <span class="label label-required">Required</span> Town or city name in which business is located.
old-business-name-1	|
old-business-name-2	|
postcode |	
old-postcode-1 |	
old-postcode-2 |	
country | One of USA, GBR, CAN, AUS. Defaults to USA.
phone | <span class="label label-required">Required</span>	
website | <span class="label label-required">Required</span> Link to the website of your business.
business-type | <span class="label label-required">Required</span>	
state-code | <span class="label label-required">Required</span> (USA only). 2-letter state code (USA only).
monthly-run | One of 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31. Defaults to 0 (none).
weekly-run | One of 1, 2, 3, 4, 5, 6, 7. Defaults to 0 (none).
white-label-profile-id |	
active-only | Flag to fetch only active citations. One of Yes, No. Defaults to No. This cannot be changed once the report has been added.
is-public | Publish reports on a white label URL. Yes or No.

## Update Report

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "status": "edited"
    }
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/ct/update`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id | You can specify location ID or unique reference to create report for a location.
report-id | <span class="label label-required">Required</span>	
report-name |	
business-name |	
business-location | Town or city name in which business is located.
old-business-name-1	|
old-business-name-2	|
postcode |	
old-postcode-1 |	
old-postcode-2 |	
country	| One of USA, GBR, CAN, AUS. Defaults to USA.
phone |	
website	| Link to the website of your business.
business-type |	
location |	
state-code | 2-letter state code (USA only).
monthly-run | One of 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31. Defaults to 0 (none).
weekly-run | One of 1, 2, 3, 4, 5, 6, 7. Defaults to 0 (none).
white-label-profile-id |	
active-only | Flag to fetch only active citations. One of Yes, No. Defaults to No.
is-public | Publish reports on a white label URL. Yes or No.

## Get Report

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "success": true,
    "report": {
        "report_id": "255565",
        "customer_id": "88",
        "location_id": "1",
        "weekly_run": "3",
        "monthly_run": "0",
        "report_name": "The View",
        "website_address": "www.ullubatanc.com",
        "business_name": "Ullu Bata Inc.",
        "business_location": "London",
        "postcode": "ABCD1234",
        "country": "GBR",
        "state_code": null,
        "address1": "",
        "address2": "",
        "telephone": "01273 207 100",
        "business_type": "Restaurant",
        "primary_location": "Brighton",
        "last_run_id": "1185703",
        "old_business_name_1": "View Hove",
        "old_postcode_1": "01273 207 037",
        "old_business_name_2": "Babylon Lounge",
        "old_postcode_2": "BN3 4FA",
        "last_run": "2015-10-28 05:31:59",
        "company_name": "Ullu Bata Inc.",
        "white_label_profile_id": "7819",
        "notify": "0",
        "email_addresses": "[\"example@brightlocal.com\"]",
        "active_only": "",
        "is_public": "Yes",
        "public_key": "<REPLACED>",
        "created": "2015-10-28 05:00:34",
        "status": "complete",
        "urls": {
            "interactive_url": "https:\/\/tools.brightlocal.com\/seo-tools\/admin\/ct\/reports\/view\/255565",
            "pdf_url": "https:\/\/tools.brightlocal.com\/seo-tools\/admin\/ct\/reports\/pdf\/255565",
            "csv_url": "https:\/\/tools.brightlocal.com\/seo-tools\/admin\/ct\/reports\/csv\/255565",
            "public_interactive_url": "<REPLACED>",
            "public_pdf_url": "<REPLACED>",
            "public_csv_url": "<REPLACED>"
        }
    }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/ct/get`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report-id | <span class="label label-required">Required</span>

## Run Report

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "status": "running"
    }
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/ct/run`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report-id | <span class="label label-required">Required</span>

## Delete Report

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "status": "deleted"
    }
}
```

Warning: This action cannot be undone.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/ct/delete`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report-id | <span class="label label-required">Required</span>

## Get All Reports

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "results":  [
            {
                "report_id": "278",
                "customer_id": "35",
                "location_id": "5",
                "report_run_id": "2457",
                "report_name": "Test 1",
                "website_address": "http://www.test1.com",
                "business_name": "Test 1",
                "business_location": "Test location",
                "postcode": "TEST TEST",
                "country": "GBR",
                "state_code": null,
                "cancel_run": "0",
                "address1": "",
                "address2": "",
                "telephone": "0123456789",
                "business_type": "Pub",
                "primary_location": "Fulham",
                "old_business_name_1": "",
                "old_postcode_1": "",
                "old_business_name_2": "",
                "old_postcode_2": "",
                "currently_running": "No",
                "generation_error": "No",
                "terminal_fail": "No",
                "last_run": "2012-09-07 11:45:56",
                "report_status": null,
                "your_ct_count": "197",
                "your_ct_count_up": "0",
                "your_ct_count_down": "0",
                "total_ct_sources": "230",
                "total_ct_sources_up": "0",
                "competitor_ct_count": "76",
                "competitor_ct_count_diff": null,
                "old_ct_count": "0",
                "company_name": null,
                "branding_profile_id": null,
                "notify": "0",
                "email_addresses": "['test@test1.com']",
                "your_ct_count_diff": 0,
                "competitor_ct_count_up": 0,
                "competitor_ct_count_down": 0,
                "total_ct_sources_diff": 0,
                "successful_runs": "1"
            },
            {
                "report_id": "660",
                "customer_id": "35",
                "location_id": "0",
                "report_run_id": "2756",
                "report_name": "Test 2",
                "website_address": "",
                "business_name": "Test 2",
                "postcode": "chicago",
                "country": "USA",
                "state_code": "IL",
                "cancel_run": "0",
                "address1": "",
                "address2": "",
                "telephone": "0123456789",
                "business_type": "car hire",
                "primary_location": "chicago",
                "old_business_name_1": "",
                "old_postcode_1": "",
                "old_business_name_2": "",
                "old_postcode_2": "",
                "currently_running": "No",
                "generation_error": "No",
                "terminal_fail": "No",
                "last_run": "2013-05-21 11:18:31",
                "report_status": null,
                "your_ct_count": "633",
                "your_ct_count_up": "129",
                "your_ct_count_down": "0",
                "total_ct_sources": "356",
                "total_ct_sources_up": "100",
                "competitor_ct_count": "90",
                "competitor_ct_count_diff": "10",
                "old_ct_count": "0",
                "company_name": null,
                "branding_profile_id": null,
                "notify": "0",
                "email_addresses": "['test@test2.com']",
                "your_ct_count_diff": 0,
                "competitor_ct_count_up": 0,
                "competitor_ct_count_down": 0,
                "total_ct_sources_diff": 0,
                "successful_runs": "2"
            }
        ]
    }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/ct/get-all`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id |

## Get Report Results

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "results":  {
            "active":  [
                {
                    "id": "",
                    "citation_id": 182555,
                    "customer_id": "35",
                    "report_id": "2457",
                    "citation-status": "active",
                    "source": "carricktoday.co.uk",
                    "url": "http://www.carricktoday.co.uk/findit?action=showMap&placeid=68739",
                    "citation-notes": null,
                    "status": "Got it",
                    "date-identified-sorting": "2012-09-07T00:00:00+00:00",
                    "date-identified": "07 Sep 12",
                    "domain-authority": "38.75",
                    "citation-value": "Unknown",
                    "moz-rank": "Unknown",
                    "site-type": "Local Directory",
                    "listing-type": "Free Listing",
                    "seomoz-lookup-complete": "Yes",
                    "business-name": null,
                    "postcode": null
                }
            ],
            "pending":  [

            ],
            "possible": [

            ],
            "old":  [

            ],
            "activeDomains":  {
                "facebook.com": true,
                "twitter.com": true,
                "yelp.com": true,
                "yell.com": true,
                "thomsonlocal.com": true,
                "beerintheevening.com": true,
                "hotfrog.co.uk": true,
                "cylex-uk.co.uk": true
            },
            "pendingDomains": {

            },
            "possibleDomains": {

            },
            "oldDomains": {

            },
            "flags": {
                "customer":  {
                    "new":  [],
                    "disappeared":  []
                },
                "competitor":  {
                    "new":  [],
                    "disappeared":  []
                }
            },
            "competitors": {

            }
        }
    }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/ct/get-results`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report-id | <span class="label label-required">Required</span>
