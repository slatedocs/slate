## Applied Pricings

The applied pricing allows the assignment of pricing to organization with a determined scope.

<!-------------------- LIST APPLIED PRICINGS -------------------->
### List applied pricings

`GET /applied_pricings`

Retrieves a list of applied pricings configured in the system.

```shell
# Retrieve applied pricing list
curl "https://cloudmc_endpoint/rest/applied_pricings" \
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


<!-------------------- GET APPLIED PRICING -------------------->
### Retrieve an applied pricing

`GET /applied_pricings/:id`

Retrieve an applied pricing's details.

```shell
# Retrieve an applied pricing
curl "https://cloudmc_endpoint/rest/applied_pricings/03bc22bd-adc4-46b8-988d-afddc24c0cb5" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
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
}
```

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

<!-------------------- CREATE APPLIED PRICING -------------------->
### Create applied pricing

`POST /applied_pricings`

Create a new applied pricing.

```shell
# Creates a new pricing
curl -X POST "https://cloudmc_endpoint/rest/applied_pricings" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{
  "pricingDefinition": {
    "id": "f786b9c5-177b-4cbc-9011-331282485d05"
  },
  "organization": {
    "id": "23910576-d29f-4c14-b663-31d728ff49a5"
  },
  "currency": "USD",
  "scopeQualifier": "GLOBAL",
  "startDate": "2020-06-05T00:00:00Z",
  "endDate": "2021-06-05T23:59:59.999Z"
}
```
> The above command return JSON structured like this:

```js
{
  "data": {
    "pricingDefinition": {
      "name": {},
      "changes": [],
      "description": {},
      "id": "f786b9c5-177b-4cbc-9011-331282485d05"
    },
    "endDate": "2021-06-05T23:59:59.999Z",
    "organization": {
      "id": "23910576-d29f-4c14-b663-31d728ff49a5"
    },
    "currency": "USD",
    "id": "8bb5e457-41c3-410b-aced-b9c694ff141a",
    "creationDate": "2020-06-04T19:31:31.178Z",
    "scopeQualifier": "GLOBAL",
    "startDate": "2020-06-05T00:00:00Z"
  }
}
```

Required | &nbsp;
------- | -----------
`organization.id` <br/>*UUID* | The UUID of the organization the applied pricing belongs to. 
`pricingDefinition.id` <br/>*UUID* | the UUID of the pricing that will be used in the applied pricing.
`scopeQualifier` <br/>*string* | The scope qualifier for the applied pricing. Possible values are : ORG_BASE, ORG_TREE, ORG_SUB, ORG_TOPLEVEL, GLOBAL.
`currency` <br/>*String* | The currency used for the applied pricing. The value is a ISO 4217 currency code that is part of the pricing selected. 
`startDate` <br/>*Date* | The start date for the applied pricing.

Optional | &nbsp;
------- | -----------
`endDate` <br/>*Date* | The end date for the applied pricing. 
`scopeOrganization.id` <br/>*UUID* | The UUID of the organization that the scope is targeting. Only required for scopes : ORG_BASE, ORG_TREE, ORG_SUBS.


<!-------------------- UPDATE APPLIED PRICING -------------------->
### Update applied pricing

`PUT /applied_pricings/:id`

Update an applied pricing. Updates to the pricing, the scope, start date and end date may cause charges to be rolled back.

```shell
# Update an applied pricing
curl -X PUT "https://cloudmc_endpoint/rest/applied_pricings/8bb5e457-41c3-410b-aced-b9c694ff141a" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```js
{
  "pricingDefinition": {
    "id": "f786b9c5-177b-4cbc-9011-331282485d05"
  },
  "organization": {
    "id": "23910576-d29f-4c14-b663-31d728ff49a5"
  },
  "currency": "USD",
  "scopeQualifier": "ORG_BASE",
  "scopeOrganization": {
    "id": "d2e467f8-3a33-441a-b074-aec960758452"
  },
  "startDate": "2020-06-05T00:00:00Z",
  "endDate": "2021-06-05T23:59:59.999Z"
}
```

> The above command return JSON structured like this:

```js
{
  "data": {
    "pricingDefinition": {
      "supportedCurrencies": [
        "CAD",
        "USD"
      ],
      "organization": {
        "id": "23910576-d29f-4c14-b663-31d728ff49a5"
      },
      "name": {
        "en": "my-pricing",
        "fr": "mon-pricing"
      },
      "changes": [],
      "description": {},
      "id": "f786b9c5-177b-4cbc-9011-331282485d05",
      "effectiveDate": "2020-05-06T00:00:00Z"
    },
    "endDate": "2021-06-05T23:59:59.999Z",
    "organization": {
      "name": "Systemer",
      "id": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e"
    },
    "currency": "CAD",
    "id": "d08b9332-d26e-42fe-b272-3071f2d64839",
    "creationDate": "2020-09-08T17:44:18.000Z",
    "scopeQualifier": "ORG_BASE",
    "scopeOrganization": {
      "id": "d2e467f8-3a33-441a-b074-aec960758452",
      "name": "scoped-organization",
    },
    "startDate": "2020-06-05T00:00:00Z"
  }
}
```

Required | &nbsp;
------- | -----------
`organization.id` <br/>*UUID* | The UUID of the organization the applied pricing belongs to. 
`pricingDefinition.id` <br/>*UUID* | the UUID of the pricing that will be used in the applied pricing.
`scopeQualifier` <br/>*string* | The scope qualifier for the applied pricing. Possible values are : ORG_BASE, ORG_TREE, ORG_SUB, ORG_TOPLEVEL, GLOBAL.
`currency` <br/>*String* | The currency used for the applied pricing. The value is a ISO 4217 currency code that is part of the pricing selected. 
`startDate` <br/>*Date* | The start date for the applied pricing.

Optional | &nbsp;
------- | -----------
`endDate` <br/>*Date* | The end date for the applied pricing. 
`scopeOrganization.id` <br/>*UUID* | The UUID of the organization that the scope is targeting. Only required for scopes : ORG_BASE, ORG_TREE, ORG_SUBS.

### Delete applied pricing

`DELETE /applied_pricings/:id`

Delete an existing applied pricing. Deleting an applied pricing that is ACTIVE or EXPIRED may cause charges to be rolled back.

```shell
curl -X DELETE "https://cloudmc_endpoint/rest/applied_pricings/d08b9332-d26e-42fe-b272-3071f2d64839" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "85df8dfb-b904-42dc-bb76-4824e6b50c83",
  "taskStatus": "SUCCESS"
}
```
