# API Version 1

## List All Campaigns

```shell
curl -X "GET" "http://api.webconnex.com/v1/public/forms" \
	-H "apiKey: xxxxxxxxxx"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "accountId": 1,
    "name": "Form 1",
    "product": "givingfuel.com",
    "status": 1,
    "createdDate": "2015-01-31T00:59:08Z",
    "updatedDate": "2015-11-12T16:13:37Z"
  },
  {
    "id": 4,
    "accountId": 1,
    "name": "Form 2",
    "product": "givingfuel.com",
    "status": 1,
    "publishedDate": "2015-11-05T21:43:36Z",
    "createdDate": "2015-01-31T17:10:54Z",
    "updatedDate": "2015-11-05T21:43:35Z"
  }
]
```
`GET /forms2`

### Response Parameters
Parameter | Type | Description
-------------- | -------------- | --------------
id | integer | ID of the requested form
accountId | integer | ID of the form owner account
name | string | name of the form
product | string | product of the form
status | integer | status of the form state (0 = scheduled, 1 = open, 2 = closed, 3 = archived, 4 = deleted)
createdDate | date/time | created updated date and time
updatedDate |  date/time | last updated date and time in UTC

## Form Detail

```shell
curl -X "GET" "http://api.webconnex.com/v1/public/forms/1" \
	-H "apiKey: xxxxxxxxxx"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "accountId": 1,
  "name": "Form 1",
  "product": "givingfuel.com",
  "fields": {
    "type": "form",
    "attributes": {
      "visible": true,
      "enabled": true,
      "registrantPermissions": {
        "createAccount": {
          "startDate": "2015-11-17T08:00:00.000Z",
          "endDate": "2015-11-16T08:00:00.000Z",
          "link": "http://test.account.webconnex.com/login",
          "enabled": true,
          "showConfPage": true,
          "showEmail": true
        }
      }
    },
    "triggers": [],
    "header": {
      "type": "header",
      "key": "header",
      "attributes": {
        "visible": true,
        "enabled": true
      },
      "children": []
    },
    "registrants": {
      "type": "registrants",
      "key": "registrants",
      "attributes": {
        "maximum": 1,
        "minimum": 1,
        "multireg": false,
        "visible": true,
        "enabled": true
      },
      "children": []
    },
    "billing": {
      "type": "billing",
      "key": "billing",
      "attributes": {
        "label": "Billing",
        "required": true,
        "visible": true,
        "enabled": true
      },
      "header": {},
      "name": {},
        "firstName": {},
        "lastName": {},
        "mi": {},
      "address": {
        "street1": {},
        "street2": {},
        "city": {},
        "state": {},
        "postalCode": {},
        "country": {}
      },
      "paymentMethod": {
        "type": "paymentMethod",
        "key": "paymentMethod",
        "attributes": {
          "label": "Payment Method",
          "visible": true
        },
        "card": {},
        "check": {},
        "offline": {}
      },
      "card": {
        "type": "creditCard",
        "key": "card",
        "attributes": {
          "label": "Credit Card",
          "visible": true,
          "enabled": true
        },
        "cardNumber": {},
        "expMonth": {},
        "expYear": {},
        "cvvCode": {}
      },
      "check": {
        "bankName": {},
        "accountType": {},
        "routingNumber": {},
        "accountNumber": {}
      },
      "email": {}
    },
    "submit": {},
    "footer": {
      "children": []
    }
  },
  "status": 1,
  "timeZone": "",
  "createdDate": "2015-01-31T00:59:08Z",
  "updatedDate": "2015-11-12T16:13:37Z"
}
```
`GET /forms/:id`


Contains all the details about the form including the fields and the field's attributes.

### Query Parameters
Parameter | Optional | Description
-------------- | -------------- | --------------
id | no | ID of the requested form

### Response Parameters
Parameter | Type | Description
-------------- | -------------- | --------------
id | integer | ID of the requested form
accountId | integer | ID of the form owner account
name | string | name of the form
product | string | product of the form
fields | array | array of the all the products fields
status | integer | status of the form state (0 = scheduled, 1 = open, 2 = closed, 3 = archived, 4 = deleted)
timeZone| string | timezone offset for the form
createdDate | date/time | created updated date and time
updatedDate |  date/time | last updated date and time in UTC

## Webhooks


```shell
curl -X "GET" "http://api.webconnex.com/v1/public/webhooks" \
	-H "apiKey: xxxxxxxxxx"
```

> The above command returns JSON structured like this:

`GET /webhooks`

```json
[
  {
    "id": 1,
    "accountId": 1,
    "forms": [
      1
    ],
    "token": "x1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x1x",

    "events": ["registration"],
    "method": "POST",
    "url": "https://your-endpoint.com",
    "typeId": 0,
    "status": 1,
    "meta": {
      "name": "Nanno Test"
    },
    "dateCreated": "2015-12-02T16:25:53Z",
    "dateUpdated": "2015-11-20T21:20:31Z"
  }
]
```

### Response Parameters
Parameter | Type | Description
-------------- | -------------- | --------------
id | integer | ID of the requested form
accountId | integer | ID of the form owner account
forms | array[integers] | array of the formsID's tied to the webhook
token | hmac token | token used to uniquely identify the webhook
method | string | HTTP Method for the webhook
url | string | qualified URL for the webhook endpoint
typeID | integer | should be set to 1 unless the webhook is an internal integration
status| integer | 1 = active, 2 = inactive
meta| object | contains name and other meta information
createdDate | date/time | created updated date and time
updatedDate |  date/time | last updated date and time in UTC


## View Webhook Details

```shell
curl -X "GET" "http://api.webconnex.com/v1/public/webhooks/:id" \
	-H "apiKey: xxxxxxxxxx"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 39,
    "accountId": 1,
    "forms": [
      432
    ],
    "token": "b473fe314def43ccacc10ec75aae1451",
    "events": [
      "registration"
    ],
    "method": "POST",
    "url": "https://3jo5qdp4ke.execute-api.us-west-2.amazonaws.com/prod/test/?email=nathanael%40wearebunker.com",
    "typeId": 0,
    "status": 1,
    "meta": {
      "name": "Nanno Test"
    },
    "dateCreated": "2015-12-02T16:25:53Z",
    "dateUpdated": "2015-11-20T21:20:31Z"
  }
]
```

`GET /webhooks/:id`

### Response Parameters
Parameter | Type | Description
-------------- | -------------- | --------------
id | integer | ID of the requested form
accountId | integer | ID of the form owner account
forms | array[integers] | array of the formsID's tied to the webhook
token | hmac token | token used to uniquely identify the webhook
method | string | HTTP Method for the webhook
url | string | qualified URL for the webhook endpoint
typeID | integer | should be set to 1 unless the webhook is an internal integration
status| integer | 1 = active, 2 = inactive
meta| object | contains name and other meta information
createdDate | date/time | created updated date and time
updatedDate |  date/time | last updated date and time in UTC

## Create Webhook

`POST /webhooks`

```json
{

}
```
## Update Webhook

```shell
curl "http://example.com/divvy/resend/:hook_id/delivery/:history_id"
  -H "Authorization: sessionID"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name" : "something here"
  },
  {
    "id": 2,
    "name": "something here"
  }
]
```

`PUT /webhooks/:id`





## Delete Webhook

`DELETE /webhooks/:id`

```json
{

}
```


### HTTP Request

`GET http://example.com/api/divvy/`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
sort | "asc" | Will sort by either time processed ascending or descending
errors | true | Will show only failed requests




```shell
curl "http://example.com/api/divvy"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "something to go here"
}
```
