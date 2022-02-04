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


# customer-resource

## Create a customer record under a business account

```json
[
  {
    "customerNum" : "string",
    "email" : "string",
    "firstName" : "string",
    "id" : "string",
    "lastName" : "string",
    "phoneNo" : "string"
  }
]
```

This endpoint creates a customer record under a business account

### HTTP Request

POST  /enterprise/v1/customers/{businessId}

### Query Parameters

Parameter | Description
--------------------|----------
businessId *required| businessId
string              |
*(path)*            |
                    |
customer*required   | customer
*(body)*            |

### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          | Customer record created successfully 
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
201          | Created
400          | Invalid data supplied for creation of customer
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId supplied      



## Update a Customer record under a business account

```json
[
  {
    "customerNum" : "string",
    "email" : "string",
    "firstName" : "string",
    "id" : "string",
    "lastName" : "string",
    "phoneNo" : "string"
  }
]
```

This endpoint updates a customer record under a business account

### HTTP Request

PUT  /enterprise/v1/customers/{businessId}

### Query Parameters

Parameter | Description
--------------------| -----------
businessId *required| businessId
string              |
*(path)*            |
                    |
customer*required   | customer
*(body)*            |

### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          | Customer record updated successfully 
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
201          | Created
400          | Invalid data supplied for update of customer record
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId supplied    

## Find customer record by its id
This endpoint finds  customer record by its id 

### HTTP Request

GET /enterprise/v1/customers/{businessId}/id/{customerId}

### Query Parameters

Parameter | Description
--------------------| -----------
businessId *required| businessId
string              |
*(path)*            |
                    |
customer*required   | customer
*(body)*            |

### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          | Customer record found successfully 
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId supplied    

# subscription-resource


## Create a subscription record under a business account

```json
[
  {
    "amount" : "0",
    "cancelledOn" : "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
    "customerId" : "string",
    "id" : "string",
    "lastBilledOn" : "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
    "nextBillingDate" : "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
    "pausedOn" : "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
    "receipts" : [
      {
        "amount" : 0,
        "receivedAt": "yyyy-MM-dd'T'HH:mm:ss.SSSZZ",
        "subscriptionId" : "string"
      }
    ],
    "scheduleResets" : true,
    "schedules": [
      {
        "amount": 0,
        "graceDate": "yyyy-MM-dd",
        "id": "string",
        "reminderDate": "yyyy-MM-dd",
        "scheduledFor": "yyyy-MM-dd",
        "shortenedUrl": "string",
        "status": "AVAILABLE",
        "subscriptionId": "string"
      }
    ],
    "startDate": "yyyy-MM-dd",
    "status": "ACTIVE",
    "tierId": "string"
  }
]
```

This endpoint creates a subscription record under a business account

### HTTP Request

POST  /enterprise/v1/subscriptions/{businessId}

### Query Parameters

Parameter | Description
-------------------- | -----------
businessId *required | businessId
string               |
*(path)*             |
subscription*required| subscription
*(body)*             |

### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          | Subscription record created successfully
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
201          | Created
400          | Invalid data supplied for creation of customer
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId supplied  


## Find a subscription under a business account by id 

This endpoint finds a subscription record under a business account by id

### HTTP Request

GET  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}

### Query Parameters

Parameter | Description
--------------------------|-------------------
businessId *required      | businessId
string                    |
*(path)*                  |
subscriptionId*required   | subscriptionId
string                    |
*(path)*                  |

### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          | Subscription record found successfully
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId or subscriptionId supplied



##Find a scheduled payment under a business account by id

This endpoint finds a scheduled payment under a business account by id 

### HTTP Request

GET  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/{scheduleId}

### Query Parameters

Parameter | Description
--------------------------|-----------------------
businessId *required      | businessId
string                    |
*(path)*                  |
subscriptionId*required   | subscriptionId
string                    |
*(path)*                  |
scheduledId*required      | scheduleId
string                    |
*(path)*                  |

### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          | PaymentSchedule record created successfully
             | Example Value /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId, subscriptionId or scheduledId supplied



## Cancel a subscription

This endpoint cancels a subscription record under a business account by id

### HTTP Request

PATCH  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/cancel

### Query Parameters

Parameter | Description
--------------------------|----------------------
businessId *required      | businessId
string                    |
*(path)*                  |
subscriptionId*required   | subscriptionId
string                    |
*(path)*                  |

### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          | Subscription cancelled successfully
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
204          | No Content
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId or subscriptionId supplied



## Pause a subscription

This endpoint pauses a subscription record under a business account 

### HTTP Request

PATCH  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/pause

### Query Parameters

Parameter | Description
--------------------------|---------------
businessId *required      | businessId
string                    |
*(path)*                  |
subscriptionId*required   | subscriptionId
string                    |
*(path)*                  |

### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          | Subscription paused successfully
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
204          | No Content 
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId or subscriptionId supplied



## Update a PaymentSchedule record

```json
[
  {
    "amount": 0,
    "graceDate": "yyyy-MM-dd",
    "id": "string",
    "reminderDate": "yyyy-MM-dd",
    "scheduledFor": "yyyy-MM-dd",
    "shortenedUrl": "string",
    "status": "AVAILABLE",
    "subscriptionId": "string"
  }
]
```

