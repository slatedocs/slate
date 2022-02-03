# Enrichment API

## People Enrichment

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

```python
import requests

url = "https://api.apollo.io/v1/people/match"

data = {
    "api_key": "YOUR API KEY HERE",
    "id": "583f2f7ed9ced98ab5bfXXXX",
    "first_name": "Tim",
    "last_name": "Zheng",
    "organization_name": "Apollo",
    "email": "name@domain.io",
    "domain": "apollo.io"
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


## Organization Enrichment 

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" "https://api.apollo.io/v1/organizations/enrich?api_key=YOUR_API_KEY_HERE&domain=apollo.io"
```

```python
import requests

url = "https://api.apollo.io/v1/organizations/enrich"

querystring = {
    "api_key": "YOUR API KEY HERE",
    "domain": "apollo.io"
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
            "number": "202374XXXX",
            "source": "Account"
        },
        "languages": [],
        "alexa_ranking": 522,
        "phone": "202374XXXX",
        "linkedin_uid": "185115XX",
        "founded_year": 2015,
        "publicly_traded_symbol": null,
        "publicly_traded_exchange": null,
        "logo_url": "https://apollo-server.com/uploads/pictures/61824XXXXXXXXXXXXXXXXXXX/picture",
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
            "email engagement",
            "revenue intelligence",
            "sales operations",
            "demand generation"
        ],
        "estimated_num_employees": 170,
        "snippets_loaded": true,
        "industry_tag_id": "5567cdXXXXXXXXXXXXXXXXXX",
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
        "seo_description": "Apollo is a data-first engagement platform that embeds intelligence within your workflows to help you execute, analyze, and improve on your growth strategy.",
        "short_description": "Apollo is the unified engagement acceleration platform that gives reps the ability to dramatically increase their number of quality conversations and opportunities. Reps are empowered do more than just conduct outreach, they learn who to target, how to reach out, and what to say at speed and scale. We help drive growth and success by providing the means for teams to discover and utilize their organization’s unique best practices. \n\nBy working in a unified platform, reps and managers alike save hours of time each day, strategy changes are instantly scaled across the whole team, and managers can finally dig into data at each step of their pipeline to continually find new ways to improve. \n\nTeams get access to our database of 200+ million contacts with a built-in fully customizable Scoring Engine, full sales engagement stack, our native Account Playbook builder, and the industry’s only custom deep analytics suite. Managers create and enforce order and process with the industry’s most advanced Rules Engine.\n\nApollo is the foundation for your entire end-to-end sales strategy.\n\nJoin teams like Autodesk, Copper (ProsperWorks), and Snowflake to experience the future of sales today. Ready to join our crew? Email sales@apollo.io. ",
        "annual_revenue_printed": "10M",
        "annual_revenue": 10000000,
        "total_funding": 9200000,
        "total_funding_printed": "9.2M",
        "latest_funding_round_date": "2018-06-26T00:00:00.000+00:00",
        "latest_funding_stage": "Series A",
        "funding_events": [
            {
                "id": "5ffe93XXXXXXXXXXXXXXXXXX",
                "date": "2018-06-26T00:00:00.000+00:00",
                "news_url": "https://techcrunch.com/2018/06/26/yc-grad-zenprospect-rebrands-as-apollo-lands-7-m-series-a/",
                "type": "Series A",
                "investors": "Nexus Venture Partners",
                "amount": "7M",
                "currency": "$"
            },
            {
                "id": "5ffe93XXXXXXXXXXXXXXXXXX",
                "date": "2016-10-01T00:00:00.000+00:00",
                "news_url": null,
                "type": "Other",
                "investors": "Y Combinator, SV Angel, Social Capital, Nexus Venture Partners",
                "amount": "2.2M",
                "currency": "$"
            }
        ],
        "technology_names": [
            "Cloudflare DNS",
            "Mailchimp Mandrill",
            "Gmail",
            "Marketo",
            "Google Apps",
            "Microsoft Office 365",
            "CloudFlare Hosting",
            "Route 53",
            "Zendesk",
            "Google Cloud Hosting",
            "Stripe",
            "Lever",
            "Segment.io",
            "Amplitude",
            "Hubspot",
            "Nginx",
            "CrazyEgg",
            "Squarespace ECommerce",
            "Linkedin Marketing Solutions",
            "Yandex Metrica",
            "Mobile Friendly",
            "Typekit",
            "Google Tag Manager"
        ],
        "current_technologies": [
            {
                "uid": "cloudflare_dns",
                "name": "Cloudflare DNS",
                "category": "Domain Name Services"
            },
            {
                "uid": "mailchimp_mandrill",
                "name": "Mailchimp Mandrill",
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
            }
        ],
        "account_id": "614264XXXXXXXXXXXXXXXXXX",
        "account": {
            "id": "614264XXXXXXXXXXXXXXXXXX",
            "domain": "apollo.io",
            "name": "Apollo",
            "team_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "organization_id": "5e66b6XXXXXXXXXXXXXXXXXX",
            "account_stage_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "source": "salesforce",
            "original_source": "salesforce",
            "owner_id": "5c1004XXXXXXXXXXXXXXXXXX",
            "created_at": "2021-09-15T21:24:18.374Z",
            "phone": "(123) 456-XXXX",
            "phone_status": "no_status",
            "test_predictive_score": null,
            "hubspot_id": null,
            "salesforce_id": "0015g0XXXXXXXXXXXX",
            "crm_owner_id": "0055g0XXXXXXXXXXXX",
            "parent_account_id": null,
            "sanitized_phone": "+112345XXXXX",
            "account_playbook_statuses": [],
            "existence_level": "full",
            "label_ids": [],
            "typed_custom_fields": {},
            "modality": "account",
            "persona_counts": {}
        },
        "departmental_head_count": {
            "engineering": 45,
            "accounting": 4,
            "product_management": 5,
            "support": 31,
            "arts_and_design": 10,
            "sales": 37,
            "education": 6,
            "consulting": 10,
            "human_resources": 10,
            "business_development": 22,
            "operations": 10,
            "finance": 8,
            "entrepreneurship": 4,
            "marketing": 7,
            "information_technology": 5,
            "administrative": 3,
            "legal": 0,
            "media_and_commmunication": 0,
            "data_science": 0
        }
    }
}
```

This endpoint enriches a company with info such as industry, company size, etc. based on the domain parameter passed in.

`GET https://api.apollo.io/v1/organizations/enrich`

### Query Parameters

| Parameter | Description        | Example    |
| --------- | ------------------ | ---------- |
| domain    | The company domain | google.com |

