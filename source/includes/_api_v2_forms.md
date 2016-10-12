##Form

###List all Forms

#### HTTP Request
`GET /v2/public/forms`

```json
{
  "responseCode": 200,
  "data": [
    {
      "id": 1203002,
      "name": "Form Number 1",
      "product": "ticketspice.com",
      "status": "open",
      "dateCreated": "2016-04-07T01:09:58Z",
      "dateUpdated": "2016-04-07T01:10:01Z"
    },
    {
      "id": 1203002,
      "name": "Form Number 2",
      "product": "ticketspice.com",
      "status": "open",
      "dateCreated": "2016-04-07T01:09:40Z",
      "dateUpdated": "2016-04-07T01:09:43Z"
    }
	]
}
```



####  Request Params
Parameter			|	Description
--------------|----------------------------------------------------------------------
**product**<br>*string*<br>Optional 				| Name of the product you want to list forms for


####  Response Object
Attribute			|	Description
--------------|----------------------------------------------------------------------
**id**<br>*integer* 				| Unique ID of the
**name**<br>*string*					| Name of the form
**status**<br>*string*					| Status of the form
**dateCreated**<br>*timestamp* | Date and time of the creation of the form


###Get Form By ID

#### HTTP Request
`GET /v2/public/forms/{id}`

```json
{
  "responseCode": 200,
  "data": {
    "id": 1,
    "name": "Donation Form",
    "product": "givingfuel.com",
    "accRef": "DNTFORM",
    "fields": {
      "type": "form",
      "triggers": [],
      "header": {
        "type": "header",
        "key": "header"
      },
      "registrants": {
        "type": "registrants",
        "key": "registrants"
      },
      "billing": {
        "type": "billing",
        "key": "billing",
        "header": {},
        "name": {
          "type": "name",
          "key": "name",
          "attributes": {},
          "firstName": {},
          "lastName": {},
          "mi": {}
        },
        "address": {
          "type": "address",
          "key": "address",
          "attributes": {},
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
          "attributes": {},
          "card": {},
          "check": {},
          "offline": {}
        },
        "card": {
          "type": "creditCard",
          "key": "card",
          "cardNumber": {},
          "expMonth": {},
          "expYear": {},
          "cvvCode": {}
        },
        "check": {
          "type": "check",
          "key": "check",

          "bankName": {},
          "accountType": {
            "type": "accountType",
            "key": "accountType",
            "checking": {},
            "savings": {}
          },
          "routingNumber": {
            "type": "routingNumber",
            "key": "routingNumber"
          },
          "accountNumber": {
            "type": "accountNumber",
            "key": "accountNumber"
					}
        },
        "email": {
          "type": "email",
          "key": "email"
        }
      },
      "submit": {},
      "footer": {}
    },
    "status": "open",
    "timeZone": "America/Los_Angeles",
    "dateCreated": "0001-01-01T00:00:00Z"
  },
  "totalResults": 1
}
```


####  Request Params
Parameter			|	Description
--------------|----------------------------------------------------------------------
**id**<br>*Integer*<br>Required 				| ID of the form that is being requested


####  Response Object
Attribute												|	Description
--------------------------------|----------------------------------------------------
**id**<br>*Integer* 						| Unique ID of the
**name**<br>*string*						| Name of the form
**status**<br>*string*					| Status of the form
**accRef**<br>*string*					| Accounting Reference
**fields**<br>*object*					| A collection of fields that make up the form
**time zone**<br>*string*					| Timezone code for the form
**dateCreated**<br>*timestamp* | Date and time of the creation of the form

#### Fields Object
Attribute												|	Description
--------------------------------|----------------------------------------------------
**type**<br>*string* 						| The root of the fields is always set to type form
**attributes**<br>*object*						| Key/Value attributes related to the field set
**triggers**<br>*object*					| A collection of actions/conditions to provide logic to the form
**header**<br>*object*<br>required					| Fields in set in the header. Always present on the form (Display only fields).
**registrants**<br>*object*<br>required					| Main data collection fields. Repeated for each registrant when using "multireg" forms. (registrants.attributes.multireg === true)
**billing**<br>*object*<br>required					| Billing fields for the form. Not used if the billing is disabled on the form.
**footer**<br>*object*<br>required | Date and time of the creation of the form
