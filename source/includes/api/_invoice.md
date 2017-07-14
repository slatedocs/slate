# Invoice

Invoice handles all invoices with custom fields, lineitems with/without custom fields.

## Create

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 2050,
    "hash": "bZh9aU89BMeOeFl1r7AXkVxy6bqZDOoW8aotJuhhZdUL3xZaPm",
    "number": "TST-EVE03152017",
    "date": "2017-03-15",
    "logo": "https://s3.amazonaws.com/slycegateway-files/merchant-754c2f6dfbc8aaa8570096dfe296c9fd.png",
    "credit": null,
    "mail_to": "evelynl@zylun.com",
    "mail_body": "An Invoice for your recent medical bill has been created under your account.",
    "footer_id": 2,
    "include_login": 1,
    "login_url": "https://slycegateway-dev.cmsonline.com",
    "include_pdf": 0,
    "pdf": "",
    "medical_invoice": 1,
    "send_now": 1,
    "send_reminder":"1",
    "invoice_preference":"email",
    "webhook_url": "https://dev-cs.email-invoice.com/response",
    "date_sent": "2017-03-15",
    "total": "322.50",
    "balance": "0.00",
    "status": "outstanding",
    "custom_fields": [
      {
        "name": "Contact Person",
        "value": "John Doe",
        "tag": "{contact_person}"
      },
      {
        "name": "Secondary Email",
        "value": "email@domain.com",
        "tag": "{secondary_email}"
      },
      {
        "name": "Fax",
        "value": "123456789",
        "tag": "{fax}"
      },
      {
        "name": "Secondary Phone",
        "value": "123456789",
        "tag": "{secondary_phone}"
      },
      {
        "name": "Secondary Address",
        "value": "Address Location",
        "tag": "{secondary_address}"
      }
    ],
    "customer": {
      "custid": "7111177788",
      "user_id":142971,
      "first_name": "Savy",
      "last_name": "Phere",
      "email": "evelynl@zylun.com",
      "phone": "",
      "company": "",
      "street1": "",
      "street2": "",
      "city": "",
      "state": "",
      "zip": "",
      "country": ""
    },
    "line_items": [
      {
        "id": 123,
        "sku": "PN01",
        "quantity": 1,
        "total_cost": 200,
        "due_date": "2017-03-15",
        "date_service":"2017-03-15",
        "date_paid": "0000-00-00",
        "custom_fields": [
          {
            "name": "Description",
            "value": "A simple dummy text of the printing and typesetting industry."
          },
          {
            "name": "Dosage",
            "value": "Lorem Ipsum comes from sections 1.10.32 and 1.10.33"
          }
        ],
        "child": [
          {
            "id": 124,
            "sku": "PNB01",
            "quantity": 1,
            "total_cost": 10,
            "due_date": "2017-03-15",
            "date_paid": "0000-00-00",
            "custom_fields": [
              {
                "name": "Description",
                "value": "test industry"
              },
              {
                "name": "Dosage",
                "value": "comes from sections 1.10.32"
              }
            ]
          },
          {
            "id": 125,
            "sku": "PNM01",
            "quantity": 1,
            "total_cost": -3,
            "due_date": "2017-03-15",
            "date_paid": "0000-00-00",
            "custom_fields": [
              {
                "name": "Description",
                "value": "typesetting industry"
              },
              {
                "name": "Dosage",
                "value": "comes from sections 1.10.32 and 1.10.33"
              }
            ]
          }
        ]
      },
      {
        "id": 130,
        "sku": "STBJ",
        "quantity": 1,
        "total_cost": 115.5,
        "due_date": "2017-03-15",
        "date_paid": "0000-00-00",
        "date_service":"2017-03-15",
        "custom_fields": null,
        "child": []
      }
    ]
  }
}
```

This method lets you create new invoice.

### HTTP Request

`POST invoice`


### Data Object

Field Name | Required | Type | Description
---------|-----|------|------
number | yes | string | Invoice Number
date | yes | string | Invoice Date (Y-m-d).
logo | | url| Invoice logo url.
mail_to | yes | string | Email address for the receiver of the invoice.
mail_body | | string | Email body. Can be html.
include_login | | boolean | Lets you specify if login link should be included or not in the email invoice.
login_url | | url | Login url.
include_pdf | | boolean | Lets you specify if pdf invoice attachment should be included or not in the email.
send_now | | boolean | Lets you specify whether to send the invoice directly or not.
send_reminder| | boolean | Lets you specify whether to send the email reminders or not.
invoice_preference| | varchar | Lets you specify invoice preference data to receive (email, paper, or both).
footer_id | | integer | The id of the invoice footer.
custom_fields | | json | The custom fields or additional information needed for this new invoice. Useful for medical industry invoices. Refer to [Invoice Custom Fields Json](#invoice-custom-fields-json)
medical_invoice | | boolean | Lets you specify if this new invoice is for medical industry or not.
credit | | amount | Customer credit amount.
customer | | json | Json data of customer. Refer to [Customer Object](#customer-object)
line_items | | array | Array of objects. Refer to [Line Item Object](#line-item-object)

### Invoice Custom Fields Json
Follow the format required here.

### Data Json

Field 1 | Field 2 | Field 3
-------|-------|-------
name | value | tag

### Structure
``
"custom_fields":[
    {"name":"Contact Name","value":"John Doe","tag":{contact_name}"},
    {"name":"Contact No.","value":"123-4567","tag":{contact_no}"}
]
``

### Customer Object

Field Name|Required|Type| Description
---------|-----|------|------
custid | yes | string | Customer ID
user_id | | int | Customer User Account ID
first_name | | string | Customer's firstname
last_name | | string | Customer's lastname
email | yes | string | Customer's email
phone | | string | Customer's contact number
company | | string | Company
street1 | | string | Street 1
street2 | | string | Street 2
city | | string | City
state | | string | State
zip | | string | ZIP

### Line Item Object

Field Name|Required|Type|Description
---------|-----|------|------
id | yes | integer | ID
sku | yes | integer | Item identification code
name | yes | integer | Item name
quantity | yes | integer | Number of items
total_cost | yes | float | Total cost of the item
due_date |yes | string | Date due (Y-m-d)
date_service |yes | string | Date of Service (Y-m-d)
order | | numeric | Item ordering
child | | array | Items as a child. Refer to [Line Item Child Object](#line-item-child-object)
custom_fields | | json | Lets you add other details through this field. Refer to [Lineitem Custom Fields Json](#lineitem-custom-fields-json)


### Line Item Child Object

Field Name | Required |Type| Description
---------|-----|------|------
id | yes | numeric |  Item id
sku | yes | string |    Item identification code
name | yes | string |  Item name
quantity | yes | integer | Number of items
total_cost | yes | float | Total cost of the item
order | | numeric | Item ordering
custom_fields | | json | Lets you add other details through this field. Refer to [Lineitem Custom Fields Json](#lineitem-custom-fields-json)


### Lineitem Custom Fields Json
Follow the format required here.

### Data Json

Field 1 | Field 2 
-------|-------
name | value 

### Structure
``
"custom_fields":[
    {"name":"Description","value":"Description details are here."},
    {"name":"Dosage","value":"Dosage details are here"}
]
``

## View

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 2050,
    "hash": "bZh9aU89BMeOeFl1r7AXkVxy6bqZDOoW8aotJuhhZdUL3xZaPm",
    "number": "TST-EVE03152017",
    "date": "2017-03-15",
    "logo": "https://s3.amazonaws.com/slycegateway-files/merchant-754c2f6dfbc8aaa8570096dfe296c9fd.png",
    "credit": null,
    "mail_to": "evelynl@zylun.com",
    "mail_body": "An Invoice for your recent medical bill has been created under your account.",
    "footer_id": 2,
    "include_login": 1,
    "login_url": "https://slycegateway-dev.cmsonline.com",
    "include_pdf": 0,
    "pdf": "",
    "medical_invoice": 1,
    "send_now": 1,
    "send_reminder": 1,
    "invoice_preference":"email",
    "webhook_url": "https://dev-cs.email-invoice.com/response",
    "date_sent": "2017-03-15",
    "total": "322.50",
    "balance": "0.00",
    "status": "outstanding",
    "custom_fields": [
      {
        "name": "Contact Person",
        "value": "John Doe",
        "tag": "{contact_person}"
      },
      {
        "name": "Secondary Email",
        "value": "email@domain.com",
        "tag": "{secondary_email}"
      },
      {
        "name": "Fax",
        "value": "123456789",
        "tag": "{fax}"
      },
      {
        "name": "Secondary Phone",
        "value": "123456789",
        "tag": "{secondary_phone}"
      },
      {
        "name": "Secondary Address",
        "value": "Address Location",
        "tag": "{secondary_address}"
      }
    ],
    "customer": {
      "custid": "7111177788",
      "user_id":142971,
      "first_name": "Savy",
      "last_name": "Phere",
      "email": "evelynl@zylun.com",
      "phone": "",
      "company": "",
      "street1": "",
      "street2": "",
      "city": "",
      "state": "",
      "zip": "",
      "country": ""
    },
    "line_items": [
      {
        "id": 123,
        "sku": "PN01",
        "quantity": 1,
        "total_cost": 200,
        "due_date": "2017-03-15",
        "date_service":"2017-03-15",
        "date_paid": "0000-00-00",
        "custom_fields": [
          {
            "name": "Description",
            "value": "A simple dummy text of the printing and typesetting industry."
          },
          {
            "name": "Dosage",
            "value": "Lorem Ipsum comes from sections 1.10.32 and 1.10.33"
          }
        ],
        "child": [
          {
            "id": 124,
            "sku": "PNB01",
            "quantity": 1,
            "total_cost": 10,
            "due_date": "2017-03-15",
            "date_paid": "0000-00-00",
            "custom_fields": [
              {
                "name": "Description",
                "value": "test industry"
              },
              {
                "name": "Dosage",
                "value": "comes from sections 1.10.32"
              }
            ]
          },
          {
            "id": 125,
            "sku": "PNM01",
            "quantity": 1,
            "total_cost": -3,
            "due_date": "2017-03-15",
            "date_paid": "0000-00-00",
            "custom_fields": [
              {
                "name": "Description",
                "value": "typesetting industry"
              },
              {
                "name": "Dosage",
                "value": "comes from sections 1.10.32 and 1.10.33"
              }
            ]
          }
        ]
      },
      {
        "id": 130,
        "sku": "STBJ",
        "quantity": 1,
        "total_cost": 115.5,
        "due_date": "2017-03-15",
        "date_paid": "0000-00-00",
        "date_service":"2017-03-15",
        "custom_fields": null,
        "child": []
      }
    ]
  }
}
```
This method lets you view a specific invoice.

