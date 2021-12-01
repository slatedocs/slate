# Opportunities API

Opportunities are records that you can use to track possible deals with your prospective customers.
Opportunities can be associated with both companies and people in Apollo.

## Create Opportunity

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "owner_id":"5c10XXXXXXXXXXXXXXXXXXXX",
    "name":"Opportunity Name",
    "amount":"200",
    "opportunity_stage_id":"5c14XXXXXXXXXXXXXXXXXXXX",
    "closed_date":"2020-12-18",
    "account_id":"5f06XXXXXXXXXXXXXXXXXXXX"
}' "https://app.apollo.io/api/v1/opportunities"
```

```python
import requests

url = "https://app.apollo.io/api/v1/opportunities"

data = {
    "api_key": "YOUR API KEY HERE",
    "owner_id":"5c10XXXXXXXXXXXXXXXXXXXX",
    "name":"Opportunity Name",
    "amount":"200",
    "opportunity_stage_id":"5c14XXXXXXXXXXXXXXXXXXXX",
    "closed_date":"2020-12-18",
    "account_id":"5f06XXXXXXXXXXXXXXXXXXXX"
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
  "opportunity": {
    "id": "5fdcXXXXXXXXXXXXXXXXXXXX",
    "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
    "owner_id": "5c10XXXXXXXXXXXXXXXXXXXX",
    "salesforce_owner_id": null,
    "amount": 200.0,
    "closed_date": "2020-12-18T00:00:00.000+00:00",
    "account_id": "5f06XXXXXXXXXXXXXXXXXXXX",
    "description": null,
    "is_closed": null,
    "is_won": null,
    "name": "Opportunity Name",
    "stage_name": null,
    "opportunity_stage_id": "5c14XXXXXXXXXXXXXXXXXXXX",
    "salesforce_id": null,
    "created_at": "2020-12-18T10:41:54.591Z",
    "existence_level": "none",
    "opportunity_contact_roles": []
  }
}
```

`POST https://api.apollo.io/v1/opportunities`

