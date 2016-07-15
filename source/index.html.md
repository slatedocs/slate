---
title: API Reference

language_tabs:
 - javascript: JavaScript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  
search: true
---

# API Reference

##The Zibby.js plugin is designed for retailers on custom-built ecommerce sites or retailers on ecommerce platforms with a high degree of configurability. Below are the steps you would follow to integrate Zibby into your website.

1. Add the Zibby.js snippet to your site
2. Initialize the Zibby preapproval button and position it
3. Initialize the Zibby checkout button and position it
4. Create a checkout with the Zibby.js API

# Setting Up

## Authentication

> Sample Curl:

```javascript
curl -X GET https://sandbox.zibby.com/api/v2/application/2398798  

-H "Authorization: Bearer 01234567-89ab-cdef-0123-456789abcdef"
```

Zibby uses Oauth 2.0 to authenticate all requests to the API.

During onboarding with Zibby, you will be provided an access token that can be used to access protected resources, as well as a separate token to be used publicly, to initialize customers checking out with the Zibby payment button.

Once you receive your tokens you’re all set to make requests to the Zibby API. 



<aside class="warning">
All API requests must be made over HTTPS. Calls made over plain HTTP will fail. You must authenticate for all requests.
</aside>

### Versioning

The Zibby API is versioned for major backwards incompatible changes to the system.
The API is currently on version 2.0.

### Environment

To make the Zibby Integration as easy as possible, we support sandbox and live environments. The two environments have distinct Oauth keys and can be active simultaneously. Data is never shared across environments.

### Test Endpoint

`https://sandbox.zibby.com/api/v2`

###Live Endpoint

`https://www.zibby.com/api/v2`

## shipping_object

The shipping_object is a JSON object containing information related to the shipment of an order or items within an order.


```json
{
  "items": [
    {
      "sku": "145867", 
      "leasable": true, 
      "display_name": "TV", 
      "item_tax": 0.00, 
      "unit_price": 1000.00, 
      "quantity": 1
    } 
  ],
      "shipping_confirmation": "198CAHJ23",
      "shipping_carrier": "UPS" 
}
```


# Pre-Approval

##Step 1

```javascript
<script>
var _zibby_config = { 
api_key: "#############",
  environment: "<zibby.js url>" 
};
!function(e,t){e.zibby=e.zibby||{};var n,i,r;i=! 
1,n=document.createElement("script"),n.type="text/javascript", 
n.async=0,n.src=t.environment+"/plugin/js/zibby.js", 
n.onload=n.onreadystatechange=function(){i||this.readyState 
&&"complete"!=this.readyState||(i=0,e.zibby.setConfig(t.api_key))}, 
r=document.getElementsByTagName("script")[0],r.parentNode.insertBefore(n,r); 
var s=document.createElement("link"); s.setAttribute("rel","stylesheet"), 
s.setAttribute("type","text/css"), 
s.setAttribute("href",t.environment+"/plugin/css/zibby.css"); 
var a=document.querySelector("head"); 
a.insertBefore(s,a.firstChild)}(window,_zibby_config); 
</script>
```

Place the following script tag on the bottom of your page. This snippet uses an asynchronous loading method that allows you to immediately use the zibby.js plugin without a significant impact on the load time of your page.



## Step 2

Place a button with class `btn-zibby-preapprove` on the pages where you want the Zibby pre-approval functionality to be available. Clicking this button will load the Zibby pre-approval form.

`<a href="#" class="btn-zibby-preapprove"></a>`



```javascript
<script>
$(‘.custom-class’).on(‘click keyup’, function() { 
zibby.preapprove();
});
</script>
```
<aside class="notice">
Note:
The zibby.js plugin automatically attempts to bind to the class btn-zibby-preapprove. If you wish to use a class other than btn-zibby-preapprove you should bind the class to the zibby.js plugin as shown to the right.
</aside>

#Checkout

##Step 1

```javascript
<a href="#" class="btn-zibby-checkout">
<img src="https://www.zibby.com/static/img/btn-zibby-checkout.png"
 alt="Checkout with Zibby">
</a>
```

Place or name the Zibby checkout button within the payment options page of your site.

## Step 2

```javascript
<script>
  // setup and configure cart 
  zibby.checkout.set({
    customer: { 
      billing: {
        first_name: "jane", 
        last_name: "doe",
        address: "123 main street", 
        address2: "apt 5b",
        city: "New York",
        state: "NY",
        country: "United States", 
        zip: "10009",
        phone: "5554324537",
        email: "jqdoe@anonmail.com" 
      },
      shipping: {
        first_name: "jane",
        last_name: "doe",
        address: "123 main street", 
        address2: "apt 5b",
        city: "New York",
        state: "NY",
        country: "United States",
        zip: "10009",
        phone: "5554324537",
        email: "jqdoe@anonmail.com"
      } 
    },

    items: [{
      display_name: "4K LG TV", 
      sku: "LG-4k2352", 
      unit_price: 1399.99, 
      quantity:1
    }],

    checkout: {
      customer_id: "10004323", 
      discounts: {
        discount_name_one: 10.00,
        discount_name_two: 50.00 
      },
      shipping_amount: 20.00 
    },
    
    urls: {
      return: "https://yoursite.com/return", 
      cancel:"https://yoursite.com/cancel"
    }

  });
  
  // load zibby checkout modal 
  zibby.checkout.load();

</script>
```

To check out with zibby, you must first initialize the cart object with the following information

1. Customer information - This is the billing and shipping information that the customer has already entered on your site

2. Item data - The contents of the customers’ shopping cart

3. Checkout data - Meta data on the transaction, such as the order id and any applicable discounts

