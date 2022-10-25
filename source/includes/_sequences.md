# Sequences API

Use the Sequences API to interact with sequences, add contacts to sequence, and more!

## Search for sequences

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "q_name": "Sequence Name"
}' "https://api.apollo.io/v1/emailer_campaigns/search"
```

```python
import requests

url = "https://api.apollo.io/v1/emailer_campaigns/search"

data = {
    "api_key": "YOUR API KEY HERE",
    "q_name": "Sequence Name"
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
    "pagination": {
        "page": 1,
        "per_page": 25,
        "total_entries": 1,
        "total_pages": 1
    },
    "breadcrumbs": [
        {
            "label": "Name",
            "signal_field_name": "q_name",
            "value": "Manual Message Sequence",
            "display_name": "Manual Message Sequence"
        }
    ],
    "emailer_campaigns": [
        {
            "id": "5c8751XXXXXXXXXXXXXXXX",
            "name": "Manual Message Sequence",
            "archived": false,
            "created_at": "2019-03-12T06:27:23.539Z",
            "emailer_schedule_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "max_emails_per_day": null,
            "user_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "same_account_reply_policy_cd": null,
            "excluded_account_stage_ids": [
                "5c1004XXXXXXXXXXXXXXXXXX",
                "5c1004XXXXXXXXXXXXXXXXXX",
                "5c1004XXXXXXXXXXXXXXXXXX",
                "5c1004XXXXXXXXXXXXXXXXXX"
            ],
            "excluded_contact_stage_ids": [
                "5c1004XXXXXXXXXXXXXXXXXX",
                "5c1004XXXXXXXXXXXXXXXXXX",
                "5c1004XXXXXXXXXXXXXXXXXX",
                "5c1004XXXXXXXXXXXXXXXXXX"
            ],
            "contact_email_event_to_stage_mapping": {},
            "label_ids": [],
            "create_task_if_email_open": false,
            "email_open_trigger_task_threshold": 3,
            "mark_finished_if_click": false,
            "active": false,
            "days_to_wait_before_mark_as_response": 5,
            "starred_by_user_ids": [],
            "mark_finished_if_reply": true,
            "mark_finished_if_interested": true,
            "mark_paused_if_ooo": true,
            "sequence_by_exact_daytime": null,
            "permissions": "team_can_view",
            "last_used_at": "2020-04-07T00:34:36.244+00:00",
            "sequence_ruleset_id": "5c1004a041f5ac0995d5f61f",
            "folder_id": null,
            "same_account_reply_delay_days": 30,
            "num_steps": 1,
            "unique_scheduled": 0,
            "unique_delivered": 1,
            "unique_bounced": 0,
            "unique_opened": 1,
            "unique_replied": 0,
            "unique_demoed": 0,
            "unique_clicked": 0,
            "unique_unsubscribed": 0,
            "bounce_rate": 0,
            "open_rate": 1,
            "click_rate": 0,
            "reply_rate": 0,
            "spam_blocked_rate": 0,
            "opt_out_rate": 0,
            "demo_rate": 0,
            "loaded_stats": true,
            "cc_emails": "",
            "bcc_emails": ""
        }
    ],
    "num_fetch_result": null
}
```

`POST https://api.apollo.io/v1/emailer_campaigns/search`


Parameter | Description | Example
--------- | ----------- | -----------
q_name| Name | "Name of Sequence"


## Add Contacts to Sequence

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "async": false,
    "contact_ids": ["contact id 1", "contact id 2"],
    "emailer_campaign_id": REPLACE_WITH_SEQUENCE_ID,
    "send_email_from_email_account_id": "email_account_id",
    "sequence_active_in_other_campaigns": false,
    "sequence_no_email": false,
    "sequence_finished_in_other_campaigns": false   
}' "https://api.apollo.io/v1/emailer_campaigns/REPLACE_WITH_SEQUENCE_ID/add_contact_ids"
```

```python
import requests

url = "https://api.apollo.io/v1/emailer_campaigns/REPLACE_WITH_SEQUENCE_ID/add_contact_ids"