### HTTP Request

`GET invoice/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The id of the invoice.



##Update

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 2050,
    "hash": "bZh9aU89BMeOeFl1r7AXkVxy6bqZDOoW8aotJuhhZdUL3xZaPm",
    "number": "TST-EVE03152017",
    "date": "2017-03-15",
    "logo": "https://s3.amazonaws.com/slycegateway-files/merchant-754c2f6dfbc8aaa8570096dfe296c9fd.png",
    "credit": null,
    "mail_to": "evelynl@zylun.com",
    "mail_body": "An Invoice for your recent medical bill has been created under your account.",
    "footer_id": 2,
    "include_login": 1,
    "login_url": "https://slycegateway-dev.cmsonline.com",
    "include_pdf": 0,
    "pdf": "",
    "medical_invoice": 1,
    "send_now": 1,
    "invoice_preference":"email",
    "webhook_url": "https://dev-cs.email-invoice.com/response",
    "date_sent": "2017-03-15",
    "total": "322.50",
    "balance": "0.00",
    "status": "outstanding",
    "custom_fields": [
      {
        "name": "Contact Person",
        "value": "John Doe",
        "tag": "{contact_person}"
      },
      {
        "name": "Secondary Email",
        "value": "email@domain.com",
        "tag": "{secondary_email}"
      },
      {
        "name": "Fax",
        "value": "123456789",
        "tag": "{fax}"
      },
      {
        "name": "Secondary Phone",
        "value": "123456789",
        "tag": "{secondary_phone}"
      },
      {
        "name": "Secondary Address",
        "value": "Address Location",
        "tag": "{secondary_address}"
      }
    ],
    "customer": {
      "custid": "7111177788",
      "user_id":142971,
      "first_name": "Savy",
      "last_name": "Phere",
      "email": "evelynl@zylun.com",
      "phone": "",
      "company": "",
      "street1": "",
      "street2": "",
      "city": "",
      "state": "",
      "zip": "",
      "country": ""
    },
    "line_items": [
      {
        "id": 123,
        "sku": "PN01",
        "quantity": 1,
        "total_cost": 200,
        "due_date": "2017-03-15",
        "date_service":"2017-03-15",
        "date_paid": "0000-00-00",
        "custom_fields": [
          {
            "name": "Description",
            "value": "A simple dummy text of the printing and typesetting industry."
          },
          {
            "name": "Dosage",
            "value": "Lorem Ipsum comes from sections 1.10.32 and 1.10.33"
          }
        ],
        "child": [
          {
            "id": 124,
            "sku": "PNB01",
            "quantity": 1,
            "total_cost": 10,
            "due_date": "2017-03-15",
            "date_paid": "0000-00-00",
            "custom_fields": [
              {
                "name": "Description",
                "value": "test industry"
              },
              {
                "name": "Dosage",
                "value": "comes from sections 1.10.32"
              }
            ]
          },
          {
            "id": 125,
            "sku": "PNM01",
            "quantity": 1,
            "total_cost": -3,
            "due_date": "2017-03-15",
            "date_paid": "0000-00-00",
            "custom_fields": [
              {
                "name": "Description",
                "value": "typesetting industry"
              },
              {
                "name": "Dosage",
                "value": "comes from sections 1.10.32 and 1.10.33"
              }
            ]
          }
        ]
      },
      {
        "id": 130,
        "sku": "STBJ",
        "quantity": 1,
        "total_cost": 115.5,
        "due_date": "2017-03-15",
        "date_service":"2017-03-15",
        "date_paid": "0000-00-00",
        "custom_fields": null,
        "child": []
      }
    ]
  }
}
```

