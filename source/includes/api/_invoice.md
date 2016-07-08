# Invoice

Lets you create invoice with line items. It will send the email with the attached Invoice PDF.


## Create

> Returns JSON structured like this:

```json
{
  "data": {
    "status": true,
    "message": "Invoice sent successfully.",
    "id": 123,
    "pdf": "https://s3.amazonaws.com/email-invoices/CZIWUxRlk0AvSkKQx1xKE22rrz2JPzCN0pAY1V48atvfdPVI0X.pdf"
  }
}
```


> Request JSON structure like this:

```json
{
    "number": "INV-0003",
    "date": "",
    "logo": "https:\/\/invoice_logos.s3.amazonaws.com\/bleh.png",
    "mail_body": "",
    "credit": "$12.00",
    "mail_to": "customer@email.com",
    "include_pdf": 1,
    "key": "9ypnPRT9v2ChPCQv",
    "customer": {
        "custid": "9ypnPRT9v2ChPCQv_2266",
        "first_name": "Customer  ",
        "last_name": "Portal",
        "email": "customer@email.com",
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
            "sku": "ming-123",
            "name": "Peanut",
            "quantity": "1",
            "total_cost": "200.00",
            "due_date": "2016-07-07",
            "order": 1,
            "child": [{
                "id": 124,
                "sku": "ming-456",
                "name": "Butter",
                "quantity": "1",
                "total_cost": "10.00",
                "order": 2
            }]
        },
        {
            "id": 130,
            "sku": "STBJ",
            "name": "Strawberry Jam",
            "quantity": "1",
            "total_cost": "115.50",
            "due_date": "2016-07-07",
            "order": 2,
            "child": []
        }
    ]
}
```

This method lets you create the invoice.

### HTTP Request

`POST invoice/create`


### Data Object

Field Name|Type| Description
---------|-----|------
number | string | Invoice Number
date | string | Invoice Date (Y-m-d).
logo | string | Invoice logo link.
mail_to | string | Email where invoice will be send
mail_body| string | Email body. Can be html.
credit | string | Customer credit
customer | json | Json data of customer. Refer to [Customer Object](../#customer-object)
line_items | array | Array of objects. Refer to [Line Item Object](../#line-item-object)


### Customer Object

Field Name|Type| Description
---------|-----|------
custid | string | Customer ID
first_name | string | Customer's firstname
last_name | string | Customer's lastname
email | string | Customer's email
phone | string | Customer's contact number
company | string | Company
street1 | string | Street 1
street2 | string | Street 2
city | string | City
state | string | State
zip | string | ZIP

### Line Item Object

Field Name|Type| Description
---------|-----|------
id | integer | ID
sku | integer | Item identification code
name | integer | Item name
quantity | integer | Number of items
total_cost | float | Total cost of the item
due_date | string | Date due (Y-m-d)
order | numeric | Item ordering
child | array | Items as a child. Refer to [Line Item Child Object](../#line-item-child-object)


### Line Item Child Object

Field Name|Type| Description
---------|-----|------
id | integer  |  Item id
sku | string |  	Item identification code
name | string |  Item name
quantity | integer | Number of items
total_cost | float | Total cost of the item
order | numeric | Item ordering





## View


> Returns JSON structured like this:

```json
{
  "data": {
    "customer_id": "9ypnPRT9v2ChPCQv_2266",
    "customer_num": "4831234",
    "customer_name": "Jan Doe",
    "customer_email": "jandoe@email.com",
    "customer_street": "",
    "customer_street2": "",
    "customer_city": "",
    "customer_country": "",
    "customer_state": "",
    "customer_zip": "",
    "invoice_number": "INV-0003",
    "invoice_date": "02 July, 2016",
    "invoice_credit": "12.00",
    "invoice_total": "315.50",
    "status": "sent",
    "line_items": [
      {
        "id": 5,
        "product_id": 123,
        "invoice_id": 11,
        "parent": 0,
        "sku": "PN01",
        "product_name": "Peanut",
        "product_cost": 200,
        "quantity": 1,
        "total_cost": 200,
        "due_date": "2016-07-02",
        "created_at": "2016-07-02 06:28:31",
        "updated_at": "2016-07-02 06:28:31",
        "status": "unpaid"
      },
      {
        "id": 6,
        "product_id": 124,
        "invoice_id": 11,
        "parent": 123,
        "sku": "PNB01",
        "product_name": "PButter",
        "product_cost": 10,
        "quantity": 1,
        "total_cost": 10,
        "due_date": "2016-07-02",
        "created_at": "2016-07-02 06:28:31",
        "updated_at": "2016-07-02 06:28:31",
        "status": "unpaid"
      },
      {
        "id": 7,
        "product_id": 125,
        "invoice_id": 11,
        "parent": 123,
        "sku": "PNM01",
        "product_name": "PMayo",
        "product_cost": -3,
        "quantity": 1,
        "total_cost": -3,
        "due_date": "2016-07-02",
        "created_at": "2016-07-02 06:28:31",
        "updated_at": "2016-07-02 06:28:31",
        "status": "unpaid"
      },
      {
        "id": 8,
        "product_id": 130,
        "invoice_id": 11,
        "parent": 0,
        "sku": "STBJ",
        "product_name": "Strawberry Jam",
        "product_cost": 115.5,
        "quantity": 1,
        "total_cost": 115.5,
        "due_date": "2016-07-03",
        "created_at": "2016-07-02 06:28:31",
        "updated_at": "2016-07-02 06:28:31",
        "status": "unpaid"
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



##Update Logo

> Returns JSON structured like this:

```json
{
  "data": {
    "status": true,
    "url": "https://invoice_logos.s3.amazonaws.com/me.jpg"
  }
}
```

This method lets you update the merchant logo.

### HTTP Request

`POST invoice/merchant/logo`

### POST Data

Field | Description
--------- | -----------
logo| Field name from input form data


##Cancel Invoice

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 1234,
    "status": true
  }
}
```

This method lets you set the Invoice as 'Cancelled'.

### HTTP Request

`POST invoice/<ID>/cancel`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The hash of the invoice.



##Paid Invoice
> Returns JSON structured like this:

```json
{
  "data": {
    "id": 1234,
    "status": true
  }
}
```

This method lets you set the invoice as 'Paid'.

### HTTP Request

`POST invoice/<ID>/paid`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The hash of the invoice.