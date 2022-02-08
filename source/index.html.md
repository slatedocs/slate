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
# Authentication Api
# Introduction
[Base URl : localhost:8080/ ]

http://localhost:8080/v2/api-docs


# Customer

## Create a customer record under a business account

```json
  {
    "customerNum" : "4515",
    "email" : "JoeyEGosselin@jourrapide.com",
    "firstName" : "Joey",
    "id" : "1",
    "lastName" : "Gosselin",
    "phoneNo" : "603-227-4012"
  }
```

This endpoint creates a customer record under a business account

### HTTP Request

POST  /enterprise/v1/customers/{businessId}

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
|      | Example  /Model                                |
|      | {                                              | 
|      | "body" : {},                                   |
|      | "statusCode" : "100 CONTINUE" ,                | 
|      | "statusCodeValue" : 0                          |
|      | }                                              |
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
    "id" : "5",
    "lastName" : "Perrin",
    "phoneNo" : "281-587-2451"
  }
```

This endpoint updates a customer record under a business account

### HTTP Request

PUT  /enterprise/v1/customers/{businessId}

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
|      | Example  /Model                                     |
|      | {                                                   | 
|      | "body" : {},                                        |  
|      | "statusCode" : "100 CONTINUE"                       | , 
|      | "statusCodeValue" : 0}                              |
| 201  | Created                                             |
| 400  | Invalid data supplied for update of customer record |
| 401  | Unauthorized                                        |
| 403  | Operation not permitted for this business           |
| 404  | Invalid businessId supplied                         |

## Find customer record by its id
This endpoint finds  customer record by its id 

### HTTP Request

GET /enterprise/v1/customers/{businessId}/id/{customerId}

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
|      | Example  /Model                           | 
|      | {                                         |
|      | "body" : {},                              |
|      | "statusCodeValue" : 0                     |
|      | }                                         |
| 401  | Unauthorized                              |
| 403  | Operation not permitted for this business |
| 404  | Invalid businessId supplied               |

# Subscription


## Create a subscription record under a business account

```json
  {
    "amount" : "0",
    "cancelledOn" : "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
    "customerId" : "32174",
    "id" : "3",
    "lastBilledOn" : "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
    "nextBillingDate" : "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
    "pausedOn" : "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
    "receipts" : [
      {
        "amount" : 0,
        "receivedAt": "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
        "subscriptionId" : "4690"
      }
    ],
    "scheduleResets" : true,
    "schedules": [
      {
        "amount": 0,
        "graceDate": "yyyy-MM-dd",
        "id": "2",
        "reminderDate": "yyyy-MM-dd",
        "scheduledFor": "yyyy-MM-dd",
        "shortenedUrl": "https://test.jpg-online.com/connect/processing?storename=115512500&oid=VT-83be410a-6aba-449c-paymentUrlId=d32rceubeff-ca74-00388n8839d",
        "status": "AVAILABLE",
        "subscriptionId": "59140"
      }
    ],
    "startDate": "yyyy-MM-dd",
    "status": "ACTIVE",
    "tierId": "1248"
  }
