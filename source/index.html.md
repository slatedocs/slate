---
title: Reveknew - API Documentation

language_tabs: # must be one of https://git.io/vQNgJ
  - Example Value | Model
  

  

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>


search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the  Reveknew-API
---

# Introduction
[Base URl : localhost:8080/ ]

http://localhost:8080/v2/api-docs

Reveknew provides a simple and powerful REST API to schedule payments and payment reminders for your customers via SMS.
This API reference provides information on the endpoints and how to use them. 
Take note that your business must be marked as an enterprise and be provided with credentials by contacting the sales department of Reveknew.
When enterprise features is provided to you, you will be able to see the businessId that you need in all the API calls.

# Authentication
This API supports this mode of authentication:
* OAuth2 
```
curl https://api.reveknew.net/enterprise/v1/customers/53e08b340cd983/id/f27a7b170cd \
    -H "Authorization: Bearer abd90df5f27a7b170cd775abf89d632b350b7c1c9d53e08b340cd9832ce52c2c"
```

## OAuth2
To make calls to this API, you will need to be authenticated via OAuth2. You will need a clientId and clientSecret from the Enterprise section of the Reveknew dashboard.
You will need to perform the following operation to get an access token.

`POST https://auth.reveknew.net/oauth/token
Content-Type: application/x-www-form-urlencoded
grant_type=client_credentials&client_id=YOUR_CLIENT_ID&client_secret=YOUR_CLIENT_SECRET&audience=https://services.reveknew.net`


Any further API call now needs to include the access token in the `Authorization` header as a bearer token. To use the bearer token, construct a normal HTTPS request and include an `Authorization` header with the value of Bearer.

# Customers

## Create a customer record under a business account

```json
  {
    "customerNum" : "4515",
    "email" : "JoeyEGosselin@jourrapide.com",
    "firstName" : "Joey",
    "id" : "e17ecab2-8a63-11ec-a8a3-0242ac120002",
    "lastName" : "Gosselin",
    "phoneNo" : "0222740128"
  }
```

This endpoint creates a customer record under a business account

### HTTP Request

`POST`  /enterprise/v1/customers/{businessId}

### Query Parameters

| Parameter            | Description |
|----------------------|-------------|
| businessId *required | businessId  |
| string               |             |
| *(path)*             |             |
| customer*required    | customer    |
| *(body)*             |             |

### Responses

| Code | Description                                    |
|------|------------------------------------------------|
| 200  | Customer record created successfully           |
| 201  | Created                                        |
| 400  | Invalid data supplied for creation of customer |
| 401  | Unauthorized                                   |
| 403  | Operation not permitted for this business      |
| 404  | Invalid businessId supplied                    |



## Update a Customer record under a business account

```json
  {
    "customerNum" : "77014",
    "email" : "ChristinaRPerrin@jourrapide.com",
    "firstName" : "Christina",
    "id" : "f6867d4c-8a72-11ec-a8a3-0242ac120002",
    "lastName" : "Perrin",
    "phoneNo" : "0515872451"
  }
```

This endpoint updates a customer record under a business account

### HTTP Request

`PUT`  /enterprise/v1/customers/{businessId}

### Query Parameters

| Parameter            | Description |
|----------------------|-------------|
| businessId *required | businessId  |
| string               |             |
| *(path)*             |             |
| customer*required    | customer    |
| *(body)*             |             |

### Responses

| Code | Description                                         |
|------|-----------------------------------------------------|
| 200  | Customer record updated successfully                | 
| 201  | Created                                             |
| 400  | Invalid data supplied for update of customer record |
| 401  | Unauthorized                                        |
| 403  | Operation not permitted for this business           |
| 404  | Invalid businessId supplied                         |

## Find customer record by its id
This endpoint finds  customer record by its id 

### HTTP Request

`GET` /enterprise/v1/customers/{businessId}/id/{customerId}

### Query Parameters

| Parameter            | Description |
|----------------------|-------------|
| businessId *required | businessId  |
| string               |             |
| *(path)*             |             |
| customer*required    | customer    |
| *(body)*             |             |

### Responses

| Code | Description                               |
|------|-------------------------------------------|
| 200  | Customer record found successfully        | 
| 401  | Unauthorized                              |
| 403  | Operation not permitted for this business |
| 404  | Invalid businessId supplied               |

