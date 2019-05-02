## Usage

<!-------------------- LIST USAGE SUMMARY -------------------->

### List usage summary

`GET /usage_summary/organizations/:id`

```shell
# Retrieve usage summary in JSON
curl "https://cloudmc_endpoint/v1/usage_summary/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5?start_date=2017-05-01&end_date=2017-05-15&format=json" \
   -H "MC-Api-Key: your_api_key"

# Response body example
```
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
curl "https://cloudmc_endpoint/v1/usage_summary/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5?start_date=2017-05-01&end_date=2017-05-15&format=csv" \
   -H "MC-Api-Key: your_api_key"

# Response body example
organizationId,serviceConnectionId,startDate,endDate,usageType,secondaryType,serviceConnectionPricingId,utilityCost,utilityUsage
52fd201e-aa82-4a27-86b3-ea9650a7fb1e,beeba736-0451-49b0-8020-8b93ed5abb35,2017-05-01T00:00:00.000Z,2017-05-01T01:00:00.000Z,1,RAM,e37cc44a-47b6-4a26-81f5-1dbf85433e36,0.660000,5.49999878
```

Retrieve the usage summary records for an organization and all of its sub-organizations for a specific period. The response can be in JSON (default) or CSV format. Additionally, you can aggregate these records using the different query parameters available.

*Note*: Old records are aggregated by day instead of hour. If you try to query those records per hour, then you will receive an empty list.

Attributes | &nbsp;
---- | -----------
`organizationId`<br/>*UUID* | Id of the [organization](#administration-organizations)
`serviceConnectionId`<br/>*UUID* | Id of the [service connection](#administration-service-connections)
`serviceConnectionPricingId`<br/>*UUID* | Id of the service connection pricing
`utilityCost`<br/>*string* | Utility cost of the record (aggregated per the period)
`utilityUsage`<br/>*string* | Utility usage of the record
`startDate`<br/>*string* | Start date of the record in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
`endDate`<br/>*string* | End date of the record in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
`usageType`<br/>*string* | Usage type of the record.
`secondaryType`<br/>*string* | Secondary type of the record.

*Note*: The `utilityUsage` reported by this API is the total usage recorded for the specified period. The resource commitment is not taken into account for this endpoint but is outlined in the endpoint `/top_level/organizations/{org_id}` below.

Query Parameters (*required*) | &nbsp;
---------- | -----
`start_date`<br/>*String* | Start date (inclusive). Should have the following format YYYY-MM-DD.
`end_date`<br/>*String* | End date (exclusive). Should have the following format YYYY-MM-DD.

Query Parameters | &nbsp;
---------- | -----
`service_connection_id`<br/>*UUID* | Show usage summary for this service connection
`include_sub_orgs`<br/>*boolean* | Include usage summary of all its sub-organizations. Defaults to false.
`include_cost`<br/>*boolean* | Include the utility cost and service connection pricing id fields. Defaults to true.
`include_free_usage`<br/>*boolean* | Include all summary records that has no cost associated to it (i.e. utilityCost == 0). Defaults to true.
`combine_usage_types`<br/>*boolean* | Sums up the utility cost per organization and service connection. The following fields are removed from the output: `serviceConnectionPricingId`, `usageType`, `secondaryType`, `utilityUsage`
`period`<br/>*String* | The period on which the aggregation is made. HOUR, DAY or PERIOD. The default is HOUR.
`format`<br/>*String* | JSON or CSV. Defaults to JSON.
`include_deleted`<br/>*boolean* | Will find usage of an organization that may have been deleted

### List top level organization usage summary

`GET /usage_summary/top_level/organizations/:id`<br/>


```shell
# Retrieve usage summary in JSON
curl --request GET \
  --url 'https://cloudmc_endpoint/rest/usage_summary/top_level/organizations/52fd201e-aa82-4a27-86b3-ea9650a7fb1e?start_date=2019-03-12&end_date=2019-03-13' \
  --header 'content-type: application/json' \
  --header 'mc-api-key: your_api_key' \

# Response body example
```
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

Retrieves the usage summary records for top level organization and it's sub-organizations for a specific period ensuring that usage is split between two buckets, resource commitment usage and utility usage. The response format will be in the JSON format

##### Resource Commitment Usage:
The usage that is counted toward a pre assigned pool of resources defined by the Resource Commitment of the organization on a specified service connection. The resource commitment usage is capped by the resource commitment capacity which is the total amount of resource allocated to the organization.

##### Utility Usage:
Usage that bursts outside of the allocated resource commitment if one exists. Note that utility usage will only appear in the response when the `actualUsage` > `resourceCommitmentsUsage`. Note that the `resourceCommitmentUsage` will always be less than or equal to the `resourceCommitmentCapacity` which is defined by the commitment.

The following will always hold:
`utilityUsage + resourceCommitmentUsage = actualUsage`

Attributes | &nbsp;
---- | -----------
`organizationId`<br/>*UUID* | Id of the [organization](#administration-organizations)
`serviceConnectionId`<br/>*UUID* | Id of the [service connection](#administration-service-connections)
`serviceConnectionPricingId`<br/>*UUID* | Id of the service connection pricing
`utilityCost`<br/>*string* | Utility cost of the record (aggregated per the period)
`utilityUsage`<br/>*string* | Utility usage of the record
`resourceCommitmentUsage`<br/>*string* | The amount of usage that was counted toward the commitment capacity defined by the resource commitment.
`startDate`<br/>*string* | Start date of the record in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
`endDate`<br/>*string* | End date of the record in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
`usageType`<br/>*string* | Usage type of the record.
`secondaryType`<br/>*string* | Secondary type of the record.


Query Parameters (*required*) | &nbsp;
---------- | -----
`start_date`<br/>*String* | Start date (inclusive). Should have the following format YYYY-MM-DD.
`end_date`<br/>*String* | End date (exclusive). Should have the following format YYYY-MM-DD.

Query Parameters | &nbsp;
---------- | -----
`service_connection_id`<br/>*UUID* | Show usage summary for this service connection
`include_sub_orgs`<br/>*boolean* | Include usage summary of all its sub-organizations. Defaults to false.
`include_cost`<br/>*boolean* | Include the utility cost and service connection pricing id fields. Defaults to true.
`include_free_usage`<br/>*boolean* | Include all summary records that has no cost associated to it (i.e. utilityCost == 0). Defaults to true.
`combine_usage_types`<br/>*boolean* | Sums up all the utility cost per organization and service connection. The following fields are removed from the output: `serviceConnectionPricingId`, `usageType`, `secondaryType`, `utilityUsage` 
`period`<br/>*String* | The period on which the aggregation is made. HOUR, DAY or PERIOD. The default is HOUR.
`format`<br/>*String* | JSON or CSV. Defaults to JSON.