```

This endpoint creates a subscription record under a business account

### HTTP Request

POST  /enterprise/v1/subscriptions/{businessId}

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
|      | Example  /Model                                |
|      | {                                              | 
|      | "body" : {},                                   |  
|      | "statusCode" : "100 CONTINUE"                  | , 
|      | "statusCodeValue" : 0}                         |
| 201  | Created                                        |
| 400  | Invalid data supplied for creation of customer |
| 401  | Unauthorized                                   |
| 403  | Operation not permitted for this business      |
| 404  | Invalid businessId supplied                    |


## Find a subscription under a business account by id 

This endpoint finds a subscription record under a business account by id

### HTTP Request

GET  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}

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
|      | Example  /Model                               |
|      | {                                             |
|      | "body" : {},                                  |
|      | "statusCode" : "100 CONTINUE" ,               |
|      | "statusCodeValue" : 0                         |
|      | }                                             | 
| 401  | Unauthorized                                  |
| 403  | Operation not permitted for this business     |
|  404 | Invalid businessId or subscriptionId supplied |



## Find a scheduled payment under a business account by id

This endpoint finds a scheduled payment under a business account by id 

### HTTP Request

GET  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/{scheduleId}

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
|      | Example Value /Model                                       |
|      | {                                                          |
|      | "body" : {},                                               |
|      | "statusCode" : "100 CONTINUE" ,                            |
|      | "statusCodeValue" : 0                                      |
|      | }                                                          |
| 401  | Unauthorized                                               |
| 403  | Operation not permitted for this business                  |
| 404  | Invalid businessId, subscriptionId or scheduledId supplied |



## Cancel a subscription

This endpoint cancels a subscription record under a business account by id

### HTTP Request

PATCH  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/cancel

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
|      | Example  /Model                               |
|      | {                                             |
|      | "body" : {},                                  |
|      | "statusCode" : "100 CONTINUE" ,               |
|      | "statusCodeValue" : 0                         |
|      | }                                             |
| 204  | No Content                                    |
| 401  | Unauthorized                                  |
| 403  | Operation not permitted for this business     |
| 404  | Invalid businessId or subscriptionId supplied |



## Pause a subscription

This endpoint pauses a subscription record under a business account 

### HTTP Request

PATCH  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/pause

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
|      | Example  /Model                               |
|      | {                                             |
|      | "body" : {},                                  |
|      | "statusCode" : "100 CONTINUE" ,               |
|      | "statusCodeValue" : 0                         |
|      | }                                             |
| 204  | No Content                                    |
| 401  | Unauthorized                                  |
| 403  | Operation not permitted for this business     |
| 404  | Invalid businessId or subscriptionId supplied |



## Update a PaymentSchedule record

```json
  {
    "amount": 0,
    "graceDate": "yyyy-MM-dd",
    "id": "7",
    "reminderDate": "yyyy-MM-dd",
    "scheduledFor": "yyyy-MM-dd",
    "shortenedUrl": "https://test.jpg-online.com/connect/gateway/processing?storename=110995000&oid=VT-83be410a-6aba-449c-paymentUrlId=d32rceubeff-cdy4-00388n8839d",
    "status": "AVAILABLE",
    "subscriptionId": "57740"
  }
```

This endpoint updates a PaymentSchedule record
### HTTP Request

PUT  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/schedule

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

| Code                            | Description                                    |
|---------------------------------|------------------------------------------------|
| 200                             | Payment schedule updated successfully          |
| Example  /Model                 |                                                |
| {                               |                                                |
| "body" : {},                    |                                                |
| "statusCode" : "100 CONTINUE" , |                                                |
| "statusCodeValue" : 0           |                                                |
| }                               |                                                |
| 201                             | Created                                        |
| 400                             | Invalid data supplied for creation of customer |
| 401                             | Unauthorized                                   |
| 403                             | Operation not permitted for this business      |
| 404                             | Invalid businessId supplied                    |

## Resend SMS notification of payment 
```json
  {
    "amount": 0,
    "date": "yyyy-MM-dd",
    "id": "9"
  }
```

This endpoint resends SMS notification of payment 

### HTTP Request

PATCH  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/schedule

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

| Code                            | Description                                   |
|---------------------------------|-----------------------------------------------|
| 200                             | SMS notification sent successfully            |
| Example  /Model                 |                                               |
| {                               |                                               |
| "body" : {},                    |                                               |
| "statusCode" : "100 CONTINUE" , |                                               |
| "statusCodeValue" : 0           |                                               |
| }                               |                                               |
| 204                             | No Content                                    |
| 401                             | Unauthorized                                  |
| 403                             | Operation not permitted for this business     |
| 404                             | Invalid businessId or subscriptionId supplied |

## Schedule payments for this subscription using the dates and amounts specified in the body 

This endpoint schedule payments for this subscription using the dates and amounts specified in the body

### HTTP Request

POST  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/schedule/date

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

| Code                            | Description                                    |
|---------------------------------|------------------------------------------------|
| 200                             | Payment schedules generated successfully       |
| Example  /Model                 |                                                |
| {                               |                                                |
| "body" : {},                    |                                                |
| "statusCode" : "100 CONTINUE" , |                                                |
| "statusCodeValue" : 0           |                                                |
| }                               |                                                |
| 201                             | Created                                        |
| 400                             | Invalid data supplied for creation of customer |
| 401                             | Unauthorized                                   |
| 403                             | Operation not permitted for this business      |
| 404                             | Invalid businessId supplied                    |

## Schedule payments for this subscription using the order and amounts specified in the body

```json
  {
    "amount": 0,
    "order": 0
  }
