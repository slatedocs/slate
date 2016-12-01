---
title: Zibby API Documentation

language_tabs:
 - json: JSON

toc_footers:


includes:


search: true
---

# Zibby API Documentation


The Zibby API is designed to be compatible with retailers on all
platforms, both custom and off-shelf.

The API is designed with the REST protocol and uses native HTTP
features like HTTP verbs and HTTP authentication, which can be
understood by all HTTP clients.

All requests and responses are in JSON format, including errors.

#Setting Up

##Authentication

>Sample Curl

```script
curl -X GET https://sandbox.zibby.com/api/v3/application/2398798 \

-H "Content-Type:application/json" \

-H "Authorization: Bearer 01234567-89ab-cdef-0123-456789abcdef"
```

Zibby uses Oauth 2.0 to authenticate all requests
to the API.

During onboarding with Zibby, you will be provided an
access token that can be used to access protected
resources and initialize customers checking out  or applying with the
Zibby payment method.

Once you receive your Oauth access token you’re all set
to make requests to the Zibby API. All API requests must
be made over HTTPS. Calls made over plain HTTP will
fail. You must authenticate for all requests.

###Versioning

The Zibby API is versioned for major backwards
incompatible changes to the system.
The API is currently on version 3.0.

###Environment

To make the Zibby Integration as easy as possible, we
support sandbox and live environments. The two
environments have distinct Oauth keys and can be active
simultaneously. Data is never shared across environments.

###Test Endpoint:

https://sandbox.zibby.com/api/v3

###Live Endpoint:

https://www.zibby.com/api/v3


#Applying with Zibby



##Request Verification Code

>Request Phone Verification Code:

```script
URL:			/api/v3/user/auth/retailer/
Method:			POST
Request:		{"phone": "1234567890"}
Response:		{"new_user": true}
Status:			202
```

To begin an application, Zibby requires that the consumer verify their phone number. This is done by sending an SMS message to the input number.



##Submit Verification Code


>Submit Verification Code:

```script
URL:			/api/v3/user/auth/verify/
Method:			POST
Request:		{"phone": "1234567890", "code": "123456"}
Response:		{"verified": true}
Status:			202
```

Once the customer has recieved the SMS code, it must be sent to Zibby to complete the verication of their phone number.

##Create an Application

>Customer Application Data:

```script
URL:			/api/v3/application/
Method:			POST
Request:		{"phone": "1234567890",
           		 "billing_first_name": "John",
              	 "billing_last_name": "Doe",
              	 "email": "jdoe@jtest.com",
              	 "billing_address": "14 28th Ave.",
              	 "billing_address2": "",
              	 "billing_city": "New York",
              	 "billing_state": "NY",
              	 "billing_zip": "11102",
              	 "dob_day": 15,
              	 "dob_month": 7,
              	 "dob_year": 1984,
              	 "income": "50000.00",
              	 "ssn": "342134125",
                 "driver_license_number": "E82923892",
                 "driver_license_state": "NY",
                 "driver_license_expiration_year": "2018",
                 "driver_license_expiration_month": "09",
                 "driver_license_expiration_day": "12",
                 "employment_type": "full-time",
                 "reference_name": "Jamie Smith",
                 "reference_phone_number": "2172849548",
                 "employment_name": "Streamlake Insurance",
                 "employment_number": "3672734875",
                 "privacy_agreement_accepted": "true"}
Response:		{"uid": "2f0db9059d6a46c1a02e5361243e40b6"}
Status: 		201
```

To create the Zibby application for a consumer, the customer’s application data as shown in the Application JSON to the right should be sent either in a POST or PATCH request to Zibby.

##Privacy Policy Signature

>Submit Privacy Policy Signature:

```script
URL:			/api/v3/application/<uid>/privacy_policy_signature/
Method:			POST
Request:		{"signature": "PNG image as base64 encoded string"}
Response:		{"success": true}
Status: 		201
```


Customers will need to review and accept the privacy policy before proceeding. The privacy policy can be viewed here:

URL: https://www.zibby.com/privacy-policy



