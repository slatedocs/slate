## Usage

<!-------------------- LIST USAGE SUMMARY -------------------->

### List organization usage summary

`GET /usage_summary/organizations/:id`

```shell
# Retrieve usage summary in JSON
curl "https://cloudmc_endpoint/api/v1/usage_summary/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5?start_date=2017-05-01&end_date=2017-05-15&format=json" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [{
    "organizationId": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e",
    "serviceConnectionId": "beeba736-0451-49b0-8020-8b93ed5abb35",
    "serviceConnectionPricingId": "e37cc44a-47b6-4a26-81f5-1dbf85433e36",
    "utilityCost": 0.66,
    "utilityUsage": 5.49999878,
    "startDate": "2017-05-01T00:00:00.000Z",
    "endDate": "2017-05-01T01:00:00.000Z",
    "usageType": "1",
    "secondaryType": "RAM"
  }]
}
```

```shell
# Retrieve usage summary in CSV
curl "https://cloudmc_endpoint/api/v1/usage_summary/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5?start_date=2017-05-01&end_date=2017-05-15&format=csv" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```
organizationId,serviceConnectionId,startDate,endDate,usageType,secondaryType,serviceConnectionPricingId,utilityCost,utilityUsage
52fd201e-aa82-4a27-86b3-ea9650a7fb1e,beeba736-0451-49b0-8020-8b93ed5abb35,2017-05-01T00:00:00.000Z,2017-05-01T01:00:00.000Z,1,RAM,e37cc44a-47b6-4a26-81f5-1dbf85433e36,0.660000,5.49999878
```

Retrieve the usage summary records for an organization and all of its sub-organizations for a specific period. The response can be in JSON (default) or CSV format. Additionally, you can aggregate these records using the different query parameters available.

*Note*: Old records are aggregated by day instead of hour. If you try to query those records per hour, then you will receive an empty list.

Attributes | &nbsp;
---- | -----------
`organizationId`<br/>*UUID* | Id of the [organization](#administration-organizations).
`serviceConnectionId`<br/>*UUID* | Id of the [service connection](#administration-service-connections).
`serviceConnectionPricingId`<br/>*UUID* | Id of the service connection pricing.
`utilityCost`<br/>*string* | Utility cost of the record (aggregated per the period).
`utilityUsage`<br/>*string* | Utility usage of the record.
`startDate`<br/>*string* | Start date of the record in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601).
`endDate`<br/>*string* | End date of the record in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601).
`usageType`<br/>*string* | Usage type of the record.
`secondaryType`<br/>*string* | Secondary type of the record.

*Note*: The `utilityUsage` reported by this API is the total usage recorded for the specified period. The resource commitment is not taken into account for this endpoint but is outlined in the endpoint `/top_level/organizations/{org_id}` below.

Query Parameters (*required*) | &nbsp;
---------- | -----
`start_date`<br/>*String* | Start date (inclusive). Should have the following format YYYY-MM-DD.
`end_date`<br/>*String* | End date (exclusive). Should have the following format YYYY-MM-DD.

Query Parameters | &nbsp;
---------- | -----
`service_connection_id`<br/>*UUID* | Show usage summary for this service connection.
`include_sub_orgs`<br/>*boolean* | Include usage summary of all its sub-organizations. Defaults to false.
`include_cost`<br/>*boolean* | Include the utility cost and service connection pricing id fields. Defaults to true.
`include_free_usage`<br/>*boolean* | Include all summary records that has no cost associated to it (i.e. utilityCost == 0). Defaults to true.
`combine_usage_types`<br/>*boolean* | Sums up the utility cost per organization and service connection. The following fields are removed from the output: `serviceConnectionPricingId`, `usageType`, `secondaryType`, `utilityUsage`.
`period`<br/>*String* | The period on which the aggregation is made. HOUR, DAY or PERIOD. The default is HOUR.
`format`<br/>*String* | JSON or CSV. Defaults to JSON.
`include_deleted`<br/>*boolean* | Will find usage of an organization that may have been deleted.

### List top level organization usage summary

`GET /usage_summary/top_level/organizations/:id`<br/>


```shell
# Retrieve usage summary in JSON
curl -X GET \
  'https://cloudmc_endpoint/rest/usage_summary/top_level/organizations/52fd201e-aa82-4a27-86b3-ea9650a7fb1e?start_date=2019-03-12&end_date=2019-03-13' \
  -H 'content-type: application/json' \
  -H 'mc-api-key: your_api_key' \
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
   {
     "organizationId": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e",
     "serviceConnectionId": "818fa22d-1621-4cf3-87c3-4c10b146524c",
     "serviceConnectionPricingId": "c2e38b0d-9b6e-4e79-959f-731cf3d00b1a",
     "usageType": "1",
     "secondaryType": "RAM",
     "utilityCost": 0.480000,
     "utilityUsage": 3.99999910,
     "resourceCommitmentUsage": 1.0000000,
     "startDate": "2019-03-12T00:00:00Z",
     "endDate": "2019-03-12T01:00:00Z"
   }]
}
```

Retrieves the usage summary records for top level organization and its sub-organizations for a specific period ensuring that usage is split between two buckets, resource commitment usage and utility usage. The response format will be in the JSON format.

##### Resource Commitment Usage:
The usage that is counted toward a pre assigned pool of resources defined by the Resource Commitment of the organization on a specified service connection. The resource commitment usage is capped by the resource commitment capacity which is the total amount of resource allocated to the organization.

##### Utility Usage:
Usage that bursts outside of the allocated resource commitment if one exists. Note that utility usage will only appear in the response when the `actualUsage` > `resourceCommitmentsUsage`. Note that the `resourceCommitmentUsage` will always be less than or equal to the `resourceCommitmentCapacity` which is defined by the commitment.

The following will always hold:
`utilityUsage + resourceCommitmentUsage = actualUsage`

Attributes | &nbsp;
---- | -----------
`organizationId`<br/>*UUID* | Id of the [organization](#administration-organizations).
`serviceConnectionId`<br/>*UUID* | Id of the [service connection](#administration-service-connections).
`serviceConnectionPricingId`<br/>*UUID* | Id of the service connection pricing.
`utilityCost`<br/>*string* | Utility cost of the record (aggregated per the period).
`utilityUsage`<br/>*string* | Utility usage of the record.
`resourceCommitmentUsage`<br/>*string* | The amount of usage that was counted toward the commitment capacity defined by the resource commitment.
`startDate`<br/>*string* | Start date of the record in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601).
`endDate`<br/>*string* | End date of the record in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601).
`usageType`<br/>*string* | Usage type of the record.
`secondaryType`<br/>*string* | Secondary type of the record.

Query Parameters (*required*) | &nbsp;
---------- | -----
`start_date`<br/>*String* | Start date (inclusive). Should have the following format YYYY-MM-DD.
`end_date`<br/>*String* | End date (exclusive). Should have the following format YYYY-MM-DD.

Query Parameters | &nbsp;
---------- | -----
`service_connection_id`<br/>*UUID* | Show usage summary for this service connection.
`include_sub_orgs`<br/>*boolean* | Include usage summary of all its sub-organizations. Defaults to false.
`include_cost`<br/>*boolean* | Include the utility cost and service connection pricing id fields. Defaults to true.
`include_free_usage`<br/>*boolean* | Include all summary records that has no cost associated to it (i.e. utilityCost == 0). Defaults to true.
`combine_usage_types`<br/>*boolean* | Sums up the utility cost per organization and service connection. The following fields are removed from the output: `serviceConnectionPricingId`, `usageType`, `secondaryType`, `utilityUsage`.
`period`<br/>*String* | The period on which the aggregation is made. HOUR, DAY or PERIOD. The default is HOUR.
`include_deleted`<br/>*boolean* | Will find usage of an organization that may have been deleted.

## Retrieve service usage

`GET /service/usage`

```shell
# Retrieve customer usage
curl -X POST "https://cloudmc_endpoint/rest/service/usage?page=1&page_size=1" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
 "data": {
  "records": [
   {
    "id": "a855e912f682b398379eefd5bbeffa2e:805",
    "usageType": "memory_type",
    "usage": 143.99833333333333,
    "unit": "gibibyte-hour",
    "connectionId": "081ffa1f-1531-4dd5-a7e2-070e560409ce",
    "connectionName": "Edge Services",
    "organizationId": "ca785487-5e22-4bac-ab01-187260b0d0cb",
    "organizationName": "Cox",
    "environmentId": "207ed06a-5b20-4d79-a7eb-d9ac4878519b",
    "environmentName": "jdias-test-jason",
    "startDate": "2022-01-01T00:00:00Z",
    "endDate": "2022-01-02T00:00:00Z",
    "fields": {
     "PoP": "Phoenix",
     "type": "Container",
     "region": "NA"
    },
    "metricType": "GAUGE",
    "metadata": {
     "serviceCode": "edge-cloud-beta",
     "account_id": "69b60c67-6175-4515-bb65-033108305d66",
     "stackId": "cb9caf46-323f-402c-b173-742ba464e50e",
     "service_account_id": "657c6671-872f-4590-8e31-a9bc6589918b",
     "stackSlug": "jdias-test-jaso-7vhhr3lplg-env",
     "client_id": "4e0c5f157c5d089671a57c4132205667",
     "credential_id": "8b4e6d56-216b-4c70-8ce6-d283042aa3b9"
    }
   }
  ],
  "metadata": {
   "totalCount": 13922,
   "totalPageCount": 13923,
   "count": 1,
   "page": 1
  }
 }
}
```

| Record Attributes                 | Description
| ------------------                | ---------------
| id <br> *String*                  | The id of the record.
| usageType <br> *String*           | The type of the underlying usage.
| usage <br> *Number*               | The amount of usage within this usage records period.
| unit <br> *String*                | The unit attributed to the usage.
| connectionId <br> *String*        | The id of the connection on which this usage was generated.
| connectionName <br> *String*      | The name of the connection on which this usage was generated.
| organizationId <br> *String*      | The id of the organization on which this usage was generated.
| organizationName <br> *String*    | The name of the organization on which this usage was generated.
| environmentId <br> *String*       | The id of the environment on which this usage was generated.
| environmentName <br> *String*     | The name of the environment on which this usage was generated.
| startDate <br> *ISO8601 Date Time*| The start date of the record (inclusive)
| endDate <br> *ISO8601 Date Time*  | The end date of the record (exclusive)
| fields <br> *Object*              | Attributes of the underlying resource that created this usage
| metricType <br> *String*          | The type of usage specified. [COUNTER,GAUGE].
| metadata <br> *Object*            | Attributes of the underlying environment under which this usge was created.

| Metadata Attributes           | Description
| ------------------            | ---------------
| totalCount <br> *Number*      | The total number of records satisfying the query.
| totalPageCount <br> *Number*  | The total number of pages.
| count <br> *Number*           | The number of records returned on this page only.
| page <br> *Number*            | The page returned. Always the same as the page requested.


### Query Options

| Optional Query Parameters  | Description                                        | Default Behaviour (when not specified)
---------------------------- | ------------                                       | -----------------
| organization_id            | Retrieve the usage of a specific organization only | All orgs you have visibility on
| environment_Id             | Retrieve the usage of a specific environment only  | All environments you visibility on
| connection_id              | Retrieve the usage of a specific connection only   | All connections you have visibility on
| usage_type                 | Retrieve the usage of a specific usage type only   | All usage types
| start_date (inclusive)     | Retrieve the usage starting from the requested date| The last 7 days or for the granularity specified. I.e. last year if YEARLY, last month if MONTHLY
| end_date                   | Retrieve the usage up to the specific date only    | The time of the request

To retrieve data as a json response please supply the `application/json` Accept header in your request. For example:

```shell
curl -X POST "https://cloudmc_endpoint/rest/service/usage" \
   -H "MC-Api-Key: your_api_key" \
   -H "Accept: application/json"