```

This endpoint schedule payments for this subscription using the order and amounts specified in the body


### HTTP Request

POST  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/schedule/order

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

| Code                            | Description                                             |
|---------------------------------|---------------------------------------------------------|
| 200                             | Payments schedules cancelled successfully               |
| Example  /Model                 |                                                         |
| {                               |                                                         |
| "body" : {},                    |                                                         |
| "statusCode" : "100 CONTINUE" , |                                                         |
| "statusCodeValue" : 0           |                                                         |
| }                               |                                                         |
| 201                             | Created                                                 |
| 400                             | Invalid data supplied for creation of payment schedules |
| 401                             | Unauthorized                                            |
| 403                             | Operation not permitted for this business               |
| 404                             | Invalid businessId or subscriptionId supplied           |

## Find all subscriptions for a customer by customerId

This endpoint finds all subscriptions for a customer by customerId

### HTTP Request

GET  /enterprise/v1/subscriptions/{businessId}/customer/{customerId}

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

| Code                            | Description                                   |
|---------------------------------|-----------------------------------------------|
| 200                             | Customer subscriptions found successfully     |
| Example  /Model                 |                                               |
| {                               |                                               |
| "body" : {},                    |                                               |
| "statusCode" : "100 CONTINUE" , |                                               |
| "statusCodeValue" : 0           |                                               |
| }                               |                                               |
| 401                             | Unauthorized                                  |
| 403                             | Operation not permitted for this business     |
| 404                             | Invalid businessId or subscriptionId supplied |

# Tier

## Create a tier under a business account

```json
  {
    "amount": 0,
    "billingPeriod": "ONCE",
    "deductions": 0,
    "graceDays": 0,
    "id": "7",
    "name": "John H. Thomas",
    "policy": "TIER",
    "reminderDays": 0
  }
```

This endpoint creates a tier under a business account


### HTTP Request

POST  /enterprise/v1/tiers/{businessId}

### Query Parameters

| Parameter            | Description |
|----------------------|-------------|
| businessId *required | businessId  |
| string               |             |
| *(path)*             |             |
| tier*required        | tier        |
| *(body)*             |             |

### Responses

| Code                            | Description                                |
|---------------------------------|--------------------------------------------|
| 200                             | Tier created successfully                  |
| Example  /Model                 |                                            |
| {                               |                                            |
| "body" : {},                    |                                            |
| "statusCode" : "100 CONTINUE" , |                                            |
| "statusCodeValue" : 0           |                                            |
| }                               |                                            |
| 201                             | Created                                    |
| 400                             | Invalid data supplied for creation of tier |
| 401                             | Unauthorized                               |
| 403                             | Operation not permitted for this business  |
| 404                             | Invalid businessId or  supplied            |

## Get a tier record by it's id

This endpoint  Get a tier record by it's id

### HTTP Request

GET  /enterprise/v1/tiers/{businessId}/{tierId}

### Query Parameters

| Parameter            | Description |
|----------------------|-------------|
| businessId *required | businessId  |
| string               |             |
| *(path)*             |             |
| tierId*required      | tierId      |
| *(path)*             |             |

### Responses

| Code                            | Description                               |
|---------------------------------|-------------------------------------------|
| 200                             | Tier found by id                          |
| Example  /Model                 |                                           |
| {                               |                                           |
| "body" : {},                    |                                           |
| "statusCode" : "100 CONTINUE" , |                                           |
| "statusCodeValue" : 0           |                                           |
| }                               |                                           |
| 401                             | Unauthorized                              |
| 403                             | Operation not permitted for this business |
| 404                             | Invalid businessId or tierId supplied     |

## Update a tier under a business account

```json
 {
    "amount": 0,
    "billingPeriod": "ONCE",
    "deductions": 0,
    "description": "Enjoy new additional services",
    "graceDays": 0,
    "id": "12",
    "name": "Jacqueline M. Abbot",
    "policy": "TIER",
    "reminderDays": 0
  }

```

This endpoint updates a tier under a business account


### HTTP Request

PUT  /enterprise/v1/tiers/{businessId}/{tierId}

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

| Code                            | Description                                |
|---------------------------------|--------------------------------------------|
| 200                             | Tier updated successfully                  |
| Example  /Model                 |                                            |
| {                               |                                            |
| "body" : {},                    |                                            |
| "statusCode" : "100 CONTINUE" , |                                            |
| "statusCodeValue" : 0           |                                            |
| }                               |                                            |
| 201                             | Created                                    |
| 400                             | Invalid data supplied for creation of tier |
| 401                             | Unauthorized                               |
| 403                             | Operation not permitted for this business  |
| 404                             | Invalid businessId or tierId supplied      |
