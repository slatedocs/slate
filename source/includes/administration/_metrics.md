## Metrics

The metrics API can be queried to obtain data related to different organizations, environments, or workloads

### Retrieve Metrics for a Specified Interval

<!-- GET METRICS FOR INTERVAL -->

`GET /metrics/{serviceCode}/{metricId}`

Retrieves metrics for a given metric id in a specified interval

```shell
# Retrieve metrics for a given interval
curl "https://cloudmc_endpoint/rest/metrics/stackpath-cox-dev/ingress_bandwidth?startDate=2021-08-12T10:50:46.386Z&endDate=2021-08-15T10:50:46.386Z&size=12&unit=hours" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
        "ingress_bandwidth": [
            {
                "label": "2021-08-12T12:00:00.000",
                "value": 0.24
            },
            {
                "label": "2021-08-13T00:00:00.000",
                "value": 0.30
            },
            {
                "label": "2021-08-13T12:00:00.000",
                "value": 0.25
            },
            {
                "label": "2021-08-14T00:00:00.000",
                "value": 0.27
            },
            {
                "label": "2021-08-14T12:00:00.000",
                "value": 0.30
            },
            {
                "label": "2021-08-15T00:00:00.000",
                "value": 0.27
            }
        ]
    }
}
```

Path Parameters | &nbsp;
---- | -----------
`serviceCode`<br/>*String* | A globally unique code that identifies this service connection..
`metricId`<br/>*String* | A unique identifier used to define a `MetricDescriptor`.

Required Query Parameters | &nbsp;
---- | -----------
`startDate`<br/>*Date* | The start date of the interval to query metrics for. The date must be in a valid ISO-8601 format. The start date must be provided to query this endpoint.
`endDate`<br/>*Date* | The start date of the interval to query metrics for. The date must be in a valid ISO-8601 format.  The end date must be provided to query this endpoint.

Optional Query Parameters | &nbsp;
---- | -----------
`environment`<br/>*String* | The name of the environment to query metrics for.
`aggregationType`<br/>*String* | How the queried metrics should be aggregated. The possible values are sum, count, min, max, avg (average). When not provided, the default value used is `average`.
`size`<br/>*Int* | The size of the granularity used to aggregate data points. The size must be a positive integer value. When combined with `unit`, this forms an expression similar to `1 hour`, or `1 day`, etc. When not provided, the default value used is `5`.
`unit`<br/>*String* | The unit of the granularity used to aggregate data points. The unit must be a valid Java Chronounit. When not provided, the default value is `minutes`. 
`entityType`<br/>*String* | the type of entity to query metrics for.
`entityId`<br/>*UUID* | The id of the entity to query metrics for.
`groupBy`<br/>*String* | .


Attributes | &nbsp;
---- | -----------
`label`<br/>*UUID* | The timestamp used to label the value returned by the query.
`value`<br/>*Object* | The value of the metric at the given timestamp.
