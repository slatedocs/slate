# Creating Orders

`POST /orders`

To create an order, submit order data via POST command. The order will be rejected if the data fails validation and the API will respond with an error.

## Order Requirements
All fields, whether number or text should be entered as a [string value](http://www.json.org/) surrounded with quotes.
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
| Data Field | Attributes |
|-----------:|:-----------|
**pickup_date** | Format: **yyyy-mm-dd** 
 | Date must be at least one non-holiday, business day in the future.
**description** |**optional**
 | Description is used by the customer to track the parcel on Sendle Dashboard. It does not show up on a label.
 | It must be under 255 characters in length.
**confirmed_not_dangerous** | *boolean value* (true or false).
 | **Sendle** will only make a booking if `confirmed_not_dangerous` is set to **true**.
**kilogram_weight** | Must be a decimal value over zero and less than the category/max weight allowed (25kg max).
**cubic_metre_volume** | Must be a decimal value above zero and less than one.
 | To get value, multiply *length* x *width* x *depth* of parcel **in metres**.
**customer_reference** |**optional**
 | Reference will appear on the label for parcel identification.
 | It must be under 255 characters in length.
 |
**sender** |
**instructions** |**optional**
 | Short message used as pickup instructions for courier.
 | It must be under 255 chars, but is recommended to be under 40 chars due to label-size limitations.
 |
**contact** | 
**name** | It must be under 255 characters in length.
**email** | Leave this empty - it will be populated with your email based on your `sendle_id`.
**phone** | Used to coordinate pickup if the courier is outside attempting delivery.
 | It must be a valid Australian phone number (inc area code), or fully qualified international number.
 | eg. (02) 1234 1234, +1 519 123 1234, +61 (0)4 1234 1234.
 |
**address** |
**address_line1** | The street address where the parcel will be picked up. Addresses can be split over two lines using `address_line1` and `address_line2`. Only `address_line1` is mandatory. `line2` will be displayed below `line1` on the parcel label.
 | Do not include postcode, state, or suburb in this field
 | It must be under 255 char in length, but best practice to keep under 40 chars due to label-size limitations.
**address_line2** |**optional**
 | Second line of the street address for the pickup location.
**suburb** | Suburb or town where the parcel is to be picked up.
 | If Sendle cannot service this location, response will be a validation error stating that the suburb is not serviceable.
 | Postcode and suburb must match. If they do not match, Sendle will return a set of alternates to choose from.
 | If reciving an unserviceable error, you may want to check if the location is also listed under a different suburb name.
**postcode** | Postcode of pickup location.
 | It must be a four digit string for a valid location.
 | If the area cannot be picked up from, response will be a validation error stating the location is unserviceable.
**state_name** | Must be the pickup location's state or territory.
 | Valid options include: ACT, NSW, NT, QLD, SA, TAS, VIC, WA.
 | Long-form (i.e. "Northern Territory") is also accepted.
**country** |**optional**
 | Sendle only works within Australia. If absecent, Sendle assumes orders are in Australia.
 | String value under 255 characters in length.
 | If included, must read "Australia"
 |
**receiver** | 
**instructions** |**optional**
 | Short message used as delivery instructions for courier.
 | It must be under 255 chars, but is recommended to be under 40 chars due to label-size limitations.
 |
**contact** | 
**name** | It must be under 255 characters in length.
**email** |**optional**
 | Recipient email allows **Sendle** to send parcel updates to the recipient.
**phone** |**optional**
 | Used to coordinate pickup if the courier is outside attempting delivery.
 | It must be a valid Australian phone number (inc area code), or fully qualified international number.
 | eg. (02) 1234 1234, +1 519 123 1234, +61 (0)4 1234 1234.
 |
**address** |
**address_line1** | The street address where the parcel will be delivered. Addresses can be split over two lines using `address_line1` and `address_line2`. Only `address_line1` is mandatory. `line2` will be displayed below `line1` on the parcel label.
 | Do not include postcode, state, or suburb in this field
 | It must be under 255 char in length, but best practice to keep under 40 chars due to label-size limitations.
**address_line2** |**optional**
 | Second line of the street address for the pickup location.
**suburb** | Suburb or town where the parcel is to be delivered.
 | If Sendle cannot service this location, response will be a validation error stating that the suburb is not serviceable.
 | Postcode and suburb must match. If they do not match, Sendle will return a set of alternates to choose from.
**postcode** | Postcode of destination location.
 | It must be a four digit string for a valid location.
 | If the area is cannot be delivered to, response will be a validation error stating the location is unserviceable.
**state_name** | Must be the destination location's state or territory.
 | Valid options include: ACT, NSW, NT, QLD, SA, TAS, VIC, WA.
 | Long-form (i.e. "Northern Territory") is also accepted.
**country** |**optional**
 | Sendle only works within Australia. If absecent, Sendle assumes orders are in Australia.
 | String value under 255 characters in length.
 | If included, must read "Australia"


### Getting the Label

Getting a label for an order requires an order to be created and booked with a courier which happens asynchronously. For more information, read more in [getting labels](#getting-lables).
