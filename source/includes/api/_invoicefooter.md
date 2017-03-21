# Invoice Footer 

Invoice footer handles all invoice footer templates with/without custom fields tags.

Invoice Footer

## View


> Returns JSON structured like this:

```json
{
  "data": {
    "id": 1,
    "footer_value":"<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Total Tax:<\/strong>\r\n<span>{currency}{total_tax}<\/span>\r\n<\/div>\r\n<\/div>\r\n<div class=\"row\">\r\n   <div class=\"col-md-4 pull-right\">\r\n        <strong>Total:<\/strong>\r\n<span>{currency}{invoice_total}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Current Balance:<\/strong>\r\n<span>{currency}{invoice_current_balance}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-12\">\r\nWe accept MasterCard, VISA, Discover, American Express and ACH payments. Do you have billing or payment questions? Contact billing at <b>{merchant_contact}<\/b>. We can also be reached via email, <b>{merchant_email}<\/b>.\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>"
  }
}
```

This method lets you view a specific invoice footer.

### HTTP Request

`GET invoicefooter/{id}`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The id of the invoice footer.

##View All

> Returns JSON structured like this:

```json
{
  "data": [
    {
      "id": 2,
      "footer_value":"<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Total Tax:<\/strong>\r\n<span>{currency}{total_tax}<\/span>\r\n<\/div>\r\n<\/div>\r\n<div class=\"row\">\r\n   <div class=\"col-md-4 pull-right\">\r\n        <strong>Total:<\/strong>\r\n<span>{currency}{invoice_total}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Current Balance:<\/strong>\r\n<span>{currency}{invoice_current_balance}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-12\">\r\nWe accept MasterCard, VISA, Discover, American Express and ACH payments. Do you have billing or payment questions? Contact billing at <b>{merchant_contact}<\/b>. We can also be reached via email, <b>{merchant_email}<\/b>.\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>"
    },
    {
      "id": 1,
      "footer_value":"<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Total Tax:<\/strong>\r\n<span>{currency}{total_tax}<\/span>\r\n<\/div>\r\n<\/div>\r\n<div class=\"row\">\r\n   <div class=\"col-md-4 pull-right\">\r\n        <strong>Total:<\/strong>\r\n<span>{currency}{invoice_total}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Current Balance:<\/strong>\r\n<span>{currency}{invoice_current_balance}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-12\">\r\nWe accept MasterCard, VISA, Discover, American Express and ACH payments. Do you have billing or payment questions? Contact billing at <b>{merchant_contact}<\/b>. We can also be reached via email, <b>{merchant_email}<\/b>.\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>"
    }
  ],
  "meta": {
    "pagination": {
      "total": 2,
      "count": 2,
      "per_page": 20,
      "current_page": 1,
      "total_pages": 1,
      "links": []
    }
  }
}
```

This endpoint retrieves all invoice footer template.

### HTTP Request

`GET invoicefooter`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
limit | 20 | Number of items to show per page.
page | 1 | Page number.

## Create

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 1,
    "footer_value":"<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Total Tax:<\/strong>\r\n<span>{currency}{total_tax}<\/span>\r\n<\/div>\r\n<\/div>\r\n<div class=\"row\">\r\n   <div class=\"col-md-4 pull-right\">\r\n        <strong>Total:<\/strong>\r\n<span>{currency}{invoice_total}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Current Balance:<\/strong>\r\n<span>{currency}{invoice_current_balance}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-12\">\r\nWe accept MasterCard, VISA, Discover, American Express and ACH payments. Do you have billing or payment questions? Contact billing at <b>{merchant_contact}<\/b>. We can also be reached via email, <b>{merchant_email}<\/b>.\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>"
  }
}
```


> Request JSON structure like this:

```json
{
  "footer_value":"<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Total Tax:<\/strong>\r\n<span>{currency}{total_tax}<\/span>\r\n<\/div>\r\n<\/div>\r\n<div class=\"row\">\r\n   <div class=\"col-md-4 pull-right\">\r\n        <strong>Total:<\/strong>\r\n<span>{currency}{invoice_total}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Current Balance:<\/strong>\r\n<span>{currency}{invoice_current_balance}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-12\">\r\nWe accept MasterCard, VISA, Discover, American Express and ACH payments. Do you have billing or payment questions? Contact billing at <b>{merchant_contact}<\/b>. We can also be reached via email, <b>{merchant_email}<\/b>.\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>"
}
```

This method lets you create new invoice footer.

### HTTP Request

`POST invoicefooter`


### Data Object

Field Name | Required | Type | Description
---------|-----|------|------
footer_value | yes | string | Can be an html content.

##Update

> Returns JSON structured like this:

```json
{
  "data": {
    "id": 1,
    "footer_value":"<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Total Tax:<\/strong>\r\n<span>{currency}{total_tax}<\/span>\r\n<\/div>\r\n<\/div>\r\n<div class=\"row\">\r\n   <div class=\"col-md-4 pull-right\">\r\n        <strong>Total:<\/strong>\r\n<span>{currency}{invoice_total}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Current Balance:<\/strong>\r\n<span>{currency}{invoice_current_balance}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-12\">\r\nWe accept MasterCard, VISA, Discover, American Express and ACH payments. Do you have billing or payment questions? Contact billing at <b>{merchant_contact}<\/b>. We can also be reached via email, <b>{merchant_email}<\/b>.\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>"
  }
}
```

> Request JSON structure like this:

```json
{
  "footer_value":"<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Total Tax:<\/strong>\r\n<span>{currency}{total_tax}<\/span>\r\n<\/div>\r\n<\/div>\r\n<div class=\"row\">\r\n   <div class=\"col-md-4 pull-right\">\r\n        <strong>Total:<\/strong>\r\n<span>{currency}{invoice_total}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-4 pull-right\">\r\n<strong>Current Balance:<\/strong>\r\n<span>{currency}{invoice_current_balance}<\/span>\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-md-12\">\r\nWe accept MasterCard, VISA, Discover, American Express and ACH payments. Do you have billing or payment questions? Contact billing at <b>{merchant_contact}<\/b>. We can also be reached via email, <b>{merchant_email}<\/b>.\r\n<\/div>\r\n<\/div>\r\n\r\n<div class=\"row\">&nbsp;<\/div>"
}
```

This method lets you update a specific invoice footer.

### HTTP Request

`PUT invoicefooter/{id}`

### Data Object

Field Name | Required | Type | Description
---------|-----|------|------
footer_value | yes | string | Can be an html content.

##Remove

> Returns true if successfull:

```json
true
```

This method lets you remove a specific invoice footer.

### HTTP Request

`DELETE invoicefooter/{id}`

