---
title: DYNM

language_tabs: # must be one of https://git.io/vQNgJ
  - json: json

toc_footers:
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true
---

# Introduction

This API.......

HOST: [https://almexapiqa.azure-api.net](https://almexapiqa.azure-api.net).

This API documentation page was created with [Slate](https://github.com/slatedocs/slate).

# home_energy

> REQUEST

> <code>Headers</code>

```json
"Content-Type: application/json"
```

> Body

```json
{
  "userName": "",
  "password": "",
  "numberAccount": ""
}
```

> RESPONSE : <code>200</code>

> Headers

```json
"Content-Type: application/json"
```

> Body

```json
{
  "response": {
    "idEvent": 88983549,
    "trackingIdEvent": 4,
    "descriptionEvent": "Mercancía Entregada",
    "description2Event": "Goods delivered",
    "dateLastEvent": "2020-06-10T16:02:38.363",
    "hourLastEvent": "2020-06-10T16:02:38.363",
    "referenceEvent": "0 MONTERREY (SUC. GUERRERO)",
    "officeName": "MONTERREY (SUC. GUERRERO)",
    "tractor": {
      "operatorName": "",
      "tractorNumber": ""
    }
  },
  "success": true,
  "code": 200,
  "message": ""
}
```

This endpoint deals with a user.

### EndPoint

POST/auth/token

### HTTP Request

`POST https://almexapiqa.azure-api.net/auth/token?subscription-key=e725bd3f101c46c8a4e8ce132d3f34c4`

### Query Parameters

| Parameter        | Description                      |
| ---------------- | -------------------------------- |
| subscription-key | e725bd3f101c46c8a4e8ce132d3f34c4 |

# transportation

> REQUEST

> <code>Headers</code>

```json
"Content-Type: application/json"
```

> Body

```json
{
  "current_maintenance": "Do Not Do",
  "average_emissions_per_vehicle": 10484,
  "vehicles": [
    {
      "average_miles_driven": {
        "duration": "Per Week",
        "value": 23
      },
      "average_gas_mileage": 20
    },
    {
      "average_miles_driven": {
        "duration": "Per Week",
        "value": 30
      },
      "average_gas_mileage": 30
    }
  ]
}
```

> RESPONSE : <code>200</code>

> Headers

```json
"Content-Type: application/json"
```

> Body

```json
{
  "response": {
    "idEvent": 88983549,
    "trackingIdEvent": 4,
    "descriptionEvent": "Mercancía Entregada",
    "description2Event": "Goods delivered",
    "dateLastEvent": "2020-06-10T16:02:38.363",
    "hourLastEvent": "2020-06-10T16:02:38.363",
    "referenceEvent": "0 MONTERREY (SUC. GUERRERO)",
    "officeName": "MONTERREY (SUC. GUERRERO)",
    "tractor": {
      "operatorName": "",
      "tractorNumber": ""
    }
  },
  "success": true,
  "code": 200,
  "message": ""
}
```

This endpoint deals with a user.

### EndPoint

POST/auth/token

### HTTP Request

`POST https://almexapiqa.azure-api.net/auth/token?subscription-key=e725bd3f101c46c8a4e8ce132d3f34c4`

### Query Parameters

| Parameter        | Description                      |
| ---------------- | -------------------------------- |
| subscription-key | e725bd3f101c46c8a4e8ce132d3f34c4 |

# waste

> REQUEST

> <code>Headers</code>

```json
"Content-Type: application/json"
```

> Body

```json
{
  "average_waste_per_person": 692,
  "number_of_people": 2,
  "materials_recycled": {
    "metal": true,
    "plastic": true,
    "glass": false,
    "newspaper": false,
    "magazines": false
  }
}
```

> RESPONSE : <code>200</code>

> Headers

```json
"Content-Type: application/json"
```

> Body

```json
{
  "response": {
    "idEvent": 88983549,
    "trackingIdEvent": 4,
    "descriptionEvent": "Mercancía Entregada",
    "description2Event": "Goods delivered",
    "dateLastEvent": "2020-06-10T16:02:38.363",
    "hourLastEvent": "2020-06-10T16:02:38.363",
    "referenceEvent": "0 MONTERREY (SUC. GUERRERO)",
    "officeName": "MONTERREY (SUC. GUERRERO)",
    "tractor": {
      "operatorName": "",
      "tractorNumber": ""
    }
  },
  "success": true,
  "code": 200,
  "message": ""
}
```

This endpoint deals with a user.

### EndPoint

POST/auth/token

### HTTP Request

`POST https://almexapiqa.azure-api.net/auth/token?subscription-key=e725bd3f101c46c8a4e8ce132d3f34c4`

### Query Parameters

| Parameter        | Description                      |
| ---------------- | -------------------------------- |
| subscription-key | e725bd3f101c46c8a4e8ce132d3f34c4 |
