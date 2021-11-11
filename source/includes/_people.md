# People API

A person represents a person in Apollo's database.

## Search 

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "q_organization_domains": "apollo.io\ngoogle.com",
    "page" : 1,
    "person_titles" : ["sales manager", "engineer manager"]
}' "https://api.apollo.io/v1/mixed_people/search"
``` 

> Sample response:

```json 
{
    "breadcrumbs": [
        {
            "label": "Titles",
            "signal_field_name": "person_titles",
            "value": "sales manager",
            "display_name": "sales manager"
        },
        {
            "label": "Titles",
            "signal_field_name": "person_titles",
            "value": "engineer manager",
            "display_name": "engineer manager"
        },
        {
            "label": "Company Domains",
            "signal_field_name": "q_organization_domains",
            "value": [
                "apollo.io",
                "google.com"
            ],
            "display_name": "apollo.io, google.com"
        }
    ],
    "partial_results_only": false,
    "partial_results_limit": 10000,
    "pagination": {
        "page": 1,
        "per_page": 10,
        "total_entries": 1339,
        "total_pages": 134
    },
    "contacts": [],
    "people": [
        {
            "id": "618a24XXXXXXXXXXXXXXXXXX",
            "first_name": "Tim",
            "last_name": "Zheng",
            "name": "Tim Zheng",
            "linkedin_url": "http://www.linkedin.com/in/tim-zheng-677ba010",
            "title": "Founder & CEO",
            "email_status": "verified",
            "photo_url": "https://static-exp1.licdn.com/sc/h/244xhbkr7g40x6bsu4gi6q4ry",
            "twitter_url": null,
            "github_url": null,
            "facebook_url": null,
            "extrapolated_email_confidence": null,
            "headline": "Founder & CEO at Apollo",
            "email": "email_not_unlocked@domain.com",
            "employment_history": [
                {
                    "_id": "618afbXXXXXXXXXXXXXXXXXX",
                    "created_at": "2021-11-09T22:51:18.531Z",
                    "current": true,
                    "degree": null,
                    "description": null,
                    "emails": null,
                    "end_date": null,
                    "grade_level": null,
                    "kind": null,
                    "major": null,
                    "organization_id": "5e66b6XXXXXXXXXXXXXXXXXX",
                    "organization_name": "Apollo",
                    "raw_address": null,
                    "start_date": "2015-01-01",
                    "title": "Founder & CEO",
                    "updated_at": "2021-11-09T22:51:18.531Z",
                    "id": "618afbXXXXXXXXXXXXXXXXXX",
                    "key": "618afbXXXXXXXXXXXXXXXXXX"
                },
                {
                    "_id": "618afbXXXXXXXXXXXXXXXXXX",
                    "created_at": "2021-11-09T22:51:18.536Z",
                    "current": false,
                    "degree": null,
                    "description": null,
                    "emails": null,
                    "end_date": "2014-01-01",
                    "grade_level": null,
                    "kind": null,
                    "major": null,
                    "organization_id": null,
                    "organization_name": "Braingenie",
                    "raw_address": null,
                    "start_date": "2011-01-01",
                    "title": "Founder & CEO",
                    "updated_at": "2021-11-09T22:51:18.536Z",
                    "id": "618afbXXXXXXXXXXXXXXXXXX",
                    "key": "618afbXXXXXXXXXXXXXXXXXX"
                },
                {
                    "_id": "618afbXXXXXXXXXXXXXXXXXX",
                    "created_at": "2021-11-09T22:51:18.536Z",
                    "current": false,
                    "degree": null,
                    "description": null,
                    "emails": null,
                    "end_date": "2011-01-01",
                    "grade_level": null,
                    "kind": null,
                    "major": null,
                    "organization_id": "54a22fXXXXXXXXXXXXXXXXXX",
                    "organization_name": "Citadel Investment Group",
                    "raw_address": null,
                    "start_date": "2011-01-01",
                    "title": "Investment & Trading Associate",
                    "updated_at": "2021-11-09T22:51:18.536Z",
                    "id": "618afbXXXXXXXXXXXXXXXXXX",
                    "key": "618afbXXXXXXXXXXXXXXXXXX"
                }
            ],
            "state": "Texas",
            "city": "Austin",
            "country": "United States",
            "organization_id": "5e66b6XXXXXXXXXXXXXXXXXX",
            "organization": {
                "id": "5e66b6XXXXXXXXXXXXXXXXXX",
                "name": "Apollo.io",
                "website_url": "http://www.apollo.io",
                "blog_url": null,
                "angellist_url": null,
                "linkedin_url": "http://www.linkedin.com/company/apolloio",
                "twitter_url": "https://twitter.com/MeetApollo/",
                "facebook_url": "https://www.facebook.com/MeetApollo/",
                "primary_phone": {
                    "number": "(202) 374-XXXX",
                    "source": "Account"
                },
                "languages": [],
                "alexa_ranking": 685,
                "phone": "(202) 374-XXXX",
                "linkedin_uid": "185115XX",
                "founded_year": 2015,
                "publicly_traded_symbol": null,
                "publicly_traded_exchange": null,
                "logo_url": "https://zenprospect-production.s3.amazonaws.com/uploads/pictures/6188c0967ae1c20001869130/picture",
                "crunchbase_url": null,
                "primary_domain": "apollo.io",
                "persona_counts": {}
            },
            "account_id": "616d0eXXXXXXXXXXXXXXXXXX",
            "account": {
                "id": "616d0eXXXXXXXXXXXXXXXXXX",
                "name": "Apollo",
                "website_url": "http://www.apollo.io",
                "blog_url": null,
                "angellist_url": null,
                "linkedin_url": "http://www.linkedin.com/company/apolloio",
                "twitter_url": "https://twitter.com/MeetApollo/",
                "facebook_url": "https://www.facebook.com/MeetApollo/",
                "primary_phone": {
                    "number": "(202) 374-XXXX",
                    "source": "Account"
                },
                "languages": [],
                "alexa_ranking": 685,
                "phone": "(123) 456-XXXX",
                "linkedin_uid": "185115XX",
                "founded_year": 2015,
                "publicly_traded_symbol": null,
                "publicly_traded_exchange": null,
                "logo_url": "https://zenprospect-production.s3.amazonaws.com/uploads/pictures/6188c0967ae1c20001869130/picture",
                "crunchbase_url": null,
                "primary_domain": "apollo.io",
                "persona_counts": {},
                "domain": "apollo.io",
                "team_id": "5c1004a041f5ac0995d5f5e8",
                "organization_id": "5e66b6XXXXXXXXXXXXXXXXXX",
                "account_stage_id": "5c1004XXXXXXXXXXXXXXXXXX",
                "source": "crm",
                "original_source": "crm",
                "owner_id": null,
                "created_at": "2021-10-18T06:03:45.774Z",
                "phone_status": "no_status",
                "test_predictive_score": null,
                "hubspot_id": "699261XXXX",
                "salesforce_id": null,
                "crm_owner_id": "511281XX",
                "parent_account_id": null,
                "sanitized_phone": "+112345XXXXX",
                "account_playbook_statuses": [],
                "existence_level": "full",
                "label_ids": [],
                "typed_custom_fields": {},
                "modality": "account",
                "hubspot_record_url": "https://app.hubspot.com/sales/25200013/company/699261XXXX",
                "salesloft_id": "233684XX",
                "salesloft_url": "https://app.salesloft.com/app/company/233684XX"
            }
        }
    ]
}
```

This endpoint searches for people. Calls to the search endpoint do not cost you credits. They also do not return any email information. To get email information, use the "enrich" endpoint.

`POST https://api.apollo.io/v1/mixed_people/search`

