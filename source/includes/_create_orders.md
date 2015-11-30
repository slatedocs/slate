# Creating Orders

`POST /orders`

To create an order, submit order data via POST command. The order will be rejected if the data fails validation and the API will respond with an error.

## Order Requirements
> Example Booking

```shell
  curl https://www.sendle.com/api/orders -X POST
  -u sendleAPI:42RRTjYz5Z4hZrm8XY3t4Vxt
  -H "Content-Type: application/json"
  -d '{
    "pickup_date": "2015-11-24",
    "description": "Kryptonite",
    "confirmed_not_dangerous": true,
    "kilogram_weight": 1,
    "cubic_metre_volume": 0.01,
    "customer_reference": "SupBdayPressie",
    "sender": {
      "contact": {
        "name": "Lex Luthor",
        "email": "me@lexluthor.com",
        "phone": "0412 345 678"
      },
      "address": {
        "address_line1": "123 Gotham Ln",
        "suburb": "Sydney",
        "state_name": "NSW",
        "postcode": "2000",
        "country": "Australia"
      },
      "instructions": "Knock loudly"
    },
    "receiver": {
      "contact": {
        "name": "Clark Kent",
        "email": "clarkissuper@dailyplanet.xyz"
      },
      "address": {
        "address_line1": "80 Wentworth Park Road",
        "suburb": "Glebe",
        "state_name": "NSW",
        "postcode": "2037",
        "country": "Australia"
      },
      "instructions": "Give directly to Clark"
    }
  }'
```

> 201 Response

```json
  {
    "order_id":"f5233746-71d4-4b05-bf63-56f4abaed5f6",
    "state":"Payment",
    "order_url":"https://www.sendle.com/api/orders/f5233746-71d4-4b05-bf63-56f4abaed5f6",
    "labels":null,
    "scheduling":{
      "is_cancellable":true,
      "pickup_date":"2015-10-24"
    },
    "description":"Kryptonite",
    "confirmed_not_dangerous":true,
    "kilogram_weight":"1.0",
    "cubic_metre_volume":"0.01",
    "customer_reference":"SupBdayPressie",
    "sender":{
      "contact":{
        "name":"Lex Luthor",
        "phone":"0412 345 678",
        "email":"me@lexluthor.com"
      },
      "address":{
        "address_line1":"123 Gotham Ln",
        "address_line2":null,
        "suburb":"Sydney",
        "state_name":"NSW",
        "postcode":"2000",
        "country":"Australia"
      },
      "instructions":"Knock loudly"
    },
    "receiver":{
      "contact":{
        "name":"Clark Kent",
        "phone":null,
        "email":"clarkissuper@dailyplanet.xyz"
      },
      "address":{
        "address_line1":"80 Wentworth Park Road",
        "address_line2":null,
        "suburb":"Glebe",
        "state_name":"NSW",
        "postcode":"2037",
        "country":"Australia"
      },
      "instructions":"Give directly to Clark"
    }
  }
```

- `pickup_date`
  - Format: **yyyy-mm-dd**
  - Date must be at least one non-holiday, business day in the future.
- `description`
  - Description is used by users to track the parcel. It does not show up on a label.
  - It must be under 255 characters in length.
- `confirmed_not_dangerous`
  - Boolean value (true or false)
  - **Sendle** will only deliver if `confirmed_not_dangerous` is set to **true**
- `kilogram_weight`
  - Must be a decimal value over zero.
- `cubic_metre_volume`
  - To get value Multiply length x width x depth of parcel **in metres**.
  - Must be a decimal value above zero and less than 1.
- `customer_reference`
  - Reference will appear on the label for parcel identification.
  - It must be under 255 characters in length.
- `sender`
  - `contact`
      - `email`
          - Must be your email address for the account you are
            authenticated with

### Getting the Label

Getting a label for an order requires an order to be created and booked with a courier which happens asynchronously. For more information, read more in [getting labels](#getting-lables).
