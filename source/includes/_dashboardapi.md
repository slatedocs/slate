Dashboard API
=============

API for the dashboard v3

API overview
------------

- [Current Version](#current-version)
- [HTTP Verbs](#http-verbs)
- [Cross Origin Resource Sharing](#cross-origin-resource-sharing)
- [Endpoints](#endpoints)
- [ApiKey](#apikey)
- [Response](#response)

### Current version

    http://54.152.17.93/

### HTTP Verbs

The Powerlinks Dashboard API strives to use appropriate HTTP verbs to perform actions on our [resources](#resources).

| verb   | description                                          |
|--------| -----------------------------------------------------|
| GET 	 | use to retrieve a resources or collection            |
| POST	 | use to create a resource or perform a custom action  |
| PUT    | use to store an entity under a specific resource     |
| PATCH  | use to update an entity or specific resource         |
| DELETE | delete an entity or specific resource                |

### Cross Origin Resource Sharing

We support cross origin resource sharing ([CORS](http://www.w3.org/TR/cors/)). All endpoints return the following header.

    Access-Control-Allow-Origin: *
    Access-Control-Allow-Methods: GET,POST,OPTIONS,PUT,PATCH,DELETE
    Access-Control-Allow-Headers: ApiKey,Content-Type,Keep-Alive,User-Agent,Cache-Control

### Endpoints

| verb | route | ApiKey | parameters |
|------|-------|--------|------------|
| POST | /users | | {"email":STRING,"password":STRING,"firstName":STRING,"lastName":STRING,"name":STRING,"address1":STRING,"address2":STRING,"city":STRING,"state":STRING,"country":STRING,"zip":STRING,"phone_number":STRING,"website":STRING} |
| POST | /users/login | | {"email":STRING,"password":STRING,"company":STRING} |
| POST | /users/reset-password | | {"email":STRING} |
| GET | /users/confirm/{hash} | | |
| GET | /users | X | |
| GET | /users/{id:[0-9]+} | X | |
| GET | /users/company/{id:[0-9]+} | X | |
| POST | /users/switch-company | X | |
| PATCH | /users | X | |
| PATCH | /users/{id:[0-9]+} | X | |
| POST | /users/invite | X | |
| GET | /companies | X | |
| GET | /companies/{id:[0-9]+} | X | |
| POST | /companies | X | |
| PATCH | /companies/{id:[0-9]+} | X | |
| GET | /suppliers | X | |
| GET | /suppliers/{id:[0-9]+} | X | |
| POST | /suppliers | X | |
| PATCH | /suppliers/{id:[0-9]+} | X | |
| GET | /campaigns | X | |
| GET | /campaigns/{id:[0-9]+} | X | |
| GET | /campaigns/details | X | |
| POST | /campaigns | X | {"advertiser":INTEGER, "name":STRING, "internalId":STRING, "startDate":DATE, "endDate":DATE, "budget":FLOAT, "impressionCap":INTEGER, "dailyBudget":FLOAT, "dailyImpressionCap":INTEGER, "billingType":INTEGER,  "billingCategory":INTEGER, "feeType":INTEGER, "feeAmount":FLOAT, "pacing":INTEGER, "isActive":INTEGER} |
| PATCH | /campaigns/{id:[0-9]+} | X | {"advertiser":INTEGER, "name":STRING, "internalId":STRING, "startDate":DATE, "endDate":DATE, "budget":FLOAT, "impressionCap":INTEGER, "dailyBudget":FLOAT, "dailyImpressionCap":INTEGER, "billingType":INTEGER,  "billingCategory":INTEGER, "feeType":INTEGER, "feeAmount":FLOAT, "pacing":INTEGER, "isActive":INTEGER} |
| GET | /line-items | X | |
| GET | /line-items/{id:[0-9]+} | X | |
| GET | /line-items/details | X | |
| POST | /line-items | X | {"campaign":INTEGER, "internalId":STRING, "name":STRING, "budget":FLOAT, "impressionCap":INTEGER, "dailyBudget":FLOAT, "pacing":INTEGER, "defaultBid":FLOAT, "maxBid":FLOAT, "cpcBid":FLOAT,  "optimisation":INTEGER, "startDate":DATE, "endDate":DATE, "targeting":ARRAY, "creatives":ARRAY, "isActive":INTEGER} |
| PATCH | /line-items/{id:[0-9]+} | X | {"campaign":INTEGER, "internalId":STRING, "name":STRING, "budget":FLOAT, "impressionCap":INTEGER, "dailyBudget":FLOAT, "pacing":INTEGER "defaultBid":FLOAT, "maxBid":FLOAT, "cpcBid":FLOAT,  "optimisation":INTEGER, "startDate":DATE, "endDate":DATE, "targeting":ARRAY, "creatives":ARRAY, "isActive":INTEGER} |
| GET | /creatives | X | |
| GET | /creatives/{id:[0-9]+} | X | |
| GET | /creatives/details | X | |
| POST | /creatives | X | {"advertiser":INTEGER, "name":STRING, "type":INTEGER, "link":OBJECT, "titleAssets": ARRAY, "dataAssets":ARRAY, "imgAssets":ARRAY, "impressionTrackers":ARRAY} |
| PATCH | /creatives/{id:[0-9]+} | X | {"advertiser":INTEGER, "name":STRING, "type":INTEGER, "link":OBJECT, "titleAssets": ARRAY, "dataAssets":ARRAY, "imgAssets":ARRAY, "impressionTrackers":ARRAY} |
| GET | /publishers | X | |
| GET | /publishers/{id:[0-9]+} | X | |
| GET | /publishers/details | X | |
| POST | /publishers | X | {"name":STRING, "domain":STRING, "categories":ARRAY, "ssps":ARRAY} |
| PATCH | /publishers/{id:[0-9]+} | X | {"name":STRING, "domain":STRING, "categories":ARRAY, "ssps":ARRAY} |
| GET | /tags | X | |
| GET | /tags/{id:[0-9]+} | X | |
| GET | /tags/details | X | |
| POST | /tags | X | {"publisher":INTEGER, "name":STRING, "adFormat":INTEGER, "placement":INTEGER, "contentType":INTEGER, "contentSubtype":INTEGER, "isNative":INTEGER, "isDisplay":INTEGER, "isSecure":INTEGER, "bidFloor":FLOAT,  "isCpc":INTEGER, "isCpm":INTEGER, "enableThirdParty":INTEGER, "dealId":STRING, "dealAuctionType":INTEGER, "blockedCategories":ARRAY, "blockedAdvertisers":ARRAY, "fillNetworks":ARRAY} |
| PATCH | /tags/{id:[0-9]+} | X | {"publisher":INTEGER, "name":STRING, "adFormat":INTEGER, "placement":INTEGER, "contentType":INTEGER, "contentSubtype":INTEGER, "isNative":INTEGER, "isDisplay":INTEGER, "isSecure":INTEGER, "bidFloor":FLOAT,  "isCpc":INTEGER, "isCpm":INTEGER, "enableThirdParty":INTEGER, "dealId":STRING, "dealAuctionType":INTEGER, "blockedCategories":ARRAY, "blockedAdvertisers":ARRAY, "fillNetworks":ARRAY} |
| GET | /billing-types | X | |
| GET | /billing-categories | X | |
| GET | /ad-formats | X | |
| GET | /fee-types | X | |
| GET | /pacings | X | |
| GET | /placements | X | |
| GET | /content-types | X | |
| GET | /content-subtype | X | |

### ApiKey

The Powerlinks Dashboard API allows, and in some cases requires, requests to include an access token to authorize elevated client privileges. Pass the access token via the `ApiKey` HTTP header.

    curl -H "ApiKey:j878g39yx378pa77djthzzpn" https://dashboard.api.powerlinks.com/users

Acquire an access token using the API `/users/login`.

    curl -XPOST https://dashboard.api.powerlinks.com/users/login -H 'Content-Type: application/json' -d '{"email":"admin@powerlinks.com","password":"password","company":"1"}'

    HTTP/1.1 200 OK
    Content-Type: application/json;charset=utf-8
    Content-Length: 119

    {"status":"success","data":{"apiKey":"gJmil12lO5WgPDrCJlCJ23BPpJA7vep4Qr1zf89l5gY5z\/TGb2PA5muYF6Yrg5IPiuuu6fYw_Mo"}}

If elevated client privilege is required but missing, the API returns an authorization challenge in the response.

    HTTP/1.1 401 Unauthorized
    Content-Type: application/json;charset=utf-8
    Content-Length: 42

    {"status":"fail","message":"Unauthorized"}

### Response

The JSON response has this form:
```json
	{
	  "status": string(success|fail|error),
      "data": array|object,
      "message": string,
      "meta": array,
      "code": int
	}
```