```

| Query parameters (application/json)                | Description                                        | Default Behaviour (when not specified)  
| -------------------------------------------------- | -----------                                        | -------------------------------------
| page                                               | The page of data to retrieve [1,...,N]             | 1
| page_size                                          | The size of the page to retrieve (max: 1000)       | 100
| granularity<sup>2</sup>                            | [YEARLY, MONTHLY, DAILY, HOURLY]. Transforms the data into the requested granularity | No transformation is made
| next_page_token                                    | For requests that specify a granularity, may be used to retrieve the next page of results.  


<sup>2</sup> Note: a granularity query is expensive and may take time. When specifying a granularity, traditional paging is not performed. Up to 65,536 results may be returned. If there are more than 65,536 results only the first 65,536 results will be returned and subsequent records maybe retrieved by specifying the `next_page_token` query param in the request. The token will be provided in the response.

```js
{
  "records": [...],
  "metadata": {
    "count": 65536,
    "next_page_token": "ewogICJzb3J0IjogInN0YXJ0RGF0ZSIsCiAgInZhbHVlIjogMTY1MDU1NTQ0OQp9"
  }
}
```

To retrieve data as a csv response please supply the `text/csv` Accept header in your request. For example:

```shell
curl -X POST "https://cloudmc_endpoint/rest/service/usage" \
   -H "MC-Api-Key: your_api_key" \
   -H "Accept: text/csv"
```

Note that granularity and paging (of any kind) are not supported for the CSV response type.
