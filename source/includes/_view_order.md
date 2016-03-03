# View an Order
## `GET /api/orders/{id}`

> [ GET /api/orders/{id} ]

```shell
  curl "https://www.sendle.com/api/orders/f5233746-71d4-4b05-bf63-56f4abaed5f6"
    -u "sendleID:APIKey"
    -H "Content-Type: application/json"
```

> 200 Response

```
  {
    "order_id":"f5233746-71d4-4b05-bf63-56f4abaed5f6",
    "state":"Pickup",
    "order_url":"https://www.sendle.com/api/orders/f5233746-71d4-4b05-bf63-56f4abaed5f6",
    "labels":[
      {
        "format":"pdf",
        "size":"a4",
        "url":"https://www.sendle.com/api/orders/f5233746-71d4-4b05-bf63-56f4abaed5f6/labels/a4.pdf"
      },
      {
        "format":"pdf",
        "size":"cropped",
        "url":"https://www.sendle.com/api/orders/f5233746-71d4-4b05-bf63-56f4abaed5f6/labels/cropped.pdf"
      }
    ],
    "scheduling":{
      "is_cancellable":true,
      "pickup_date":"2015-10-24",
      "estimated_delivery_date_minimum":"2015-10-26",
      "estimated_delivery_date_maximum":"2015-10-27"
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
        "email":null
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

Viewing an order will give you all the details associated with an existing Sendle Booking. Important details in an order include:

| Field | Description |
|------:|:-----------|
**order_id** | The order's individual identification in Sendle's system. |
**state** | Identifies the current state of the order. Visit [Check for Status Updates](#check-for-status-updates) for more information. |
**order_url** | Specific url for order queries. After booking, this url becomes the point to check for updated information (state changes), labels and any other information related to the order.|
**labels** | Covered in detail in the [label section](#getting-labels). This field returns `null` at the initial order booking. After the booking is processed, label details will be included here. |
**scheduling** | Information regarding the order's pickup date and whether an order can be [cancelled](#cancelling-orders) |
 | Estimate Delivery range (minimum & maximum). These dates can change depending on courier conditions.
