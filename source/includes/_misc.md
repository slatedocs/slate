# Misc

## Get a List of Users

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" "https://api.apollo.io/v1/users/search?api_key=YOUR_API_KEY_HERE"
```

```python
import requests

url = "https://api.apollo.io/v1/users/search"

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
    "pagination": {
        "page": null,
        "per_page": 25,
        "total_entries": 2,
        "total_pages": 1
    },
    "users": [
        {
            "id": "5cc77dXXXXXXXXXXXXXXXXXX",
            "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "first_name": "Test",
            "last_name": "User",
            "title": null,
            "email": "alangrios14@gmail.com",
            "created_at": "2019-04-29T22:39:36.645Z",
            "credit_limit": 50,
            "direct_dial_credit_limit": 0,
            "salesforce_account": null,
            "deleted": false,
            "should_include_unsubscribe_link": false,
            "opt_out_html_template": "If you don't want to hear from me again, please <%let me know%>.",
            "name": "Test User",
            "enable_click_tracking": false,
            "password_needs_reset": false,
            "salesforce_id": null,
            "default_cockpit_layout": null,
            "default_finder_view_ids": {},
            "default_account_overview_layout_id": null,
            "default_organization_overview_layout_id": null,
            "default_contact_overview_layout_id": null,
            "bridge_calls": false,
            "bridge_phone_number": null,
            "bridge_incoming_calls": false,
            "bridge_incoming_phone_number": null,
            "current_email_verified": true,
            "record_calls": true,
            "salesforce_instance_url": null,
            "permission_set_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "assistant_setting": {
                "_id": "5cc77dXXXXXXXXXXXXXXXXXX",
                "deal_size_metric": "amount",
                "inactive_account_stage_ids": [],
                "inactive_contact_stage_ids": [],
                "insight_deal_size_signals": {},
                "insight_sale_cycle_signals": {},
                "insight_win_rate_signals": {},
                "job_posting_locations": [],
                "job_posting_titles": [],
                "latest_funding_days": 90,
                "latest_news_days": 30,
                "max_num_active_accounts": 100,
                "max_people_in_sequence_per_account": 5,
                "num_inactive_days_to_re_engage": 180,
                "persona_ids": [
                    "5c1004XXXXXXXXXXXXXXXXXX",
                    "5c1004XXXXXXXXXXXXXXXXXX"
                ],
                "success_case_account_stage_ids": [],
                "technology_uids": [],
                "territory_company_size_ranges": [],
                "territory_location_override": false,
                "territory_locations": [
                    "United States"
                ],
                "territory_person_locations": [
                    "United States"
                ],
                "id": "5cc77dXXXXXXXXXXXXXXXXXX",
                "key": "5cc77XXXXXXXXXXXXXXXXXX"
            },
            "typed_custom_fields": {},
            "default_use_local_numbers": false,
            "disable_email_linking": null,
            "sync_salesforce_id": null,
            "sync_crm_id": null,
            "zp_contact_id": "59f9e0XXXXXXXXXXXXXXXXXX",
            "chrome_extension_downloaded": false,
            "user_roles": [],
            "email_oauth_signin_only": false,
            "notification_last_created_at": "2020-04-07T00:40:12.399+00:00",
            "crm_requested_to_integrate": null,
            "has_invited_user": false,
            "notification_last_read_at": null,
            "daily_data_request_email": false,
            "data_request_emails": true,
            "daily_task_email": true,
            "free_data_credits_email": true,
            "dismiss_new_team_suggestion": null,
            "request_email_change_to": null,
            "self_identified_persona": "Product",
            "added_contact_to_sequence": false,
            "has_approved_emailer_campaign": false,
            "main_emailer_campaign_id": null,
            "current_onboarding_step": "create_account",
            "onboarding_use_cases": {
                "bulk_status": "started",
                "current_use_case": "bulk",
                "first_user_case": "bulk",
                "searched_people": true,
                "download_leads": true
            },
            "skip_use_case_selection": false,
            "subteam_ids": [
                "5cc77XXXXXXXXXXXXXXXXXX"
            ],
            "prospect_territory_ids": [],
            "linked_salesforce": null,
            "linked_hubspot": false,
            "linked_salesloft": false,
            "default_chrome_extension_log_email_send_to_salesforce": true,
            "chrome_extension_auto_match_salesforce_opportunity": true,
            "chrome_extension_gmail_enable_email_tools": true,
            "enable_desktop_notifications": true,
            "default_chrome_extension_enable_reminders": false,
            "chrome_extension_gmail_enable_crm_sidebar": true
        },
        {
            "id": "5c1004XXXXXXXXXXXXXXXXXX",
            "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "first_name": "Alan",
            "last_name": "Rios",
            "title": null,
            "email": "example@domain.io",
            "created_at": "2018-12-11T18:40:32.639Z",
            "credit_limit": 50,
            "direct_dial_credit_limit": 0,
            "salesforce_account": "fencefeet@gmail.com",
            "deleted": false,
            "should_include_unsubscribe_link": false,
            "opt_out_html_template": "If you don't want to hear from me again, please <%let me know%>.",
            "name": "Alan Rios",
            "enable_click_tracking": true,
            "password_needs_reset": false,
            "salesforce_id": "0051XXXXXXXXXXXXXX",
            "default_cockpit_layout": "5c1004XXXXXXXXXXXXXXXXXX",
            "default_finder_view_ids": {},
            "default_account_overview_layout_id": null,
            "default_organization_overview_layout_id": null,
            "default_contact_overview_layout_id": null,
            "bridge_calls": false,
            "bridge_phone_number": null,
            "bridge_incoming_calls": false,
            "bridge_incoming_phone_number": "+1 (408) 201-2216",
            "current_email_verified": true,
            "record_calls": true,
            "salesforce_instance_url": "https://na85.salesforce.com",
            "permission_set_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "assistant_setting": {
                "_id": "5c1004XXXXXXXXXXXXXXXXXX",
                "deal_size_metric": "amount",
                "inactive_account_stage_ids": [],
                "inactive_contact_stage_ids": [],
                "insight_deal_size_signals": {},
                "insight_sale_cycle_signals": {},
                "insight_win_rate_signals": {},
                "job_posting_locations": [],
                "job_posting_titles": [],
                "latest_funding_days": 90,
                "latest_news_days": 30,
                "max_num_active_accounts": 100,
                "max_people_in_sequence_per_account": 5,
                "num_inactive_days_to_re_engage": 180,
                "persona_ids": [
                    "5c1004XXXXXXXXXXXXXXXXXX",
                    "5c1004XXXXXXXXXXXXXXXXXX"
                ],
                "success_case_account_stage_ids": [],
                "technology_uids": [],
                "territory_company_size_ranges": [],
                "territory_location_override": false,
                "territory_locations": [
                    "United States"
                ],
                "territory_person_locations": [
                    "United States"
                ],
                "id": "5c1004XXXXXXXXXXXXXXXXXX",
                "key": "5c1004XXXXXXXXXXXXXXXXXX"
            },
            "typed_custom_fields": {},
            "default_use_local_numbers": false,
            "disable_email_linking": null,
            "sync_salesforce_id": "0051UXXXXXXXXXXXXXX",
            "sync_crm_id": null,
            "zp_contact_id": "5a9de5XXXXXXXXXXXXXXXXXX",
            "chrome_extension_downloaded": true,
            "user_roles": [
                "admin"
            ],
            "email_oauth_signin_only": false,
            "notification_last_created_at": "2019-11-06T22:48:12.812+00:00",
            "crm_requested_to_integrate": null,
            "has_invited_user": false,
            "notification_last_read_at": "2019-09-25T18:09:05.000+00:00",
            "daily_data_request_email": true,
            "data_request_emails": true,
            "daily_task_email": true,
            "free_data_credits_email": true,
            "dismiss_new_team_suggestion": true,
            "request_email_change_to": null,
            "self_identified_persona": null,
            "subteam_ids": [],
            "prospect_territory_ids": [],
            "linked_salesforce": true,
            "linked_hubspot": false,
            "linked_salesloft": true,
            "default_chrome_extension_log_email_send_to_salesforce": true,
            "chrome_extension_auto_match_salesforce_opportunity": true,
            "chrome_extension_gmail_enable_email_tools": true,
            "enable_desktop_notifications": true,
            "default_chrome_extension_enable_reminders": false,
            "chrome_extension_gmail_enable_crm_sidebar": true
        }
    ],
    "num_fetch_result": null
}
```

`GET https://api.apollo.io/v1/users/search`



