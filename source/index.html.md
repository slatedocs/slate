---
title: ALMEXAPIQA

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

All endpoints except auth/token and auth/refresh-token require a token for Authorization, failure to which the API will return an error .

HOST: [https://almexapiqa.azure-api.net](https://almexapiqa.azure-api.net).

This API documentation page was created with [Slate](https://github.com/slatedocs/slate).

# Authentication

## Token

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

> Body

```json
{
  "code": 200,
  "message": "OK",
  "response": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIiLCJqdGkiOiIwYTZlZGM0Ni1kODI1LTQ2YWItOGQ1ZS05ZjE3ZjY5YjRlMGIiLCJ1c2VyTmFtZSI6IiIsIm51bWJlckFjY291bnQiOiIiLCJ1c2VySWQiOjExNzQwLCJjbGllbnRJZCI6NTUxMDU4LCJjdXJyZW5jeUlkIjowLCJkZW5zaXR5IjowLjAsImdyb3VwUHJvamVjdElkIjowLCJwcm9qZWN0SWQiOjAsInR5cGVTZXJ2aWNlIjoxLCJjb21wYW55SWQiOjUsInBhcmlkYWRJZCI6MC4wLCJpdmFJZCI6MSwicm9sZSI6IkFsbWV4IiwibmJmIjoxNjEzMzgzODQwLCJleHAiOjE2MTM5ODg2NDAsImlhdCI6MTYxMzM4Mzg0MCwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMzYvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMzYvIn0.DtUX_YD892zImsjpOjQBzHSGeDiMGJr4XcfdnMafp6c",
    "refreshToken": "2ep2/QZ+GirsSpVKUmeuN54qN/tQr+NctvJ0BUmofsNm7M/iAxoW8/gjXxPC5OJ4G14oj6ZA5w5Cq5Q2DdATVw=="
  },
  "success": true
}
```

This endpoint deals with a user.

### EndPoint

POST/auth/token

### HTTP Request

> RESPONSE : <code>200</code>

> Headers

```json
"Content-Type: application/json"
```

`POST https://almexapiqa.azure-api.net/auth/token?subscription-key=e725bd3f101c46c8a4e8ce132d3f34c4`

### Query Parameters

| Parameter        | Description                      |
| ---------------- | -------------------------------- |
| subscription-key | e725bd3f101c46c8a4e8ce132d3f34c4 |

## Refresh Token

This endpoint refreshes the token.

### EndPoint

POST/auth/refresh-token

### HTTP Request

> REQUEST

> <code>Headers</code>

```json
"Content-Type: application/json"
```

> Body

```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIiLCJqdGkiOiIwYTZlZGM0Ni1kODI1LTQ2YWItOGQ1ZS05ZjE3ZjY5YjRlMGIiLCJ1c2VyTmFtZSI6IiIsIm51bWJlckFjY291bnQiOiIiLCJ1c2VySWQiOjExNzQwLCJjbGllbnRJZCI6NTUxMDU4LCJjdXJyZW5jeUlkIjowLCJkZW5zaXR5IjowLjAsImdyb3VwUHJvamVjdElkIjowLCJwcm9qZWN0SWQiOjAsInR5cGVTZXJ2aWNlIjoxLCJjb21wYW55SWQiOjUsInBhcmlkYWRJZCI6MC4wLCJpdmFJZCI6MSwicm9sZSI6IkFsbWV4IiwibmJmIjoxNjEzMzgzODQwLCJleHAiOjE2MTM5ODg2NDAsImlhdCI6MTYxMzM4Mzg0MCwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMzYvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMzYvIn0.DtUX_YD892zImsjpOjQBzHSGeDiMGJr4XcfdnMafp6c"
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
  "success": false,
  "code": 200,
  "message": "Nombre de usuario o contraseña incorrectos, inténtalo de nuevo."
}
```

`POST https://almexapiqa.azure-api.net/auth/refresh-token?subscription-key=820987daaf1d4b37bca95b6e7a0cd8da`

### Query Parameters

| Parameter        | Description                      |
| ---------------- | -------------------------------- |
| subscription-key | 820987daaf1d4b37bca95b6e7a0cd8da |

# Quote

## Rate

This endpoint ..............

### EndPoint

POST/quote/rate

### HTTP Request

> REQUEST

> <code>Headers</code>

```json
"Content-Type: application/json"
```

> Body

```json
{
  "origin": {
    "postalCode": "52227"
  },
  "destination": {
    "postalCode": "75110"
  },
  "packages": [
    {
      "content": "camisetas rosas",
      "amount": 1,
      "type": "box",
      "dimensions": {
        "length": 1,
        "width": 1,
        "height": 1
      },
      "weight": 1,
      "insurance": 1,
      "declaredValue": 0,
      "weightUnit": "KGS",
      "lengthUnit": "MTS"
    }
  ]
}
```

> RESPONSE : <code>401</code>

> Headers

```json
"Content-Type: application/json"
```

> Body

```json
{
  "type": "https://httpstatuses.com/401",
  "title": "Unauthorized",
  "status": 401,
  "traceId": "|abb06879-486bc05a368175f2."
}
```

`POST https://almexapiqa.azure-api.net/quote/rate?subscription-key=820987daaf1d4b37bca95b6e7a0cd8da`

### Query Parameters

| Parameter        | Description                      |
| ---------------- | -------------------------------- |
| subscription-key | 820987daaf1d4b37bca95b6e7a0cd8da |

# Pickup Request

## Generate

This endpoint generates a pickup request.

### EndPoint

POST/pickuprequest/generate

### HTTP Request

> REQUEST

> <code>Headers</code>

```json
"Content-Type: application/json"
```

> Body

```json
{
  "shipper": {
    "name": "Tepeji Depot MX",
    "id": "Costco_224",
    "address_street": "Calle Norte 3 No. 3",
    "address_neighborhood": "Parque Industrial",
    "city": "Tepeji del Rio de Ocampo",
    "state": "HG",
    "country": "MX",
    "zipcode": "42884",
    "phone_number": "123456",
    "email": "123@123.com"
  },
  "consignee": {
    "name": "Centiro",
    "id": null,
    "address_street": "Benito Juárez",
    "address_neighborhood": "Centro",
    "city": "Asuncion Cuyotepeji City",
    "state": "OA",
    "country": "MX",
    "zipcode": "64500",
    "phone_number": "073001100",
    "email": "Centiro@costco.com"
  },
  "services": {
    "observations": "",
    "service_type": 3,
    "shipping_type": 1
  },
  "accessorials": {
    "insurance": {
      "types_insurance": 4,
      "declared_amount": 0.0
    },
    "pickup": {
      "service_needed": true,
      "date": "2021-01-29T00:00:00",
      "appointment": {
        "start_time": null,
        "end_time": null
      }
    },
    "delivery": {
      "service_needed": true,
      "only_working_days": 1,
      "appointment": {
        "date": null,
        "start_time": null,
        "end_time": null
      }
    }
  },
  "packages": {
    "weight_unit": "KGS",
    "length_unit": "MTS",
    "details": [
      {
        "package": "BOX",
        "quantity": 1,
        "dimensions": {
          "length": 1.42,
          "width": 0.94,
          "height": 0.94
        },
        "weight": 172.0
      }
    ]
  },
  "references": [
    {
      "almex_reference_id": 0,
      "customer_reference": "MX11Ord2222165"
    }
  ]
}
```

> RESPONSE : <code>401</code>

> Headers

```json
"Content-Type: application/json"
```

> Body

```json
{
  "type": "https://httpstatuses.com/401",
  "title": "Unauthorized",
  "status": 401,
  "traceId": "|abb06885-486bc05a368175f2."
}
```

`POST https://almexapiqa.azure-api.net/pickuprequest/generate?subscription-key=820987daaf1d4b37bca95b6e7a0cd8da`

### Query Parameters

| Parameter        | Description                      |
| ---------------- | -------------------------------- |
| subscription-key | 820987daaf1d4b37bca95b6e7a0cd8da |

# Tracking

## Last Event

This endpoint tracks the last event..

### EndPoint

GET/tracking/:id/lastevent

### HTTP Request

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

`GET https://almexapiqa.azure-api.net/tracking/07053846188/lastevent?subscription-key=820987daaf1d4b37bca95b6e7a0cd8da"`

### Query Parameters

| Parameter        | Description                      |
| ---------------- | -------------------------------- |
| subscription-key | 820987daaf1d4b37bca95b6e7a0cd8da |

# Imaging

## Image Download

This endpoint downloads an image.

### EndPoint

GET/imaging/:id/imaging/es-mx

### HTTP Request

> RESPONSE : <code>200</code>

> Headers

```json
"Content-Type: application/json"
```

> Body

```json
{
  "response": {
    "url": "http://imagenguias.almex.com.mx/imgCte.asp?Q5fr2ytYSTP55xrRvdrkps4wtQOP0dNB"
  },
  "success": true,
  "code": 200,
  "message": ""
}
```

`GET https://almexapiqa.azure-api.net/imaging/07070769168/imaging/es-mx?documentType=DR&documentFormat=URL&subscription-key=85070f2ccf9345c58bcd5d3ad78446bf`

### Query Parameters

| Parameter        | Description                      |
| ---------------- | -------------------------------- |
| subscription-key | 820987daaf1d4b37bca95b6e7a0cd8da |
| documentType     | DR                               |
| documentFormat   | URL                              |
| subscription-key | 85070f2ccf9345c58bcd5d3ad78446bf |
