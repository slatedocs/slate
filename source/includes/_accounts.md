# Accounts API

An Account is a company your team has explicitly added to your database. It can be from prospected from Apollo, manually added by your team, or created by the API.

## Create an account

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "name": "Google",
    "domain": "google.com",
    "phone_number": "1-866-246-6453",
    "raw_address": "1600 Amphitheatre Parkway"
}' "https://api.apollo.io/v1/accounts"
```

```python
import requests

url = "https://api.apollo.io/v1/accounts"

data = {
  "api_key": "YOUR API KEY HERE",
    "name": "Google",
    "domain": "google.com",
    "phone_number": "1-866-246-6453",
    "raw_address": "1600 Amphitheatre Parkway"
}

headers = {
    'Cache-Control': 'no-cache',
    'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, json=data)

print(response.text)
```

> Sample response:

```json
{
  "account": {
    "id": "5fe0XXXXXXXXXXXXXXXXXXXX",
    "domain": "google.com",
    "name": "Google",
    "team_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
    "typed_custom_fields": {},
    "organization_id": null,
    "account_stage_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
    "source": "api",
    "original_source": "api",
    "owner_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
    "created_at": "2020-12-21T15:33:02.709Z",
    "phone": null,
    "phone_status": "no_status",
    "test_predictive_score": null,
    "hubspot_id": null,
    "salesforce_id": null,
    "crm_owner_id": null,
    "parent_account_id": null,
    "account_playbook_statuses": [],
    "existence_level": "full",
    "label_ids": [],
    "modality": "account",
    "persona_counts": {}
  },
  "team": {
    "id": "5fc6XXXXXXXXXXXXXXXXXXX",
    "accounts_finder_empty": false
  }
}
```

`POST https://api.apollo.io/v1/accounts`

| Parameter    | Description                                                                                                                    |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------ |
| name         | The account's name                                                                                                             |
| domain       | The domain of the account you are adding                                                                                       |
| phone_number | The corporate phone for this account.                                                                                          |
| raw_address  | The address string for this account, Apollo will intelligently infer the city, state, country, and time zone from your address |

## Update an account

> Sample request:

```shell
curl -X PUT -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "name": "new name ",

}' "https://api.apollo.io/v1/accounts/ACOUNT_ID"
```

```python
import requests

url = "https://api.apollo.io/v1/accounts/ACOUNT_ID"

data = {
  "api_key": "YOUR API KEY HERE",
    "name": "new name ",
}

headers = {
    'Cache-Control': 'no-cache',
    'Content-Type': 'application/json'
}

response = requests.request("PUT", url, headers=headers, json=data)

print(response.text)
```

> Sample response:

```json
{
  "account": {
    "id": "5fe0XXXXXXXXXXXXXXXXXXXX",
    "domain": "google.com",
    "name": "new name",
    "team_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
    "typed_custom_fields": {},
    "organization_id": null,
    "account_stage_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
    "source": "api",
    "original_source": "api",
    "owner_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
    "created_at": "2020-12-21T15:55:01.956Z",
    "phone": null,
    "phone_status": "no_status",
    "test_predictive_score": null,
    "hubspot_id": null,
    "salesforce_id": null,
    "crm_owner_id": null,
    "parent_account_id": null,
    "account_playbook_statuses": [],
    "existence_level": "full",
    "label_ids": [],
    "modality": "account",
    "persona_counts": {}
  },
  "labels": []
}
```

`PUT https://api.apollo.io/v1/accounts`

| Parameter     | Description                                |
| ------------- | ------------------------------------------ |
| id (Required) | Account ID                                 |
| name          | The account's name                         |
| domain        | The domain of the account you are updating |
| phone_number  | The corporate phone for this account.      |

## Search for accounts

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "q_organization_name": "Google",
    "sort_by_field": "account_last_activity_date",
    "sort_ascending": false
}' "https://api.apollo.io/v1/accounts/search"
```

```python
import requests

url = "https://api.apollo.io/v1/accounts/search"

