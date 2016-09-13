# Merchants

##Update

> Returns JSON structured like this:

```json
{
  "data": {
    "status": true,
    "data": {
      "mail_body": "This email is a reminder that the balance on your account is {tag:invoice_total}. We accept MasterCard, VISA, Discover and American Express. If your payment is already on its way, we thank you and ask that you please disregard this notice. If not, we would appreciate receipt of your payment as soon as possible. If you would like to further discuss the details of your account, please do not hesitate to call billing at {tag:invoice_merchant_contact}."
    }
  }
}
```

> Request JSON structure like this:

```json
{
  "mail_body": "This email is a reminder that the balance on your account is {tag:invoice_total}. We accept MasterCard, VISA, Discover and American Express. If your payment is already on its way, we thank you and ask that you please disregard this notice. If not, we would appreciate receipt of your payment as soon as possible. If you would like to further discuss the details of your account, please do not hesitate to call billing at {tag:invoice_merchant_contact}."
}
```

This method lets you update the invoice.

### HTTP Request

`POST merchantsettings`

### Data Object

Field Name | Required | Type | Description
---------|-----|------|------
mail_body|  | string | Invoice Number
logo | | image | Invoice logo link.