> Request JSON structure like this:

```json
{
  "number": "TST-EVE03152017",
  "date": "2017-03-22",
  "logo": "",
  "credit": "50.00",
  "mail_body": "An Invoice for your recent bill has been created under your account.",
  "footer_id":2,
  "mail_to": "email@domain.com",
  "logo":"",
  "include_pdf": "0",
  "include_login": "0",
  "medical_invoice": "1",
  "send_now":"0",
  "send_reminder":1,
  "invoice_preference":"email",
  "login_url": "https://slycegateway-slycev2.cmsonline.comn",
  "webhook_url": "https://email-invoice.com/response",
  "custom_fields":[
      {"name":"Contact Person","value":"John Doe","tag":"{contact_person}"},
    {"name":"Secondary Email","value":"email2@domain.com","tag":"{secondary_email}"}
  ],
  "customer": {
      "custid": "7111177788",
      "user_id":142971,
      "first_name": "Savy",
      "last_name": "Phere",
      "email": "email@domain.com",
      "phone": "",
      "company": "",
      "street1": "",
      "street2": "",
      "city": "",
      "state": "",
      "zip": "",
     "country": ""
  },
  "line_items": [
    {
      "id": "123",
      "sku": "PN01",
      "name": "Peanut",
      "quantity": "1",
      "total_cost": "200.00",
      "due_date": "2017-03-22",
      "date_service": "2017-03-22",
      "child" : [
          {
            "id": 124,
            "sku": "PNB01",
            "name": "PButter",
            "quantity": "1",
            "total_cost": "10.00",
            "custom_fields":[
              {"name":"Description","value":"test industry"},
            {"name":"Dosage","value":"comes from sections 1.10.32"}
          ]
          },
          {
            "id": 125,
            "sku": "PNM01",
            "name": "PMayo",
            "quantity": "1",
            "total_cost": "-3.00",
            "custom_fields":[
            {"name":"Description","value":"typesetting industry"},
          {"name":"Dosage","value":"comes from sections 1.10.32 and 1.10.33"}
            ]
          }
      ],
      "custom_fields":[
          {"name":"Description","value":"A simple dummy text of the printing and typesetting industry."},
        {"name":"Dosage","value":"Lorem Ipsum comes from sections 1.10.32 and 1.10.33"}
      ]
    },
    {
      "id": 130,
      "sku": "STBJ",
      "name": "Strawberry Jam",
      "quantity": "1",
      "total_cost": "115.50",
      "due_date": "2017-03-22",
      "date_service": "2017-03-22",
      "child":[]
    }
  ]
}
```

