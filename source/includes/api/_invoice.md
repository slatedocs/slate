# Invoice


Lets you create invoicing and manage details.


## Create

> Returns JSON structured like this:

```json
{
  "data": {
    "status": true,
    "message": "Invoice sent successfully.",
    "id": 1234,
    "hash": "gbe4O9XBZvPU0n9PALEozFYt4fsbYnoYayswAECR0jdkRwlQW0"
  }
}
```

This method lets you create the invoice.

### HTTP Request

`POST invoice/create`

### Data Object



Field Name|Type| Description
---------|-----|------
number | string | Invoice Number
date | string | Invoice Date.
logo | string | Invoice logo link.
mail_to | string | Email where invoice will be send
mail_body| string | Email body. Can be html.
customer | string | Json data of customer
line_items | array | Array of objects.
credit | string | Customer credit

> Sample JSON structure like this:

```json
{
  "number": "INV-0001",
  "date": "29 June, 2016",
  "logo": "https:\/\/invoice_logos.s3.amazonaws.com\/bleh.png",
  "mail_body": "<span style=\"color: #000000;\">This email is a reminder that the balance on your account is <strong style=\"font-weight: bold\">$210.00<\/strong>. We accept MasterCard, VISA, Discover and American Express. If your payment is already on its way, we thank you and ask that you please disregard this notice. If not, we would appreciate receipt of your payment as soon as possible. If you would like to further discuss the details of your account, please do not hesitate to call billing at <strong style=\"font-weight: bold\"><\/strong>.<\/span>",
  "credit": "$0.00",
  "mail_to": "jamesj@zylun.com",
  "section": "content",
  "key": "9ypnPRT9v2ChPCQv",
  "customer": {
    "custid": "9ypnPRT9v2ChPCQv_2266",
    "first_name": "Customer  ",
    "last_name": "Portal",
    "email": "evelynlopz@outlook.com",
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
      "id": 1002,
      "sku": "1233476",
      "name": "My ProductName 11",
      "quantity": "1",
      "total_cost": "$200.00",
      "parent": 0,
      "due_date": "2016-06-29"
    },
    {
      "id": 1003,
      "sku": "1233476",
      "name": "Sub Product 11",
      "quantity": "1",
      "total_cost": "$10.00",
      "parent": 1002,
      "due_date": "2016-06-29"
    },
    {
      "id": 1004,
      "sku": "09324174593",
      "name": "Ice Blast",
      "quantity": "6",
      "total_cost": "$10.08",
      "parent": 1002,
      "due_date": "2016-06-29"
    }
  ]
}
```


## View


> Returns JSON structured like this:

```json
{
  "data": {
    "customer_id": "9ypnPRT9v2ChPCQv_8080",
    "customer_num": "7654321",
    "customer_name": "Jan Doe",
    "customer_email": "me@email.com",
    "customer_street": "123 Tupas St.",
    "customer_street2": "",
    "customer_city": "Cebu",
    "customer_country": "Ph",
    "customer_state": "Cebu",
    "customer_zip": "",
    "invoice_number": "000001",
    "invoice_date": "28 April, 2016",
    "invoice_subtotal": "123.00",
    "invoice_credit": "0.00",
    "invoice_total": "123.00",
    "summary": [
      {
        "sku": "sk-123",
        "productname": "Bread",
        "unitcost": "123.00",
        "unitquantity": "1",
        "unitprice": "$123.00"
      },
      {
        "sku": "sk-124",
        "productname": "Wine",
        "unitcost": "123.00",
        "unitquantity": "1",
        "unitprice": "$123.00"
      }
    ],
    "date_due": "28 April, 2016",
    "date_paid": "0000-00-00 00:00:00",
    "status": "sent"
  }
}
```
This method lets you view a specific invoice.

### HTTP Request

`GET invoice/<HASH>`

### URL Parameters

Parameter | Description
--------- | -----------
HASH| The hash of the invoice.



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

`POST invoice/<HASH>/cancel`

### URL Parameters

Parameter | Description
--------- | -----------
HASH| The hash of the invoice.



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

`POST invoice/<HASH>/paid`

### URL Parameters

Parameter | Description
--------- | -----------
HASH| The hash of the invoice.