This endpoint updates a PaymentSchedule record
### HTTP Request

PUT  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/schedule

### Query Parameters

Parameter | Description
------------------------------|-----------------
businessId *required          | businessId
string                        |
*(path)*                      |
customer*required             | customer
*(body)*                      |
updateRequestDto              | updateRequestDto
*(body)*                      |
### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          | Payment schedule updated successfully
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
201          | Created
400          | Invalid data supplied for creation of customer
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId supplied   



## Resend SMS notification of payment 
```json
[
  {
    "amount": 0,
    "date": "yyyy-MM-dd",
    "id": "string"
  }
]
```

This endpoint resends SMS notification of payment 

### HTTP Request

PATCH  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/schedule

### Query Parameters

Parameter |Description
---------------------------|--------------------
businessId *required       | businessId
string                     |
*(path)*                   |
subscriptionId*required    | subscriptionId
string                     |
*(path)*                   |

### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          | SMS notification sent successfully
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
204          | No Content
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId or subscriptionId supplied



##Schedule payments for this subscription using the dates and amounts specified in the body 

This endpoint Schedule payments for this subscription using the dates and amounts specified in the body

### HTTP Request

POST  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/schedule/date

### Query Parameters

Parameter | Description
------------------------------|-------------------------
businessId *required          | businessId
string                        |
*(path)*                      |
subscriptionId*required       | subscriptionId
string                        |
*(body)*                      |
payments*required             | payments
(body)                        |
### Responses

Code         |                   Description
-----------  |  ----------------------------------------
200          | Payment schedules generated successfully
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
201          | Created
400          | Invalid data supplied for creation of customer
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId supplied  



## Schedule payments for this subscription using the order and amounts specified in the body

```json
[
  {
    "amount": 0,
    "order": 0
  }
]
```

This endpoint Schedule payments for this subscription using the order and amounts specified in the body


### HTTP Request

POST  /enterprise/v1/subscriptions/{businessId}/{subscriptionId}/schedule/order

### Query Parameters

Parameter | Description
--------------------------|-----------------------
businessId *required      | businessId
string                    |
*(path)*                  |
subscriptionId*required   | subscriptionId
string                    |
*(path)*                  |
payments*required         | payments
*(body)*                  |

### Responses

Code| Description
----|----------------------------------------
200 | Payments schedules cancelled successfully
    | Example  /Model
    | {
    |  "body" : {},
    | "statusCode" : "100 CONTINUE" ,
    | "statusCodeValue" : 0
    | }
201 | Created
400 |Invalid data supplied for creation of payment schedules
401 | Unauthorized
403 | Operation not permitted for this business
404 | Invalid businessId or subscriptionId supplied



## Find all subscriptions for a customer by customerId

This endpoint finds all subscriptions for a customer by customerId

### HTTP Request

GET  /enterprise/v1/subscriptions/{businessId}/customer/{customerId}

### Query Parameters

Parameter | Description
--------------------|---------------------
businessId *required| businessId
string              |
*(path)*            |
customerId*required | customerId
string              |
*(path)*            |

### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          | Customer subscriptions found successfully
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId or subscriptionId supplied



#tier-resource

## Create a tier under a business account

```json
[
  {
    "amount": 0,
    "billingPeriod": "ONCE",
    "deductions": 0,
    "graceDays": 0,
    "id": "string",
    "name": "string",
    "policy": "TIER",
    "reminderDays": 0
  }
]
```

This endpoint creates a tier under a business account


### HTTP Request

POST  /enterprise/v1/tiers/{businessId}

### Query Parameters

Parameter | Description
--------------------|------------
businessId *required| businessId
string              |
*(path)*            |
tier*required       | tier
*(body)*            |

### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          |  Tier created successfully
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
201          | Created
400          |Invalid data supplied for creation of tier
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId or  supplied



## Get a tier record by it's id

This endpoint  Get a tier record by it's id

### HTTP Request

GET  /enterprise/v1/tiers/{businessId}/{tierId}

### Query Parameters

Parameter | Description
------------------------------|--------------
businessId *required          | businessId
string                        |
*(path)*                      |
tierId*required               | tierId
*(path)*                      |

### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          | Tier found by id
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId or tierId supplied



## Update a tier under a business account

```json
 {
    "amount": 0,
    "billingPeriod": "ONCE",
    "deductions": 0,
    "description": "string",
    "graceDays": 0,
    "id": "string",
    "name": "string",
    "policy": "TIER",
    "reminderDays": 0
  }

```

This endpoint updates a tier under a business account


### HTTP Request

PUT  /enterprise/v1/tiers/{businessId}/{tierId}

### Query Parameters

Parameter | Description
--------------------|--------------
businessId *required| businessId
string              |
*(path)*            |
tier*required       | tier
string              |
*(path)*            |
tier*required       | tier
*(body)*            |

### Responses

Code         |                   Description
-----------  |  ----------------------------------------------------------------------------
200          | Tier updated successfully
             | Example  /Model
             | {
             |  "body" : {},
             | "statusCode" : "100 CONTINUE" ,
             | "statusCodeValue" : 0
             | }
201          | Created
400          |Invalid data supplied for creation of tier
401          | Unauthorized
403          | Operation not permitted for this business
404          | Invalid businessId or tierId supplied