# Subscriptions


## Create a subscription record under a business account

```json
  {
    "amount" : 85392,
    "cancelledOn" : "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
    "customerId" : "b03e0562-8a8b-11ec-a8a3-0242ac120002",
    "id" : "f6867d4c-8a72-11ec-a8a3-0242ac120002",
    "lastBilledOn" : "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
    "nextBillingDate" : "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
    "pausedOn" : "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
    "receipts" : [
      {
        "amount" :  26891,
        "receivedAt": "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
        "subscriptionId" : "f5c633ca-8a8b-11ec-a8a3-0242ac120002"
      }
    ],
    "scheduleResets" : true,
    "schedules": [
      {
        "amount":31586 ,
        "graceDate": "yyyy-MM-dd",
        "id": "10d45a7a-8a73-11ec-a8a3-0242ac120002",
        "reminderDate": "yyyy-MM-dd",
        "scheduledFor": "yyyy-MM-dd",
        "shortenedUrl": "https://test.jpg-online.com/connect/processing?storename=115512500&oid=VT-83be410a-6aba-449c-paymentUrlId=d32rceubeff-ca74-00388n8839d",
        "status": "AVAILABLE",
        "subscriptionId": "056838f0-8a8c-11ec-a8a3-0242ac120002"
      }
    ],
    "startDate": "yyyy-MM-dd",
    "status": "ACTIVE",
    "tierId": "156c9048-8a8c-11ec-a8a3-0242ac120002"
  }
```

This endpoint creates a subscription record under a business account

### HTTP Request

`POST`  /enterprise/v1/subscriptions/{businessId}

### Query Parameters

| Parameter             | Description  |
|-----------------------|--------------|
| businessId *required  | businessId   | 
| string                |              |
| *(path)*              |              |
| subscription*required | subscription |
| *(body)*              |              |

### Responses

| Code | Description                                    |
|------|------------------------------------------------|
| 200  | Subscription record updated successfully       | 
| 201  | Created                                        |
| 400  | Invalid data supplied for creation of customer |
| 401  | Unauthorized                                   |
| 403  | Operation not permitted for this business      |
| 404  | Invalid businessId supplied                    |


## Find a subscription under a business account by id 

This endpoint finds a subscription record under a business account by id

### HTTP Request

`GET`  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}

### Query Parameters

| Parameter               | Description    |
|-------------------------|----------------|
| businessId *required    | businessId     |
| string                  |                |
| *(path)*                |                |
| subscriptionId*required | subscriptionId |
| string                  |                |
|  *(path)*               |                |

### Responses

| Code | Description                                   |
|------|-----------------------------------------------|
| 200  | Subscription record found successfully        |
| 401  | Unauthorized                                  |
| 403  | Operation not permitted for this business     |
| 404  | Invalid businessId or subscriptionId supplied |



## Find a scheduled payment under a business account by id

This endpoint finds a scheduled payment under a business account by id 

### HTTP Request

`GET`  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/{scheduleId}

### Query Parameters

| Parameter               | Description         |
|-------------------------|---------------------|
| businessId *required    | businessId          |
| string                  |                     |
| *(path)*                |                     |
| subscriptionId*required | subscriptionId      |
| string                  |                     |
| *(path)*                |                     |
| scheduledId*required    | scheduleId          |
| string                  |                     |
|  *(path)*               |                     |

### Responses

| Code | Description                                                |
|------|------------------------------------------------------------|
| 200  | PaymentSchedule record created successfully                |
| 401  | Unauthorized                                               |
| 403  | Operation not permitted for this business                  |
| 404  | Invalid businessId, subscriptionId or scheduledId supplied |



## Cancel a subscription

This endpoint cancels a subscription record under a business account by id

### HTTP Request

`PATCH`  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/cancel

### Query Parameters

| Parameter               | Description    |
|-------------------------|----------------|
| businessId *required    | businessId     |
| string                  |                |
| *(path)*                |                |
| subscriptionId*required | subscriptionId |
| string                  |                |
|  *(path)*               |                |

### Responses