##Build the Application

```script
URL: 			/api/v3/application/<uid>/
Method: 		PATCH
Request:		{"billing_address" : "151 W 25th St",
               	 "billing_address2" : "9th Fl",
               	 "billing_city" : "New York",
               	 "billing_first_name" : "John",
               	 "billing_last_name" : "Doe",
               	 "billing_state" : "NY",
               	 "billing_zip" : "10010",
               	 "dob_day" : 11,
               	 "dob_month" : 6,
               	 "dob_year" : 1986,
               	 "email" : "jd@cognical.com",
               	 "income" : "50000.00",
               	 "ssn" : "431135234",
                 "driver_license_number": "E82923892",
                 "driver_license_state": "NY",
                 "driver_license_expiration_year": "2018",
                 "driver_license_expiration_month": "09",
                 "driver_license_expiration_day": "12",
                 "employment_type": "full-time",
                 "reference_name": "Jamie Smith",
                 "reference_phone_number": "2172849548",
                 "employment_name": "Streamlake Insurance",
                 "employment_number": "3672734875",
                 "privacy_agreement_accepted": "true"}
Response: 		{"uid" : "2f0db9059d6a46c1a02e5361243e40b6"}
Status: 		202
```
The Zibby API Supports a multistep process for building the application once you have the uid.

To build the Zibby application for a consumer, the customer’s application data as shown in the Application JSON to the right should be sent in a PATCH request to Zibby with the new information.

##Submit Application for Underwriting

>Submit Application for Underwriting

```script
URL:			/api/v3/application/<uid>/preapprove/
METHOD: 		GET
Response: 		{"approved": true,
				 "approval_limit": "2000"}
```


Once the application has been built successfully, the final step in the Zibby approval process is to commit it for preapproval.

At this point, Zibby will make a full approval decision in real-time. If approved, we will return the approval amount in the response.


##Error Example

```script
Response: {"error": {"ssn": ["Invalid Ssn"]}}
Status: 400
```

When an error is encountered the system will return this response.

#Zibby Plugin Checkout

##Step 1

```script
<script>
    var _zibby_config = {
        api_key: "[INSERT YOUR API KEY HERE]",
        environment: "https://sandbox.zibby.com"
    };

     !function(e,t){e.zibby=e.zibby||{};var i,r,s;r=!1,i=document.createElement("script"),i.type="text/javascript",i.async=!0,i.src=t.script,i.onload=i.onreadystatechange=function(){r||this.readyState&&"complete"!=this.readyState||(r=!0,e.zibby.setConfig(t.api_key))},s=document.getElementsByTagName("script")[0],s.parentNode.insertBefore(i,s);var n=document.createElement("link");n.setAttribute("rel","stylesheet"),n.setAttribute("type","text/css"),n.setAttribute("href",_config.url+"plugin/css/zibby.css");var c=document.querySelector("head");c.insertBefore(n,c.firstChild)}(window,_zibby_config);


</script>
```

Place the following script tag on the bottom of your page. This snippet uses an asynchronous loading method that allows you to immediately use the zibby.js plugin without a significant impact on the load time of your page.

##Step 2

```script
<a href="#" class="btn-zibby-checkout">
<img src="https://www.zibby.com/static/img/btn-zibby-checkout.png" alt="Checkout with Zibby">
</a>
```

Place or name the Zibby checkout button within the payment options page of your site.

##Step 3

```script
<script>


$('.btn-zibby-checkout').on('click', function() {
  var checkout = {
     customer: {
         billing: {
             first_name: "jane",
             middle_name: "Q",
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
             middle_name: "Q",
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
      display_name:         "4K LG TV",
      sku:                  "LG-4k2352",
      unit_price:           1399.99,
      quantity:             1,
      leasable:             true
    }],

    checkout: {
      customer_id: "1000438727823",
      shipping_amount: 20.00,
      discounts: [
         {discount_name: "Discount name 1", discount_amount: 50.00},
         {discount_name: "Discount name 2", discount_amount: 50.00}
      ]
    },

    urls: {
        return: "https://yoursite.com/return",
        cancel:"https://yoursite.com/cancel"
    }

  };
  zibby.checkout.set(checkout);
  zibby.checkout.load();
});


</script>
```