data = {
    "api_key": "YOUR API KEY HERE",
    "async": False,
    "contact_ids": ["contact id 1", "contact id 2"],
    "emailer_campaign_id": REPLACE_WITH_SEQUENCE_ID,
    "send_email_from_email_account_id": "email_account_id",
    "sequence_active_in_other_campaigns": False,
    "sequence_no_email": False,
    "sequence_finished_in_other_campaigns": False    
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
            "id": "5c1004XXXXXXXXXXXXXXXXXX",
            "first_name": "Ray",
            "last_name": "Li",
            "name": "Ray Li",
            "linkedin_url": null,
            "title": "CTO",
            "contact_stage_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "owner_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "person_id": null,
            "email_needs_tickling": false,
            "organization_name": "Apollo",
            "organization_id": null,
            "headline": null,
            "photo_url": null,
            "present_raw_address": null,
            "linkedin_uid": null,
            "extrapolated_email_confidence": 0.0,
            "salesforce_id": "0036g000XXXXXXX",
            "salesforce_lead_id": null,
            "salesforce_contact_id": "0036g0000XXXXXXXXX",
            "salesforce_account_id": "0016g0000XXXXXXXXX",
            "salesforce_owner_id": "0056g000000XXXXXXXXX",
            "created_at": "2020-07-27T01:23:36.898Z",
            "lead_request_id": null,
            "test_predictive_score": null,
            "emailer_campaign_ids": [
                "5c1004XXXXXXXXXXXXXXXXXX"
            ],
            "email_manually_changed": false,
            "direct_dial_status": null,
            "direct_dial_enrichment_failed_at": null,
            "email_status": "verified",
            "account_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "last_activity_date": null,
            "hubspot_vid": null,
            "hubspot_company_id": null,
            "sanitized_phone": "+165XXXXXX",
            "merged_crm_ids": [],
            "typed_custom_fields": {},
            "updated_at": "2020-07-27T01:23:36.898Z",
            "queued_for_crm_push": false,
            "starred_by_user_ids": [],
            "suggested_from_rule_engine_config_id": null,
            "label_ids": [],
            "has_pending_email_arcgate_request": false,
            "has_email_arcgate_request": false,
            "existence_level": "full",
            "email": "ray@apollo.io",
            "salesforce_record_url": "https://na174.salesforce.com/0036g00000XXXXXXX",
            "contact_campaign_statuses": [
                {
                    "id": "5c1004XXXXXXXXXXXXXXXXXX",
                    "emailer_campaign_id": "5c1004XXXXXXXXXXXXXXXXXX",
                    "send_email_from_user_id": "5c1004XXXXXXXXXXXXXXXXXX",
                    "inactive_reason": "Sequence inactive",
                    "status": "paused",
                    "added_at": "2020-08-26T17:53:02.533+00:00",
                    "added_by_user_id": "5c1004XXXXXXXXXXXXXXXXXX",
                    "finished_at": null,
                    "paused_at": null,
                    "auto_unpause_at": null,
                    "send_email_from_email_address": "ab@apollo.io",
                    "send_email_from_email_account_id": "5c1004XXXXXXXXXXXXXXXXXX",
                    "manually_set_unpause": null,
                    "failure_reason": null,
                    "current_step_id": null,
                    "current_step_position": null
                }
            ],
            "phone_numbers": [
            ],
            "account_phone_note": null
        }
    ],
    "emailer_campaign": {
        "id": "5c1004XXXXXXXXXXXXXXXXXX",
        "name": "Test Sequence",
        "archived": false,
        "created_at": "2020-08-26T09:21:01.510Z",
        "emailer_schedule_id": "5c1004XXXXXXXXXXXXXXXXXX",
        "max_emails_per_day": null,
        "user_id": "5c1004XXXXXXXXXXXXXXXXXX",
        "same_account_reply_policy_cd": null,
        "excluded_account_stage_ids": [
            "5c1004XXXXXXXXXXXXXXXXXX",
            "5c1004XXXXXXXXXXXXXXXXXX",
            "5c1004XXXXXXXXXXXXXXXXXX",
            "5c1004XXXXXXXXXXXXXXXXXX"
        ],
        "excluded_contact_stage_ids": [
            "5c1004XXXXXXXXXXXXXXXXXX",
            "5c1004XXXXXXXXXXXXXXXXXX",
            "5c1004XXXXXXXXXXXXXXXXXX",
            "5c1004XXXXXXXXXXXXXXXXXX"
        ],
        "contact_email_event_to_stage_mapping": {},
        "label_ids": [],
        "create_task_if_email_open": false,
        "email_open_trigger_task_threshold": 3,
        "mark_finished_if_click": false,
        "active": false,
        "days_to_wait_before_mark_as_response": 5,
        "starred_by_user_ids": [],
        "mark_finished_if_reply": true,
        "mark_finished_if_interested": true,
        "mark_paused_if_ooo": true,
        "sequence_by_exact_daytime": null,
        "permissions": "",
        "last_used_at": "2020-08-26T17:53:02.672+00:00",
        "sequence_ruleset_id": "5c1004XXXXXXXXXXXXXXXXXX",
        "folder_id": null,
        "same_account_reply_delay_days": 30,
        "unique_scheduled": "loading",
        "unique_delivered": 0,
        "unique_bounced": 0,
        "unique_opened": 0,
        "unique_replied": 0,
        "unique_demoed": 0,
        "unique_clicked": 0,
        "unique_unsubscribed": 0,
        "bounce_rate": 0.0,
        "open_rate": 0.0,
        "click_rate": 0.0,
        "reply_rate": 0.0,
        "spam_blocked_rate": 0.0,
        "opt_out_rate": 0.0,
        "demo_rate": 0.0,
        "loaded_stats": true,
        "contact_statuses": {
            "active": "loading",
            "failed": "loading",
            "paused": "loading",
            "finished": "loading",
            "bounced": "loading",
            "not_sent": "loading"
        },
        "num_contacts": 1,
        "cc_emails": "",
        "bcc_emails": ""
    },
    "emailer_steps": [],
    "emailer_touches": [],
    "team": {
        "id": "5c1004XXXXXXXXXXXXXXXXXX",
        "sequences_finder_empty": false
    }
}
```

`POST https://api.apollo.io/v1/emailer_campaigns/REPLACE_WITH_SEQUENCE_ID/add_contact_ids`