| Code | Description                                   |
|------|-----------------------------------------------|
| 200  | Subscription cancelled successfully           |
| 204  | No Content                                    |
| 401  | Unauthorized                                  |
| 403  | Operation not permitted for this business     |
| 404  | Invalid businessId or subscriptionId supplied |



## Pause a subscription

This endpoint pauses a subscription record under a business account 

### HTTP Request

`PATCH`  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/pause

### Query Parameters

| Parameter               | Description    |
|-------------------------|----------------|
| businessId *required    | businessId     |
| string                  |                |
| *(path)*                |                |
| subscriptionId*required | subscriptionId |
| string                  |                |
| *(path)*                |                |

### Responses

| Code | Description                                   |
|------|-----------------------------------------------|
| 200  | Subscription paused successfully              |
| 204  | No Content                                    |
| 401  | Unauthorized                                  |
| 403  | Operation not permitted for this business     |
| 404  | Invalid businessId or subscriptionId supplied |



## Update a PaymentSchedule record

```json
  {
    "amount": 93874,
    "graceDate": "yyyy-MM-dd",
    "id": "6bb42d33-c2a2-4763-90e4-ff1702fc9951",
    "reminderDate": "yyyy-MM-dd",
    "scheduledFor": "yyyy-MM-dd",
    "shortenedUrl": "https://test.jpg-online.com/connect/gateway/processing?storename=110995000&oid=VT-83be410a-6aba-449c-paymentUrlId=d32rceubeff-cdy4-00388n8839d",
    "status": "AVAILABLE",
    "subscriptionId": "3330eb10-8a8c-11ec-a8a3-0242ac120002"
  }
```

This endpoint updates a PaymentSchedule record
### HTTP Request

`PUT`  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/schedule

### Query Parameters

| Parameter            | Description      |
|----------------------|------------------|
| businessId *required | businessId       |
| string               |                  |
| *(path)*             |                  |
| customer*required    | customer         |
| *(body)*             |                  |
| updateRequestDto     | updateRequestDto |
|  *(body)*            |                  |
### Responses

| Code | Description                                    |
|------|------------------------------------------------|
| 200  | Payment schedule updated successfully          |
| 201  | Created                                        |
| 400  | Invalid data supplied for creation of customer |
| 401  | Unauthorized                                   |
| 403  | Operation not permitted for this business      |
| 404  | Invalid businessId supplied                    |

## Resend SMS notification of payment 
```json
  {
    "amount": 64913,
    "date": "yyyy-MM-dd",
    "id": "3993cf04-8a73-11ec-a8a3-0242ac120002"
  }
```

This endpoint resends SMS notification of payment 

### HTTP Request

`PATCH`  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/schedule

### Query Parameters

| Parameter               | Description    |
|-------------------------|----------------|
| businessId *required    | businessId     |
| string                  |                |
| *(path)*                |                |
| subscriptionId*required | subscriptionId |
| string                  |                |
| *(path)*                |                |

### Responses

| Code | Description                                             |
|------|---------------------------------------------------------|
| 200  | SMS notification sent successfully                      |
| 204  | No Content                                              |
| 400  | Invalid data supplied for creation of payment schedules |
| 401  | Unauthorized                                            |
| 403  | Operation not permitted for this business               |
| 404  | Invalid businessId or subscriptionId supplied           |



## Schedule payments for this subscription using the dates and amounts specified in the body 

This endpoint schedule payments for this subscription using the dates and amounts specified in the body

### HTTP Request

`POST`  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/schedule/date

### Query Parameters

| Parameter               | Description    |
|-------------------------|----------------|
| businessId *required    | businessId     |
| string                  |                |
| *(path)*                |                |
| subscriptionId*required | subscriptionId |
| string                  |                |
| *(body)*                |                |
| payments*required       | payments       |
| (body)                  |                |

### Responses

| Code | Description                                    |
|------|------------------------------------------------|
| 200  | Payment schedule generated successfully        |
| 201  | Created                                        |
| 400  | Invalid data supplied for creation of customer |
| 401  | Unauthorized                                   |
| 403  | Operation not permitted for this business      |
| 404  | Invalid businessId supplied                    |
## Schedule payments for this subscription using the order and amounts specified in the body

```json
  {
    "amount": 56827,
    "order": 0
  }
```

This endpoint schedule payments for this subscription using the order and amounts specified in the body


### HTTP Request