data = {
  "api_key": "YOUR API KEY HERE",
    "q_organization_name": "Google",
    "sort_by_field": "account_last_activity_date",
    "sort_ascending": False
}

headers = {
    'Cache-Control': 'no-cache',
    'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, json=data)

print(response.text)
```

> Sample response:

```json
{
  "breadcrumbs": [
    {
      "label": "Company Name",
      "signal_field_name": "q_organization_name",
      "value": "Google",
      "display_name": "Google"
    }
  ],
  "partial_results_only": false,
  "disable_eu_prospecting": false,
  "partial_results_limit": 10000,
  "pagination": {
    "page": 1,
    "per_page": 25,
    "total_entries": 2,
    "total_pages": 1
  },
  "accounts": [
    {
      "id": "5c3d15XXXXXXXXXXXXXXXXXX",
      "name": "Google",
      "website_url": "http://www.google.com",
      "blog_url": null,
      "angellist_url": "http://angel.co/google",
      "linkedin_url": "http://www.linkedin.com/company/google",
      "twitter_url": "http://twitter.com/google",
      "facebook_url": "https://www.facebook.com/Google",
      "languages": [
        "English",
        "German",
        "Spanish",
        "French",
        "Italian",
        "Portuguese",
        "Chinese",
        "Japanese",
        "Russian",
        "English"
      ],
      "alexa_ranking": 1,
      "phone": "(512) 225-6000",
      "linkedin_uid": "1441",
      "publicly_traded_symbol": "GOOG",
      "publicly_traded_exchange": "nasdaq",
      "logo_url": "https://zen-server.com/uploads/pictures/5f2d7fXXXXXXXXXXXXXXXXXX/picture",
      "crunchbase_url": "https://www.crunchbase.com/organization/google",
      "primary_domain": "google.com",
      "starred_by_user_ids": [],
      "persona_counts": {},
      "market_cap": "835.5B",
      "organization_raw_address": "1600 Amphitheatre Parkway, Mountain View, CA",
      "organization_city": "Mountain View",
      "organization_street_address": "1600 Amphitheatre Parkway",
      "organization_state": "California",
      "organization_country": "United States",
      "organization_postal_code": "94043",
      "suggest_location_enrichment": false,
      "domain": "google.com",
      "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
      "typed_custom_fields": {},
      "organization_id": "54fca10XXXXXXXXXXXXXXXXXX",
      "account_stage_id": "5c1004XXXXXXXXXXXXXXXXXX",
      "source": "csv_import",
      "original_source": "csv_import",
      "owner_id": "5c1004XXXXXXXXXXXXXXXXXX",
      "created_at": "2019-01-14T23:05:07.335Z",
      "phone_status": "no_status",
      "test_predictive_score": null,
      "hubspot_id": null,
      "salesforce_id": "0011UXXXXXXXXXXXXXX",
      "salesforce_owner_id": "0051UXXXXXXXXXXXXXX",
      "parent_account_id": null,
      "sanitized_phone": "+15122256000",
      "account_playbook_statuses": [],
      "existence_level": "full",
      "label_ids": [],
      "modality": "account",
      "salesforce_record_url": "https://na85.salesforce.com/0011UXXXXXXXXXXXX",
      "contact_emailer_campaign_ids": [],
      "contact_campaign_status_tally": {},
      "num_contacts": 12,
      "last_activity_date": null
    }
  ],
  "num_fetch_result": null
}
```

`POST https://api.apollo.io/v1/accounts/search`

| Parameter           | Description                                                                                                     |
| ------------------- | --------------------------------------------------------------------------------------------------------------- |
| q_organization_name | The account's name                                                                                              |
| account_stage_ids   | An array of stage ids the account must belong to. Refer to /account_stages to get a list of possible stage ids. |
| sort_by_field       | Possible values: "account_last_activity_date" or "account_created_at"                                           |
| sort_ascending      | Possible values: true or false                                                                                  |
| page                | which page to return. Defaults to 1                                                                             |

## Get a list of account stages

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" "https://api.apollo.io/v1/account_stages?api_key=YOUR_API_KEY_HERE"
```

```python
import requests

url = "https://api.apollo.io/v1/account_stages"

querystring = {
  "api_key": "YOUR API KEY HERE"
}

headers = {
    'Cache-Control': 'no-cache',
    'Content-Type': 'application/json'
}

response = requests.request("GET", url, headers=headers, params=querystring)

print(response.text)
```

> Sample response:

```json
{
  "account_stages": [
    {
      "id": "5c1004XXXXXXXXXXXXXXXXXX",
      "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
      "display_name": "Cold",
      "name": "Cold",
      "display_order": 0,
      "default_exclude_for_leadgen": false,
      "category": "in_progress"
    },
    {
      "id": "5c1004XXXXXXXXXXXXXXXXXX",
      "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
      "display_name": "Current Client",
      "name": "Current Client",
      "display_order": 1,
      "default_exclude_for_leadgen": true,
      "category": "succeeded"
    },
    {
      "id": "5c1004a04XXXXXXXXXXXXXX",
      "team_id": "5c1004aXXXXXXXXXXXXXXXX",
      "display_name": "Active Opportunity",
      "name": "Active Opportunity",
      "display_order": 2,
      "default_exclude_for_leadgen": true,
      "category": "succeeded"
    },
    {
      "id": "5c1004XXXXXXXXXXXXXXXXXX",
      "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
      "display_name": "Dead Opportunity",
      "name": "Dead Opportunity",
      "display_order": 3,
      "default_exclude_for_leadgen": false,
      "category": "failed"
    },
    {
      "id": "5c1004XXXXXXXXXXXXXXXXXX",
      "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
      "display_name": "Do Not Prospect",
      "name": "Do Not Prospect",
      "display_order": 4,
      "default_exclude_for_leadgen": true,
      "category": "failed"
    }
  ]
}
```

`GET https://api.apollo.io/v1/account_stages`

## Update account stage

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "account_ids": ["account_id1", "account_id2"],
    "account_stage_id": "stage_id"
}' "https://api.apollo.io/v1/accounts/bulk_update"
```

```python
import requests

