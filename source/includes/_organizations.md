# Organizations API

An Organization represents a company in Apollo's database.

## Organization jobs postings

> Sample request:

```shell
curl -X GET -H "Content-Type: application/json" -H "Cache-Control: no-cache" "https://api.apollo.io/v1/organizations/ORGANIZATION_ID/job_postings?api_key=YOUR_API_KEY_HERE"
```

```python
import requests

url = "https://api.apollo.io/v1/organizations/ORGANIZATION_ID/job_postings"

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

### Query parameters

| Parameter | Description                                                                                                                 | Example                  |
| --------- | --------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| id        | The id of the organization (i.e. NOT account id). You can obtain this with a company's domain by using the enrich endpoint. | 54fca1087369647fcXXXXXXX |
