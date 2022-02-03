# Contacts API

A Contact is a person your team has explicitly added to your database. It can be from prospected from Apollo, manually added by your team, or created by the API.

## Create a Contact

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "first_name": "Jon",
    "last_name": "Snow",
    "title": "Lord Commander",
    "organization_name": "Westeros"
}' "https://api.apollo.io/v1/contacts"
```

```python
import requests

url = "https://api.apollo.io/v1/contacts"

data = {
    "api_key": "YOUR API KEY HERE",
    "first_name": "Jonny",
    "last_name": "Snow",
    "title": "Lord Commander",
    "organization_name": "Apollo",
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
    "contact": {
        "id": "5f34e4XXXXXXXXXXXXXXXXXX",
        "first_name": "Jon",
        "last_name": "Snow",
        "name": "Jon Snow",
        "linkedin_url": null,
        "title": "Lord Commander",
        "contact_stage_id": "5c48fb3XXXXXXXXXXXXXXXXXX",
        "owner_id": "5cc77dXXXXXXXXXXXXXXXXXX",
        "person_id": null,
        "email_needs_tickling": false,
        "organization_name": "Westeros",
        "source": "api",
        "original_source": "api",
        "organization_id": null,
        "headline": null,
        "photo_url": null,
        "present_raw_address": null,
        "linkedin_uid": null,
        "extrapolated_email_confidence": 0,
        "salesforce_id": null,
        "salesforce_lead_id": null,
        "salesforce_contact_id": null,
        "salesforce_account_id": null,
        "salesforce_owner_id": null,
        "created_at": "2020-08-13T06:56:09.789Z",
        "lead_request_id": null,
        "test_predictive_score": null,
        "emailer_campaign_ids": [],
        "email_manually_changed": false,
        "direct_dial_status": null,
        "direct_dial_enrichment_failed_at": null,
        "email_status": null,
        "account_id": null,
        "last_activity_date": null,
        "hubspot_vid": null,
        "hubspot_company_id": null,
        "sanitized_phone": null,
        "merged_crm_ids": [],
        "typed_custom_fields": {},
        "updated_at": "2020-08-13T06:56:09.789Z",
        "queued_for_crm_push": true,
        "starred_by_user_ids": [],
        "suggested_from_rule_engine_config_id": null,
        "label_ids": [],
        "has_pending_email_arcgate_request": false,
        "has_email_arcgate_request": false,
        "existence_level": "full",
        "email": null,
        "contact_campaign_statuses": [],
        "next_contact_id": null,
        "time_zone": null,
        "city": null,
        "state": null,
        "country": null,
        "phone_numbers": [],
        "account_phone_note": null
    },
    "labels": [],
    "team": {
        "id": "5c1004XXXXXXXXXXXXXXXXXX",
        "contacts_finder_empty": false
    }
}
```

`POST https://api.apollo.io/v1/contacts`

<aside class="notice">
Apollo does not run any deduplication during <code>CREATE</code>. If your record contains the same email or name+company as an existing contact, Apollo will create a new contact instead of updating the existing contact.
</aside>

Parameter | Description | Example
--------- | ----------- | -----------
first_name| First name | "Jon"
last_name | Last Name   | "Snow"
organization_name | Company Name   | "Westeros Inc."
title | Title   | "Lord Commander"
account_id     | ID of the Account (Optional) | "583f2f7ed9ced98ab5bfXXXX"
email     | Email. Invalid emails will be ignored.  | "jon.snow@westeros.com"
website_url | The organization website Apollo can use to enrich data for you. DO NOT pass in personal social media URLs such as "http://www.linkedin.com/profile_url", or your data will be incorrectly enriched. This argument will be ignored if you pass in a valid email. | "http://www.westeros.com"
label_names | A list of names to tag this newly created contact. If the name does not exist, Apollo will automatically create it | ["inbound contact", "smb clients"]
contact_stage_id | Assign contact to this stage, if the contact does not yet exist. Get a list of possible stage ids with GET /contact_stages | "583f2f7ed9ced98ab5bfXXXX"
present_raw_address | The address string for this contact, Apollo will intelligently infer the city, state, country, and time zone from your address | "San Francisco"


