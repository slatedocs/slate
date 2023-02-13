# Enrichment API

## Bulk People Enrichment

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "reveal_personal_emails": true,
    "details": [
        {
            "first_name": "Tim",
            "last_name": "Zheng",
            "domain": "apollo.io",
            "email": "tim@apollo.io",
            "email_md5": "8d935115b9ff4489f2d1f9249503cadf",
            "email_sha256": "337dc0c1aad74f93af086dcf7dc0289f141c8ef5f44c3f104f07b0f03050ff49",
            "organization_name": "Apollo"
        },
        {
            "first_name": "Roy",
            "last_name": "Chung",
            "email": "roy@apollo.io",
            "email_md5": "7328fddefd53de471baeb6e2b764f78a",
            "email_sha256": "97817c0c49994eb500ad0a5e7e2d8aed51977b26424d508f66e4e8887746a152",
            "organization_name": "Apollo"
        }
    ]
}' "https://api.apollo.io/api/v1/people/bulk_match"
```

```python
import requests

url = "https://api.apollo.io/api/v1/people/bulk_match"

data = {
    "api_key": "YOUR API KEY HERE",
    "reveal_personal_emails": true,
    "details": [
        {
            "first_name": "Tim",
            "last_name": "Zheng",
            "domain": "apollo.io",
            "email_md5": "8d935115b9ff4489f2d1f9249503cadf",
            "email_sha256": "337dc0c1aad74f93af086dcf7dc0289f141c8ef5f44c3f104f07b0f03050ff49",
            "email": "tim@apollo.io",
            "organization_name": "Apollo"
        },
        {
            "first_name": "Roy",
            "last_name": "Chung",
            "email": "roy@apollo.io",
            "email_md5": "7328fddefd53de471baeb6e2b764f78a",
            "email_sha256": "97817c0c49994eb500ad0a5e7e2d8aed51977b26424d508f66e4e8887746a152",
            "organization_name": "Apollo"
        }
    ]
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
   "status":"success",
   "error_code":null,
   "error_message":null,
   "total_requested_enrichments":2,
   "unique_enriched_records":2,
   "missing_records":0,
   "credits_consumed":0.02,
   "matches":[
      {
         "revealed_for_current_team":true,
         "email":"email_not_unlocked@domain.com",
         "email_status":"verified",
         "id":"61c2e2d4bbb92a0001509cce",
         "first_name":"Tim",
         "last_name":"Zheng",
         "name":"Tim Zheng",
         "linkedin_url":"http://www.linkedin.com/in/tim-zheng-677ba010",
         "title":"Founder \u0026 CEO",
         "photo_url":"https://media-exp1.licdn.com/dms/image/C5603AQGiphGg4YXw4Q/profile-displayphoto-shrink_400_400/0/1527618224366?e=1652918400\u0026v=beta\u0026t=ApFqfgq3DodDHyS3m-1bYH9xQfztL_yqUItyo_7sGEQ",
         "twitter_url":null,
         "github_url":null,
         "facebook_url":null,
         "extrapolated_email_confidence":null,
         "headline":"Founder \u0026 CEO at Apollo",
         "organization_id":"5e66b6381e05b4008c8331b8",
         "state":"Texas",
         "city":"Austin",
         "country":"United States",
         "organization":{
            "id":"5e66b6381e05b4008c8331b8",
            "name":"Apollo.io",
            "website_url":"http://www.apollo.io",
            "blog_url":null,
            "angellist_url":null,
            "linkedin_url":"http://www.linkedin.com/company/apolloio",
            "twitter_url":"https://twitter.com/MeetApollo/",
            "facebook_url":"https://www.facebook.com/MeetApollo/",
            "primary_phone":{
               "number":"+1 415-763-6055",
               "source":"Owler"
            },
            "languages":[
               
            ],
            "alexa_ranking":2651,
            "phone":"+1 415-763-6055",
            "linkedin_uid":"18511550",
            "founded_year":2015,
            "publicly_traded_symbol":null,
            "publicly_traded_exchange":null,
            "logo_url":"https://zenprospect-production.s3.amazonaws.com/uploads/pictures/62299e01b86a98000152b0c5/picture",
            "crunchbase_url":null,
            "primary_domain":"apollo.io",
            "persona_counts":{
               
            },
            "industry":"computer software",
            "keywords":[
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
            "estimated_num_employees":200,
            "snippets_loaded":true,
            "industry_tag_id":"5567cd4e7369643b70010000",
            "retail_location_count":0,
            "raw_address":"535 Mission St, Suite 1100, San Francisco, California 94105, US",
            "street_address":"535 Mission St",
            "city":"San Francisco",
            "state":"California",
            "postal_code":"94105",
            "country":"United States"
         },
         "account_id":"6182b6670e22be00ded90b0f",
         "account":{
            "id":"6182b6670e22be00ded90b0f",
            "name":"Apollo.io",
            "website_url":"http://www.apollo.io",
            "blog_url":null,
            "angellist_url":null,
            "linkedin_url":"http://www.linkedin.com/company/apolloio",
            "twitter_url":"https://twitter.com/MeetApollo/",
            "facebook_url":"https://www.facebook.com/MeetApollo/",
            "primary_phone":{
               "number":"+1 415-763-6055",
               "source":"Owler"
            },
            "languages":[
               
            ],
            "alexa_ranking":2651,
            "phone":"2023741312",
            "linkedin_uid":"18511550",
            "founded_year":2015,
            "publicly_traded_symbol":null,
            "publicly_traded_exchange":null,
            "logo_url":"https://zenprospect-production.s3.amazonaws.com/uploads/pictures/62299e01b86a98000152b0c5/picture",
            "crunchbase_url":null,
            "primary_domain":"apollo.io",
            "persona_counts":{
               
            },
            "domain":"apollo.io",
            "team_id":"6181a50999668600ded6fe71",
            "organization_id":"5e66b6381e05b4008c8331b8",
            "account_stage_id":"6181a50999668600ded6fe7c",
            "source":"deployment",
            "original_source":"deployment",
            "owner_id":"6181a50a99668600ded6feed",
            "created_at":"2021-11-03T16:18:47.229Z",
            "phone_status":"no_status",
            "test_predictive_score":null,
            "hubspot_id":null,
            "salesforce_id":null,
            "crm_owner_id":null,
            "parent_account_id":null,
            "sanitized_phone":"+12023741312",
            "account_playbook_statuses":[
               {
                  "_id":"61844b47a4258e00c2499c8e",
                  "added_by_id":"6181a50a99668600ded6feed",
                  "added_on":"2021-11-04T21:06:15.053+00:00",
                  "completed_step_ids":[
                     "6184391f26e0aa00a4ccc56b"
                  ],
                  "created_at":null,
                  "current_step_id":"61844dba8b94530112288546",
                  "finished_reason_cd":"completed_all_steps",
                  "paused_reason_cd":null,
                  "playbook_id":"6184388a0515e4008cbf5129",
                  "position":2,
                  "status_cd":"finished",
                  "updated_at":null,
                  "id":"61844b47a4258e00c2499c8e",
                  "key":"61844b47a4258e00c2499c8e"
               }
            ],
            "existence_level":"full",
            "label_ids":[
               
            ],
            "typed_custom_fields":{
               "618438b906b01300da086546":"Google, Okta, Lyft"
            },
            "modality":"account"
         },
         "phone_numbers":[
            {
               "raw_number":"+1 415-763-6055",
               "sanitized_number":"+14157636055",
               "type":"work_hq",
               "position":0,
               "status":"no_status"
            }
         ]
      },
      {
         "revealed_for_current_team":true,
         "email":"email_not_unlocked@domain.com",
         "email_status":"verified",
         "id":"611c931f1b404b00014e884c",
         "first_name":"Roy",
         "last_name":"Chung",
         "name":"Roy Chung",
         "linkedin_url":"http://www.linkedin.com/in/royychung",
         "title":"Chief Business Officer",
         "photo_url":"https://media-exp1.licdn.com/dms/image/C5603AQFVolaIjLeG3g/profile-displayphoto-shrink_200_200/0/1517707907539?e=1652918400\u0026v=beta\u0026t=cpM4yiTrGbgwEiM61eTYIsdW83u-bmv4m27hiaiJppU",
         "twitter_url":"https://twitter.com/r1strategy",
         "github_url":null,
         "facebook_url":null,
         "extrapolated_email_confidence":null,
         "headline":"Founder @ Apollo - We're Hiring! 🚀",
         "organization_id":"5e66b6381e05b4008c8331b8",
         "state":"California",
         "city":"San Francisco",
         "country":"United States",
         "organization":{
            "id":"5e66b6381e05b4008c8331b8",
            "name":"Apollo.io",
            "website_url":"http://www.apollo.io",
            "blog_url":null,
            "angellist_url":null,
            "linkedin_url":"http://www.linkedin.com/company/apolloio",
            "twitter_url":"https://twitter.com/MeetApollo/",
            "facebook_url":"https://www.facebook.com/MeetApollo/",
            "primary_phone":{
               "number":"+1 415-763-6055",
               "source":"Owler"
            },
            "languages":[
               
            ],
            "alexa_ranking":2651,
            "phone":"+1 415-763-6055",
            "linkedin_uid":"18511550",
            "founded_year":2015,
            "publicly_traded_symbol":null,
            "publicly_traded_exchange":null,
            "logo_url":"https://zenprospect-production.s3.amazonaws.com/uploads/pictures/62299e01b86a98000152b0c5/picture",
            "crunchbase_url":null,
            "primary_domain":"apollo.io",
            "persona_counts":{
               
            },
            "industry":"computer software",
            "keywords":[
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
            "estimated_num_employees":200,
            "snippets_loaded":true,
            "industry_tag_id":"5567cd4e7369643b70010000",
            "retail_location_count":0,
            "raw_address":"535 Mission St, Suite 1100, San Francisco, California 94105, US",
            "street_address":"535 Mission St",
            "city":"San Francisco",
            "state":"California",
            "postal_code":"94105",
            "country":"United States"
         },
         "account_id":"6182b6670e22be00ded90b0f",
         "account":{
            "id":"6182b6670e22be00ded90b0f",
            "name":"Apollo.io",
            "website_url":"http://www.apollo.io",
            "blog_url":null,
            "angellist_url":null,
            "linkedin_url":"http://www.linkedin.com/company/apolloio",
            "twitter_url":"https://twitter.com/MeetApollo/",
            "facebook_url":"https://www.facebook.com/MeetApollo/",
            "primary_phone":{
               "number":"+1 415-763-6055",
               "source":"Owler"
            },
            "languages":[
               
            ],
            "alexa_ranking":2651,
            "phone":"2023741312",
            "linkedin_uid":"18511550",
            "founded_year":2015,
            "publicly_traded_symbol":null,
            "publicly_traded_exchange":null,
            "logo_url":"https://zenprospect-production.s3.amazonaws.com/uploads/pictures/62299e01b86a98000152b0c5/picture",
            "crunchbase_url":null,
            "primary_domain":"apollo.io",
            "persona_counts":{
               
            },
            "domain":"apollo.io",
            "team_id":"6181a50999668600ded6fe71",
            "organization_id":"5e66b6381e05b4008c8331b8",
            "account_stage_id":"6181a50999668600ded6fe7c",
            "source":"deployment",
            "original_source":"deployment",
            "owner_id":"6181a50a99668600ded6feed",
            "created_at":"2021-11-03T16:18:47.229Z",
            "phone_status":"no_status",
            "test_predictive_score":null,
            "hubspot_id":null,
            "salesforce_id":null,
            "crm_owner_id":null,
            "parent_account_id":null,
            "sanitized_phone":"+12023741312",
            "account_playbook_statuses":[
               {
                  "_id":"61844b47a4258e00c2499c8e",
                  "added_by_id":"6181a50a99668600ded6feed",
                  "added_on":"2021-11-04T21:06:15.053+00:00",
                  "completed_step_ids":[
                     "6184391f26e0aa00a4ccc56b"
                  ],
                  "created_at":null,
                  "current_step_id":"61844dba8b94530112288546",
                  "finished_reason_cd":"completed_all_steps",
                  "paused_reason_cd":null,
                  "playbook_id":"6184388a0515e4008cbf5129",
                  "position":2,
                  "status_cd":"finished",
                  "updated_at":null,
                  "id":"61844b47a4258e00c2499c8e",
                  "key":"61844b47a4258e00c2499c8e"
               }
            ],
            "existence_level":"full",
            "label_ids":[
               
            ],
            "typed_custom_fields":{
               "618438b906b01300da086546":"Google, Okta, Lyft"
            },
            "modality":"account"
         },
         "phone_numbers":[
            {
               "raw_number":"+1 415-763-6055",
               "sanitized_number":"+14157636055",
               "type":"work_hq",
               "position":0,
               "status":"no_status"
            }
         ]
      }
   ], 
   "personal_emails": [
       "personalemail1@domain.com",
       "personalemail2@domain.com"
   ],
   "departments": [
       "c_suite", 
       "master_information_technology", 
       "master_operations"
   ],
   "subdepartments": [
       "operations_executive",
       "business_service_management_itsm",
       "operations"
   ],
   "functions": [
       "operations"
   ],
   "seniority": "c_suite"
}
```

This endpoint enriches people information in bulk - the more information you pass in, the more likely we can find a match. 

Up to 10 records can be enriched at the same time through this endpoint. 


### Credit Usage

The enrich endpoint charges you credits for its usage. If a verified email is successfully returned or the list of personal emails is revealed, it will cost you 1 credit. If an email is not found, but Apollo successfully found ALL of the following information: Name, Linkedin Profile, Current Company Information, Apollo will charge a fraction of a credit. Typically this is 0.01 credit per successful enrichment without email. But it may be higher depending on your specific plan.


Duplicate enrichments of the same record will not be charged credits. 

### Rate Limits

Rate limits on this endpoint are 1/10th of what is available on the single enrichment endpoint.

`POST https://api.apollo.io/api/v1/people/bulk_match`

### Request Parameters

Parameter | Description | Example
--------- | ----------- | -----------
first_name (optional) | The person's first name | Tim
last_name (optional) | The person's last name | Zheng
name (optional) | The person's full name | Tim Zheng
email (optional) | The person's email | example@domani.com
email_md5 (optional) | The person's hashed email | 8d935115b9ff4489f2d1f9249503cadf
email_sha256 (optional) | The person's sha 256 hashed email | 97817c0c49994eb500ad0a5e7e2d8aed 51977b26424d508f66e4e8887746a152
organization_name (optional) | The person's company name | Apollo Inc.
domain (optional) | The person's company domain | apollo.io
id (optional) |  The person's ID obtained from the search endpoint | "583f2f7ed9ced98ab5bfXXXX"
reveal_personal_emails (optional) | Flag to reveal personal emails | true


## Bulk Organization Enrichment

```shell
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
    "api_key": "YOUR API KEY HERE",
    "domains": [
        "apollo.io",
        "outreach.com",
        "microsoft.com"
    ]
}' "https://api.apollo.io/api/v1/organizations/bulk_enrich"
```

```python
import requests

url = "https://api.apollo.io/api/v1/organizations/bulk_enrich"

data = {
    "api_key": "YOUR API KEY HERE",
    "domains": [
        "apollo.io",
        "outreach.com",
        "microsoft.com"
    ]
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
   "status":"success",
   "error_code":null,
   "error_message":null,
   "total_requested_domains":3,
   "unique_domains":3,
   "unique_enriched_records":3,
   "missing_records":0,
   "organizations":[
      {
         "id":"5e66b6381e05b4008c8331b8",
         "name":"Apollo.io",
         "website_url":"http://www.apollo.io",
         "blog_url":null,
         "angellist_url":null,
         "linkedin_url":"http://www.linkedin.com/company/apolloio",
         "twitter_url":"https://twitter.com/MeetApollo/",
         "facebook_url":"https://www.facebook.com/MeetApollo/",
         "primary_phone":{
            "number":"+1 415-763-6055",
            "source":"Owler"
         },
         "languages":[
            
         ],
         "alexa_ranking":2651,
         "phone":"+1 415-763-6055",
         "linkedin_uid":"18511550",
         "founded_year":2015,
         "publicly_traded_symbol":null,
         "publicly_traded_exchange":null,
         "logo_url":"https://zenprospect-production.s3.amazonaws.com/uploads/pictures/6232fbed6106460001ca5dc7/picture",
         "crunchbase_url":null,
         "primary_domain":"apollo.io",
         "persona_counts":{
            
         },
         "industry":"computer software",
         "keywords":[
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
         "estimated_num_employees":210,
         "snippets_loaded":true,
         "industry_tag_id":"5567cd4e7369643b70010000",
         "retail_location_count":0,
         "raw_address":"535 mission st, suite 1100, san francisco, california 94105, us",
         "street_address":"535 Mission St",
         "city":"San Francisco",
         "state":"California",
         "country":"United States",
         "postal_code":"94105",
         "owned_by_organization_id":null,
         "account_id":"6182b6670e22be00ded90b0f",
         "account":{
            "id":"6182b6670e22be00ded90b0f",
            "domain":"apollo.io",
            "name":"Apollo.io",
            "team_id":"6181a50999668600ded6fe71",
            "organization_id":"5e66b6381e05b4008c8331b8",
            "account_stage_id":"6181a50999668600ded6fe7c",
            "source":"deployment",
            "original_source":"deployment",
            "owner_id":"6181a50a99668600ded6feed",
            "created_at":"2021-11-03T16:18:47.229Z",
            "phone":"2023741312",
            "phone_status":"no_status",
            "test_predictive_score":null,
            "hubspot_id":null,
            "salesforce_id":null,
            "crm_owner_id":null,
            "parent_account_id":null,
            "sanitized_phone":"+12023741312",
            "account_playbook_statuses":[
               {
                  "_id":"61844b47a4258e00c2499c8e",
                  "added_by_id":"6181a50a99668600ded6feed",
                  "added_on":"2021-11-04T21:06:15.053+00:00",
                  "completed_step_ids":[
                     "6184391f26e0aa00a4ccc56b"
                  ],
                  "created_at":null,
                  "current_step_id":"61844dba8b94530112288546",
                  "finished_reason_cd":"completed_all_steps",
                  "paused_reason_cd":null,
                  "playbook_id":"6184388a0515e4008cbf5129",
                  "position":2,
                  "status_cd":"finished",
                  "updated_at":null,
                  "id":"61844b47a4258e00c2499c8e",
                  "key":"61844b47a4258e00c2499c8e"
               }
            ],
            "existence_level":"full",
            "label_ids":[
               
            ],
            "typed_custom_fields":{
               "618438b906b01300da086546":"Google, Okta, Lyft"
            },
            "modality":"account",
            "persona_counts":{
               
            }
         },
         "departmental_head_count":{
            "engineering":46,
            "business_development":14,
            "support":21,
            "finance":2,
            "marketing":10,
            "administrative":1,
            "product_management":7,
            "arts_and_design":8,
            "operations":7,
            "accounting":2,
            "entrepreneurship":3,
            "information_technology":2,
            "consulting":9,
            "human_resources":6,
            "sales":17,
            "education":3,
            "legal":0,
            "media_and_commmunication":0,
            "data_science":0
         }
      },
      {
         "id":"55ea57fdf3e5bb1430000ac7",
         "name":"Outreach, Inc.",
         "website_url":"http://www.outreach.com",
         "blog_url":null,
         "angellist_url":null,
         "linkedin_url":"http://www.linkedin.com/company/outreach-inc-",
         "twitter_url":null,
         "facebook_url":"https://www.facebook.com/outreachinc",
         "primary_phone":{
            "number":"+1 800-991-6011",
            "source":"Owler"
         },
         "languages":[
            "English",
            "English"
         ],
         "alexa_ranking":597090,
         "phone":"+1 800-991-6011",
         "linkedin_uid":"314305",
         "founded_year":1996,
         "publicly_traded_symbol":null,
         "publicly_traded_exchange":null,
         "logo_url":"https://zenprospect-production.s3.amazonaws.com/uploads/pictures/623369279d4f650001b93cb3/picture",
         "crunchbase_url":null,
         "primary_domain":"outreach.com",
         "persona_counts":{
            
         },
         "industry":"marketing \u0026 advertising",
         "keywords":[
            "outreach marketing product for christian churches",
            "customized design services",
            "professional design",
            "print \u0026 full service delivery",
            "targeted mailings done by inhouse mail services",
            "thought leader in outreach",
            "resource provider \u0026 content network",
            "churches",
            "marketing",
            "professional services",
            "religious organizations"
         ],
         "estimated_num_employees":170,
         "snippets_loaded":true,
         "industry_tag_id":"5567cd467369644d39040000",
         "retail_location_count":1,
         "raw_address":"5550 tech center drive, colorado springs, co 80919, us",
         "street_address":"5550 Tech Center Drive",
         "city":"Colorado Springs",
         "state":"Colorado",
         "country":"United States",
         "postal_code":"80919",
         "owned_by_organization_id":null,
         "departmental_head_count":{
            "accounting":3,
            "operations":4,
            "finance":2,
            "arts_and_design":5,
            "human_resources":3,
            "sales":11,
            "marketing":8,
            "media_and_commmunication":7,
            "product_management":3,
            "engineering":5,
            "consulting":6,
            "support":4,
            "entrepreneurship":2,
            "information_technology":5,
            "business_development":1,
            "administrative":2,
            "legal":0,
            "education":0,
            "data_science":0
         }
      },
      {
         "id":"5d09312ca3ae61489386b467",
         "name":"Microsoft",
         "website_url":"http://www.microsoft.com",
         "blog_url":null,
         "angellist_url":null,
         "linkedin_url":"http://www.linkedin.com/company/microsoft",
         "twitter_url":"https://twitter.com/microsoft",
         "facebook_url":"https://facebook.com/Microsoft",
         "primary_phone":{
            "number":"+1 425-882-8080",
            "source":"Owler"
         },
         "languages":[
            "English"
         ],
         "alexa_ranking":19,
         "phone":"+1 425-882-8080",
         "linkedin_uid":"1035",
         "founded_year":1975,
         "publicly_traded_symbol":"MSFT",
         "publicly_traded_exchange":"nasdaq",
         "logo_url":"https://zenprospect-production.s3.amazonaws.com/uploads/pictures/6232f7976d60b600019c2644/picture",
         "crunchbase_url":null,
         "primary_domain":"microsoft.com",
         "persona_counts":{
            
         },
         "market_cap":"2099.6B",
         "industry":"computer software",
         "keywords":[
            "business software",
            "developer tools",
            "home",
            "educational software",
            "tablets",
            "search",
            "advertising",
            "servers",
            "windows operating system",
            "windows applications",
            "platforms",
            "smartphones",
            "cloud computing",
            "quantum computing",
            "future of work",
            "productivity",
            "ai",
            "artificial intelligence",
            "machine learning",
            "laptops",
            "mixed reality",
            "virtual reality",
            "gaming",
            "developers",
            "it professional",
            "computers",
            "electronics",
            "mobile phones",
            "shopping"
         ],
         "estimated_num_employees":224000,
         "snippets_loaded":true,
         "industry_tag_id":"5567cd4e7369643b70010000",
         "retail_location_count":96,
         "raw_address":"1 microsoft way, redmond, washington 98052, us",
         "street_address":"1 Microsoft Way",
         "city":"Redmond",
         "state":"Washington",
         "country":"United States",
         "postal_code":"98052",
         "owned_by_organization_id":null,
         "departmental_head_count":{
            "sales":10117,
            "business_development":9413,
            "engineering":66732,
            "media_and_commmunication":1612,
            "finance":3079,
            "marketing":5327,
            "operations":3747,
            "support":12733,
            "consulting":5822,
            "product_management":4099,
            "data_science":1922,
            "administrative":350,
            "education":13249,
            "human_resources":3818,
            "arts_and_design":2125,
            "information_technology":3727,
            "legal":625,
            "accounting":476,
            "entrepreneurship":121
         }
      }
   ]
}
```

This endpoint enriches organization information in bulk with info such as industry, company size, etc. based on the domain parameter passed in.

Up to 10 records can be enriched at the same time through this endpoint. 

### Credit Usage

Duplicate enrichments of the same record will not be charged credits. 

### Rate Limits

Rate limits on this endpoint are 1/10th of what is available on the single enrichment endpoint. 

`POST https://api.apollo.io/api/v1/organizations/bulk_enrich`

### Request Parameters

| Parameter | Description        | Example    |
| --------- | ------------------ | ---------- |
| domains    | The company domain | google.com |


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
    "email_md5": "8d935115b9ff4489f2d1f9249503cadf",
    "email_sha256": "337dc0c1aad74f93af086dcf7dc0289f141c8ef5f44c3f104f07b0f03050ff49",
    "domain": "apollo.io",
    "reveal_personal_emails": true
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
    "email_md5": "8d935115b9ff4489f2d1f9249503cadf",
    "email_sha256": "337dc0c1aad74f93af086dcf7dc0289f141c8ef5f44c3f104f07b0f03050ff49",
    "domain": "apollo.io",
    "reveal_personal_emails": true
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
        },
        "personal_emails": [
            "personalemail1@domain.com",
            "personalemail2@domain.com"
        ],
       "departments": [
           "c_suite",
           "master_information_technology",
           "master_operations"
       ],
       "subdepartments": [
           "operations_executive",
           "business_service_management_itsm",
           "operations"
       ],
       "functions": [
           "operations"
       ],
       "seniority": "c_suite"
    }
}
```

This endpoint enriches a person's information, the more information you pass in, the more likely we can find a match.  

The enrich endpoint charges you credits for its usage. If a verified email is successfully returned or the list of personal emails is revealed, it will cost you 1 credit. If an email is not found, but Apollo successfully found ALL of the following information: Name, Linkedin Profile, Current Company Information, Apollo will charge a fraction of a credit. Typically this is 0.01 credit per successful enrichment without email. But it may be higher depending on your specific plan.

The enrich endpoint charges credits even if the person is already in your CRM. The enrich endpoint also charges credits if you pass in the same information multiple times.

`POST https://api.apollo.io/v1/people/match`

### Query Parameters

Parameter | Description | Example
--------- | ----------- | -----------
first_name (optional) | The person's first name | Tim
last_name (optional) | The person's last name | Zheng
name (optional) | The person's full name | Tim Zheng
email (optional) | The person's email | example@domani.com
email_md5 (optional) | The person's hashed email | 8d935115b9ff4489f2d1f9249503cadf 
email_sha256 (optional) | The person's sha 256 hashed email | 97817c0c49994eb500ad0a5e7e2d8aed 51977b26424d508f66e4e8887746a152
organization_name (optional) | The person's company name | Apollo Inc.
domain (optional) | The person's company domain | apollo.io
id (optional) |  The person's ID obtained from the search endpoint | "583f2f7ed9ced98ab5bfXXXX"
reveal_personal_emails (optional) | Flag to reveal personal emails | true


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

