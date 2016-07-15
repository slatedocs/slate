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
  "number": "INV-1234",
  "date": "2016-07-14",
  "logo": "https:\/\/invoice_logos.s3.amazonaws.com\/cms_logo.png",
  "mail_body": "This email is a reminder that the balance on your account is {tag:invoice_total}. We accept MasterCard, VISA, Discover and American Express. If your payment is already on its way, we thank you and ask that you please disregard this notice. If not, we would appreciate receipt of your payment as soon as possible. If you would like to further discuss the details of your account, please do not hesitate to call billing at {tag:invoice_merchant_contact}.",
  "credit": "0.00",
  "mail_to": "youremail@email.com",
  "include_pdf": "1",
  "include_login": "1",
  "login_url": "http:\/\/slycegateway.local\/\/login",
  "key": "9ypnPRT9v2ChPCQx",
  "webhook_url": "http:\/\/slycegateway.local\/",
  "customer": {
    "custid": "9ypnPRT9v2ChPCQv_2266",
    "first_name": "Customer  ",
    "last_name": "Portal",
    "email": "youremail@email.com",
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
      "id": "233",
      "sku": "1233476",
      "name": "My ProductName 11",
      "quantity": "1",
      "total_cost": 200,
      "due_date": "2016-07-14",
      "order": 1
    }
  ]
}
```

This method lets you create the invoice.

### HTTP Request

`POST invoice/create`


### Data Object

Field Name | Required | Type | Description
---------|-----|------|------
number | yes | string | Invoice Number
date | yes | string | Invoice Date (Y-m-d).
logo | | string | Invoice logo link.
mail_to | yes | string | Email where invoice will be send
mail_body | | string | Email body. Can be html.
credit | | string | Customer credit
customer | | json | Json data of customer. Refer to [Customer Object](#customer-object)
line_items | | array | Array of objects. Refer to [Line Item Object](#line-item-object)


### Customer Object

Field Name|Required|Type| Description
---------|-----|------|------
custid | yes | string | Customer ID
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
order | | numeric | Item ordering
child | | array | Items as a child. Refer to [Line Item Child Object](#line-item-child-object)


### Line Item Child Object

Field Name | Required |Type| Description
---------|-----|------|------
id | yes | numeric |  Item id
sku | yes | string |  	Item identification code
name | yes | string |  Item name
quantity | yes | integer | Number of items
total_cost | yes | float | Total cost of the item
order | | numeric | Item ordering





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



##Update

> Returns JSON structured like this:

```json
{
  "data": {
    "status": true,
    "url": "https://invoice_logos.s3.amazonaws.com/me.jpg"
  }
}
```

> Request JSON structure like this:

```json
{
  "number": "INV-1234",
  "date": "2016-07-06",
  "logo": "https:\/\/invoice_logos.s3.amazonaws.com\/bleh.png",
  "mail_body": "",
  "credit": "12.00",
  "mail_to": "youremail@email.com",
  "include_pdf": "1",
  "include_login":"0",
  "login_url":"http://test@test.com/test",
  "webhook_url":"http://test@test.com/test",
  "key": "9ypnPRT9v2ChPCQx",
  "status":"sent",
  "line_items": [
    {
      "id": 123,
      "sku": "PN01",
      "name": "Peanut",
      "quantity": "1",
      "total_cost": "200.00",
      "due_date": "2016-07-07",
      "order":2,
      "child" : [
          {
            "id": 125,
            "sku": "PNM01",
            "name": "PMayo",
            "quantity": "1",
            "total_cost": "-3.00",
            "order":1
          }
      ]
    },
    {
      "id": 130,
      "sku": "STBJ",
      "name": "Strawberry Jam",
      "quantity": "1",
      "total_cost": "115.50",
      "due_date": "2016-07-07",
      "order":1,
      "child":[]
    }
  ]
}
```

This method lets you update the invoice.

### HTTP Request

`PUT invoice/update/{id}`

### Data Object

Field Name | Required | Type | Description
---------|-----|------|------
number | yes | string | Invoice Number
date | yes | string | Invoice Date (Y-m-d).
logo | | string | Invoice logo link.
mail_to | yes | string | Email where invoice will be send
mail_body | | string | Email body. Can be html.
credit | | string | Customer credit
customer | | json | Json data of customer. Refer to [Customer Object](#customer-object)
line_items | | array | Array of objects. Refer to [Line Item Object](#line-item-object)