### Query Parameters

Parameter | Description | Example
--------- | ----------- | -----------
person_titles (optional) | an array of the person's title. Apollo will return results matching ANY of the titles passed in |  ["sales director", "engineer manager"]
q_organization_domains (optional) | an array of the company domains to search for, joined by the new line character.  | "google.com\nfacebook.com"
page (optional) | an integer that allows you to paginate through the results  | 1

### Return Results
"people" are people in Apollo's database.
"contacts" are people already in your linked CRM.


## Enrichment

> Sample request:

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "id": "583f2f7ed9ced98ab5bfXXXX",
    "first_name": "Tim",
    "last_name": "Zheng",
    "organization_name": "Apollo",
    "email": "name@domain.io",
    "domain": "apollo.io"
}' "https://api.apollo.io/v1/people/match"
```

> Sample response:

```json
{
    "person": {
        "id": "583f2f7ed9ced98ab5bfXXXX",
        "first_name": "Tim",
        "last_name": "Zheng",
        "name": "Tim Zheng",
        "linkedin_url": "http://www.linkedin.com/in/tim-zheng-677ba010",
        "title": "Founder & CEO",
        "city": "San Francisco",
        "email_status": null,
        "photo_url": "https://media-server.url",
        "twitter_url": null,
        "github_url": null,
        "facebook_url": null,
        "extrapolated_email_confidence": null,
        "headline": "Founder & CEO at Apollo",
        "country": "United States",
        "email": "name@domain.io",
        "state": "CA",
        "excluded_for_leadgen": false,
        "contact_id": "5da8ceXXXXXXXXXXXXXXXX",
        "contact": {
            "id": "5da8ceXXXXXXXXXXXXXXXX",
            "first_name": "Tim",
            "last_name": "Zheng",
            "name": "Tim Zheng",
            "linkedin_url": "http://www.linkedin.com/in/tim-zheng-677ba010",
            "title": "Founder & CEO",
            "contact_stage_id": "5c48fb36ae29ba0f376d11ab",
            "owner_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "person_id": "5eb53cXXXXXXXXXXXXXXXX",
            "email_needs_tickling": false,
            "organization_name": "Apollo",
            "source": "search",
            "original_source": "email_import",
            "organization_id": "5e66b6XXXXXXXXXXXXXXXX",
            "headline": "Founder & CEO at Apollo",
            "photo_url": "https://static-exp2.licdn.com/sc/h/djzv59yelk5urv2ujlazfyvrk",
            "present_raw_address": "San Francisco, California, United States",
            "linkedin_uid": "38777275",
            "extrapolated_email_confidence": 0,
            "salesforce_id": "0031UXXXXXXXXXXXX",
            "salesforce_lead_id": null,
            "salesforce_contact_id": "0031UXXXXXXXXXXXX",
            "salesforce_account_id": "0011UXXXXXXXXXXXX",
            "salesforce_owner_id": "0051UXXXXXXXXXXXX",
            "created_at": "2019-10-17T20:25:07.594Z",
            "lead_request_id": null,
            "test_predictive_score": null,
            "emailer_campaign_ids": [],
            "email_manually_changed": false,
            "direct_dial_status": null,
            "direct_dial_enrichment_failed_at": null,
            "email_status": "verified",
            "account_id": "5f1faXXXXXXXXXXXXXXXX",
            "last_activity_date": "2018-06-26T16:30:35.000+00:00",
            "hubspot_vid": null,
            "hubspot_company_id": null,
            "sanitized_phone": null,
            "merged_crm_ids": [],
            "typed_custom_fields": {
                "5d856e9c6899d00098XXXXXX": "Tim Zheng"
            },
            "updated_at": "2020-07-28T04:44:51.448Z",
            "queued_for_crm_push": false,
            "starred_by_user_ids": [],
            "suggested_from_rule_engine_config_id": null,
            "label_ids": [],
            "has_pending_email_arcgate_request": false,
            "has_email_arcgate_request": false,
            "existence_level": "full",
            "email": "example@domain.com",
            "salesforce_record_url": "https://na85.salesforce.com/0031UXXXXXXXXXXXX",
            "phone_numbers": [],
            "account_phone_note": null
        },
        "revealed_for_current_team": true,
        "organization_id": "5e66b6XXXXXXXXXXXXXXXX",
        "organization": {
            "id": "5e66b6XXXXXXXXXXXXXXXX",
            "name": "Apollo",
            "website_url": "http://www.apollo.io",
            "blog_url": null,
            "angellist_url": null,
            "linkedin_url": "http://www.linkedin.com/company/apolloio",
            "twitter_url": "https://twitter.com/MeetApollo/",
            "facebook_url": "https://www.facebook.com/MeetApollo/",
            "languages": [],
            "alexa_ranking": 1955,
            "phone": null,
            "linkedin_uid": "18511550",
            "publicly_traded_symbol": null,
            "publicly_traded_exchange": null,
            "logo_url": "https://apollo-server.com/uploads/pictures/5f026XXXXXXXXXXXXXXXX/picture",
            "crunchbase_url": null,
            "primary_domain": "apollo.io",
            "persona_counts": {},
            "industry": "computer software",
            "keywords": [
                "sales engagement",
                "lead generation",
                "predictive analytics",
                "lead scoring",
                "sales strategy",
                "conversation intelligence",
                "sales enablement",
                "lead routing",
                "sales development",
                "and email engagement"
            ],
            "estimated_num_employees": 38,
            "snippets_loaded": true,
            "industry_tag_id": "5567cdXXXXXXXXXXXXXXXX",
            "retail_location_count": 0,
            "raw_address": "535 Mission St, Suite 1100, San Francisco, California 94105, US",
            "street_address": "535 Mission St",
            "city": "San Francisco",
            "state": "California",
            "postal_code": "94105",
            "country": "United States",
            "owned_by_organization_id": null,
            "suborganizations": [],
            "num_suborganizations": 0,
            "seo_description": "Apollo is an intelligent, data-first engagement platform that puts structured data at the core of your workflows to help you execute, analyze, and improve on your growth strategy.",
            "short_description": "Apollo is the unified engagement acceleration platform that gives reps the ability to dramatically increase their number of quality conversations and opportunities. Reps are ...",
            "total_funding": null,
            "total_funding_printed": null,
            "latest_funding_round_date": null,
            "latest_funding_stage": null,
            "funding_events": [],
            "technology_names": [
                "Cloudflare DNS",
                "Rackspace MailGun",
                "Gmail",
                "Marketo",
                "Google Apps",
                "Microsoft Office 365",
                "CloudFlare Hosting",
                ...
            ],
            "current_technologies": [
                {
                    "uid": "cloudflare_dns",
                    "name": "Cloudflare DNS",
                    "category": "Domain Name Services"
                },
                {
                    "uid": "rackspace_mailgun",
                    "name": "Rackspace MailGun",
                    "category": "Email Delivery"
                },
                {
                    "uid": "gmail",
                    "name": "Gmail",
                    "category": "Email Providers"
                },
                {
                    "uid": "marketo",
                    "name": "Marketo",
                    "category": "Marketing Automation"
                },
                {
                    "uid": "google_apps",
                    "name": "Google Apps",
                    "category": "Other"
                },
                {
                    "uid": "office_365",
                    "name": "Microsoft Office 365",
                    "category": "Other"
                },
                {
                    "uid": "cloudflare_hosting",
                    "name": "CloudFlare Hosting",
                    "category": "Hosting"
                },
                {
                   ...
                }
            ]
        }
    }
}
```


This endpoint enriches a person's information, the more information you pass in, the more likely we can find a match.  

The enrich endpoint charges you credits for its usage. If a verified email is successfully returned, it will cost you 1 credit. If an email is not found, but Apollo successfully found ALL of the following information: Name, Linkedin Profile, Current Company Information, Apollo will charge a fraction of a credit. Typically this is 0.01 credit per successful enrichment without email. But it may be higher depending on your specific plan.

The enrich endpoint charges credits even if the person is already in your CRM. The enrich endpoint also charges credits if you pass in the same information multiple times.

`POST https://api.apollo.io/v1/people/match`

### Query Parameters

Parameter | Description | Example
--------- | ----------- | -----------
first_name (optional) | The person's first name | Tim
last_name (optional) | The person's last name | Zheng
name (optional) | The person's full name | Tim Zheng
email (optional) | The person's email | example@domani.com
organization_name (optional) | The person's company name | Apollo Inc.
domain (optional) | The person's company domain | apollo.io
id (optional) |  The person's ID obtained from the search endpoint | "583f2f7ed9ced98ab5bfXXXX"