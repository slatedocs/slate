## Webhooks Events

These are the system events that are available as webhook triggers

### Registration


> Payload

```json
{
  "eventType": "registration",
  "accountId": 1,
  "formId": 432,
  "data": {
    "billing": {
      "address": {
        "city": "Sacramento",
        "country": "US",
        "postalCode": "95814",
        "state": "CA",
        "street1": "123 Any St."
      },
      "card": {
        "cardNumber": "VISA-1111",
        "expMonth": 4,
        "expYear": 2018
      },
      "check": {},
      "email": "no-reply@webconnex.com",
      "name": {
        "first": "Robert",
        "last": "Jones"
      },
      "paymentMethod": "card"
    },
    "id": "14508051894641200000",
    "customerId": 8210,
    "orderNumber": "NWBGBY-xxx-xxx",
    "orderStatus": "completed",
    "registrants": [
      {
        "amount": 100,
        "data": [
          {
            "first": {
              "label": "First Name",
              "type": "nameField",
              "value": "Robert"
            },
            "key": "name",
            "label": "Name",
            "last": {
              "label": "Last Name",
              "type": "nameField",
              "value": "Jones"
            },
            "type": "name"
          },
          {
            "key": "registrationOptions",
            "label": "Registration Options",
            "options": [
              {
                "amount": "100",
                "discount": "0",
                "key": "option1",
                "label": "Option 1",
                "price": "100",
                "type": "regOption",
                "value": true
              }
            ],
            "type": "regOptions",
            "value": "option1"
          },
          {
            "city": {
              "label": "City",
              "type": "textField",
              "value": "Sacramento"
            },
            "country": {
              "label": "Country",
              "type": "textField",
              "value": "US"
            },
            "key": "address",
            "label": "Address",
            "postalCode": {
              "label": "ZIP/Postal Code",
              "type": "textField",
              "value": "95814"
            },
            "state": {
              "label": "State",
              "type": "textField",
              "value": "CA"
            },
            "street1": {
              "label": "Street Address",
              "type": "textField",
              "value": "1233 Any St."
            },
            "type": "address"
          },
          {
            "key": "email",
            "label": "Email",
            "type": "email",
            "value": "nathanael@wearebunker.com"
          }
        ],
        "id": "145080518947020000"
      }
    ],
    "registrationTimestamp": "2015-12-22T17:26:29Z",
    "total": 100
  }
}
```

The registration event is fired whenever a successful registration has occurred on a form that you have set up a webhook for. The payload will resemble the fields in the form tied to the webhook event.

#### Response Parameters

Parameter | Default | Description
--------- | ------- | -----------
eventId | string | ID of the event
eventType | string | registration
formId | integer | ID of the form
accountId | integer | ID of the account
registrationTimestamp | timestamp | UTC date and time
total | float | The total value of the registration
data | object | The object container the complete payload for the registration

#### Data values

Parameter | Default | Description
--------- | ------- | -----------
billing | object | Object contains the billing information
registrants | object | Contains all the fields for the registrant(s)
tickets | object | Contains all the fields for the tickets
id | string | Unique has for the registration
customerId | integer | ID of the customer
metrics | object | Contains certain metrics from the registration (incomplete)
orderNumber | string | Unique order number built from accounting reference in the form
orderStatus | string | Status of the order

### Form Published

> Payload
```json
{
  "eventType": "publish",
  "accountId": 14,
  "formId": 14280,
  "data": {
    "accRef": "MMBRSHPTST",
    "currency": "USD",
    "datePublished": "2016-08-31T17:03:08Z",
    "eventStart": "2016-05-31T07:00:00Z",
    "id": 14280,
    "name": "Example Form",
    "product": "regfox.com",
    "publishedPath": "help.regfox.com/membership-test-ek",
    "status": "open",
    "timeZone": "America/Regina"
  },
  "meta": {
    "name": "Your webhook name"
  }
}
```

The publish event is fired whenever a successful form has been published on a form that you have set up a webhook for.

#### Response Parameters

Parameter | Default | Description
--------- | ------- | -----------
eventType | string | registration
eventId | string | ID of the event
formId | integer | ID of the form
accountId | integer | ID of the account
data | object | The object container the complete payload for the publish event

#### Data values

Parameter | Default | Description
--------- | ------- | -----------
id | string | ID of the form
accRef | string | Campaign accounting reference
currency | string | Currency of the campaign
datePublished | string | Date of publish event
eventStart | date | Event start date
eventEnd | date | Event end date
registrationStart | date | Opening date for registration (optional)
name | string | Name of the campaign
product | string | Name of the campaign
publishedPath | string | Name of the campaign
status | string | Status of the campaign
timeZone | string | Timezone of the published campaign

### Subscription

> Payload

```json
{
  "eventType": "subscription",
  "accountId": 14,
  "formId": 1293,
  "eventId": 13533,
  "data": {
    "billing": {
      "address": {
        "city": "Sacramento",
        "country": "US",
        "postalCode": "95819",
        "state": "CA",
        "street1": "1440 44th street"
      },
      "card": {
        "cardNumber": "VISA-1111",
        "expMonth": 9,
        "expYear": 2022
      },
      "check": {},
      "email": "eric@webconnex.com",
      "name": {
        "first": "Eric",
        "last": "Knopf"
      },
      "paymentMethod": "card"
    },
    "customerId": 2,
    "id": "1471026990929548076",
    "orderNumber": "CNFRMTNPGF-AWE-2",
    "orderStatus": "completed",
    "subscription": {
      "amount": 100,
      "category": "Bacon",
      "dateCreated": "2016-08-12T18:36:31Z",
      "dateLast": "2016-09-12T00:00:07Z",
      "dateNext": "2016-10-12T10:00:00Z",
      "dateUpdated": "2016-09-12T00:00:07Z",
      "email": "eric@webconnex.com",
      "id": 346,
      "paymentsLeft": -1,
      "paymentsLeftString": "unlimited",
      "schedule": "0 0 0 12 * *",
      "scheduleString": "12th of every month"
    },
    "total": 100,
    "transactionReference": "TESTERCHARGE"
  },
  "meta": {
    "name": "Alex test fast"
  }
}
```

The subscription / reoccurring event is fired whenever a successful subscription or deposit has been completed on a form that you have set up a webhook for.

#### Response Parameters

Parameter | Default | Description
--------- | ------- | -----------
eventType | string | subscription
eventId | string | ID of the event
formId | integer | ID of the form
accountId | integer | ID of the account
data | object | The object container the complete payload for the subscription event

#### Data values

Parameter | Default | Description
--------- | ------- | -----------
id | string | ID of the form
customerId | integer | ID of the customer
billing | object | Object contains the billing information
orderNumber | string | Unique order number built from accounting reference in the form
orderStatus | string | Status of the order
subscription | object | Object contains the subscription information


### Test

> Payload

```json
{
  "eventType": "test",
  "formId": 0,
  "eventId": 1234,
  "accountId": 14,
  "data": {
    "data": "Additional documentation available at http://docs.webconnex.io/divvy/",
    "eventId": 1234,
    "eventType": "test",
    "formId": 0
  }
}
```

Used for testing

#### Response Parameters

Parameter | Default | Description
--------- | ------- | -----------
eventType | string | test
eventId | string | 1234
formId | integer | 0
accountId | integer | ID of the account
data | object | The object container the complete payload for the test event

#### Data values

Parameter | Default | Description
--------- | ------- | -----------
data |  string  | Random string to use as data payload