## Update a Contact

> Sample request:

```shell
curl -X PUT -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "first_name": "Jon",
    "last_name": "Snow",
    "email": “jon.snow@westeros.com”,
    "title": "Lord Commander",
    "organization_name": "Westeros"
}' "https://api.apollo.io/v1/contacts/YOUR CONTACT ID"
```

```python
import requests

url = "https://api.apollo.io/v1/contacts/YOUR CONTACT ID"

data = {
    "api_key": "YOUR API KEY HERE",
    "first_name": "Jon",
    "last_name": "Snow",
    "email": "jon.snow@westeros.com",
    "title": "Lord Commander",
    "organization_name": "Westeros"
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
    "contact": {
        "id": "5f34e4XXXXXXXXXXXXXXXXXX",
        "first_name": "Jon",
        "last_name": "Snow",
        "name": "Jon Snow",
        "linkedin_url": null,
        "title": "Lord Commander",
        "contact_stage_id": "5c48fbXXXXXXXXXXXXXXXXXX",
        "owner_id": "5cc77dXXXXXXXXXXXXXXXXXX",
        "person_id": null,
        "email_needs_tickling": false,
        "organization_name": "Westeros",
        "source": "api",
        "original_source": "api",
        "organization_id": null,
        "headline": null,
        "photo_url": null,
        "present_raw_address": null,
        "linkedin_uid": null,
        "extrapolated_email_confidence": 0,
        "salesforce_id": null,
        "salesforce_lead_id": null,
        "salesforce_contact_id": null,
        "salesforce_account_id": null,
        "salesforce_owner_id": null,
        "created_at": "2020-08-13T06:56:09.789Z",
        "lead_request_id": null,
        "test_predictive_score": null,
        "emailer_campaign_ids": [],
        "email_manually_changed": true,
        "direct_dial_status": null,
        "direct_dial_enrichment_failed_at": null,
        "email_status": "verified",
        "account_id": null,
        "last_activity_date": null,
        "hubspot_vid": null,
        "hubspot_company_id": null,
        "sanitized_phone": null,
        "merged_crm_ids": [],
        "typed_custom_fields": {},
        "updated_at": "2020-08-13T07:21:10.336Z",
        "queued_for_crm_push": false,
        "starred_by_user_ids": [],
        "suggested_from_rule_engine_config_id": null,
        "label_ids": [],
        "has_pending_email_arcgate_request": false,
        "has_email_arcgate_request": false,
        "existence_level": "full",
        "email": "jon.snow@westeros.com",
        "next_contact_id": null,
        "time_zone": null,
        "city": null,
        "state": null,
        "country": null,
        "crm_job": {
            "id": "5f34e6XXXXXXXXXXXXXXXXXX",
            "note": "storage limit exceeded",
            "job_type": "push_contacts",
            "retry_at": "2020-08-13T07:17:19.707+00:00",
            "status": "failed",
            "created_at": "2020-08-13T07:07:19.696Z"
        },
        "phone_numbers": [],
        "account_phone_note": null
    },
    "labels": []
}
```

`PUT https://api.apollo.io/v1/contacts`

<aside class="notice">
Do not pass in <code>contact_stage_id</code> in this endpoint. Use contacts/update_stages instead.
</aside>

