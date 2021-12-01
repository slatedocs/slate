# Tasks API

A task is an action to be performed on a contact, The Task can be assigned to any member of your team and also given the appropriate priority

## Creating a task

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "priority": "medium",
    "user_id": "5c10XXXXXXXXXXXXXXXXXXXX",
    "due_at": "2020-12-21T16:16:48.311Z",
    "type": "call",
    "contact_ids": [
        "5cd9XXXXXXXXXXXXXXXXXXXX",
        "5cd9XXXXXXXXXXXXXXXXXXXX"
    ],
    "note": "Note to be attached to the task",
    "status": "scheduled"
}' "https://api.apollo.io/v1/tasks/bulk_create"
```

```python
import requests

url = "https://api.apollo.io/v1/tasks/bulk_create"

data = {
    "api_key": "YOUR API KEY HERE",
    "priority": "medium",
    "user_id": "5c10XXXXXXXXXXXXXXXXXXXX",
    "due_at": "2020-12-21T16:16:48.311Z",
    "type": "call",
    "contact_ids": [
        "5cd9XXXXXXXXXXXXXXXXXXXX",
        "5cd9XXXXXXXXXXXXXXXXXXXX"
    ],
    "note": "Note to be attached to the task",
    "status": "scheduled"
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
  true
}
```

`POST https://api.apollo.io/v1/tasks/bulk_create`

| Parameter              | Description                                                                                                                     | Example                                                  |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| priority (required)    | Priority of the task                                                                                                            | "high"/"medium"/"low"                                    |
| user_id                | The ID of the user the task is to be assigned to . You can GET a list of possible users from [Misc/Users](#get-a-list-of-users) | "583f2f7ed9ced98ab5bfXXXX"                               |
| due_at                 | the due date and time for the task                                                                                              | 2020-12-21T16:16:48.311Z                                 |
| type                   | The type of the task there are 3 valid task types `call`, `outreach_manual_email` ,`action_item`                                | call, outreach_manual_email ,action_item                 |
| contact_ids (required) | An array of contact Ids                                                                                                         | ["583f2f7ed9ced98ab5bfXXXX", "583f2f7ed9ced98ab5bfXXXX"] |
| note                   | note to be attached to the task                                                                                                 | "Example note"                                           |
| status                 | the status of the task                                                                                                          | "scheduled"                                              |

## Getting a list of tasks

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "sort_by_field": "task_created_at",
    "per_page": 200,
    "open_factor_names": [
        "task_types"
    ]
}' "https://api.apollo.io/v1/tasks/search"
```

```python
import requests

url = "https://api.apollo.io/v1/tasks/search"