Parameter | Description | Example
--------- | ----------- | -----------
id (required, embedded in URL)| ID of the sequence | "583f2f7ed9ced98ab5bfXXXX"
contact_ids (required)| An array of contact Ids | ["583f2f7ed9ced98ab5bfXXXX", "583f2f7ed9ced98ab5bfXXXX"]
emailer_campaign_id (required)| The ID of sequence to deploy to | "583f2f7ed9ced98ab5bfXXXX"
send_email_from_email_account_id (required)| ID of the email account to send email from, use the email_account/search api to figure out the list IDs | "583f2f7ed9ced98ab5bfXXXX"
sequence_no_email | Whether to still sequence the contact if he/she does not have an email address | true or false (default false)
sequence_active_in_other_campaigns | Whether to still sequence the contact if he/she is active or paused in another sequence | true or false (default false)
sequence_finished_in_other_campaigns  | Whether to still sequence the contact if he/she already finished another sequence | true or false (default false)
async | Whether process should be executed synchronously or asynchronously | true or false (default false)


## Remove Contacts from Sequence / Marking Contacts as Finished in Sequence

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "emailer_campaign_ids": ["contact id 1", "contact id 2"],
    "contact_ids": ["contact id 1", "contact id 2"],
    "mode": "remove",
    "async": "false"
}' "https://api.apollo.io/v1/emailer_campaigns/remove_or_stop_contact_ids"
```

```python
import requests

url = "https://api.apollo.io/v1/emailer_campaigns/remove_or_stop_contact_ids"

data = {
    "api_key": "YOUR API KEY HERE",
    "emailer_campaign_ids": ["contact id 1", "contact id 2"],
    "contact_ids": ["contact id 1", "contact id 2"],
    "mode": "remove",
    "async": False   
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
            "id": "5f0d9de3XXXXXXXXXXXXXXXXXX",
            "first_name": "Jon",
            "last_name": "Snow",
            "name": "Jon Snow",
            "linkedin_url": null,
            "title": null,
            "contact_stage_id": "5f0d9d5aXXXXXXXXXXXXXXXXXX",
            "owner_id": "5f0d9d5XXXXXXXXXXXXXXXXXX",
            "person_id": null,
            "email_needs_tickling": false,
            "organization_name": "Winter",
            "organization_id": null,
            "headline": null,
            "photo_url": null,
            "present_raw_address": null,
            "linkedin_uid": null,
            "extrapolated_email_confidence": 0.0,
            "salesforce_id": null,
            "salesforce_lead_id": null,
            "salesforce_contact_id": null,
            "salesforce_account_id": null,
            "salesforce_owner_id": null,
            "created_at": "2020-07-14T11:58:27.395Z",
            "lead_request_id": null,
            "test_predictive_score": null,
            "emailer_campaign_ids": [],
            "email_manually_changed": false,
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
            "updated_at": "2020-07-14T11:58:27.395Z",
            "queued_for_crm_push": false,
            "starred_by_user_ids": [],
            "suggested_from_rule_engine_config_id": null,
            "label_ids": [],
            "has_pending_email_arcgate_request": false,
            "has_email_arcgate_request": false,
            "existence_level": "full",
            "email": "jonsnow@westeros.com",
            "contact_campaign_statuses": [],
            "phone_numbers": [],
            "account_phone_note": null
        }
    ],
    "emailer_campaigns": [
        {
            "id": "5f46297XXXXXXXXXXXXXXXXXX"
        }
    ],
    "num_contacts": 0,
    "contact_statuses": {
        "active": "loading",
        "failed": "loading",
        "paused": "loading",
        "finished": "loading",
        "bounced": "loading",
        "not_sent": "loading"
    },
    "emailer_steps": []
}
```

`POST https://api.apollo.io/v1/emailer_campaigns/remove_or_stop_contact_ids`

Parameter | Description | Example
--------- | ----------- | -----------
emailer_campaign_ids (required)| A list of ids to remove all contacts from| ["583f2f7ed9ced98ab5bfXXXX", "583f2f7ed9ced98ab5bfXXXX"]
contact_ids (required)| An array of contact Ids to remove from the sequences | ["583f2f7ed9ced98ab5bfXXXX", "583f2f7ed9ced98ab5bfXXXX"]
mode (required)| Whether to remove the contacts from the sequence, or mark them as finished or stop them | mark_as_finished OR remove OR stop