Parameter | Description | Example
--------- | ----------- | -----------
id (Required)        | Contact ID  | "583f2f7ed9ced98ab5bfXXXX"
first_name| First name | "Jon"
last_name | Last Name   | "Snow"
organization_name | Company Name   | "Westeros Inc."
title | Title   | "Lord Commander"
account_id     | ID of the Account (Optional)  | "583f2f7ed9ced98ab5bfXXXX"
email     | Email   | "jon.snow@westeros.com"
label_names | A list of names to tag this contact. If the name does not exist, Apollo will automatically create it | ["inbound contact", "smb clients"]
present_raw_address | The address string for this contact, Apollo will intelligently infer the city, state, and country from your address | "San Francisco"
direct_phone | The direct dial phone for this contact. If the contact already has a direct dial, this overwrites it. If a contact does not already have a direct dial, this ADDS a new direct dial on top of existing phone numbers | "123-456-7890"
corporate_phone | The corporate phone for this contact. If the contact already has a corporate phone, this overwrites it. If a contact does not already have a corporate phone, this ADDS a new corporate phone on top of existing phone numbers | "123-456-7890"
mobile_phone | The mobile phone for this contact. If the contact already has a mobile phone, this overwrites it. If a contact does not already have a mobile phone, this ADDS a new mobile phone on top of existing phone numbers | "123-456-7890"
home_phone | The home phone for this contact. If the contact already has a home phone, this overwrites it. If a contact does not already have a home phone, this ADDS a new home phone on top of existing phone numbers | "123-456-7890"
other_phone | Phone of unknown type for this contact. If the contact already has phone of unknown type, this overwrites it. If a contact does not already have phone of unknown type, this ADDS a new phone on top of existing phone numbers | "123-456-7890"


## Search for Contacts

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "q_keywords": "Tim Zheng, CEO, Apollo",
    "sort_by_field": "contact_last_activity_date",
    "sort_ascending": false
}' "https://api.apollo.io/v1/contacts/search"
```

```python
import requests

url = "https://api.apollo.io/v1/contacts/search"

