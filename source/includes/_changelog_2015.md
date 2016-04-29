# 2015

## November

### New block/retry schedule for unsuccessful webhook calls

To maximize the rapid delivery of successful webhooks, Bigcommerce has imposed a new 60-second block on webhooks reporting unsuccessful callbacks. The new mechanism works like this:

* Whenever a webhook gives a non-`**2_xx_**` response, or times out, the app will be blocked for 60 seconds.
* Webhooks created during that 60-second block will be queued up to send on the next scheduled retry attempt after the block expires, so that webhooks are not lost.
* The first retry will now occur 60 seconds after the most recent failure. (The dispatcher will no longer attempt retries immediately, nor at 30 seconds, as Bigcommerce previously stated.)
* Remaining retries will occur on the previously published schedule, up to 48 hours after the first unsuccessful callback.

For details, please see [this updated Dev Portal article][1].

[1]: /api#webhooks-getting-started

## July

### Manage users' logout and session timeouts

A new callback function allows your Single-Click Apps to detect, and respond to, a user's logout or timeout from the Bigcommerce control panel.

To use this function, first include Bigcommerce's JavaScript SDK in your Single-Click App. You do so by adding this script tag:

    http://www.google-analytics.com/ga.js"> src="">https://cdn.bigcommerce.com/jssdk/bc-sdk.js">

Next, when you initialize the SDK, include the logout callback function:

```
    Bigcommerce.init({
          onLogout: callback
    });
```

The callback function will run when the user explicitly logs out of the Bigcommerce control panel, or is automatically timed out. Your app can then respond to this logout. [Read more.][2]

[2]: /api#using-oauth-intro

## April

### Limits on categories, SKUs, option values, and brands

To maximize platform availability and system performance, Bigcommerce has imposed the following limits.

* Maximum of 16,000 categories per store
* Maximum of 30,000 brands per store
* Maximum of 500 SKUs per product
* Products cannot belong to more than 1,000 categories
* Products cannot have more than seven parent categories
* Product options cannot have more than 250 values

Requests to the Stores API that exceed these limits will receive a 403 response.  

### Automatic sales tax document submissions for Avalara Premium stores

#### POST or PUT Orders on stores with Avalara Premium causes tax documents to be submitted

If a store has subscribed to Avalara Premium, Bigcommerce automatically submits tax documents to Avalara when the order achieves a paid status. The following statuses are of the paid type:

* `**Shipped**`
* `**Partially Shipped**`
* `**Awaiting Pickup**`
* `**Awaiting Shipment**`
* `**Completed**`
* `**Awaiting Fulfillment**`

Bigcommerce considers all statuses other than the above to be of the unpaid type, except `**Refunded**`, which is considered neither paid or unpaid.

Orders created using the `**POST**` method that include a status of the paid type result in the submission of tax documents to Avalara. The behavior becomes more complex with order updates. The following table details the behavior for `**PUT**` operations.

| Existing Status | Status Passed | Resultant Status | Avalara tax document submission |
| ---| --- | --- | ---|
| Any | None | `**Pending**` | None |
| Paid or `**Refunded**` | Paid | Paid | None |
| Unpaid or `**Refunded**` | Unpaid | Unpaid | None |
| Paid or `**Refunded**` | Unpaid | Unpaid | Tax document voided |
| Unpaid or `**Refunded**` | Paid | Paid | Tax document submitted |

PRO TIP: Abbreviated state names in shipping and billing addresses will prevent tax documents from being submitted to Avalara. Spell state names out in full to ensure successful Avalara tax document submissions. For example, supplying `**CA**` as a state name results in no tax document submission. Supplying `**California**` as a state name results in a successful submission.

#### POST and PUT Orders now results in better order tax object values

When values for `**price_inc_tax**` and `**price_ex_tax**` are passed, a value of `**API Tax Override**` is written to the `**name**` field of the order tax object. In addition, the `**base_price**` value is no longer derived from the product object and any rulesets defined. Instead, Bigcommerce writes either the `**price_inc_tax**` and `**price_ex_tax**` value to `**base_price**`, according to the store settings.

When the product already exists in the store and no values for `**price_inc_tax**` and `**price_ex_tax**` are passed, an order tax object will be created with a `**base_price**` value based on the product's price.

#### DELETE Orders now fails if automatic tax enabled on the store

Attempts to `**DELETE**` an order on a store with automatic tax enabled now return a `**405 Method not allowed**`.  

## March

### New fields to support deeper Avalara integrations

Bigcommerce now allows merchants to further increase the automation and accuracy of their sales tax calculations by upgrading to AvaTax Pro. We have extended the Stores API to include these new features and maintain parity with the Control Panel GUI. The extension consists of two new fields in the `**customer**` and `**product**` objects that accept AvaTax codes. We recommend using these codes to identify customers, products, and services that fall into special sales tax categories whenever possible.

Stores that do not have the AvaTax Pro subscription will store the codes but the codes will not impact their sales tax calculations. Please note that you should only pass one code per customer or product and the codes are case sensitive.

#### Identify customers exempt from sales tax

The [**customer**][3] object includes a new `**tax_exempt_category**` field, allowing you to identify customers that are either fully or partially exempt from paying sales tax. This includes employees of the federal government, Native Americans, foreign diplomats, and more. Review the [Avalara documentation][4] to find out more about these categories and for the list of codes.

#### Increase sales tax accuracy with product and service codes

The [**product**][5] object includes a new `**avalara_product_tax_code**` field that accepts a wide range of product and service codes. Refer to the "AvaTax System tax codes" section of the [Avalara documentation][6] for more information and the full list of codes.

[3]: /api/v2#customer
[4]: http://developer.avalara.com/api-docs/designing-your-integration/handling-tax-exempt-customers
[5]: /api/v2#product
[6]: https://help.avalara.com/000_AvaTax_Calc/000AvaTaxCalc_User_Guide/040_Managing_Tax_Profiles/050_Tax_Codes/001_What_is_a_Tax_Code

## February

### New Test Payment Gateway

Developers using the `**orders**` resource may find the new Test Payment Gateway useful while developing and testing their apps. The Test Payment Gateway can be enabled from inside of your sandbox store. It allows a successful transaction to be processed from start to finish. To create or update an order to use the Test Payment Gateway, pass `**Test Payment Gateway**` as the value for `**payment_method**` in the `**orders**` object.

Further details can be reviewed in the [orders][7] object documentation.

[7]: /api/v2#order