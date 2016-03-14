# Local Search Rank Checker

## Add Report

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "status": "Report Added",
        "location-id": "9907",
        "credits": 298
    }
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/lsrc/add`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
name | <span class="label label-required">Required</span>	
schedule | Adhoc, Weekly or Monthly - defaults to Adhoc
day-of-week | Relevant to Weekly schedule only. Monday, Tuesday, Wednesday, Thursday, Friday, Saturday or Sunday. Defaults to Tuesday.
day-of-month | One of 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, -1 (last day of month). Defaults to 1
location-id |	
white-label-profile-id | (branding-profile-id is also supported but deprecated)
tags | Comma separated list of tags
search-terms | <span class="label label-required">Required</span> Newline (\n) separated list of search terms.
website-addresses	| Supply one or more website addresses (max 10) as a JSON string. For example, [“test.com”,“test2.com”].
website-address	| (supported but deprecated)
website-address-2 | (supported but deprecated)
website-address-3 | (supported but deprecated)
country	| One of USA, GBR, AUS, CAN:EN, CAN:FR. Defaults to USA.
google-location	| Specify a location to perform search from. When set search keywords do not need to include a location.
bing-location | Specify a location to perform search from. When set search keywords do not need to include a location.
business-names | Newline (\n) separated list of business names
postcode |	
telephone |	
search-engines | Comma separated list of search engines. Options are google, google-local, yahoo, yahoo-local, bing, bing-local. Defaults to all search engines.
include-local-directory-results	| Yes or No. Defaults to Yes.
notify | Yes or No. Defaults to No.
email-addresses	| Newline (\n) separated list of email addresses
is-public | Publish reports on a white label URL. Yes or No. Defaults to No.

## Update Report

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "status": "Report Updated",
        "campaign-id": 9907
    }
}
```

Change report settings such as name, search terms, country, website URL, schedule etc. Only specify the fields you want to change.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/lsrc/update`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id | <span class="label label-required">Required</span>	
name |	
schedule | Adhoc, Weekly or Monthly
day-of-week | Relevant to Weekly schedule only. Monday, Tuesday, Wednesday, Thursday, Friday, Saturday or Sunday.
day-of-month | One of 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, -1 (last day of month).
location-id |	
white-label-profile-id | (branding-profile-id is also supported but deprecated)
tags | Comma separated list of tags
search-terms | Newline (\n) separated list of search terms
website-addresses	| Supply one or more website addresses (max 10) as a JSON string. For example, [“test.com”,“test2.com”].
website-address	| (supported but deprecated)
website-address-2 | (supported but deprecated)
website-address-3 | (supported but deprecated)
country	| One of USA, GBR, AUS, CAN:EN, CAN:FR.
google-location	| Specify a location to perform search from. When set search keywords do not need to include a location.
bing-location | Specify a location to perform search from. When set search keywords do not need to include a location.
business-names | Newline (\n) separated list of business names
postcode |	
telephone |	
search-engines | Comma separated list of search engines. Options are google, google-local, yahoo, yahoo-local, bing, bing-local.
include-local-directory-results	| Yes or No
notify | Yes or No
email-addresses | Newline (\n) separated list of email addresses
is-public | Publish reports on a white label URL. Yes or No.

## Delete Report

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "status": "Report Deleted"
    }
}
```

Deletes a report and all history and ranking data associated with that report. Warning: This action cannot be undone.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/lsrc/delete`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id | <span class="label label-required">Required</span>

## Get All Reports

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "results":  [
            {
                "campaign_id": "49",
                "name": "Test 1",
                "schedule": "Weekly",
                "day_of_week": "Thursday",
                "day_of_month": "0"
            },
            {
                "campaign_id": "50",
                "name": "Test 2",
                "schedule": "Weekly",
                "day_of_week": "Wednesday",
                "day_of_month": null
            },
            {
                "campaign_id": "52",
                "name": "Test 3",
                "schedule": "Weekly",
                "day_of_week": "Wednesday",
                "day_of_month": null
            }
        ]    
    }
}
```