data = {
    "api_key": "YOUR API KEY HERE",
    "q_keywords": "Tim Zheng, CEO, Apollo",
    "sort_by_field": "contact_last_activity_date",
    "sort_ascending": False,
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
    "contacts": [
        {
            "id": "5da8ceXXXXXXXXXXXXXXXXXX",
            "first_name": "Tim",
            "last_name": "Zheng",
            "name": "Tim Zheng",
            "linkedin_url": "http://www.linkedin.com/in/tim-zheng-677ba010",
            "title": "Founder & CEO",
            "contact_stage_id": "5c48fbXXXXXXXXXXXXXXXXXX",
            "owner_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "person_id": "5f2b88XXXXXXXXXXXXXXXXXX",
            "email_needs_tickling": false,
            "organization_name": "Apollo",
            "source": "search",
            "original_source": "email_import",
            "organization_id": "5e66b6XXXXXXXXXXXXXXXXXX",
            "headline": "Founder & CEO at Apollo",
            "photo_url": "https://some-url.fyvrk",
            "present_raw_address": "San Francisco, California, United States",
            "linkedin_uid": "38777275",
            "extrapolated_email_confidence": 0,
            "salesforce_id": "0031UXXXXXXXXXXXXXX",
            "salesforce_lead_id": null,
            "salesforce_contact_id": "0031UXXXXXXXXXXXXXXX",
            "salesforce_account_id": "0011UXXXXXXXXXXXXXXX",
            "salesforce_owner_id": "0051UXXXXXXXXXXXXXXX",
            "created_at": "2019-10-17T20:25:07.594Z",
            "lead_request_id": null,
            "test_predictive_score": null,
            "emailer_campaign_ids": [],
            "email_manually_changed": false,
            "direct_dial_status": null,
            "direct_dial_enrichment_failed_at": null,
            "email_status": "verified",
            "account_id": "5f1fadXXXXXXXXXXXXXXXXXX",
            "last_activity_date": "2018-06-26T16:30:35.000+00:00",
            "hubspot_vid": null,
            "hubspot_company_id": null,
            "sanitized_phone": null,
            "merged_crm_ids": [],
            "typed_custom_fields": {
                "5d856eXXXXXXXXXXXXXXXXXX": "Tim Zheng"
            },
            "updated_at": "2020-07-28T04:44:51.448Z",
            "queued_for_crm_push": false,
            "starred_by_user_ids": [],
            "suggested_from_rule_engine_config_id": null,
            "label_ids": [],
            "has_pending_email_arcgate_request": false,
            "has_email_arcgate_request": false,
            "existence_level": "full",
            "email": "random@somedomain.com",
            "salesforce_record_url": "https://na85.salesforce.com/0031UXXXXXXXXXXXXXXXXXX",
            "contact_campaign_statuses": [],
            "state": "California",
            "city": "San Francisco",
            "country": "United States",
            "account": {
                "id": "5f1fadXXXXXXXXXXXXXXXXXX",
                "name": "Apollo",
                "website_url": "http://www.apollo.io",
                "blog_url": null,
                "angellist_url": null,
                "linkedin_url": "http://www.linkedin.com/company/apolloio",
                "twitter_url": "https://twitter.com/MeetApollo/",
                "facebook_url": "https://www.facebook.com/MeetApollo/",
                "languages": [],
                "alexa_ranking": 77520,
                "phone": null,
                "linkedin_uid": "18511550",
                "publicly_traded_symbol": null,
                "publicly_traded_exchange": null,
                "logo_url": "https://apollo-server.com/uploads/pictures/5f0265XXXXXXXXXXXXXXXXXX/picture",
                "crunchbase_url": null,
                "primary_domain": "apollo.io",
                "starred_by_user_ids": [],
                "persona_counts": {},
                "domain": "apollo.io",
                "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
                "typed_custom_fields": {},
                "organization_id": "5e66b6XXXXXXXXXXXXXXXXXX",
                "account_stage_id": "5c1004XXXXXXXXXXXXXXXXXX",
                "source": "salesforce",
                "original_source": "salesforce",
                "owner_id": "5c1004XXXXXXXXXXXXXXXXXX",
                "created_at": "2020-07-28T04:44:13.821Z",
                "phone_status": "no_status",
                "test_predictive_score": null,
                "hubspot_id": null,
                "salesforce_id": "0011UXXXXXXXXXX",
                "salesforce_owner_id": "0051UXXXXXXXXXX",
                "parent_account_id": null,
                "account_playbook_statuses": [],
                "existence_level": "full",
                "label_ids": [],
                "modality": "account",
                "salesforce_record_url": "https://na85.salesforce.com/0011UXXXXXXXXXXX"
            },
            "organization": {
                "id": "5e66b6XXXXXXXXXXXXXXXXXX",
                "name": "Apollo",
                "website_url": "http://www.apollo.io",
                "blog_url": null,
                "angellist_url": null,
                "linkedin_url": "http://www.linkedin.com/company/apolloio",
                "twitter_url": "https://twitter.com/MeetApollo/",
                "facebook_url": "https://www.facebook.com/MeetApollo/",
                "languages": [],
                "alexa_ranking": 77520,
                "phone": null,
                "linkedin_uid": "18511550",
                "publicly_traded_symbol": null,
                "publicly_traded_exchange": null,
                "logo_url": "https://apollo-server.com/uploads/pictures/5f0265XXXXXXXXXXXXXXXXXX/picture",
                "crunchbase_url": null,
                "primary_domain": "apollo.io",
                "starred_by_user_ids": [],
                "persona_counts": {}
            },
            "phone_numbers": [],
            "account_phone_note": null,
            "contact_job_change_event": null
        }
    ],
    "breadcrumbs": [
        {
            "label": "Contains Keywords",
            "signal_field_name": "q_keywords",
            "value": "Tim Zheng, CEO, Apollo",
            "display_name": "Tim Zheng, CEO, Apollo"
        }
    ],
    "partial_results_only": false,
    "disable_eu_prospecting": false,
    "partial_results_limit": 10000,
    "pagination": {
        "page": 1,
        "per_page": 25,
        "total_entries": 1,
        "total_pages": 1
    },
    "num_fetch_result": null
}

```

`POST https://api.apollo.io/v1/contacts/search`

Parameter | Description
--------- | -----------
q_keywords | The contact's name, title, company, or email
contact_stage_ids | An array of stage ids the contact must belong to. Refer to /contact_stages to get a list of possible stage ids.
sort_by_field | Possible values: "contact_last_activity_date", "contact_email_last_opened_at", "contact_email_last_clicked_at", "contact_created_at", or "contact_updated_at"
sort_ascending | Possible values: true or false
page | which page to return. Defaults to 1
per_page | how many contacts to return per page. Max = 200

