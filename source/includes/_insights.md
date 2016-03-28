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
{
  "data": [
    {
      "applications": {
        "coverletter_count": 0,
        "view_count_percent": 0,
        "currently_employed_count": 0,
        "count": 0,
        "currently_employed_percent": 0,
        "coverletter_percent": 0,
        "view_count": 0
      },
      "id": "cea0b50d-caab-4e61-82f4-5d4da53452c4",
      "locations": {
        "percent": 0,
        "count": 0,
        "by_country_subdivision": {
          
        },
        "by_country": {
          
        },
        "all": [
          
        ]
      },
      "experience": {
        "most_common": null,
        "percent": 0,
        "count": 0,
        "by5_year_range": {
          
        },
        "average": 0,
        "all": [
          
        ]
      },
      "salaries": {
        "percent": 0,
        "count": 0,
        "desired": {
          "by_currency": {
            
          }
        },
        "recent": {
          "by_currency": {
            
          }
        }
      },
      "company": {
        "country_subdivision": null,
        "name": null,
        "longitude": 0,
        "latitude": 0,
        "country": null,
        "city": null
      },
      "degrees": {
        "most_common": null,
        "by_level": {
          
        },
        "all": [
          
        ]
      },
      "created_at": "2015-10-30T10:29:47.553",
      "version": "2015-06-22",
      "job_id": "J3K87X74DDBHDG1S73B",
      "job": {
        "title": "Example Title",
        "modified_at": "2015-10-30T10:29:47.553",
        "expires_at": "1970-01-01T00:00:00",
        "created_at": "2015-10-30T10:29:47.553",
        "requirements": {
          "degree": "DRNS",
          "experience": -1
        }
      }
    }
  ],
  "page": 1,
  "page_size": 1,
  "total": 1
}
```

This enpoint will retrieve a summary report of all the applicants to a given job.

### HTTP Request

`GET https://api.careerbuilder.com/consumer/job-insights/{job-id}`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
{job-id} | none | You must supply a job id in the url