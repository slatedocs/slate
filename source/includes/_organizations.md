# Organizations API

An Organization represents a company in Apollo's database.

## Organization Enrichment

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" "https://api.apollo.io/v1/organizations/enrich?api_key=YOUR_API_KEY_HERE&domain=apollo.io"
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
        "logo_url": "https://zenprospect-production.s3.amazonaws.com/uploads/pictures/61824ff04db2a60001eedb85/picture",
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

## Organization Jobs Postings

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" "https://api.apollo.io/v1/organizations/ORGANIZATION_ID/job_postings?api_key=YOUR_API_KEY_HERE"
```

> Sample response:

```json
{
  "organization_job_postings": [
    {
      "id": "5ed76XXXXXXXXXXXXXXXX",
      "title": "Product Marketing Manager, Security",
      "url": "https://www.linkedin.com/jobs/view/product-marketing-manager-security-at-google-1878106711?refId=e19c8d31-7452-4bfc-8097-66ab00fe06a8&position=14&pageNum=9&trk=public_jobs_job-result-card_result-card_full-click",
      "city": "San Francisco",
      "state": "California",
      "country": "United States",
      "last_seen_at": "2020-06-03T09:09:57.751+00:00",
      "posted_at": "2020-06-03T07:09:57.751+00:00"
    },
    {
      "id": "5ed768XXXXXXXXXXXXXXXX",
      "title": "Product Marketing Manager, Security",
      "url": "https://www.linkedin.com/jobs/view/product-marketing-manager-security-at-google-1878108613?refId=e19c8d31-7452-4bfc-8097-66ab00fe06a8&position=17&pageNum=9&trk=public_jobs_job-result-card_result-card_full-click",
      "city": "Sunnyvale",
      "state": "California",
      "country": "United States",
      "last_seen_at": "2020-06-03T09:09:57.754+00:00",
      "posted_at": "2020-06-03T07:09:57.754+00:00"
    },
    {
      "id": "5ed768XXXXXXXXXXXXXXXX",
      "title": "Staff Software Engineer, Platforms, Google Cloud",
      "url": "https://www.linkedin.com/jobs/view/staff-software-engineer-platforms-google-cloud-at-google-1878104847?refId=e19c8d31-7452-4bfc-8097-66ab00fe06a8&position=18&pageNum=9&trk=public_jobs_job-result-card_result-card_full-click",
      "city": "Sunnyvale",
      "state": "California",
      "country": "United States",
      "last_seen_at": "2020-06-03T09:09:57.755+00:00",
      "posted_at": "2020-07-30T07:32:24.298+00:00"
    }
  ]
}
```

Get a list of active job postings for a company.

`GET https://api.apollo.io/v1/organizations/ORGANIZATION_ID/job_postings`

### Query Parameters

| Parameter | Description                                                                                                                 | Example                  |
| --------- | --------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| id        | The id of the organization (i.e. NOT account id). You can obtain this with a company's domain by using the enrich endpoint. | 54fca1087369647fcXXXXXXX |
