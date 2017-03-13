# Prepare Form URL
## `https://www.sendle.com/dashboard/prepare_form`

> [ https://www.sendle.com/dashboard/prepare_form ]


<aside class="success">
  All parameter arguments with white spaces should be escaped with either `+` or `%20` any other non alphanumeric characters or spaces should be escaped according to standard ASCII encoding conventions <a href="https://www.w3schools.com/tags/ref_urlencode.asp">URL Encoding Reference</a>
</aside>

## URL Parameters Details
```
https://www.sendle.com/dashboard/prepare_form?pickup_date=2017%2D04%2D03&customer_reference=flower+delivery&kilogram_weight=1&cubic_metre_volume=1&receiver_name=Oscar+Wilde&delivery_address_line1=2+Smith+Lane&delivery_address_suburb=sydney&delivery_address_state_name=nsw&delivery_address_postcode=2000
```

| Data Field | Attributes |
|-----------:|:-----------|
**pickup_date** <div class="optional">yyyy-mm-dd</div><div class="optional">optional</div> | If provided the date must be at least one non-holiday, business day in the future. If pickup date is omitted it will be set to the first available pickup date option.
**description** <div class="optional">optional</div> | Description is used by the customer to track the parcel on Sendle Dashboard. It does not show up on a label.  It must be under 255 characters in length.
**kilogram_weight** <div class="optional">optional</div> | Must be a decimal value greater than 0 and less than the maximum allowed weight of 25kg.
**cubic_metre_volume** <div class="optional">optional</div> | Must be a decimal value between 0 and 1.  When included, value will be *length* x *width* x *depth* of parcel in metres.
**customer_reference** <div class="optional">optional</div> | Reference will appear on the label for parcel identification.  It must be under 255 characters in length.
**sender_name** <div class="optional">optional</div> | It must be under 255 characters in length.
**sender_email** <div class="optional">optional</div> | Allows Sendle to send parcel updates to the sender.
**sender_contact_number** <div class="optional">optional</div>| Used to coordinate pickup if the courier is outside attempting delivery.  It must be a valid Australian phone number (including area code), or fully qualified international number.  Examples: <span class="phone-numbers">(02) 1234 1234, +1 519 123 1234, +61 (0)4 1234 1234.</span>
**pickup_instructions** <div class="optional">optional</div> | Short message used as pickup instructions for courier.  It must be under 255 chars, but is recommended to be under 40 chars due to label-size limitations.
**pickup_address_line1** <div class="optional">optional</div></div> | The street address where the parcel will be picked up. Addresses can be split over two lines using `pickup_address_line1` and `pickup_address_line2`. Only `pickup_address_line1` is mandatory. `pickup_address_line2` will be displayed below `pickup_address_line1` on the parcel label.  Do not include postcode, state, or suburb in this field  It must be under 255 char in length, but best practice to keep under 40 chars due to label-size limitations.
**pickup_address_line2** <div class="optional">optional</div> | Second line of the street address for the pickup location.
**pickup_address_suburb** <div class="optional">optional</div> | Suburb or town where the parcel is to be picked up.
**pickup_address_postcode** <div class="optional">optional</div> | Postcode of pickup location.  It must be a four digits.
**pickup_address_country** <div class="optional">optional</div> | Must be the pickup location's state or territory.  Valid options include: ACT, NSW, NT, QLD, SA, TAS, VIC, WA.  Long-form (i.e. "Northern Territory") is also accepted.
**country** <div class="optional">optional</div> | Sendle only works within Australia. If absent, Sendle assumes orders are in Australia.  It must be under 255 characters in length.  If included, must read "Australia"
**delivery_instructions** <div class="optional">optional</div> | Short message used as delivery instructions for courier.  It must be under 255 chars, but is recommended to be under 40 chars due to label-size limitations.
**receiver_name** <div class="optional">optional</div>| It must be under 255 characters in length.
**receiver_email** <div class="optional">optional</div> | Allows **Sendle** to send parcel updates to the recipient.
**receiver_contact_number** <div class="optional">optional</div> | Used to coordinate pickup if the courier is outside attempting delivery.  It must be a valid Australian phone number (including area code), or fully qualified international number.  Examples: <span class="phone-numbers">(02) 1234 1234, +1 519 123 1234, +61 (0)4 1234 1234.</span>
**delivery_address_line1** <div class="optional">optional</div> | The street address where the parcel will be delivered. Addresses can be split over two lines using `delivery_address_line1` and `delivery_address_line2`. Only `delivery_address_line1` is mandatory. `delivery_address_line2` will be displayed below `delivery_address_line1` on the parcel label.  Do not include postcode, state, or suburb in this field.  It must be under 255 char in length, but best practice to keep under 40 chars due to label-size limitations.
**delivery_address_line2** <div class="optional">optional</div> | Second line of the street address for the pickup location.
**delivery_address_suburb** <div class="optional">optional</div> | Suburb or town where the parcel is to be delivered.
**delivery_address_postcode** <div class="optional">optional</div> | Postcode of destination location.  It must be a four digits.
**delivery_address_state_name** <div class="optional">optional</div> | Must be the destination location's state or territory.  Valid options include: ACT, NSW, NT, QLD, SA, TAS, VIC, WA.  Long-form (i.e. "Northern Territory") is also accepted.
**delivery_address_country** <div class="optional">optional</div> | Sendle only works within Australia. If absent, Sendle assumes orders are in Australia. It must be under 255 characters in length.  If included, must read "Australia"

<aside class="success">For more information about <strong>kilogram weight</strong> and <strong>cubic metre volume</strong> check out <a href="#weights-and-dimensions"><strong>Weights and Dimensions.</strong></a></aside>
