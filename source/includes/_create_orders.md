# Creating Orders

`POST /orders`

To create an order, submit order data via POST command. The order will be rejected if the data fails validation and the API will respond with an error.

## Example Booking JSON
> Example Booking

```shell
  curl "https://www.sendle.com/api/orders"
  -X POST
  -u "sendleAPI:42RRTjYz5Z4hZrm8XY3t4Vxt"
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


<aside class="success">
  All fields, whether number or text should be entered as a <a href="http://www.json.org/">string value</a> surrounded with quotes.
</aside>

Each collection within the example booking JSON is described in detail in the sections below.

| Section | Attributes |
|---------|:-----------|
[Parcel details](#parcel-details)| Pickup date, a parcel description, weight, volume, and a customer reference for the shipment  |
[Sender details](#sender-details)| Sender contact details, origin address, and pickup instructions |
[Sender address](#sender-address) | Origin Address Details |
[Receiver details](#receiver-details) | Recipient contact details, destination address, and delivery instructions |
[Receiver address](#receiver-address) | Destination Address Details |
[API response](#api-response) | JSON object returned with a valid booking |
[Labels](#getting-labels) | Getting Shipping Labels |

## Parcel Details
```json
  {
    "pickup_date": "2015-11-24",
    "description": "Kryptonite",
    "confirmed_not_dangerous": true,
    "kilogram_weight": 1,
    "cubic_metre_volume": 0.01,
    "customer_reference": "SupBdayPressie"
  }
```

| Data Field | Attributes |
|-----------:|:-----------|
**pickup_date** <div class="optional">"yyyy-mm-dd"</div>| Date must be at least one non-holiday, business day in the future.
**description** <div class="optional">optional</div> | Description is used by the customer to track the parcel on Sendle Dashboard. It does not show up on a label.  It must be under 255 characters in length.
**confirmed_not_dangerous** <div class="optional">boolean value</div> | Sendle will only make a booking if `confirmed_not_dangerous` is set to true.
**kilogram_weight** | Must be a decimal value over zero and less than the category/max weight allowed (25kg max).
**cubic_metre_volume** | Must be a decimal value above zero and less than one.  To get value, multiply *length* x *width* x *depth* of parcel in metres.
**customer_reference** <div class="optional">optional</div> | Reference will appear on the label for parcel identification.  It must be under 255 characters in length.

## Sender Details
```json
  {
    "sender":{
      "instructions":"Pick up with reception",
      "contact":{
        "name":"Lex Luthor",
        "phone":"0412 345 678",
        "email":"me@lexluthor.com"
      }
    }
  }
```

|   |   |
|--:|:--|
**sender** <div class="optional">object</div> | *A collection of parcel origin details.*
**instructions** <div class="optional">optional</div> | Short message used as pickup instructions for courier.  It must be under 255 chars, but is recommended to be under 40 chars due to label-size limitations.
**contact** <div class="optional">object</div> | *A collection of sender contact details.*
**name** | It must be under 255 characters in length.
**email** | Leave this empty - it will be populated with your email based on your account.
**phone** | Used to coordinate pickup if the courier is outside attempting delivery.  It must be a valid Australian phone number (including area code), or fully qualified international number.  Examples: <span class="phone-numbers">(02) 1234 1234, +1 519 123 1234, +61 (0)4 1234 1234.</span>

## Sender Address
```json
  {
    "address":{
      "address_line1":"123 Gotham Ln",
      "address_line2":null,
      "suburb":"Sydney",
      "state_name":"NSW",
      "postcode":"2000",
      "country":"Australia"
    }
  }