4. URLS - These are the routes we will send the customer to at the end of the transaction

  a. The return URL is where we will redirect to after the customer completes their checkout. We will also POST to that URL the customer_id provided and the zibby_id associated with the order.
  
  b. The cancel URL is where we will redirect if a customer cancels a checkout with Zibby.

Once initialized, the Zibby checkout modal can then be triggered.

# Zibby API Functionality

1. View an application
2. Cancel an application
3. Update Shipping Confirmation

## View an Application

>Sample Response:

```json
{
  "created_at": "2014-10-27T11:24:43.896099", 
  "customer": {
    "billing": {
      "first_name": "jane", 
      "last_name": "doe",
      "address": "123 main street", 
      "address2": "apt 5b",
      "city": "New York",
      "state": "NY",
      "country": "United States", 
      "zip": "10009",
      “phone”: “5554324527”, 
      “email”: “jqdoe@anonmail.com”
    }, 
    "shipping": {
      "first_name": "jane", 
      "last_name": "doe", 
      "address": "123 main street", 
      "address2": "apt 5b",
      "city": "New York", 
      "state": "NY",
      "country": "United States", 
      "zip": "10009",
      “phone”: “5554324527”,
      “email”: “jqdoe@anonmail.com”
    }
  },
  "email": "jqdoe@anonmail.com", 
  "id": "777663298",
  "items": [
    {
      "display_name": "TV",
      "funded": true,
      "funded_date": “2014-06-14T05:13:21Z”, 
      "item_tax": 0.00,
      "leasable": true,
      "shipped": false,
      "sku": "145867",
      "status": "active",
      "unit_price": 1000.00
    },
    {
      "display_name": "BATTERY",
      "funded": true,
      "funded_date": “2014-06-14T05:13:21Z”, 
      "item_tax": 0.00,
      "leasable": false, 
      "shipped": false, 
      "sku": "285868", 
      "status": "active", 
      "unit_price": 4.00
    }
   ],
    "order_id": "10004323",
    "phone": "2144324537",
    "redirect": "https://sandbox.zibby.com/application/apply?uid=2fdabc7d76c346b79c255d93fa2476eb", 
    "released_for_shipping": true,
    "status": "current" 
  }
```
The Zibby API can be queried to determine the status of any transaction that initiated a checkout with Zibby. Zibby will return 4 different statuses that the Retailer should use to update orders on their end.

### Status Options

pending: The default status of an order once it’s placed on Zibby

cancelled: The order was not successfully completed on Zibby

current: The order has completed processing on Zibby and can be shipped out to the customer

return: The order was returned by customer

###Definition
`GET https://sandbox.zibby.com/api/v2/application/777663298`

###Example Request
`curl https://sandbox.zibby.com/api/v2/application/777663298 \  -H "Authorization: Bearer 9138985e464a2eb7ed5ff0390292830a48fd34ed"`

## Cancel an Order

>Example Response:

```javascript
{"status": "success"}
```

Orders can be cancelled at anytime after creation by submitting a GET request to the Zibby API. The Zibby API is designed to support full cancellations. In the event of a cancellation, Zibby refunds the customer directly and completes reconciliation with the retailer.

###Definition
`GET https://sandbox.zibby.com/api/v2/application/777663298/cancel`

###Example Request
`curl https://sandbox.zibby.com/api/v2/application/777663298/cancel \ -H "Authorization: Bearer 9138985e464a2eb7ed5ff0390292830a48fd34ed" \`


#Updated Shipping Confirmation

>Example Response:

```json
{
  "application": "777663298",
  "created": "2014-10-27T12:28:51.359010", 
  "id": 1,
  "items": [
    {
      "display_name": "DVD PLAYER", 
      "item_tax": 0.00,
      "leasable": true,
      "quantity": 1,
      "sku": "919123",
      "unit_price": 200.00
    } 
  ],
  "shipping_carrier": "UPS", 
  "shipping_confirmation": "198CAHJ23", 
  "type": "shipment"
}
```

Orders must be updated once a shipment has been created for them by the Retailer. The Zibby API is designed to support full and partial shipments. Supplying shipping confirmation helps reduce customer disputes of orders.

###Definition
`POST https://sandbox.zibby.com/api/v2/application/777663298/shipment`

###Example Request
`curl https://sandbox.zibby.com/api/v2/application/777663298/shipment \
-X POST \
-H "Authorization: Bearer 9138985e464a2eb7ed5ff0390292830a48fd34ed" \
-H "Content-Type: application/json"\
-d '{"shipping_object": <shipping_object>}'`

##(Optional) Receiving payment for the transaction

>Example Response

```json
{
  ‘payment_method’: <aes encrypted json>
}
```

>...Where the contents of aes encrypted json is a json string with contents in the format below:

```json
{
  "authorized_amount": "1210.55", 
  “billing_name”: “Cognical Inc.”, 
  "billing_address": "P.O Box 1112", 
  "billing_city": "New York", 
  "billing_state": "NY",
  "billing_zip": "10010",
  "card_cvv": "586",
  "card_expiration": "09/18", 
  "card_number": "4111111111111111", 
  “card_type”: “mastercard”
}
```

Zibby provides an API interface to allow select retailers to receive payments on approved transactions via a virtual card.

Authorized requests to this endpoint will return a JSON object with values encrypted via the AES algorithm. To decrypt the values in this JSON, a separate decryption_key will be provided by Zibby.

Upon decryption, the JSON parameters can be used to initiate a charge based on the authorized amount.

###Definition
`GET https://sandbox.zibby.com/api/v2/application/777663298/capture_charge`

###Example Request
`curl https://sandbox.zibby.com/api/v2/application/777663298/capture_charge \ -H "Authorization: Bearer 9138985e464a2eb7ed5ff0390292830a48fd34ed" \`

