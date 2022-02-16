# Action Plans

The action plan endpoints allows uploading of action plan information relating to assets such as ESG-related initiatives and improvement programs. The endpoints provide the ability download all actions, update individual actions, and delete actions.

## Get action plans

```shell
```

> GET /api/v1/actionplans/{assetId}

```shell
curl https://api.sieraglobal.com/api/v1/actionplans/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN"
```

> Response (200)

```json

[
    {
        "actionId": 2,
        "propertyId": 2,
        "actionDescription": "Upgrade lighting to LED",
        "impact": "Energy",
        "approved": true,
        "status": "AgreedActions",
        "current": 350,
        "target": 200,
        "cost": "Low",
        "costType": "RevenueServiceCharge",
        "scope": "WholeBuilding",
        "manager": "Jeff Parsons",
        "completion": "",
        "dueDate": "9/1/2022",
        "currency": "GBP",
        "utilityType": "NotApplicable",
        "performanceMeasure": "InstallationOfHighEfficiencyEquipment",
        "targetUsagePercentage": 42.86
    },
    {
        "actionId": 3,
        "propertyId": 2,
        "actionDescription": "Replace southfacing windows with high-efficiency glazing",
        "impact": "Energy",
        "approved": true,
        "status": "AgreedActions",
        "current": 600,
        "target": 300,
        "cost": "12000",
        "costType": "RevenueServiceCharge",
        "scope": "WholeBuilding",
        "manager": "Jeff Parsons",
        "completion": "",
        "dueDate": "9/1/2022",
        "currency": "GBP",
        "utilityType": "NotApplicable",
        "performanceMeasure": "WindowReplacements",
        "targetUsagePercentage": 50
    },
]
```

**Summary:** Provides a list of all the action plans associated with the specified asset.

### HTTP Request 
`GET /api/v1/actionplans/{assetId}` 

**Parameters**

| Name    | Located in | Description                            | Required | Type        |
| ------- | ---------- | -------------------------------------- | -------- | ----------- |
| assetId | path       | A valid id of an asset stored in SIERA | Yes      | **integer** |

**Response Body**

The response body will be a list of action plans which are associated with the asset specified by the assetId parameter.

