---
title: Zibby Plugin

language_tabs:
 - json: JSON

toc_footers:


includes:


search: true
---

# Zibby Plugin Documentation


The Zibby Plugin is designed to be compatible with retailers requiring such an integration.

All requests and responses are in JSON format, including errors.

#Zibby Plugin Preapproval and Checkout

##Step 1

```script
<script>
    var _zibby_config = {
        api_key: "[INSERT YOUR API KEY HERE]",
        environment: "https://sandbox.zibby.com"
    };

    !function(e,t){e.zibby=e.zibby||{};var n,i,r;i=!1,n=document.createElement("script"),n.type="text/javascript",n.async=!0,n.src=t.environment+"/"+"plugin/js/zibby.js",n.onload=n.onreadystatechange=function(){i||this.readyState&&"complete"!=this.readyState||(i=!0,e.zibby.setConfig(t.api_key))},r=document.getElementsByTagName("script")[0],r.parentNode.insertBefore(n,r);var s=document.createElement("link");s.setAttribute("rel","stylesheet"),s.setAttribute("type","text/css"),s.setAttribute("href",t.environment+"/"+"plugin/css/zibby.css");var a=document.querySelector("head");a.insertBefore(s,a.firstChild)}(window,_zibby_config);


</script>
```

Place the following script tag on the bottom of your page. This snippet uses an asynchronous loading method that allows you to immediately use the zibby.js plugin without a significant impact on the load time of your page.

##Step 2

```script
<a class="btn-zibby-preapprove" href="#"></a>
```

Place a button with class `btn-zibby-preapprove` on the pages where you want the Zibby pre-approval functionality to be available. Clicking this button will load the Zibby pre-approval form.

##Step 3

```script
<script>
$('.btn-zibby-preapprove').on('click', function() {
    zibby.preapprove();
});
</script>
```

Start the preapproval process when the button is clicked.

##Step 4

```script
<a class="btn-zibby-checkout" href="#"></a>
```

Place or name the Zibby checkout button within the payment options page of your site.

##Step 5

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

2. Item data - The contents of the customer's shopping cart

3. Checkout data - Meta data on the transaction, such as the order id and any applicable discounts

4. URLS - These are the routes we will send the customer to at the end of the transaction

  a. The return URL is where we will redirect to after the customer completes their checkout. We will also POST to that URL the customer_id provided and the zibby_id associated with the order.

  b. The cancel URL is where we will redirect if a customer cancels a checkout with Zibby.

<aside class="success">Once initialized, the Zibby checkout modal can then be triggered.
</aside>

#Zibby Testing

##Reset User

**<aside class="notice">Since a real phone number is required during the testing process, sometimes it’s desired to reset the information that Zibby has in the sandbox that’s tied to a particular number.
</aside>** 

**Perhaps you’ve exceeded the Zibby limit or maybe you’d like to re-apply as a new user (instead of a returning one). In these cases you can reset your information via the Retailer Dashboard.**

**<aside class="success">Log into the Retailer Dashboard (see section “Logging into the sandbox Retailer Dashboard”) and visit the following link to enter the number you’d like to reset:
</aside>** 

[https://sandbox.zibby.com/ng/#user-reset](https://sandbox.zibby.com/ng/#user-reset)

After resetting you should be ready to re-apply to Zibby with a fresh application.

**<aside class="success">
After resetting you should be ready to re-apply to Zibby with a fresh application.
</aside>** 

##Logging into the Retailer Dashboard

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**&#8226;** Visit [https://sandbox.zibby.com](https://sandbox.zibby.com)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**&#8226;** Click “Log in” in the upper right corner

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**&#8226;** Enter the username and password that was provided by Zibby Integration support. 

**<aside class="warning">
If you do not have these credentials, contact our integration team (integrations@zibby.com).
</aside>** 

*Keep in mind that during testing and development you’ll be logging into the Retailer Dashboard at sandbox.zibby.com, however, once live in production you will log in at:**

[https://www.zibby.com](https://www.zibby.com)

##Viewing Applications

**<aside class="notice">
Any time someone applies or creates a lease via Zibby this information gets saved in the Retailer Dashboard.
</aside>**

**You can view this information at any time via:**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**&#8226;**
Log into the Retailer Dashboard (see section “Logging into the sandbox Retailer Dashboard”).

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**&#8226;** Once logged in, click “View applications” in the top navigation.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**&#8226;** You will see a list of recent activity.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**&#8226;** You can filter this activity by different status, origination date in order to find the applications you’re looking for.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**&#8226;**Clicking into an application will show additional customer details (e.g. name and shipping information) as well as the items they purchased / cart contents.