## Get a List of Email Accounts

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" "https://api.apollo.io/v1/email_accounts?api_key=YOUR_API_KEY_HERE"
```

```python
import requests

url = "https://api.apollo.io/v1/email_accounts"

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
    "email_accounts": [
        {
            "aliases": [
                "alan@apollo.io"
            ],
            "id": "5a298fXXXXXXXXXXXXXXXXXX",
            "user_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "email": "example@random.io",
            "type": "gmail",
            "active": true,
            "default": true,
            "seconds_delay_between_emails": 0,
            "provider_display_name": "Gmail",
            "nylas_provider": null,
            "last_synced_at": "2020-08-18T06:28:04.028+00:00",
            "email_sending_policy_cd": "default",
            "sendgrid_api_user": null,
            "mailgun_domains": null,
            "signature_edit_disabled": true,
            "email_daily_threshold": 100,
            "max_outbound_emails_per_hour": 50,
            "signature_html": "null"
        }
    ]
}
```

`GET https://api.apollo.io/v1/email_accounts`


## Get a List of All Lists/Tags

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" "https://api.apollo.io/v1/labels?api_key=YOUR_API_KEY_HERE"
```

```python
import requests

url = "https://api.apollo.io/v1/labels"

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
[
    {
        "_id": "5f21ccXXXXXXXXXXXXXXXXXX",
        "cached_count": 5,
        "created_at": "2020-07-29T19:23:14.220Z",
        "modality": "contacts",
        "name": "test API label",
        "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
        "updated_at": "2020-08-04T18:16:32.733Z",
        "user_id": "5c1004XXXXXXXXXXXXXXXXXX",
        "id": "5f21ccXXXXXXXXXXXXXXXXXX",
        "key": "5f21ccXXXXXXXXXXXXXXXXXX"
    },
    {
        "_id": "5dc34dXXXXXXXXXXXXXXXXXX",
        "cached_count": 0,
        "created_at": "2019-11-06T22:48:53.173Z",
        "modality": "contacts",
        "name": "Test",
        "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
        "updated_at": "2020-07-29T19:23:14.308Z",
        "user_id": "5c1004XXXXXXXXXXXXXXXXXX",
        "id": "5dc34dXXXXXXXXXXXXXXXXXX",
        "key": "5dc34dXXXXXXXXXXXXXXXXXX"
    },
    {
        "_id": "5cd9eeXXXXXXXXXXXXXXXXXX",
        "cached_count": 3001,
        "created_at": "2019-05-13T22:22:30.843Z",
        "modality": "contacts",
        "name": "Test List 1000 Net New Contacts",
        "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
        "updated_at": "2019-05-13T23:38:49.323Z",
        "user_id": "5c1004XXXXXXXXXXXXXXXXXX",
        "id": "5cd9eeXXXXXXXXXXXXXXXXXX",
        "key": "5cd9eeXXXXXXXXXXXXXXXXXX"
    }
]
```

`GET https://api.apollo.io/v1/labels`