| Attribute               | Type and description                                                                                                                   |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `actionId`              | **integer**<br/>The id of the action plan                                                                                              |
| `propertyId`            | **integer**<br/>The id of the asset                                                                                                    |
| `actionDescription`     | **string**<br/>A description of the action plan                                                                                        |
| `impact`                | **string**<br/>The utility or utility group affected by the action                                                                     |
| `approved`              | **boolean**<br/>A boolean flag to indicate if the action plan has been approved or not                                                 |
| `status`                | **enumeration**<br/>A valid action status from the [action status](#action-status) enumeration                                         |
| `current`               | **float**<br/>The current usage amount related to this action                                                                          |
| `target`                | **float**<br/>A target usage the action is hoped to achieve                                                                            |
| `cost`                  | **string**<br/>A text description of the costs of the action. This can be a number amount or relative description such as high or low. |
| `costType`              | **enumeration**<br/>A valid cost type from the [action cost type](#action-cost-type) enumeration                                       |
| `scope`                 | **enumeration**<br/>A valid floor area scope from the [action scope](#action-scope) enumeration                                        |
| `manager`               | **string**<br/>The name of a person who is considered the manager of this action                                                       |
| `completion`            | **datetime**<br/>The actual completion date of the action, in the format *m/d/yyyy*                                                    |
| `dueDate`               | **datetime**<br/>The expected completion date of the action, in the format *m/d/yyyy*                                                  |
| `currency`              | **string**<br/>The currency of the costs related to the action, of GBP, USD or EUR.                                                    |
| `utilityType`           | **enumeration**<br/>A valid utility from the [action utility](#action-utility) enumeration                                             |
| `performanceMeasure`    | **enumeration**<br/>A valid measure description from the [action measure description](#action-measure-description) enumeration         |
| `targetUsagePercentage` | **float**<br/>A read-only percentage change between the current and target values of the action                                        |


**Responses**

| Code | Description |
| ---- | ----------- |
| 200  | Success     |



## Upload a new action plan

```shell
```

> POST /api/v1/actionplan

```shell
curl POST https://api.sieraglobal.com/api/v1/actionplan \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON  
  {
      "propertyId": 2,
      "actionDescription": "Complete reinsulation of external wall",
      "impact": "Energy",
      "approved": true,
      "status": "AgreedActions",
      "current": 7900,
      "target": 5000,
      "cost": "34500",
      "costType": "RevenueServiceCharge",
      "scope": "WholeBuilding",
      "manager": "Sue Brown",
      "completion": "",
      "dueDate": "5/1/2022",
      "currency": "GBP",
      "utilityType": "NotApplicable",
      "performanceMeasure": "WallOrRoofInsulation"
    }
```

> Response (201)

**Summary:** Upload a new action plan

### HTTP Request 
`POST /api/v1/actionplans` 


**Request body**

| Attribute            | Type and description                                                                                                                   |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `propertyId`         | **integer**<br/>The id of the asset                                                                                                    |
| `actionDescription`  | **string**<br/>A description of the action plan                                                                                        |
| `impact`             | **string**<br/>The utility or utility group affected by the action                                                                     |
| `approved`           | **boolean**<br/>A boolean flag to indicate if the action plan has been approved or not                                                 |
| `status`             | **enumeration**<br/>A valid action status from the [action status](#action-status) enumeration                                         |
| `current`            | **float**<br/>The current usage amount related to this action                                                                          |
| `target`             | **float**<br/>A target usage the action is hoped to achieve                                                                            |
| `cost`               | **string**<br/>A text description of the costs of the action. This can be a number amount or relative description such as high or low. |
| `costType`           | **enumeration**<br/>A valid cost type from the [action cost type](#action-cost-type) enumeration                                       |
| `scope`              | **enumeration**<br/>A valid floor area scope from the [action scope](#action-scope) enumeration                                        |
| `manager`            | **string**<br/>The name of a person who is considered the manager of this action                                                       |
| `completion`         | **datetime**<br/>The actual completion date of the action, in the format *m/d/yyyy*                                                    |
| `dueDate`            | **datetime**<br/>The expected completion date of the action, in the format *m/d/yyyy*                                                  |
| `currency`           | **string**<br/>The currency of the costs related to the action, of GBP, USD or EUR.                                                    |
| `utilityType`        | **enumeration**<br/>A valid utility from the [action utility](#action-utility) enumeration                                             |
| `performanceMeasure` | **enumeration**<br/>A valid measure description from the [action measure description](#action-measure-description) enumeration         |

**Responses**

| Code | Description                                                                                |
| ---- | ------------------------------------------------------------------------------------------ |
| 201  | Created                                                                                    |
| 400  | Validation failure, one or more of the enumerations were not correctly identified.         |
| 401  | Not found, the specified asset id does not exist in the caller's instance or was not found |
| 500  | Server error                                                                               |



## Update an action plan

```shell
```

> PUT /api/v1/actionplans/{actionPlanId}

```shell
curl PUT https://api.sieraglobal.com/api/v1/actionplans/2 \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -V "Content-Type: application/json" \
  -d @- <<JSON
  {
      "propertyId": 2,
      "actionDescription": "Complete reinsulation of external wall",
      "impact": "Energy",
      "approved": true,
      "status": "AgreedActions",
      "current": 9100,
      "target": 5000,
      "cost": "29500",
      "costType": "RevenueServiceCharge",
      "scope": "WholeBuilding",
      "manager": "Sue Brown",
      "completion": "",
      "dueDate": "8/1/2022",
      "currency": "GBP",
      "utilityType": "NotApplicable",
      "performanceMeasure": "WallOrRoofInsulation"
    }
```

> Response (200)

**Summary:** Updates an existing action plan by ID

### HTTP Request 
`PUT /api/v1/actionplan/{actionPlanId}` 

**Parameters**

| Name         | Located in | Description                                  | Required | Type        |
| ------------ | ---------- | -------------------------------------------- | -------- | ----------- |
| actionPlanId | path       | A valid id of an action plan stored in SIERA | Yes      | **integer** |

**Request body**

| Attribute            | Type and description                                                                                                                   |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `propertyId`         | **integer**<br/>The id of the asset                                                                                                    |
| `actionDescription`  | **string**<br/>A description of the action plan                                                                                        |
| `impact`             | **string**<br/>The utility or utility group affected by the action                                                                     |
| `approved`           | **boolean**<br/>A boolean flag to indicate if the action plan has been approved or not                                                 |
| `status`             | **enumeration**<br/>A valid action status from the [action status](#action-status) enumeration                                         |
| `current`            | **float**<br/>The current usage amount related to this action                                                                          |
| `target`             | **float**<br/>A target usage the action is hoped to achieve                                                                            |
| `cost`               | **string**<br/>A text description of the costs of the action. This can be a number amount or relative description such as high or low. |
| `costType`           | **enumeration**<br/>A valid cost type from the [action cost type](#action-cost-type) enumeration                                       |
| `scope`              | **enumeration**<br/>A valid floor area scope from the [action scope](#action-scope) enumeration                                        |
| `manager`            | **string**<br/>The name of a person who is considered the manager of this action                                                       |
| `completion`         | **datetime**<br/>The actual completion date of the action, in the format *m/d/yyyy*                                                    |
| `dueDate`            | **datetime**<br/>The expected completion date of the action, in the format *m/d/yyyy*                                                  |
| `currency`           | **string**<br/>The currency of the costs related to the action, of GBP, USD or EUR.                                                    |
| `utilityType`        | **enumeration**<br/>A valid utility from the [action utility](#action-utility) enumeration                                             |
| `performanceMeasure` | **enumeration**<br/>A valid measure description from the [action measure description](#action-measure-description) enumeration         |


**Responses**

| Code | Description                                                                       |
| ---- | --------------------------------------------------------------------------------- |
| 201  | Created                                                                           |
| 400  | Validation failure, one or more of the enumerations were not correctly identified |
| 401  | Not found, the specified meter id was not found                                   |
| 500  | Server error                                                                      |

## Delete a action plan 

```shell
```

> DELETE /api/v1/actionplans/{actionPlanId}

```shell
curl -X DELETE https://api.sieraglobal.com/api/v1/actionplans/4 \
  -H "Authorization: Bearer $ACCESS_TOKEN" 
```

> Response (200)

**Summary:** Deletes an existing action plan by ID

### HTTP Request 
`DELETE /api/v1/actionplans/{actionPlanId}` 

**Parameters**

| Name         | Located in | Description                                      | Required | Type        |
| ------------ | ---------- | ------------------------------------------------ | -------- | ----------- |
| actionPlanId | path       | The id of the action plan to be deleted in SIERA | Yes      | **integer** |

**Responses**

| Code | Description                                           |
| ---- | ----------------------------------------------------- |
| 200  | Success                                               |
| 401  | Not found, the specified action plan id was not found |
| 500  | Server error                                          |