querystring = {
    "api_key": "YOUR API KEY HERE",
    "sort_by_field": "task_created_at",
    "per_page": 200,
    "open_factor_names": [
        "task_types"
    ]
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
    "tasks": [
        {
            "emailer_campaign_id": null,
            "id": "5ff3XXXXXXXXXXXXXXXXXXXX",
            "user_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
            "created_at": "2021-01-04T15:48:10.467Z",
            "completed_at": null,
            "note": null,
            "skipped_at": null,
            "due_at": "2021-01-04T15:46:48.361+00:00",
            "type": "action_item",
            "priority": "medium",
            "status": "scheduled",
            "answered": null,
            "contact_id": "5fd1XXXXXXXXXXXXXXXXXXXX",
            "person_id": null,
            "account_id": "5fd1XXXXXXXXXXXXXXXXXXXX",
            "organization_id": null,
            "persona_ids": [],
            "subject": null,
            "created_from": "zp_ui",
            "salesforce_type": null,
            "playbook_step_ids": [],
            "playbook_id": null,
            "needs_playbook_autoprospecting": null,
            "starred_by_user_ids": [],
            "salesforce_id": null,
            "hubspot_id": null,
            "account": {
                "id": "5fd1XXXXXXXXXXXXXXXXXXXX",
                "domain": ".com",
                "name": "google",
                "team_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
                "typed_custom_fields": {},
                "organization_id": null,
                "account_stage_id": null,
                "source": "salesforce",
                "original_source": "salesforce",
                "owner_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
                "created_at": "2020-12-09T21:41:51.657Z",
                "phone": "(800) 424-9299",
                "phone_status": "no_status",
                "test_predictive_score": null,
                "hubspot_id": null,
                "salesforce_id": "0011U0XXXXXXXXXXXX",
                "crm_owner_id": "0051U0XXXXXXXXXXXX",
                "parent_account_id": null,
                "sanitized_phone": "+180xxxxxxxx",
                "account_playbook_statuses": [],
                "existence_level": "full",
                "label_ids": [],
                "modality": "account",
                "salesforce_record_url": "https://na85.salesforce.com/0011U0XXXXXXXXXXXX",
                "persona_counts": {}
            },
            "contact": {
                "id": "5fd1XXXXXXXXXXXXXXXXXXXX",
                "first_name": "John",
                "last_name": "Doe",
                "name": "John Doe",
                "linkedin_url": null,
                "title": "Senior QA Specialist",
                "contact_stage_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
                "owner_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
                "person_id": null,
                "email_needs_tickling": false,
                "organization_name": null,
                "source": "salesforce_contact",
                "original_source": "salesforce_contact",
                "organization_id": null,
                "headline": null,
                "photo_url": null,
                "present_raw_address": "Washington, District of Columbia, United States",
                "linkedin_uid": null,
                "extrapolated_email_confidence": 0.0,
                "salesforce_id": "0031U0XXXXXXXXXXXX",
                "salesforce_lead_id": null,
                "salesforce_contact_id": "0031U0XXXXXXXXXXXX",
                "salesforce_account_id": "0011U0XXXXXXXXXXXX",
                "crm_owner_id": "0051U0XXXXXXXXXXXX",
                "created_at": "2020-12-09T21:41:57.503Z",
                "test_predictive_score": null,
                "emailer_campaign_ids": [],
                "email_manually_changed": false,
                "direct_dial_status": null,
                "direct_dial_enrichment_failed_at": null,
                "email_status": "verified",
                "account_id": "5fd1XXXXXXXXXXXXXXXXXXXX",
                "last_activity_date": null,
                "hubspot_vid": null,
                "hubspot_company_id": null,
                "sanitized_phone": "+180xxxxxxxx",
                "merged_crm_ids": [],
                "typed_custom_fields": {},
                "updated_at": "2020-12-28T10:51:37.432Z",
                "queued_for_crm_push": false,
                "suggested_from_rule_engine_config_id": null,
                "email_unsubscribed": false,
                "label_ids": [],
                "has_pending_email_arcgate_request": false,
                "has_email_arcgate_request": false,
                "existence_level": "full",
                "email": "email@domain.io",
                "salesforce_record_url": "https://na85.salesforce.com/0031U0XXXXXXXXXXXX",
                "outreach_id": "1X7",
                "outreach_url": "https://app2a.outreach.io/prospects/XXX/overview",
                "salesloft_id": "6XX1XX5X",
                "salesloft_url": "https://app.salesloft.com/app/people/6XXXXXXX",
                "phone_numbers": [
                    {
                        "raw_number": "(X00) 4X4-XXXX",
                        "sanitized_number": "+280XXXXXXXX",
                        "type": "other",
                        "position": 0,
                        "status": "no_status"
                    }
                ],
                "account_phone_note": null
            }
        }
        {
            "emailer_campaign_id": null,
            "id": "5ff3XXXXXXXXXXXXXXXXXXXX",
            "user_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
            "created_at": "2021-01-04T15:36:09.033Z",
            "completed_at": null,
            "note": "Call Contact",
            "skipped_at": null,
            "due_at": "2021-01-04T15:35:58.054+00:00",
            "type": "call",
            "priority": "medium",
            "status": "scheduled",
            "answered": null,
            "contact_id": "5fd1XXXXXXXXXXXXXXXXXXXX",
            "person_id": null,
            "account_id": "5fd1XXXXXXXXXXXXXXXXXXXX",
            "organization_id": null,
            "persona_ids": [],
            "subject": null,
            "created_from": "zp_ui",
            "salesforce_type": null,
            "playbook_step_ids": [],
            "playbook_id": null,
            "needs_playbook_autoprospecting": null,
            "starred_by_user_ids": [],
            "salesforce_id": null,
            "hubspot_id": null,
            "account": {
                "id": "5fd1XXXXXXXXXXXXXXXXXXXX",
                "domain": "apple.com",
                "name": "Apple",
                "team_id": "5fcXXXXXXXXXXXXXXXXXXXX",
                "typed_custom_fields": {},
                "organization_id": null,
                "account_stage_id": null,
                "source": "salesforce",
                "original_source": "salesforce",
                "owner_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
                "created_at": "2020-12-09T21:41:51.657Z",
                "phone": "(X00) 4X4-XXXX",
                "phone_status": "no_status",
                "test_predictive_score": null,
                "hubspot_id": null,
                "salesforce_id": "0011U0XXXXXXXXXXXX",
                "crm_owner_id": "0051U0XXXXXXXXXXXX",
                "parent_account_id": null,
                "sanitized_phone": "+3X0042XXXXX",
                "account_playbook_statuses": [],
                "existence_level": "full",
                "label_ids": [],
                "modality": "account",
                "salesforce_record_url": "https://na85.salesforce.com/0011U0XXXXXXXXXXXX",
                "persona_counts": {}
            },
            "contact": {
                "id": "5fd1XXXXXXXXXXXXXXXXXXXX",
                "first_name": "Jane",
                "last_name": "doe",
                "name": "Jane Doe",
                "linkedin_url": null,
                "title": "Senior Engineer",
                "contact_stage_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
                "owner_id": "5fc6XXXXXXXXXXXXXXXXXXXX",
                "person_id": null,
                "email_needs_tickling": false,
                "organization_name": null,
                "source": "salesforce_contact",
                "original_source": "salesforce_contact",
                "organization_id": null,
                "headline": null,
                "photo_url": null,
                "present_raw_address": "Washington, District of Columbia, United States",
                "linkedin_uid": null,
                "extrapolated_email_confidence": 0.0,
                "salesforce_id": "003XXXXXXXXXXXXXXX",
                "salesforce_lead_id": null,
                "salesforce_contact_id": "0031XXXXXXXxXXXXX",
                "salesforce_account_id": "0011U00XXXXXXxXXX",
                "crm_owner_id": "0051U0XXXXXXXXXXXX",
                "created_at": "2020-12-09T21:41:57.503Z",
                "test_predictive_score": null,
                "emailer_campaign_ids": [],
                "email_manually_changed": false,
                "direct_dial_status": null,
                "direct_dial_enrichment_failed_at": null,
                "email_status": "verified",
                "account_id": "5fd1XXXXXXXXXXXXXXXXXXXX",
                "last_activity_date": null,
                "hubspot_vid": null,
                "hubspot_company_id": null,
                "sanitized_phone": "+18XXXXXXXXX",
                "merged_crm_ids": [],
                "typed_custom_fields": {},
                "updated_at": "2020-12-28T10:51:37.432Z",
                "queued_for_crm_push": false,
                "suggested_from_rule_engine_config_id": null,
                "email_unsubscribed": false,
                "label_ids": [],
                "has_pending_email_arcgate_request": false,
                "has_email_arcgate_request": false,
                "existence_level": "full",
                "email": "jane.doe@apple.com",
                "salesforce_record_url": "https://naXX.salesforce.com/0031U00XXXXXXXXXXXX",
                "outreach_id": "4XX",
                "outreach_url": "https://app2a.outreach.io/prospects/4XX/overview",
                "salesloft_id": "62619350",
                "salesloft_url": "https://app.salesloft.com/app/people/62XXXXXX",
                "phone_numbers": [
                    {
                        "raw_number": "(8XX) 4X4-XXXX",
                        "sanitized_number": "+1X004XXXXXX",
                        "type": "other",
                        "position": 0,
                        "status": "no_status"
                    }
                ],
                "account_phone_note": null
            }
        }
    ],
    "breadcrumbs": [],
    "pagination": {
        "page": 1,
        "per_page": 2,
        "total_entries": 20,
        "total_pages": 7
    },
    "faceting": {
        "playbook_step_facets": [],
        "person_function_facets": [],
        "person_seniority_facets": [],
        "normalized_person_title_facets": [],
        "organization_ids_facets": [],
        "organization_ids_in_query_facets": [],
        "person_persona_facets": [],
        "organization_keywords_facets": [],
        "linkedin_industry_facets": [],
        "linkedin_specialty_facets": [],
        "angellist_market_facets": [],
        "linkedin_company_size_facets": [],
        "num_employees_facets": [],
        "currently_using_any_of_technology_uids_facets": [],
        "currently_using_all_of_technology_uids_facets": [],
        "currently_not_using_any_of_technology_uids_facets": [],
        "added_technology_uids_facets": [],
        "dropped_technology_uids_facets": [],
        "latest_funding_stage_facets": [],
        "person_city_facets": [],
        "person_state_facets": [],
        "person_country_facets": [],
        "organization_hq_city_facets": [],
        "organization_hq_state_facets": [],
        "organization_hq_country_facets": [],
        "task_types": [
            {
                "value": "contact_call",
                "display_name": "Call Contact",
                "count": 14
            },
            {
                "value": "outreach_manual_email",
                "display_name": "Email Contact",
                "count": 5
            },
            {
                "value": "contact_action_item",
                "display_name": "Contact Action Item",
                "count": 1
            }
        ],
        "total_facets": [
            {
                "value": "pipeline_total",
                "display_name": "Total",
                "count": 20
            }
        ]
    },
    "pipeline_total": 20,
    "num_fetch_result": null
}
```

`GET https://api.apollo.io/v1/tasks/search`

| Parameter                    | Description                                                     | Example        |
| ---------------------------- | --------------------------------------------------------------- | -------------- |
| open_factor_names (required) | This is a required field and must be passed in with the request | ["task_types"] |
| per_page                     | how many tasks to return per page. Max = 200                    | 100            |