Returns basic details about all reports associated with your account.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/lsrc/get-all`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id |

## Get Report

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "result":  {
            "campaign_id": "50",
            "customer_id": "35",
            "white_label_profile_id": "19",
            "location-id": "19",
            "name": "Test Pub",
            "schedule": "Weekly",
            "day_of_week": "Wednesday",
            "day_of_month": null,
            "search_terms":  [
                "pub fulham",
                "pub in fulham",
                "london pub",
                "pub putney",
                "beer garden in fulham",
                "gastro pub fulham",
                "pubs in fulham",
                "fulham pubs",
                "nice pub fulham",
                "good pub fulham",
                "nice pubs fulham",
                "good pubs fulham",
                "best pubs fulham",
                "excellent pubs fulham",
                "lovely fulham pub",
                "lovely fulham pubs",
                "fulham lovely pubs",
                "close pub fulham",
                "fulham with pubs",
                "pubs around fulham",
                "pubs fulham broadway",
                "pub fulham broadway"
            ],
            "ppc_search_terms": null,
            "lookup_ppc": "No",
            "website-addresses": [
                "http://www.testpub.com/"
            ],
            "website_address": "http://www.testpub.com/",
            "website_address_2": null,
            "website_address_3": null,
            "country": "GBR",
            "google_location": "",
            "bing_location": null,
            "business_names":  [
                "Test Pub"
            ],
            "postcode": "TEST TEST",
            "telephone": "0123456789",
            "search_engines":  [
                "google",
                "google-local",
                "yahoo",
                "yahoo-local",
                "bing",
                "bing-local"
            ],
            "include_local_directory_results": "Yes",
            "notify": "Yes",
            "email_addresses": "test@testpub.com",
            "created": "2011-04-15",
            "last_processed": "2013-07-18",
            "last_message": "",
            "currently_running": "No",
            "status": "Enabled",
            "red_flag": "No",
            "is_public": "No",
            "public_key": null,
            "tags":  [
                "fulham",
                "london",
                "pub"
            ]
        }
    }
}
```

Returns information about the specified report such as its name, search terms, country, website URL, schedule etc. You can also use this method to find out if a report is currently running (currently_running = Yes) or if the latest run failed (red_flag = Yes).

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/lsrc/get`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id | <span class="label label-required">Required</span>	

## Run Report

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "status": "Report Run",
        "campaign-id": 50,
        "credits": 298
    }
}
```

Runs the specified report if your account has sufficient monthly adhoc run credits.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/lsrc/run`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id | <span class="label label-required">Required</span>

## Get Report History

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "results":  [
            {
                "campaign_history_id": "25554",
                "campaign_id": "50",
                "history_type": "Scheduled",
                "generation_date": "2013-07-18 13:42:32"
            },
            {
                "campaign_history_id": "25499",
                "campaign_id": "50",
                "history_type": "Scheduled",
                "generation_date": "2013-07-18 11:29:50"
            },
            {
                "campaign_history_id": "25439",
                "campaign_id": "50",
                "history_type": "Scheduled",
                "generation_date": "2013-07-18 11:17:48"
            }
        ]
    }
}
```

Returns the campaign history IDs associated with all report runs for the specified report (adhoc or scheduled). These IDs can be passed to the "Get Report Results" method to return report URLs and actual ranking data.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/lsrc/history/get`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id | <span class="label label-required">Required</span>

## Get Report Results

<span class="label label-info">Account Method</span>

If no campaign history ID or previous campaign history ID are passed then the latest results for the specified report are returned.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/lsrc/results/get`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id | <span class="label label-required">Required</span>	
campaign-history-id | If both campaign-history-id and previous-campaign-history-id are not specified then the latest report is returned.
previous-campaign-history-id | If both campaign-history-id and previous-campaign-history-id are not specified then the latest report is returned.

<aside class="notice">
    This call returns extensive result information that is too detailed to show in this API documentation.
</aside>