## Get a List of Contact Stages

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" "https://api.apollo.io/v1/contact_stages?api_key=YOUR_API_KEY_HERE"
```

```python
import requests

url = "https://api.apollo.io/v1/contact_stages"

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
    "contact_stages": [
        {
            "id": "5c48fbXXXXXXXXXXXXXXXXXX",
            "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "display_name": "Cold",
            "name": "Cold",
            "display_order": 0,
            "ignore_trigger_override": false,
            "category": "in_progress"
        },
        {
            "id": "5c1004XXXXXXXXXXXXXXXXXX",
            "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "display_name": "Approaching",
            "name": "Approaching",
            "display_order": 1,
            "ignore_trigger_override": null,
            "category": "in_progress"
        },
        {
            "id": "5c1004XXXXXXXXXXXXXXXXXX",
            "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "display_name": "Replied",
            "name": "Replied",
            "display_order": 2,
            "ignore_trigger_override": null,
            "category": "in_progress"
        },
        {
            "id": "5c1004XXXXXXXXXXXXXXXXXX",
            "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "display_name": "Interested",
            "name": "Interested",
            "display_order": 3,
            "ignore_trigger_override": true,
            "category": "succeeded"
        },
        {
            "id": "5c1004XXXXXXXXXXXXXXXXXX",
            "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "display_name": "Not Interested",
            "name": "Not Interested",
            "display_order": 4,
            "ignore_trigger_override": true,
            "category": "failed"
        },
        {
            "id": "5c1004XXXXXXXXXXXXXXXXXX",
            "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "display_name": "Unresponsive",
            "name": "Unresponsive",
            "display_order": 5,
            "ignore_trigger_override": null,
            "category": "failed"
        },
        {
            "id": "5c1004XXXXXXXXXXXXXXXXXX",
            "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "display_name": "Do Not Contact",
            "name": "Do Not Contact",
            "display_order": 6,
            "ignore_trigger_override": true,
            "category": "failed"
        },
        {
            "id": "5c1004XXXXXXXXXXXXXXXXXX",
            "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "display_name": "Bad Data",
            "name": "Bad Data",
            "display_order": 7,
            "ignore_trigger_override": null,
            "category": null
        },
        {
            "id": "5c1004XXXXXXXXXXXXXXXXXX",
            "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "display_name": "Changed Job",
            "name": "Changed Job",
            "display_order": 8,
            "ignore_trigger_override": true,
            "category": null
        }
    ]
}
```

`GET https://api.apollo.io/v1/contact_stages`


## Update Contact Stage

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "contact_ids": ["contact_id1", "contact_id2"],
    "contact_stage_id": "stage_id"
}' "https://api.apollo.io/v1/contacts/update_stages"
```

```python
import requests

url = "https://api.apollo.io/v1/contacts/update_stages"