```

|   |   |
|--:|:--|
**address** <div class="optional">object</div>| *A collection of origin address details.*
**address_line1** | The street address where the parcel will be picked up. Addresses can be split over two lines using `address_line1` and `address_line2`. Only `address_line1` is mandatory. `line2` will be displayed below `line1` on the parcel label.  Do not include postcode, state, or suburb in this field  It must be under 255 char in length, but best practice to keep under 40 chars due to label-size limitations.
**address_line2** <div class="optional">optional</div> | Second line of the street address for the pickup location.
**suburb** | Suburb or town where the parcel is to be picked up.  If Sendle cannot service this location, response will be a validation error stating that the suburb is not serviceable.  Postcode and suburb must match. If they do not match, Sendle will return a set of alternates to choose from.  If receiving an unserviceable error, you may want to check if the location is also listed under a different suburb name.
**postcode** | Postcode of pickup location.  It must be a four digit string for a valid location.  If the area cannot be picked up from, response will be a validation error stating the location is unserviceable.
**state_name** | Must be the pickup location's state or territory.  Valid options include: ACT, NSW, NT, QLD, SA, TAS, VIC, WA.  Long-form (i.e. "Northern Territory") is also accepted.
**country** <div class="optional">optional</div> | Sendle only works within Australia. If absent, Sendle assumes orders are in Australia.  String value under 255 characters in length.  If included, must read "Australia"

## Receiver Details
```json
  {
    "receiver": {
      "instructions": "Give directly to Clark",
      "contact": {
        "name": "Clark Kent",
        "email": "clarkissuper@dailyplanet.xyz",
        "phone": "0287654321"
      }
    }
  }
```

|   |   |
|--:|:--|
**receiver** <div class="optional">object</div> | *A collection of parcel recipient details.*
**instructions** <div class="optional">optional</div> | Short message used as delivery instructions for courier.  It must be under 255 chars, but is recommended to be under 40 chars due to label-size limitations.
**contact** <div class="optional">object</div> | *A collection of receiver details.*
**name** | It must be under 255 characters in length.
**email** <div class="optional">optional</div> | Recipient email allows **Sendle** to send parcel updates to the recipient.
**phone** <div class="optional">optional</div> | Used to coordinate pickup if the courier is outside attempting delivery.  It must be a valid Australian phone number (including area code), or fully qualified international number.  Examples: <span class="phone-numbers">(02) 1234 1234, +1 519 123 1234, +61 (0)4 1234 1234.</span>

## Receiver Address
```json
  {
    "address": {
      "address_line1": "80 Wentworth Park Road",
      "suburb": "Glebe",
      "state_name": "NSW",
      "postcode": "2037",
      "country": "Australia"
    }
  }
```

|   |   |
|--:|:--|
**address** <div class="optional">object</div> | *A collection of destination address details.*
**address_line1** | The street address where the parcel will be delivered. Addresses can be split over two lines using `address_line1` and `address_line2`. Only `address_line1` is mandatory. `line2` will be displayed below `line1` on the parcel label.  Do not include postcode, state, or suburb in this field.  It must be under 255 char in length, but best practice to keep under 40 chars due to label-size limitations.
**address_line2** <div class="optional">optional</div> | Second line of the street address for the pickup location.
**suburb** | Suburb or town where the parcel is to be delivered.  If Sendle cannot service this location, response will be a validation error stating that the suburb is not serviceable.  Postcode and suburb must match. If they do not match, Sendle will return a set of alternates to choose from.
**postcode** | Postcode of destination location.  It must be a four digit string for a valid location.  If the area is cannot be delivered to, response will be a validation error stating the location is unserviceable.
**state_name** | Must be the destination location's state or territory.  Valid options include: ACT, NSW, NT, QLD, SA, TAS, VIC, WA.  Long-form (i.e. "Northern Territory") is also accepted.
**country** <div class="optional">optional</div> | Sendle only works within Australia. If absent, Sendle assumes orders are in Australia.  String value under 255 characters in length.  If included, must read "Australia"

## API Response

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
A successful response will be a full version of an **Order** object. Many of the fields sent in a booking response are confirmation of the details sent in a booking request and are covered in detail in the [View and Order section](#view-an-order). In addition to the booking details, information about the current State of the order, URLs for order details, and scheduling information is included.

| Field | Description |
|------:|:-----------|
**order_id** | The order's individual identification in Sendle's system. |
**state** | Identifies the current state of the order. Visit [Check for Status Updates](#check-for-status-updates) for more information. |
**order_url** | Specific url for order queries. After booking, this url becomes the point to check for updated information (state changes), labels and any other information related to the order. |
**labels** | Covered in detail in the [label section](#getting-labels), however this field will return `null` at the initial order booking. After the booking is processed, label details will be included within the label object. |
**scheduling** | Information regarding the order's pickup date and whether an order can be [cancelled](#cancelling-orders) |

