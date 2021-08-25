## Metrics

The metrics API can be queried to obtain data related to different organizations, environments, or workloads

<!-- GET METRICS FOR INTERVAL -->

`GET /metrics/{serviceCode}/{metricId}`

Retrieves metrics for a given metric id in a specified interval

```shell
# Retrieve metrics for a given interval
curl "https://cloudmc_endpoint/rest/metrics/stackpath-env/ingress_bandwidth/" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "pricingDefinition": {
        "supportedCurrencies": [
          "CAD",
          "USD"
        ],
        "organization": {
          "id": "23910576-d29f-4c14-b663-31d728ff49a5"
        },
        "name": {
          "en": "Simple pricing",
          "fr": "Facturaction simple"
        },
        "changes": [],
        "description": {},
        "id": "f786b9c5-177b-4cbc-9011-331282485d05",
        "effectiveDate": "2020-06-04T17:55:17Z"
      },
      "endDate": "2021-06-05T23:59:59.999Z",
      "organization": {
        "name": "System",
        "id": "23910576-d29f-4c14-b663-31d728ff49a5"
      },
      "currency": "USD",
      "id": "47c4993a-a131-4365-a427-02de95bad85b",
      "creationDate": "2020-06-04T18:30:21.000Z",
      "scopeQualifier": "GLOBAL",
      "startDate": "2020-06-05T00:00:00Z",
      "status": "ACTIVE"
    }
  ]
}
```

Path Parameters | &nbsp;
---- | -----------
`serviceCode`<br/>*String* | The UUID of the applied pricing.
`metricId`<br/>*String* | The pricing definition associated with the applied pricing.

Query Parameters | &nbsp;
---- | -----------
`startDate`<br/>*Date* | The UUID of the pricing.
`endDate`<br/>*Date* | The list of currencies associated to the pricing.
`environment`<br/>*String* | The UUID of the pricing.
`aggregationType`<br/>*String* | The list of currencies associated to the pricing.
`size`<br/>*Int* | The UUID of the pricing.
`unit`<br/>*String* | The list of currencies associated to the pricing.
`entityType`<br/>*String* | The UUID of the pricing.
`entityId`<br/>*UUID* | The list of currencies associated to the pricing.
`groupBy`<br/>*String* | The UUID of the pricing.


Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the applied pricing.
`pricingDefinition`<br/>*Object* | The pricing definition associated with the applied pricing.
`pricingDefinition.id`<br/>*UUID* | The UUID of the pricing.
`pricingDefinition.supportedCurrencies`<br/>*Array[string]* | The list of currencies associated to the pricing.
`pricingDefinition.organization.id`<br/>*UUID* | The UUID of the organization owning of the pricing definition.
`pricingDefinition.name`<br/>*Object* | Mapped object containing the pricing name in different languages.
`pricingDefinition.description`<br/>*Object* | Mapped object containing the pricing description in different languages.
`pricingDefinition.effectiveDate`<br/>*date* | The date to which the pricing will be applicable from.
`organization`<br/>*Object* | The object representing the organization owning the applied pricing.
`organization.id`<br/>*UUID* | The UUID of the organization.
`organization.name`<br/>*string* | The name of the organization.
`startDate`<br/>*date* | The start date of the applied pricing.
`endDate`<br/>*date* | The end date of the applied pricing. If it is not present, there is no end date defined.
`currency`<br/>*string* | The currency associated to the applied pricing.
`scopeQualifier`<br/>*string* | Scope qualifier of the applied pricing. Possible values are : GLOBAL, ORG_TOPLEVEL, ORG_SUBS, ORG_BASE, ORG_TREE.
`scopeOrganization`<br/>*Object* | The organization to which the scope is applied to.
`scopeOrganization.id`<br/>*UUID* | The UUID of the organization.
`scopeOrganization.name`<br/>*string* | The name of the organization.
`creationDate`<br/>*Object* | The date the applied pricing was created.
`status`<br/>*string* | The status of the applied pricing. Possible values are : ACTIVE, EXPIRED, FUTURE.
