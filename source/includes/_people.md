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

```python
import requests

url = "https://api.apollo.io/v1/mixed_people/search"

data = {
    "api_key": "YOUR API KEY HERE",
    "q_organization_domains": "apollo.io\ngoogle.com",
    "page" : 1,
    "person_titles" : ["sales manager", "engineer manager"]
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
                "logo_url": "https://apollo-server.com/uploads/pictures/6188cXXXXXXXXXXXXXXXXXXX/picture",
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
                "logo_url": "https://apollo-server.com/uploads/pictures/6188cXXXXXXXXXXXXXXXXXXX/picture",
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
            },
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