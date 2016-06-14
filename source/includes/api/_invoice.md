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
---------|-----------
logo | `string` | Invoice logo link.
to | `string` | Email where invoice will be send
custnum | `string` | Customer number
customer | `string` | Encoded data of customer
invoiceNum | `string` | Invoice Number
invoiceDate | `string` | Date invoice created
invoiceDue | `string` | Due date of Invoice
merchant[id] |`array`| Merchant ID
merchant[name] |`array`| Merchant Name
merchant[city] |`array`| Merchant City
merchant[street] |`array`| Merchant Street
merchant[CityStateZip] |`array`| Merchant (city,state,zip)
merchant[contact] | `array` | Merchant's contact
merchant[email] | `array` | Merchant's email
lineitem#sku |`string` | Product item sku
lineitem#productName |`string` | Product item name
lineitem#unitCost |`string` | Item cost
lineitem#unitQuantity |`string` | Item quantity
lineitem#unitPrice | `string`| Total amount resulting from the cost & quantity
subtotal | `string` | Resulting total of all the items
credit | `string` | Customer credit	
total | `string` | Invoice total amount


> Notes:
`#` - denotes a number in line items. 




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