To check out with zibby, you must first initialize the cart object with the following information

1. Customer information - This is the billing and shipping information that the customer has already entered on your site

2. Item data - The contents of the customers’ shopping cart

3. Checkout data - Meta data on the transaction, such as the order id and any applicable discounts

4. URLS - These are the routes we will send the customer to at the end of the transaction

	a. The return URL is where we will redirect to after the customer completes their checkout. We will also POST to that URL the customer_id provided and the zibby_id associated with the order.

	b. The cancel URL is where we will redirect if a customer cancels a checkout with Zibby.

<aside class="success">Once initialized, the Zibby checkout modal can then be triggered.</aside>


#Direct Checkout

##Request Verification Code

>Request Verification Code:

```script
URL:			/api/v3/user/auth/retailer/
Method:			POST
Request:		{"phone": "1234567890"}
Response:		{"new_user": true}
Status:			202
```

To begin the checkout, Zibby requires that the consumer verify their phone number. This is done by sending an SMS message to the input number.

##Submit Verification Code

>Submit Verification Code:

```script
URL:			/api/v3/user/auth/verify/
Method:			POST
Request:		{"phone": "1234567890", "code": "123456", "last_four": "6789"}
Response:		{"verified": true, "approval_limit": "2000", "available_limit": "1500"}
Status:			202
```

Once the customer has recieved the SMS code, it must be sent to Zibby along with the last four of their SSN/ITIN to complete the verication of their phone number.

##Estimate Monthly Payment

```script
URL:			/api/v3/application/estimate/
Method:			POST
Request:		{"cash_price": "500", "zip_code": "12345"}
Response:		{"term": "18", "monthly_payment": "68.05"}
Status:			202
```

Zibby API allows you to be able to view what the monthly payment would be based on a cash price and a zip code.

<aside class="warning">Note: This assumes that all items in that cash price are leasable.</aside>


##Preview Lease Pricing



```script
URL:		/api/v3/application/preview/
Method:		POST
Request:	{"state":"NY","items":
						[{"item_type":"new",
 						  "quantity":1,
 						  "retailer_price":500,
 						  "item_code":"ukz637",
 						  "item_name":"samsung tv",
 						  "warranty":{"price":100,
 									  "name":"warranty name",
 									  "code":"warranty sku"},
 						  "leasable":true}],
 			 "delivery_method":"delivery",
 		 	 "shipping":10,
 			 "zipcode":"10010"}
Response:	{"delivery_method": "delivery",
 			 "processing_fee": 0,
 			 "shipping": "10",
 			 "shipping_sales_tax": "0.89",
 			 "items": [{"item_code": "item make",
 			 "item_name": "item description",
 			 "item_type": "new",
 			 "quantity": 1,
 			 "rent": "62.50",
 			 "retailer_price": "500",
 			 "sales_tax": "5.55",
 			 "warranty": {"code": "warranty sku",
 						  "monthly_amount": "5.56",
 						  "monthly_tax": "0.49",
 						  "name": "warranty name",
 						  "price": "100"}}],
 			 "term": 18,
 			 "monthly_total": "67.50",
			 "due_at_checkout": "84.99"}
```

Based on the content of a customer's shopping cart, the Zibby API can return a preview of the customer's initial payment at checkout as well as their subsequent monthly payments.

##Initialize the Lease for Checkout