data = {
    "api_key": "YOUR API KEY HERE",
    "contact_ids": ["contact_id1", "contact_id2"],
    "contact_stage_id": "stage_id"
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
    "contacts": [
        {
            "id": "5f34e4XXXXXXXXXXXXXXXXXX",
            "first_name": "Jon",
            "last_name": "Snow",
            "name": "Jon Snow",
            "linkedin_url": null,
            "title": "Lord Commander",
            "contact_stage_id": "new_contact_stage_id",
            "owner_id": "5cc77dXXXXXXXXXXXXXXXXXX",
            "person_id": null,
            "email_needs_tickling": false,
            "organization_name": "Westeros",
            "source": "api",
            "original_source": "api",
            "organization_id": null,
            "headline": null,
            "photo_url": null,
            "present_raw_address": null,
            "linkedin_uid": null,
            "extrapolated_email_confidence": 0,
            "salesforce_id": null,
            "salesforce_lead_id": null,
            "salesforce_contact_id": null,
            "salesforce_account_id": null,
            "salesforce_owner_id": null,
            "created_at": "2020-08-13T06:56:09.789Z",
            "lead_request_id": null,
            "test_predictive_score": null,
            "emailer_campaign_ids": [],
            "email_manually_changed": true,
            "direct_dial_status": null,
            "direct_dial_enrichment_failed_at": null,
            "email_status": "verified",
            "account_id": null,
            "last_activity_date": null,
            "hubspot_vid": null,
            "hubspot_company_id": null,
            "sanitized_phone": null,
            "merged_crm_ids": [],
            "typed_custom_fields": {},
            "updated_at": "2020-08-13T07:49:02.989Z",
            "queued_for_crm_push": false,
            "starred_by_user_ids": [],
            "suggested_from_rule_engine_config_id": null,
            "label_ids": [],
            "has_pending_email_arcgate_request": false,
            "has_email_arcgate_request": false,
            "existence_level": "full",
            "email": "jon.snow@westeros.com",
            "contact_campaign_statuses": [],
            "phone_numbers": [],
            "account_phone_note": null
        }
    ]
}
```

`POST https://api.apollo.io/v1/contacts/update_stages`

### Query Parameters

Parameter | Description
--------- | -----------
contact_ids | An array of contact ids. You can filter for a list of contact IDS with the contacts/search API.
contact_stage_id | The contact stage id to change into. You can GET a list of possible stage ids and its associated information from /contact_stages



## Update Contact Ownership

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "contact_ids": ["contact_id1", "contact_id2"],
    "owner_id": "owner_id"
}' "https://api.apollo.io/v1/contacts/update_owners"
```

```python
import requests

url = "https://api.apollo.io/v1/contacts/update_owners"

data = {
    "api_key": "YOUR API KEY HERE",
    "contact_ids": ["contact_id1", "contact_id2"],
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
    "contacts": [
        {
            "id": "5f34e4XXXXXXXXXXXXXXXXXX",
            "first_name": "Jon",
            "last_name": "Snow",
            "name": "Jon Snow",
            "linkedin_url": null,
            "title": "Lord Commander",
            "contact_stage_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "owner_id": "new_owner_id",
            "person_id": null,
            "email_needs_tickling": false,
            "organization_name": "Westeros",
            "source": "api",
            "original_source": "api",
            "organization_id": null,
            "headline": null,
            "photo_url": null,
            "present_raw_address": null,
            "linkedin_uid": null,
            "extrapolated_email_confidence": 0,
            "salesforce_id": null,
            "salesforce_lead_id": null,
            "salesforce_contact_id": null,
            "salesforce_account_id": null,
            "salesforce_owner_id": null,
            "created_at": "2020-08-13T06:56:09.789Z",
            "lead_request_id": null,
            "test_predictive_score": null,
            "emailer_campaign_ids": [],
            "email_manually_changed": true,
            "direct_dial_status": null,
            "direct_dial_enrichment_failed_at": null,
            "email_status": "verified",
            "account_id": null,
            "last_activity_date": null,
            "hubspot_vid": null,
            "hubspot_company_id": null,
            "sanitized_phone": null,
            "merged_crm_ids": [],
            "typed_custom_fields": {},
            "updated_at": "2020-08-13T07:49:02.989Z",
            "queued_for_crm_push": false,
            "starred_by_user_ids": [],
            "suggested_from_rule_engine_config_id": null,
            "label_ids": [],
            "has_pending_email_arcgate_request": false,
            "has_email_arcgate_request": false,
            "existence_level": "full",
            "email": "jon.snow@westeros.com",
            "contact_campaign_statuses": [],
            "phone_numbers": [],
            "account_phone_note": null
        }
    ]
}
```

`POST https://api.apollo.io/v1/contacts/update_owners`

### Query Parameters

Parameter | Description
--------- | -----------
contact_ids | An array of contact ids. You can filter for a list of contact IDS with the contacts/search API.
owner_id | The owner id to change into. You can GET a list of possible users and its associated information from /users