| Parameter            | Description                                                                                                                                 |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| owner_id             | Owner ID . You can GET a list of possible users and their associated information from [Misc/Users](#get-a-list-of-users)                    |
| name                 | Opportunity Name                                                                                                                            |
| amount               | The Amount of money involved in the Opportunity/ Deal                                                                                       |
| opportunity_stage_id | The ID of the current Stage .You can get a list of all opportunity stages from [Misc/Opportunity Stages](#get-a-list-of-opportunity-stages) |
| closed_date          | The date the Opportunity was closed                                                                                                         |
| account_id           | ID of the Account                                                                                                                           |

## Get all Opportunities

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" "https://api.apollo.io/v1/opportunities/search?api_key=YOUR_API_KEY_HERE"
```

```python
import requests

url = "https://api.apollo.io/v1/opportunities/search"

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
    "breadcrumbs": [],
    "opportunities": [
        {
            "id": "5c14XXXXXXXXXXXXXXXXXXXX",
            "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
            "owner_id": "5c100XXXXXXXXXXXXXXXXXXXX",
            "salesforce_owner_id": "0051U000XXXXXXXXXX",
            "amount": 90000.0,
            "closed_date": "2018-08-27T15:00:00.000+00:00",
            "account_id": "5c14XXXXXXXXXXXXXXXXXXXX",
            "description": null,
            "is_closed": true,
            "is_won": true,
            "name": "Apollo Inc",
            "stage_name": "Closed Won",
            "opportunity_stage_id": "5c10XXXXXXXXXXXXXXXXXXXX",
            "typed_custom_fields": {
                "5c10XXXXXXXXXXXXXXXXXXXX": [],
                "5c10XXXXXXXXXXXXXXXXXXXXX": [
                    "5c14XXXXXXXXXXXXXXXXXXXX"
                ]
            },
            "source": "crm",
            "salesforce_id": "0061U000XXXXXXXXXX",
            "created_at": "2018-12-14T21:36:02.191Z",
            "existence_level": "full",
            "opportunity_contact_roles": [],
            "salesforce_record_url": "https://na85.salesforce.com/0061U000XXXXXXXXXX",
            "account": {
                "id": "5c14XXXXXXXXXXXXXXXXXXXX",
                "domain": "apollo.io",
                "name": "Apollo Inc",
                "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
                "typed_custom_fields": {},
                "organization_id": null,
                "account_stage_id": "5c10XXXXXXXXXXXXXXXXXXXX",
                "source": "csv_import",
                "original_source": "salesforce",
                "owner_id": "5c10XXXXXXXXXXXXXXXXXXXX",
                "created_at": "2018-12-14T21:35:57.141Z",
                "phone": "(312) 596-1000",
                "phone_status": "no_status",
                "test_predictive_score": null,
                "hubspot_id": null,
                "salesforce_id": "0011U000XXXXXXXXXX",
                "crm_owner_id": "0051U000XXXXXXXXXX",
                "parent_account_id": null,
                "sanitized_phone": "+1312XXXXXXX",
                "account_playbook_statuses": [],
                "existence_level": "full",
                "label_ids": [],
                "modality": "account",
                "salesforce_record_url": "https://na85.salesforce.com/0011U000XXXXXXXXXX",
                "contact_emailer_campaign_ids": [],
                "contact_campaign_status_tally": {},
                "num_contacts": 0,
                "last_activity_date": null,
                "persona_counts": {}
            }
        },
        {
            "id": "5e1fXXXXXXXXXXXXXXXXXXXX",
            "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
            "owner_id": "5c10XXXXXXXXXXXXXXXXXXXX",
            "salesforce_owner_id": "0051U000XXXXXXXXXX",
            "amount": 10.0,
            "closed_date": "2020-01-31T16:00:00.000+00:00",
            "account_id": "5c14XXXXXXXXXXXXXXXXXXXX",
            "description": null,
            "is_closed": false,
            "is_won": false,
            "name": "Sample Opportunity",
            "stage_name": "Qualification",
            "opportunity_stage_id": "5c14XXXXXXXXXXXXXXXXXXXX",
            "typed_custom_fields": {},
            "source": "crm",
            "salesforce_id": "0061U000XXXXXXXXXX",
            "created_at": "2020-01-16T00:41:30.834Z",
            "existence_level": "full",
            "opportunity_contact_roles": [],
            "salesforce_record_url": "https://na85.salesforce.com/0061U000XXXXXXXXXX",
            "account": {
                "id": "5c14XXXXXXXXXXXXXXXXXXXX",
                "domain": "apollooportunity.com",
                "name": "Apollo Oportunity Limited",
                "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
                "typed_custom_fields": {},
                "organization_id": null,
                "account_stage_id": "5c100XXXXXXXXXXXXXXXXXXXX",
                "source": "salesforce",
                "original_source": "salesforce",
                "owner_id": "5c10XXXXXXXXXXXXXXXXXXXX",
                "created_at": "2018-12-14T21:35:57.141Z",
                "phone": "(512) 757-6000",
                "phone_status": "no_status",
                "test_predictive_score": null,
                "hubspot_id": null,
                "salesforce_id": "0011U000XXXXXXXXXX",
                "crm_owner_id": "0051U000XXXXXXXXXX",
                "parent_account_id": null,
                "sanitized_phone": "+1512XXXXXXX",
                "account_playbook_statuses": [],
                "existence_level": "full",
                "label_ids": [],
                "modality": "account",
                "salesforce_record_url": "https://na85.salesforce.com/0011U000XXXXXXXXXX",
                "contact_emailer_campaign_ids": [],
                "contact_campaign_status_tally": {},
                "num_contacts": 0,
                "last_activity_date": null,
                "persona_counts": {}
            }
        }
    ]
```

This endpoint returns all opportunities you have Created.

`GET https://api.apollo.io/v1/opportunities`

## View Opportunity

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" "https://api.apollo.io/v1/opportunities/REPLACE_WITH_OPPORTUNITY_ID?api_key=YOUR_API_KEY_HERE"
```

```python
import requests

url = "https://api.apollo.io/v1/opportunities/REPLACE_WITH_OPPORTUNITY_ID"

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
  "opportunity": {
    "id": "5c14XXXXXXXXXXXXXXXXXXXX",
    "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
    "owner_id": "5c10XXXXXXXXXXXXXXXXXXXX",
    "salesforce_owner_id": "0051U000001FAqXQAW",
    "amount": 90000.0,
    "closed_date": "2018-08-27T15:00:00.000+00:00",
    "account_id": "5c14XXXXXXXXXXXXXXXXXXXX",
    "description": null,
    "is_closed": true,
    "is_won": true,
    "name": "Grand Apollo SLA",
    "stage_name": "Closed Won",
    "opportunity_stage_id": "5c10XXXXXXXXXXXXXXXXXXXX",
    "source": "crm",
    "salesforce_id": "0061U000XXXXXXXXXX",
    "created_at": "2018-12-14T21:36:02.191Z",
    "existence_level": "full",
    "opportunity_contact_roles": [],
    "salesforce_record_url": "https://na85.salesforce.com/0061U000XXXXXXXXXX",
    "num_contacts": 0
  }
}
```

This endpoint returns the full information about an opportunity.
&nbsp;

You can GET a list of all created Opportunities from [Opportunities/all](#get-all-opportunities)

`GET https://api.apollo.io/v1/opportunities/REPLACE_WITH_OPPORTUNITY_ID`

## Update Opportunity

> Sample request:

```shell
curl -X PATCH -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "name": "Opportunity Name Updated",
}' "https://api.apollo.io/v1/opportunities"
```

```python
import requests

url = "https://api.apollo.io/v1/opportunities"

data = {
    "api_key": "YOUR API KEY HERE",
    "name": "Opportunity Name Updated",
}

headers = {
    'Cache-Control': 'no-cache',
    'Content-Type': 'application/json'
}

response = requests.patch(url, headers=headers, data=data)

print(response.text)
```

> Sample response:

```json
{
  "opportunity": {
    "id": "5c14XXXXXXXXXXXXXXXXXXXX",
    "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
    "owner_id": "5c10XXXXXXXXXXXXXXXXXXXX",
    "salesforce_owner_id": "0051U000001FAqXQAW",
    "amount": 90000.0,
    "closed_date": "2018-08-27T15:00:00.000+00:00",
    "account_id": "5c14XXXXXXXXXXXXXXXXXXXX",
    "description": null,
    "is_closed": true,
    "is_won": true,
    "name": "Opportunity Name Updated",
    "stage_name": "Closed Won",
    "opportunity_stage_id": "5c10XXXXXXXXXXXXXXXXXXXX",
    "source": "crm",
    "salesforce_id": "0061U000XXXXXXXXXX",
    "created_at": "2018-12-14T21:36:02.191Z",
    "existence_level": "full",
    "opportunity_contact_roles": [],
    "salesforce_record_url": "https://na85.salesforce.com/0061U000XXXXXXXXXX",
    "num_contacts": 0
  }
}
```

Update the details of an already existing opportunity.

<aside class="notice">
Only supplied fields will be updated. All other fields will be left untouched.
</aside>
&nbsp;

You can GET a list of all created Opportunities from [Opportunities/all](#get-all-opportunities)

`PATCH https://api.apollo.io/v1/opportunities/REPLACE_WITH_OPPORTUNITY_ID`