```script
URL: 		/api/v3/application/initialize/
Method: 	POST
Request:	{"code": "123456",
                 "customer":{
				"billing":{
					"first_name":"jane",
					"middle_name":"Q",
					"last_name":"doe",
					"address":"123 main street",
					"address2":"apt 5b",
					"city":"New York",
					"state":"NY",
					"country":"United States",
					"zip":"10009",
					"phone":"5554324537",
					"email":"jqdoe@anonmail.com"
					},
				"shipping":{
					"first_name":"jane",
					"middle_name":"Q",
					"last_name":"doe",
					"address":"123 main street",
					"address2":"apt 5b",
					"city":"New York",
					"state":"NY",
					"country":"United States",
					"zip":"10009",
					"phone":"5554324537",
					"email":"jqdoe@anonmail.com"
					}
				},"items":[{
					"display_name":"Furniture Set",
					"sku":"FS3525",
					"unit_price":700,
					"quantity":1
					"leasable": true,
					"shipping":{"sku":"000HD999000",
								"display_name":"HOME DELIVERY CHARGE",
								"unit_price":"5.0",
								"quantity":"1"}
								},
					{"display_name":"AA Batteries",
					 "sku":"AA5234",
					 "unit_price":15,
					 "quantity":1,
					 "leasable": false
					 }],"checkout":{"customer_id":"1000438727823",
					 				"shipping_amount":10,
					 				"discounts":[{"discount_name":"Birthday Discount",
					 							  "discount_amount":50},
					 							  {"discount_name":"Towel Discount","discount_amount":50}]},
					 				"urls":{"return":"https://yoursite.com/return","cancel":"https://yoursite.com/cancel"},"phone":"6073393582","code":"258446","new_address":false}
Response: 	{"delivery_method": "delivery",
 			 "processing_fee": 0,
 			 "shipping": "10",
 			 "shipping_sales_tax": "0.89",
 			 "items": [{"item_code": "item make",
 			 "item_name": "item description",
 			 "item_type": "new",
 			 "quantity": 1,
 			 "rent": "62.50",
 			 "retailer_price": "500",
 			 "sales_tax": "5.55",
 			 "shipping": {"sku":"000HD999000",
								"display_name":"HOME DELIVERY CHARGE",
								"unit_price":"5.0",
								"quantity":"1"},
 			 "warranty": {"code": "warranty sku",
 						  "monthly_amount": "5.56",
 						  "monthly_tax": "0.49",
 						  "name": "warranty name",
 						  "price": "100"}}],
 			 "term": 18,
 			 "monthly_total": "67.50",
			 "due_at_checkout": "84.99",
			 "uid": "113c8c68ab9a4b7ba999af018574ee2d"}
```

To begin the checkout, we must open the checkout by submitting the full contents of the shopping cart.

#Post-Origination

Once an order has been originated, Zibby provides certain API endpoints to allow a retailer to manipulate the order. These enpoints are accessed by means of a private authentication token with which Zibby provides the retailer.
The uid provided in the initialize response is required to access these endpoints.

##Cancel Order

```script
URL: 		/api/v3/application/<uid>/cancel_order/
Method: 	GET
Return: 	{"success": true}
```

The Zibby API allows retailers to directly cancel the entire order.

##Cancel Item

```script
URL: 		/api/v3/application/<uid>/cancel_item/
Method: 	POST
Request:	{"items": [{"sku": "285868","display_name": "BATTERY","unit_price": 4.0, "quantity": 4}]}
Return: 	{"success": true}
```

The Zibby API allows retailers to directly cancel individual items within an originated order.

##Confirm Order

```script
URL: 		/api/v3/application/<uid>/confirm_order/
Method: 	POST
Request: 	{"order_id": "abcd"}
Return: 	{"success": true}
```

Zibby's API allows for the retailer to be able to confirm an order once it is initialized in the retailer's downstream system.

##Submit Sales Receipt

```script
URL: 		/api/v3/application/<uid>/receipt/
Method: 	POST
Request:	{"receipt": "base 64 encoded PDF"}
Return: 	{"success": true}
```

Once the sale is complete retailers can submit their invoice for the transaction with Zibby in order to meet their funding requirement.

##Submit Delivery

```script
URL: 		/api/v3/application/<uid>/delivery/
Method: 	POST
Request: 	{"items": [{"sku": "285868","display_name": "BATTERY","unit_price": 4.0, "quantity": 4}], "delivery_date": "2016-10-14T13:40:16.368888"}
Return: 	{"success": true}
```

Once items are delivered, retailers can update Zibby on the delivery via the API.