## Get a List of All Custom Fields

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" "https://api.apollo.io/v1/typed_custom_fields?api_key=YOUR_API_KEY_HERE"
```

```python
import requests

url = "https://api.apollo.io/v1/typed_custom_fields"

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
    "typed_custom_fields": [
        {
            "id": "5c1004XXXXXXXXXXXXXXXXXX",
            "modality": "opportunity",
            "name": "Lead Source",
            "type": "picklist",
            "picklist_options": [],
            "mapped_crm_field": "LeadSource",
            "additional_mapped_crm_field": null,
            "is_readonly_mapped_crm_field": false,
            "picklist_options_last_synced_at": "2020-08-17T08:56:24.973+00:00",
            "picklist_value_set_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "mirrored": false,
            "system_name": "lead_source",
            "text_field_max_length": null,
            "picklist_values": [
                {
                    "_id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "mapped_crm_values": {
                        "5c1004XXXXXXXXXXXXXXXXXX": "Web"
                    },
                    "name": "Web",
                    "id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "key": "5c1422XXXXXXXXXXXXXXXXXX"
                },
                {
                    "_id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "mapped_crm_values": {
                        "5c1004XXXXXXXXXXXXXXXXXX": "Phone Inquiry"
                    },
                    "name": "Phone Inquiry",
                    "id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "key": "5c1422XXXXXXXXXXXXXXXXXX"
                },
                {
                    "_id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "mapped_crm_values": {
                        "5c1004XXXXXXXXXXXXXXXXXX": "Partner Referral"
                    },
                    "name": "Partner Referral",
                    "id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "key": "5c1422XXXXXXXXXXXXXXXXXX"
                },
                {
                    "_id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "mapped_crm_values": {
                        "5c1004XXXXXXXXXXXXXXXXXX": "Purchased List"
                    },
                    "name": "Purchased List",
                    "id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "key": "5c1422XXXXXXXXXXXXXXXXXX"
                },
                {
                    "_id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "mapped_crm_values": {
                        "5c1004XXXXXXXXXXXXXXXXXX": "Other"
                    },
                    "name": "Other",
                    "id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "key": "5c1422XXXXXXXXXXXXXXXXXX"
                }
            ]
        },
        {
            "id": "5c1004XXXXXXXXXXXXXXXXXX",
            "modality": "opportunity",
            "name": "Type",
            "type": "picklist",
            "picklist_options": [],
            "mapped_crm_field": "Type",
            "additional_mapped_crm_field": null,
            "is_readonly_mapped_crm_field": false,
            "picklist_options_last_synced_at": "2020-08-17T08:56:24.975+00:00",
            "picklist_value_set_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "mirrored": false,
            "system_name": "type",
            "text_field_max_length": null,
            "picklist_values": [
                {
                    "_id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "mapped_crm_values": {
                        "5c1004XXXXXXXXXXXXXXXXXX": "Existing Customer - Upgrade"
                    },
                    "name": "Existing Customer - Upgrade",
                    "id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "key": "5c1422XXXXXXXXXXXXXXXXXX"
                },
                {
                    "_id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "mapped_crm_values": {
                        "5c1004XXXXXXXXXXXXXXXXXX": "Existing Customer - Replacement"
                    },
                    "name": "Existing Customer - Replacement",
                    "id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "key": "5c1422XXXXXXXXXXXXXXXXXX"
                },
                {
                    "_id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "mapped_crm_values": {
                        "5c1004XXXXXXXXXXXXXXXXXX": "Existing Customer - Downgrade"
                    },
                    "name": "Existing Customer - Downgrade",
                    "id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "key": "5c1422XXXXXXXXXXXXXXXXXX"
                },
                {
                    "_id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "mapped_crm_values": {
                        "5c1004XXXXXXXXXXXXXXXXXX": "New Customer"
                    },
                    "name": "New Customer",
                    "id": "5c1422XXXXXXXXXXXXXXXXXX",
                    "key": "5c1422XXXXXXXXXXXXXXXXXX"
                }
            ]
        },
        {
            "id": "5c8bdaXXXXXXXXXXXXXXXXXX",
            "modality": "contact",
            "name": "User Lookup",
            "type": "lookup_user",
            "picklist_options": [],
            "mapped_crm_field": "User_Lookup__c",
            "additional_mapped_crm_field": null,
            "is_readonly_mapped_crm_field": false,
            "picklist_options_last_synced_at": "2019-03-15T17:00:14.000+00:00",
            "picklist_value_set_id": null,
            "mirrored": false,
            "system_name": null,
            "text_field_max_length": null
        },
        {
            "id": "5c4f9XXXXXXXXXXXXXXXXXX",
            "modality": "contact",
            "name": "Custom list",
            "type": "string",
            "picklist_options": [],
            "mapped_crm_field": "Custom_List__c",
            "additional_mapped_crm_field": null,
            "is_readonly_mapped_crm_field": false,
            "picklist_options_last_synced_at": "2019-01-29T00:21:38.000+00:00",
            "picklist_value_set_id": null,
            "mirrored": false,
            "system_name": null,
            "text_field_max_length": null
        },
        {
            "id": "5d856XXXXXXXXXXXXXXXXXX",
            "modality": "contact",
            "name": "Full Name Formula Field",
            "type": "string",
            "picklist_options": [],
            "mapped_crm_field": "Name",
            "additional_mapped_crm_field": "Name",
            "is_readonly_mapped_crm_field": true,
            "picklist_options_last_synced_at": "2019-09-21T00:28:11.000+00:00",
            "picklist_value_set_id": null,
            "mirrored": false,
            "system_name": null,
            "text_field_max_length": null
        },
        {
            "id": "5e5849XXXXXXXXXXXXXXXXXX",
            "modality": "contact",
            "name": "Read-only field",
            "type": "string",
            "picklist_options": [],
            "mapped_crm_field": "AssistantName",
            "additional_mapped_crm_field": null,
            "is_readonly_mapped_crm_field": true,
            "picklist_options_last_synced_at": "2020-02-27T22:59:50.000+00:00",
            "picklist_value_set_id": null,
            "mirrored": false,
            "system_name": null,
            "text_field_max_length": null
        }
    ]
}
```

`GET https://api.apollo.io/v1/typed_custom_fields`


