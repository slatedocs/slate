

# /API/V1/ACTIONPLANS/{ASSETID}
## ***GET*** 

**Summary:** Provides action plan for the sepcified instance / asset

### HTTP Request 
`***GET*** /api/v1/ActionPlans/{assetId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/ACTIONPLANS
## ***POST*** 

**Summary:** Creates an action plan

### HTTP Request 
`***POST*** /api/v1/ActionPlans` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Success |

# /API/V1/ACTIONPLANS/{ACTIONPLANID}
## ***PUT*** 

**Summary:** Updates an action plan

### HTTP Request 
`***PUT*** /api/v1/ActionPlans/{actionPlanId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| actionPlanId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***DELETE*** 

**Summary:** Deletes an action plan

### HTTP Request 
`***DELETE*** /api/v1/ActionPlans/{actionPlanId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| actionPlanId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/ASSETS

# /API/V1/ASSETUNITS/{ASSETID}
## ***GET*** 

**Summary:** Provides all units for the supplied asset

### HTTP Request 
`***GET*** /api/v1/AssetUnits/{assetId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |
| 500 | Server Error |

## ***POST*** 

**Summary:** Creates one or more asset units for the supplied assetId

### HTTP Request 
`***POST*** /api/v1/AssetUnits/{assetId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Success |
| 500 | Server Error |

## ***PUT*** 

**Summary:** Updates one or more existing asset units

### HTTP Request 
`***PUT*** /api/v1/AssetUnits/{assetId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |
| 500 | Server Error |

# /API/V1/ASSETUNITS/{ASSETID}/UNIT/{UNITID}
## ***GET*** 

**Summary:** Provides the asset unit for a given asset ID and unit ID

### HTTP Request 
`***GET*** /api/v1/AssetUnits/{assetId}/unit/{unitId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path |  | Yes |  |
| unitId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |
| 500 | Server Error |

## ***DELETE*** 

**Summary:** Deletes an existing asset unit by ID

### HTTP Request 
`***DELETE*** /api/v1/AssetUnits/{assetId}/unit/{unitId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path |  | Yes |  |
| unitId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |
| 500 | Server Error |

# /API/V1/AUTHENTICATION/CHANGEPASSWORD
## ***POST*** 

### HTTP Request 
`***POST*** /api/v1/Authentication/ChangePassword` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/AUTHENTICATION/FORGOTPASSWORD
## ***POST*** 

### HTTP Request 
`***POST*** /api/v1/Authentication/ForgotPassword` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/AUTHENTICATION/LOGIN
## ***POST*** 

### HTTP Request 
`***POST*** /api/v1/Authentication/Login` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/AUTHENTICATION/RESETPASSWORD
## ***POST*** 

### HTTP Request 
`***POST*** /api/v1/Authentication/ResetPassword` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/CARBONFACTORS/{CARBONFACTORID}
## ***GET*** 

**Summary:** Provides data for a given carbon factor ID

### HTTP Request 
`***GET*** /api/v1/CarbonFactors/{carbonFactorId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| carbonFactorId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***PUT*** 

**Summary:** Updates an existing carbon factor and any associated rates by ID

### HTTP Request 
`***PUT*** /api/v1/CarbonFactors/{carbonFactorId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| carbonFactorId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***DELETE*** 

**Summary:** Deletes an existing Carbon Factor and its associated rates by ID

### HTTP Request 
`***DELETE*** /api/v1/CarbonFactors/{carbonFactorId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| carbonFactorId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/CARBONFACTORS
## ***GET*** 

**Summary:** Provides data for all carbon factors with their associated rates

### HTTP Request 
`***GET*** /api/v1/CarbonFactors` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***POST*** 

**Summary:** Creates a carbon factor with associated rates

### HTTP Request 
`***POST*** /api/v1/CarbonFactors` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Success |

# /API/V1/CONSUMPTION/CONSUMPTIONSUMMARY/{ASSETID}/{METERID}
## ***GET*** 

### HTTP Request 
`***GET*** /api/v1/Consumption/ConsumptionSummary/{assetId}/{meterId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path |  | Yes |  |
| meterId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/CONSUMPTION/CONSUMPTIONRECORD/{ASSETID}/{METERID}
## ***GET*** 

### HTTP Request 
`***GET*** /api/v1/Consumption/ConsumptionRecord/{assetId}/{meterId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path |  | Yes |  |
| meterId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/CONSUMPTION/CONSUMPTIONRECORD/{FORCEEXACTMATCHUPLOAD}
## ***POST*** 

### HTTP Request 
`***POST*** /api/v1/Consumption/ConsumptionRecord/{forceExactMatchUpload}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| forceExactMatchUpload | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/CONSUMPTION/CONSUMPTIONRECORD
## ***PUT*** 

### HTTP Request 
`***PUT*** /api/v1/Consumption/ConsumptionRecord` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***DELETE*** 

### HTTP Request 
`***DELETE*** /api/v1/Consumption/ConsumptionRecord` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/CONSUMPTIONBULKIMPORT
## ***POST*** 

### HTTP Request 
`***POST*** /api/v1/ConsumptionBulkImport` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| forceExactMatchUpload | query |  | No |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/CURRENCY
## ***GET*** 

**Summary:** Provides data for all currencies for the instance

### HTTP Request 
`***GET*** /api/v1/Currency` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***POST*** 

**Summary:** Creates a currency

### HTTP Request 
`***POST*** /api/v1/Currency` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Success |

# /API/V1/CURRENCY/{CURRENCYCODE}
## ***GET*** 

**Summary:** Provides data for a given currency code

### HTTP Request 
`***GET*** /api/v1/Currency/{currencyCode}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| currencyCode | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***PUT*** 

**Summary:** Updates an existing currency by currencyCode

### HTTP Request 
`***PUT*** /api/v1/Currency/{currencyCode}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| currencyCode | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***DELETE*** 

**Summary:** Deletes an existing currency by currencyCode

### HTTP Request 
`***DELETE*** /api/v1/Currency/{currencyCode}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| currencyCode | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/EPCS
## ***GET*** 

### HTTP Request 
`***GET*** /api/v1/EPCs` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***POST*** 

### HTTP Request 
`***POST*** /api/v1/EPCs` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***PUT*** 

### HTTP Request 
`***PUT*** /api/v1/EPCs` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/EPCS/{EPCID}
## ***GET*** 

### HTTP Request 
`***GET*** /api/v1/EPCs/{epcId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| epcId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***DELETE*** 

### HTTP Request 
`***DELETE*** /api/v1/EPCs/{epcId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| epcId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/EPCS/SCHEMES
## ***GET*** 

### HTTP Request 
`***GET*** /api/v1/EPCs/Schemes` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***POST*** 

### HTTP Request 
`***POST*** /api/v1/EPCs/Schemes` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***PUT*** 

### HTTP Request 
`***PUT*** /api/v1/EPCs/Schemes` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/EPCS/SCHEMES/{SCHEMEID}
## ***DELETE*** 

### HTTP Request 
`***DELETE*** /api/v1/EPCs/Schemes/{schemeId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| schemeId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/EPCS/SCHEMES/RATINGS
## ***POST*** 

### HTTP Request 
`***POST*** /api/v1/EPCs/Schemes/Ratings` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***PUT*** 

### HTTP Request 
`***PUT*** /api/v1/EPCs/Schemes/Ratings` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/EPCS/SCHEMES/{SCHEMEID}/RATINGS/{RATINGID}
## ***DELETE*** 

### HTTP Request 
`***DELETE*** /api/v1/EPCs/Schemes/{schemeId}/Ratings/{ratingId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| schemeId | path |  | Yes |  |
| ratingId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/FUNDS/{FUNDID}
## ***GET*** 

**Summary:** Provides data for a given fund ID

### HTTP Request 
`***GET*** /api/v1/Funds/{fundId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| fundId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***PUT*** 

**Summary:** Updates an existing fund by ID

### HTTP Request 
`***PUT*** /api/v1/Funds/{fundId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| fundId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***DELETE*** 

**Summary:** Deletes an existing fund by ID

### HTTP Request 
`***DELETE*** /api/v1/Funds/{fundId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| fundId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/FUNDS
## ***GET*** 

**Summary:** Provides data for all funds

### HTTP Request 
`***GET*** /api/v1/Funds` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***POST*** 

**Summary:** Creates an fund

### HTTP Request 
`***POST*** /api/v1/Funds` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Success |

# /API/V1/METERS
## ***GET*** 

**Summary:** Provides data for all meters

### HTTP Request 
`***GET*** /api/v1/Meters` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***POST*** 

**Summary:** Creates a meter

### HTTP Request 
`***POST*** /api/v1/Meters` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Success |

# /API/V1/METERS/{METERID}
## ***GET*** 

**Summary:** Provides data for a given meter ID

### HTTP Request 
`***GET*** /api/v1/Meters/{meterId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| meterId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***PUT*** 

**Summary:** Updates an existing meter by ID

### HTTP Request 
`***PUT*** /api/v1/Meters/{meterId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| meterId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***DELETE*** 

**Summary:** Deletes an existing meter by ID

### HTTP Request 
`***DELETE*** /api/v1/Meters/{meterId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| meterId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/ORGANISATIONS/{ORGANISATIONID}
## ***GET*** 

**Summary:** Provides data for a given organisation ID

### HTTP Request 
`***GET*** /api/v1/Organisations/{organisationId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| organisationId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***PUT*** 

**Summary:** Updates an existing organisation by ID

### HTTP Request 
`***PUT*** /api/v1/Organisations/{organisationId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| organisationId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***DELETE*** 

**Summary:** Deletes an existing organisation by ID

### HTTP Request 
`***DELETE*** /api/v1/Organisations/{organisationId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| organisationId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/ORGANISATIONS
## ***GET*** 

**Summary:** Provides data for all organisations

### HTTP Request 
`***GET*** /api/v1/Organisations` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***POST*** 

**Summary:** Creates an organisation

### HTTP Request 
`***POST*** /api/v1/Organisations` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Success |

# /API/V1/UNITRATES
## ***GET*** 

**Summary:** Provides data for all unit rates

### HTTP Request 
`***GET*** /api/v1/UnitRates` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***POST*** 

**Summary:** Creates a unit rate

### HTTP Request 
`***POST*** /api/v1/UnitRates` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Success |

# /API/V1/UNITRATES/{UNITRATEID}
## ***GET*** 

**Summary:** Provides data for a given unit rate ID

### HTTP Request 
`***GET*** /api/v1/UnitRates/{unitRateId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| unitRateId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***PUT*** 

**Summary:** Updates an existing unit rate by ID

### HTTP Request 
`***PUT*** /api/v1/UnitRates/{unitRateId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| unitRateId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***DELETE*** 

**Summary:** Deletes an existing unit rate by ID

### HTTP Request 
`***DELETE*** /api/v1/UnitRates/{unitRateId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| unitRateId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/UNITRATES/{UNITRATEID}/RATES
## ***POST*** 

**Summary:** Creates a rate for a given unit rate

### HTTP Request 
`***POST*** /api/v1/UnitRates/{unitRateId}/rates` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| unitRateId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 201 | Success |

# /API/V1/UNITRATES/{UNITRATEID}/RATES/{RATEID}
## ***PUT*** 

**Summary:** Updates a rate for a given unit rate

### HTTP Request 
`***PUT*** /api/v1/UnitRates/{unitRateId}/rates/{rateId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| unitRateId | path |  | Yes |  |
| rateId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***DELETE*** 

**Summary:** Deletes a rate for a given unit rate

### HTTP Request 
`***DELETE*** /api/v1/UnitRates/{unitRateId}/rates/{rateId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| rateId | path |  | Yes |  |
| unitRateId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/WASTEDESTINATION/{ASSETID}
## ***GET*** 

### HTTP Request 
`***GET*** /api/v1/WasteDestination/{assetId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| assetId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/WASTEDESTINATION
## ***POST*** 

### HTTP Request 
`***POST*** /api/v1/WasteDestination` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***PUT*** 

### HTTP Request 
`***PUT*** /api/v1/WasteDestination` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/WASTEDESTINATION/{WASTEDESTINATIONID}
## ***DELETE*** 

### HTTP Request 
`***DELETE*** /api/v1/WasteDestination/{wasteDestinationId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| wasteDestinationId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/WASTERECORD/SUMMARY/{WASTEDESTINATIONID}
## ***GET*** 

### HTTP Request 
`***GET*** /api/v1/WasteRecord/Summary/{wasteDestinationId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| wasteDestinationId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/WASTERECORD/{WASTEDESTINATIONID}
## ***GET*** 

### HTTP Request 
`***GET*** /api/v1/WasteRecord/{wasteDestinationId}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| wasteDestinationId | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/WASTERECORD/{FORCEUPLOADEXACTMATCH}
## ***POST*** 

### HTTP Request 
`***POST*** /api/v1/WasteRecord/{forceUploadExactMatch}` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| forceUploadExactMatch | path |  | Yes |  |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

# /API/V1/WASTERECORD
## ***PUT*** 

### HTTP Request 
`***PUT*** /api/v1/WasteRecord` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

## ***DELETE*** 

### HTTP Request 
`***DELETE*** /api/v1/WasteRecord` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Success |

<!-- Converted with the swagger-to-slate https://github.com/lavkumarv/swagger-to-slate -->