This method lets you update a specific invoice.

### HTTP Request

`PUT invoice/{id}`

### Data Object

Field Name | Required | Type | Description
---------|-----|------|------
number | yes | string | Invoice Number
date | yes | string | Invoice Date (Y-m-d).
logo | | url| Invoice logo url.
mail_to | yes | string | Email address for the receiver of the invoice.
mail_body | | string | Email body. Can be html.
include_login | | boolean | Lets you specify if login link should be included or not in the email invoice.
login_url | | url | Login url.
include_pdf | | boolean | Lets you specify if pdf invoice attachment should be included or not in the email.
send_now | | boolean | Lets you specify whether to send the invoice directly or not.
send_reminder | | boolean | Lets you specify whether to send the email reminders or not.
invoice_preference| | varchar | Lets you specify invoice preference data to receive (email, paper, or both).
footer_id | | integer | The id of the invoice footer.
custom_fields | | json | The custom fields or additional information needed for this new invoice. Useful for medical industry invoices. Refer to [Invoice Custom Fields Json](#invoice-custom-fields-json)
medical_invoice | | boolean | Lets you specify if this new invoice is for medical industry or not.
credit | | amount | Customer credit amount.
customer | | json | Json data of customer. Refer to [Customer Object](#customer-object)
line_items | | array | Array of objects. Refer to [Line Item Object](#line-item-object)
status | | string | Status of the invoice. Refer to [Status Supported](#status-supported). 

### Status Supported

 - unsent
 - outstanding
 - partial payment
 - paid
 - canceled

##Send

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 2050,
    "hash": "bZh9aU89BMeOeFl1r7AXkVxy6bqZDOoW8aotJuhhZdUL3xZaPm",
    "number": "TST-EVE03152017",
    "date": "2017-03-15",
    "logo": "https://s3.amazonaws.com/slycegateway-files/merchant-754c2f6dfbc8aaa8570096dfe296c9fd.png",
    "credit": null,
    "mail_to": "evelynl@zylun.com",
    "mail_body": "An Invoice for your recent medical bill has been created under your account.",
    "footer_id": 2,
    "include_login": 1,
    "login_url": "https://slycegateway-dev.cmsonline.com",
    "include_pdf": 0,
    "pdf": "",
    "medical_invoice": 1,
    "send_now": 1,
    "send_reminder": 1,
    "invoice_preference": "email",
    "webhook_url": "https://dev-cs.email-invoice.com/response",
    "date_sent": "2017-03-15",
    "total": "322.50",
    "balance": "0.00",
    "status": "outstanding",
    "custom_fields": [
      {
        "name": "Contact Person",
        "value": "John Doe",
        "tag": "{contact_person}"
      },
      {
        "name": "Secondary Email",
        "value": "email@domain.com",
        "tag": "{secondary_email}"
      },
      {
        "name": "Fax",
        "value": "123456789",
        "tag": "{fax}"
      },
      {
        "name": "Secondary Phone",
        "value": "123456789",
        "tag": "{secondary_phone}"
      },
      {
        "name": "Secondary Address",
        "value": "Address Location",
        "tag": "{secondary_address}"
      }
    ],
    "customer": {
      "custid": "7111177788",
      "user_id":142971,
      "first_name": "Savy",
      "last_name": "Phere",
      "email": "evelynl@zylun.com",
      "phone": "",
      "company": "",
      "street1": "",
      "street2": "",
      "city": "",
      "state": "",
      "zip": "",
      "country": ""
    },
    "line_items": [
      {
        "id": 123,
        "sku": "PN01",
        "quantity": 1,
        "total_cost": 200,
        "due_date": "2017-03-15",
        "date_service": "2017-03-15",
        "date_paid": "0000-00-00",
        "custom_fields": [
          {
            "name": "Description",
            "value": "A simple dummy text of the printing and typesetting industry."
          },
          {
            "name": "Dosage",
            "value": "Lorem Ipsum comes from sections 1.10.32 and 1.10.33"
          }
        ],
        "child": [
          {
            "id": 124,
            "sku": "PNB01",
            "quantity": 1,
            "total_cost": 10,
            "due_date": "2017-03-15",
            "date_paid": "0000-00-00",
            "custom_fields": [
              {
                "name": "Description",
                "value": "test industry"
              },
              {
                "name": "Dosage",
                "value": "comes from sections 1.10.32"
              }
            ]
          },
          {
            "id": 125,
            "sku": "PNM01",
            "quantity": 1,
            "total_cost": -3,
            "due_date": "2017-03-15",
            "date_paid": "0000-00-00",
            "custom_fields": [
              {
                "name": "Description",
                "value": "typesetting industry"
              },
              {
                "name": "Dosage",
                "value": "comes from sections 1.10.32 and 1.10.33"
              }
            ]
          }
        ]
      },
      {
        "id": 130,
        "sku": "STBJ",
        "quantity": 1,
        "total_cost": 115.5,
        "due_date": "2017-03-15",
        "date_paid": "0000-00-00",
        "date_service": "2017-03-15",
        "custom_fields": null,
        "child": []
      }
    ]
  }
}
```

This method lets you send a specific invoice.

### HTTP Request

`POST invoice/send/<ID>`


### Data Object

** With or without the following data*

Field Name | Required | Type | Description
---------|-----|------|------
mail_to | no | string | Email address for the receiver of the invoice.
mail_body | no | string | Email body. Can be html.