url = "https://api.apollo.io/v1/accounts/bulk_update"

data = {
  "api_key": "YOUR API KEY HERE",
    "account_ids": ["account_id1", "account_id2"],
    "account_stage_id": "stage_id"
}

headers = {
    'Cache-Control': 'no-cache',
    'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, json=data)

print(response.text)
```

> Sample response:

```json
{
  "accounts": [
    {
      "id": "5c3d15XXXXXXXXXXXXXXXXXX",
      "account_stage_id": "new_account_stage_id"
    }
  ]
}
```

`POST https://api.apollo.io/v1/accounts/bulk_update`

### Query parameters

| Parameter        | Description                                                                                                                       |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| account_ids      | An array of account ids. You can filter for a list of account IDS with the accounts/search API.                                   |
| account_stage_id | The account stage id to change into. You can GET a list of possible stage ids and its associated information from /account_stages |

## Update account ownership

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "account_ids": ["account_id1", "account_id2"],
    "owner_id": "owner_id"
}' "https://api.apollo.io/v1/accounts/update_owners"
```

```python
import requests

url = "https://api.apollo.io/v1/accounts/update_owners"

data = {
  "api_key": "YOUR API KEY HERE",
    "account_ids": ["account_id1", "account_id2"],
    "owner_id": "owner_id"
}

headers = {
    'Cache-Control': 'no-cache',
    'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, json=data)

print(response.text)
```

> Sample response:

```json
{
  "accounts": [
    {
      "id": "5c3d15XXXXXXXXXXXXXXXXXX",
      "owner_id": "new_owner_id"
    }
  ]
}
```

`POST https://api.apollo.io/v1/accounts/update_owners`

### Query parameters

| Parameter   | Description                                                                                                  |
| ----------- | ------------------------------------------------------------------------------------------------------------ |
| account_ids | An array of account ids. You can filter for a list of account IDS with the accounts/search API.              |
| owner_id    | The owner id to change into. You can GET a list of possible users and its associated information from /users |