`POST`  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/schedule/order

### Query Parameters

| Parameter               | Description    |
|-------------------------|----------------|
| businessId *required    | businessId     |
| string                  |                |
| *(path)*                |                |
| subscriptionId*required | subscriptionId |
| string                  |                |
| *(path)*                |                |
| payments*required       | payments       |
| *(body)*                |                |

### Responses

| Code | Description                                             |
|------|---------------------------------------------------------|
| 200  | Payments schedules cancelled successfully               |
| 201  | Created                                                 |
| 400  | Invalid data supplied for creation of payment schedules |
| 401  | Unauthorized                                            |
| 403  | Operation not permitted for this business               |
| 404  | Invalid businessId or subscriptionId supplied           |

## Find all subscriptions for a customer by customerId

This endpoint finds all subscriptions for a customer by customerId

### HTTP Request

`GET`  /enterprise/v1/subscriptions/{businessId}/customer/{customerId}

### Query Parameters

| Parameter            | Description |
|----------------------|-------------|
| businessId *required | businessId  |
| string               |             |
| *(path)*             |             |
| customerId*required  | customerId  |
| string               |             |
| *(path)*             |             |

### Responses

| Code | Description                                   |
|------|-----------------------------------------------|
| 200  | Customer subscriptions found successfully     |
| 401  | Unauthorized                                  |
| 403  | Operation not permitted for this business     |
| 404  | Invalid businessId or subscriptionId supplied |

# Tiers

## Create a tier under a business account

```json
  {
    "amount": 102185,
    "billingPeriod": "ONCE",
    "deductions": 0,
    "graceDays": 0,
    "id": "5271cc42-8a73-11ec-a8a3-0242ac120002",
    "name": "John H. Thomas",
    "policy": "TIER",
    "reminderDays": 0
  }
```

This endpoint creates a tier under a business account


### HTTP Request

`POST`  /enterprise/v1/tiers/{businessId}

### Query Parameters

| Parameter            | Description |
|----------------------|-------------|
| businessId *required | businessId  |
| string               |             |
| *(path)*             |             |
| tier*required        | tier        |
| *(body)*             |             |

### Responses

| Code | Description                                |
|------|--------------------------------------------|
| 200  | Tier created successfully                  |
| 201  | Created                                    |
| 400  | Invalid data supplied for creation of tier |
| 401  | Unauthorized                               |
| 403  | Operation not permitted for this business  |
| 404  | Invalid businessId or  supplied            |

## Get a tier record by it's id

This endpoint  Get a tier record by it's id

### HTTP Request

`GET` /enterprise/v1/tiers/{businessId}/{tierId}

### Query Parameters

| Parameter            | Description |
|----------------------|-------------|
| businessId *required | businessId  |
| string               |             |
| *(path)*             |             |
| tierId*required      | tierId      |
| *(path)*             |             |

### Responses

| Code | Description                               |
|------|-------------------------------------------|
| 200  | Tier found by id                          |
| 401  | Unauthorized                              |
| 403  | Operation not permitted for this business |
| 404  | Invalid businessId or tierId supplied     |

## Update a tier under a business account

```json
 {
    "amount": 832964,
    "billingPeriod": "ONCE",
    "deductions": 0,
    "description": "Enjoy new additional services",
    "graceDays": 0,
    "id": "6325a978-8a73-11ec-a8a3-0242ac120002",
    "name": "Jacqueline M. Abbot",
    "policy": "TIER",
    "reminderDays": 0
  }

```

This endpoint updates a tier under a business account


### HTTP Request

`PUT`  /enterprise/v1/tiers/{businessId}/{tierId}

### Query Parameters

| Parameter            | Description |
|----------------------|-------------|
| businessId *required | businessId  |
| string               |             |
| *(path)*             |             |
| tier*required        | tier        |
| string               |             |
| *(path)*             |             |
| tier*required        | tier        |
| *(body)*             |             |

### Responses

| Code | Description                                |
|------|--------------------------------------------|
| 200  | Tier updated successfully                  |
| 201  | Created                                    |
| 400  | Invalid data supplied for creation of tier |
| 401  | Unauthorized                               |
| 403  | Operation not permitted for this business  |
| 404  | Invalid businessId or tierId supplied      |