## Get a List of Opportunity Stages

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" "https://api.apollo.io/v1/opportunity_stages?api_key=YOUR_API_KEY_HERE"
```

```python
import requests

url = "https://api.apollo.io/v1/opportunity_stages"

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
  "opportunity_stages": [
    {
      "id": "5c14XXXXXXXXXXXXXXXXXXXX",
      "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
      "name": "Negotiation/Review",
      "display_order": 0.0,
      "forecast_category_cd": "Pipeline",
      "is_won": false,
      "is_closed": false,
      "probability": 90.0,
      "description": null,
      "salesforce_id": "01XXXXXXXXXX",
      "type": "Open"
    },
    {
      "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
      "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
      "name": "Commit",
      "display_order": 2.0,
      "forecast_category_cd": "Committed",
      "is_won": false,
      "is_closed": false,
      "probability": 90.0,
      "description": "Self-explanatory",
      "salesforce_id": null,
      "type": "Open"
    },
    {
      "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
      "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
      "name": "Closed Won",
      "display_order": 3.0,
      "forecast_category_cd": "Closed",
      "is_won": true,
      "is_closed": true,
      "probability": 100.0,
      "description": "Self-explanatory",
      "salesforce_id": "01J1UXXXXXXXXXX",
      "type": "Closed/Won"
    },
    {
      "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
      "team_id": "5c10XXXXXXXXXXXXXXXXXXXX",
      "name": "Closed Lost",
      "display_order": 4.0,
      "forecast_category_cd": "Omitted",
      "is_won": false,
      "is_closed": true,
      "probability": 0.0,
      "description": "Self-explanatory",
      "salesforce_id": "0XX1U00XXXXXXXXXAC",
      "type": "Closed/Lost"
    }
  ]
}
```

`GET https://api.apollo.io/v1/opportunity_stages`
