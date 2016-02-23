# Job Insights

## Get Job Report

```ruby
```

```shell
curl "https://api.careerbuilder.com/consumer/job-insights/J12345678987654321"
  -H "Authorization: Bearer YOUR_HAPPY_TOKEN"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This enpoint will retrieve a summary report of all the applicants to a given job.

### HTTP Request

`GET https://api.careerbuilder.com/consumer/job-insights/{job-id}`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
{job-id} | none | You must supply a job id in the url