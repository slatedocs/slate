##Transaction

### Search transactions

#### HTTP Request
`GET /v2/public/search/transactions`

```json
{
  "responseCode": 200,
  "data": [
    {
      "id": 1,
      "displayId": "1111111111111111111",
      "customerId": 1,
      "customerEmail": "someone@test.com",
      "billing": {
        "firstName": "John",
        "lastName": "Doe",
        "address": {
          "city": "Sacramento",
          "country": "US",
          "postalCode": "111111",
          "state": "CA",
          "street1": "1233 SW Any St."
        }
      },
      "formId": 1,
      "formName": "test",
      "formAccRef": "TST12",
      "status": "3",
      "orderNumber": "TST12-001-4",
      "total": "40.00",
      "dateCreated": "2016-01-28T00:11:10Z",
      "dateUpdated": "2016-05-02T22:32:22Z"
    },
		{
      "id": 2,
      "displayId": "1111111111111111112",
      "customerId": 1,
      "customerEmail": "someone@test.com",
      "billing": {
        "firstName": "John",
        "lastName": "Doe",
        "address": {
          "city": "Sacramento",
          "country": "US",
          "postalCode": "111111",
          "state": "CA",
          "street1": "1233 SW Any St."
        }
      },
      "formId": 1,
      "formName": "test",
      "formAccRef": "TST12",
      "status": "3",
      "orderNumber": "TST12-001-4",
      "total": "40.00",
      "dateCreated": "2016-01-28T00:11:10Z",
      "dateUpdated": "2016-05-02T22:32:22Z"
    }
  ],
  "totalResults": 2
}
```



####  Request Params
Parameter			|	Description
--------------|----------------------------------------------------------------------
**product**<br>*string*<br>required 		| Name of the product you to search for transactions on
**email**<br>*string*<br>optional 			| Billing email you want to search on
**formId**<br>*integer*<br>optional 		| ID of the form you want to filter transactions by
**status**<br>*string*<br>optional 				| Status string of the order you want to filter on
**sort**<br>*string*<br>optional 			            	|
**limit**<br>*string*<br>optional 				          | limits the number of results returned
**orderID**<br>*integer*<br>optional 		   		| filter transactions to only show results matching a provided order id
**orderDisplayID**<br>*string*<br>optional 		   		| filter transactions to only show results matching a provided order display id
**greaterThanID**<br>*integer*<br>optional 		   		| filter transactions to only show results greater than provided id
**formID**<br>*integer*<br>optional 			         	| filter transactions to only show results matching the form id
**customerId**<br>*integer*<br>optional 				    | filter transactions to only show results matching the customer id
**orderEmail**<br>*string*<br>optional 				      | filter transactions to only show results matching the email
**lessThanId**<br>*integer*<br>optional 		       	| filter transactions to only show results less than provided id
**startingAfter**<br>*integer*<br>optional 			    | filter transactions to only show results with IDs after value
**endingIdBefore**<br>*integer*<br>optional 			 	| filter transactions to only show results with IDs before value
**dateCreatedBefore**<br>*timestamp*<br>optional 		| filter transactions to only show results created before date
**dateCreatedAfter**<br>*timestamp*<br>optional 		| filter transactions to only show results created before date
**dateUpdatedBefore**<br>*timestamp*<br>optional 		| filter transactions to only show results updated before date
**dateUpdatedAfter**<br>*timestamp*<br>optional 		| filter transactions to only show results updated after date

####  Response Object
Attribute			|	Description
--------------|----------------------------------------------------------------------
**id**<br>*integer* 				| Unique ID of the transaction
**displayId**<br>*string*					| ID string used as customer facing ID
**customerId**<br>*integer*					| ID of the associated customer
**customerEmail**<br>*string*					| Email of the associated customer
**billing**<br>*object*					| Billing name and address associated with order
**formId**<br>*integer*					| ID of the form that created order
**formName**<br>*string*					| Name of the form that created order
**formAccRef**<br>*string*					| Accounting reference string of the form that created order
**status**<br>*string*					| Status of the order
**orderNumber**<br>*string*					| Order number
**total**<br>*float*					| Total cost of the order
**dateCreated**<br>*timestamp* | Date and time of the creation of the order
**dateUpdated**<br>*timestamp* | Date and time the order was last updated

### View Transaction by ID

#### HTTP Request
`GET /v2/public/search/transactions/{id}`

```json
{
  "responseCode": 200,
  "data": [
    {
      "id": 1,
      "displayId": "1111111111111111111",
      "customerId": 1,
      "customerEmail": "someone@test.com",
      "billing": {
        "firstName": "John",
        "lastName": "Doe",
        "address": {
          "city": "Sacramento",
          "country": "US",
          "postalCode": "111111",
          "state": "CA",
          "street1": "1233 SW Any St."
        }
      },
      "formId": 1,
      "formName": "test",
      "formAccRef": "TST12",
      "status": "3",
      "orderNumber": "TST12-001-4",
      "total": "40.00",
      "dateCreated": "2016-01-28T00:11:10Z",
      "dateUpdated": "2016-05-02T22:32:22Z"
    }
  ]
}
```

####  Request Params
Parameter			|	Description
--------------|----------------------------------------------------------------------
**id**<br>*string*<br>required 				| ID of the requested order

####  Response Object
Attribute			|	Description
--------------|----------------------------------------------------------------------
**id**<br>*integer* 				| Unique ID of the transaction
**displayId**<br>*string*					| ID string used as customer facing ID
**customerId**<br>*integer*					| ID of the associated customer
**customerEmail**<br>*string*					| Email of the associated customer
**billing**<br>*object*					| Billing name and address associated with transaction
**formId**<br>*integer*					| ID of the form that created order
**formName**<br>*string*					| Name of the form that created order
**formAccRef**<br>*string*					| Accounting reference string of the form that created order
**status**<br>*string*					| Status of the transaction
**orderNumber**<br>*string*					| Order number
**total**<br>*float*					| Total cost of the transaction
**dateCreated**<br>*timestamp* | Date and time of the creation of the transaction
**dateUpdated**<br>*timestamp* | Date and time the transaction was last updated
