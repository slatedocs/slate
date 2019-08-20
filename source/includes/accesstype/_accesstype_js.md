# AccessType JS

## Readme 
AccessType JS is a javascript library provides out of the box features for publishers to integrate frontend browser applications with AccessType supported payment gateways and AccessType backed APIs.

### Usage

Load AccessTypeJS on the browser

`https://accesstype.com/frontend/accesstype.js?key=[YOUR_ACCOUNT_KEY]`

AccessType JS will now automatically load the payment provider scripts that are to be used for different payment options activated by your publisher. For e.g. Razorpay, Simpl JS.

For staging environments where you have configured the payment gateways to use test or sandbox modes, pass an  additional query parameter `env=sandbox` so that the script configures the payment provider scripts accordingly.

`https://accesstype.com/frontend/accesstype.js?key=[YOUR_ACCOUNT_KEY]&env=sandbox`

#### Set User

`setUser` checks the eligibility of the user for different payment providers and their link status. For e.g. does the user have a simpl account for the phone number. After completion it resolves the promise.

#### For logged in user

Once the user has logged in call with user name, emailAddress and phoneNumber. Phone number is be required for providers like Simpl.


```
AccessType.setUser({ 'emailAddress': emailAddress, 'mobileNumber':  mobileNumber}).then(() => ... )
```

#### For non logged in user

In case when the user is not logged in, `setUser` needs to be called with an additional field `isLoggedIn: false` .

```
AccessType.setUser({ 'emailAddress': emailAddress, 'mobileNumber':  mobileNumber, `isLoggedIn`: false}).then(() => ... )
```

#### Get Payment Options

`getPaymentOptions()` returns the available payment options for the user. For e.g. if user has a simpl account it returns that along.

```
AccessType.getPaymentOptions().then((paymentOptions) => ...)

where paymentOptions structure is {
  'simpl': {
    'action': 'link', //anyOf link, pay etc.
    'proceed': fn(args)
  },
  'razorpay': {
    'action': 'pay', //only pay
    'proceed': fn(args)
  },
  'paytm_auto_debit': {
    'action': 'link', //anyOf send_otp, link, pay
    'proceed': fn(args)
  }

}
```

The keys are the names of the payment providers that can be used of the payment.

The values are context objects related to that payment provider. For e.g. in the case of Simpl, there is a linking step that a new user will have to complete before they can use it.

In that case the value for simpl is `{'action': 'link', 'proceed': fn()  }`

The `proceed` is a callback function that takes user to next step.

The `pay` method accepts an object of the type SubscriptionParams as defined in types.js


#### Get Subscription Plans

Get 'standard' subscription plans

```AccessType.getSubscriptionPlans(): Array<SubscriptionPlan>```

#### Get Asset Subscription Plans

Get 'dynamic_asset' subscription plans for given asset

```
AccessType.getAssetPlans(asset: PurchaseableAsset): Array<SubscriptionPlan>
```

#### Purchase (optional)

You can at any point use `AccessType.purchase(..)` to independently make payments and purchase subscriptions.

### JUSPAY integration

Pre requisites:
* Set User and construction of SubscriptionParams [refer api.md](./API.md)
* Juspay dashboard needs to be set up with a redirect url
* In the cases, where user closes the browser after making the payment or Internet goes down for the user. We recoincile the subscriptions by communicating with the payment gateways with the help of webhooks. Go to Webhooks section in Juspay settings, Update the Authentication section with webhook username and webhook password in your Accesstype dashboard under payment gateways, Juspay section.
  Update the version to `2018-10-25`.
  Update the webhook url to webhook url present in Accesstype dashboard under payment gateways, Juspay section.

User Flow:
- User goes to story page or wherever Juspay has to be triggered. Then user clicks a button for example "Pay with Juspay".
- Then a pop up will appear with iFrame of Juspay loaded.
- Before the pop-up loads, Accesstype JS will create an event on the page where `Pay with Juspay` is present and will listen to the pop up.
- Once the User completes the payment, The iFrame will redirect to an URL which is specified by you in the Juspay dashboard.

You need to make sure that the below code block is present in the redirect URL

```
  (function() {
    var queryParams = window.location.search
    if( queryParams.includes('signature') &&
        queryParams.includes('signature_algorithm') &&
        queryParams.includes('order_id') &&
        queryParams.includes('status')
      ) {
      window.opener.postMessage(queryParams, "*");
    }
  })();
```

In the page, where AccessType is loaded, when the user clicks Pay with Juspay.

You can pass optional parameters to juspay payment gateway depending on the payment gateways you want juspay to render.

```
const subscriptionParams = {
  "type": "standard",
  "plan": {
    "id": "1",
    "price_cents": "29900",
    "price_currency": "INR",
    "title": "This is the stuff"
  },
  "payment": {
    "payment_type": "juspay",
    "amount_cents": "29900",
    "amount_currency": "INR"
  },
  "metadata": {
    "billing_address_first_name": "Juspay",
    "billing_address_last_name": "Technologies",
    "billing_address_line1": "Girija Building",
    "billing_address_line2": "Ganapathi Temple Road",
    "billing_address_line3": "8th Block, Koramangala",
    "billing_address_city": "Bengaluru",
    "billing_address_state": "Karnataka",
    "billing_address_country": "India",
    "billing_address_postal_code": "560095",
    "billing_address_phone": "9988775566",
    "billing_address_country_code_iso": "IND",
    "shipping_address_first_name": "Juspay",
    "shipping_address_last_name": "Technologies",
    "shipping_address_line1": "Girija Building",
    "shipping_address_line2": "Ganapathi Temple Road",
    "shipping_address_line3": "8th Block, Koramangala",
    "shipping_address_city": "Bengaluru",
    "shipping_address_state": "Karnataka",
    "shipping_address_postal_code": "560095",
    "shipping_address_phone": "9962881912",
    "shipping_address_country_code_iso": "IND",
    "shipping_address_country": "India"
  },
  "juspay": {
    "window_config": {
      // this value can be either "mobile" or "web", when not sent, web is considered to be default
      "type": "mobile"
    }
  }
}
AccessType.getPaymentOptions().then((paymentOptions) => paymentOptions.juspay.proceed(subscriptionParams
)).then((response) => {
  // add your additional functionality like call google analytics
  response.proceed(subscriptionParams).then((subscription) => {// returns a subscription }, (error) => {// handle error});
})

```

You can customize the juspay iframe popup by passing a few key value pairs object inside `window_config` under `juspay` key. The layout of the iframe content can be defined by passing `type` to the `window_config` object.

If the `type` is not passed to the `window_config`, by default, the type of iframe content will be `web`.

The whole `juspay` key is optional for the above `subscriptionParams` object.

### Razorpay Recurring Integration
For a plan that is set as recurring in Accesstype, `subscriptionParams.payment.payment_type` needs to be `razorpay_recurring`.

## Table of Contents

-   [AccessType][1]
    -   [version][2]
    -   [init][3]
        -   [Parameters][4]
    -   [setUser][5]
        -   [Parameters][6]
    -   [unsetUser][7]
    -   [getPaymentOptions][8]
        -   [Parameters][9]
    -   [getAssetPlans][10]
        -   [Parameters][11]
    -   [getSubscriptionPlans][12]
    -   [hasAccess][13]
        -   [Parameters][14]
    -   [isAssetAccessible][15]
        -   [Parameters][16]
    -   [pingbackAssetAccess][17]
        -   [Parameters][18]
    -   [purchase][19]
        -   [Parameters][20]
    -   [validateCoupon][21]
        -   [Parameters][22]
    -   [validateVoucher][23]
        -   [Parameters][24]
    -   [getSubscriptions][25]
    -   [updateSubscription][26]
        -   [Parameters][27]
    -   [getAssets][28]
    -   [getRewards][29]
    -   [resetWallets][30]
    -   [downloadInvoice][31]
        -   [Parameters][32]
    -   [isPrivateMode][33]
    -   [getReferralVoucher][34]
-   [DurationUnit][35]
-   [SubscriptionType][36]
-   [AssetType][37]
-   [PaymentType][38]
-   [Environment][39]
-   [User][40]
    -   [Properties][41]
-   [SubscriptionPlan][42]
    -   [Properties][43]
-   [SubscriptionAsset][44]
    -   [Properties][45]
-   [PaymentParams][46]
    -   [Properties][47]
-   [SubscriptionParams][48]
    -   [Properties][49]
-   [SubscriptionMetadata][50]
    -   [Properties][51]
-   [InitConfig][52]
    -   [Properties][53]
-   [PurchaseableAsset][54]
    -   [Properties][55]
-   [PaymentOption][56]
    -   [Properties][57]
-   [PaymentOptions][58]
-   [Error][59]
    -   [Properties][60]
-   [CouponValidationRequest][61]
    -   [Properties][62]
-   [VoucherValidationRequest][63]
    -   [Properties][64]
-   [DiscountDetails][65]
    -   [Properties][66]
-   [CouponValidationResponse][67]
-   [AssetAttributes][68]
    -   [Properties][69]
-   [Asset][70]
    -   [Properties][71]
-   [Meter][72]
    -   [Properties][73]
-   [AssetAccess][74]
    -   [Properties][75]

### AccessType

Available as a global variable on loading accesstype.js

### version

Returns version of the javascript

### init

Initializes AccessTypeJS with publisher specific configuration.
This is an internal method and will be invoked as part of script initialization in Access Type JS script itself

#### Parameters

-   `config` **[InitConfig][76]** 

### setUser

Set the user context immediately after user logs in.

#### Parameters

-   `user` **[User][77]** 

Returns **[Promise][78]&lt;any>** 

### unsetUser

Unset user context when user logs off

Returns **void** 

### getPaymentOptions

Returns payment options available for the given user for a given transaction amount
Payable amount has to be sent as transactionAmountCents, it's generally the price_cents of plan
discounted_price_cents from discount_details has to be sent as transactionAmountCents if a coupon code is applied

#### Parameters

-   `transactionAmountCents` **[number][79]?** 

Returns **[Promise][78]&lt;[PaymentOptions][80]>** 

### getAssetPlans

Returns subscription plans for given param

#### Parameters

-   `asset` **[PurchaseableAsset][81]** 

Returns **[Promise][78]&lt;[Array][82]&lt;[SubscriptionPlan][83]>>** 

### getSubscriptionPlans

Returns list of subscription plans across all subscription groups

Returns **[Promise][78]&lt;[Array][82]&lt;[SubscriptionPlan][83]>>** 

### hasAccess

Deprecated. Returns if user has access to story id

#### Parameters

-   `storyId` **[string][84]** 

Returns **[Promise][78]&lt;[boolean][85]>** 

### isAssetAccessible

Returns if the user has access to an asset or not, along with its reason. It makes use thinmint cookie for identifying the user for server side metering.

#### Parameters

-   `asset` **[PurchaseableAsset][81]** 
-   `disableMeter` **[boolean][85]?** 

Returns **[Promise][78]&lt;any>** 

### pingbackAssetAccess

To be used for updating the meter after asset is accessed. It makes use of thinmint cookie for identifying the user

#### Parameters

-   `asset` **[PurchaseableAsset][81]** 
-   `accessGrant` **any** 

Returns **[Promise][78]&lt;[AssetAccess][86]>** 

### purchase

Create subscription independently without using the callbacks in getPaymentOptions.
Useful for integrating with payment options that AccessTypeJS does not have first class support for

#### Parameters

-   `subscriptionParams` **[SubscriptionParams][87]** 

Returns **[Promise][78]&lt;any>** 

### validateCoupon

Validate coupon with plan

#### Parameters

-   `params` **[CouponValidationRequest][88]** 

Returns **[Promise][78]&lt;[CouponValidationResponse][89]>** 

### validateVoucher

Validate voucher with plan

#### Parameters

-   `params` **[VoucherValidationRequest][90]** 

Returns **[Promise][78]&lt;[VoucherValidationRequest][90]>** 

### getSubscriptions

Get all subscriptions for a user

Returns **[Promise][78]&lt;any>** 

### updateSubscription

update metadata for a subscription

#### Parameters

-   `subscriptionId` **[number][79]** 
-   `updateParams` **[SubscriptionMetadata][91]** 

Returns **[Promise][78]&lt;any>** 

### getAssets

Get all assets accessible to a user

Returns **[Promise][78]&lt;any>** 

### getRewards

Get all rewards for a user

Returns **[Promise][78]&lt;any>** 

### resetWallets

Reset user wallets
For e.g. when user has changed their linked mobile number

Returns **[Promise][78]&lt;any>** 

### downloadInvoice

Download Invoice for a subscription

#### Parameters

-   `subscriptionId` **[number][79]** 
-   `invoiceId` **[number][79]** 

Returns **[Promise][78]&lt;any>** 

### isPrivateMode

Check if browser is in private mode

### getReferralVoucher

Get Referral code for a user

Returns **[Promise][78]&lt;any>** 

## DurationUnit

Represents duration unit

Type: (`"months"` \| `"weeks"` \| `"years"`)

## SubscriptionType

Represents valid subscription types

Type: (`"standard"` \| `"dynamic_asset"`)

## AssetType

Represents supported asset type

Type: `"story"`

## PaymentType

Represents supported payment types

Type: (`"razorpay"` \| `"simpl"` \| `"paytm_auto_debit"`)

## Environment

Represents environment

Type: (`"production"` \| `"sandbox"`)

## User

Represents a user

Type: {name: [string][84], emailAddress: [string][84], mobileNumber: [string][84], isLoggedIn: [boolean][85]?}

### Properties

-   `name` **[string][84]** 
-   `emailAddress` **[string][84]** 
-   `mobileNumber` **[string][84]** 
-   `isLoggedIn` **[boolean][85]?** 

## SubscriptionPlan

Represents a subscription plan

Type: {id: [string][84], title: [string][84]?, description: [string][84]?, price_cents: [number][79], price_currency: [string][84], duration_length: [number][79], duration_unit: [DurationUnit][92]}

### Properties

-   `id` **[string][84]** 
-   `title` **[string][84]?** 
-   `description` **[string][84]?** 
-   `price_cents` **[number][79]** 
-   `price_currency` **[string][84]** 
-   `duration_length` **[number][79]** 
-   `duration_unit` **[DurationUnit][92]** 

## SubscriptionAsset

Represents an Asset

Type: {id: [string][84], title: [string][84], slug: [string][84]}

### Properties

-   `id` **[string][84]** 
-   `title` **[string][84]** 
-   `slug` **[string][84]** 

## PaymentParams

Represents payment request params

Type: {payment_type: [PaymentType][93], amount_cents: [string][84], amount_currency: [string][84]}

### Properties

-   `payment_type` **[PaymentType][93]** 
-   `amount_cents` **[string][84]** 
-   `amount_currency` **[string][84]** 

## SubscriptionParams

Represents SubscriptionParams which encapsulates the parameters required to make a subscription

Type: {type: [SubscriptionType][94], plan: [SubscriptionPlan][83], payment: [PaymentParams][95], assets: [Array][82]&lt;[SubscriptionAsset][96]>, coupon_code: [string][84]?}

### Properties

-   `type` **[SubscriptionType][94]** 
-   `plan` **[SubscriptionPlan][83]** 
-   `payment` **[PaymentParams][95]** 
-   `assets` **[Array][82]&lt;[SubscriptionAsset][96]>** 
-   `coupon_code` **[string][84]?** 

## SubscriptionMetadata

Represents metadata fields required to be updated

Type: {metadata: [Object][97]}

### Properties

-   `metadata` **[Object][97]** 

## InitConfig

Represents InitConfig which encapsulates initialization params.
Used internally only.

Type: {accesstype_host: [string][84], account_key: [string][84], account_name: [string][84], payment_providers: {}, env: [Environment][98]}

### Properties

-   `accesstype_host` **[string][84]** 
-   `account_key` **[string][84]** 
-   `account_name` **[string][84]** 
-   `payment_providers` **{}** 
-   `env` **[Environment][98]** 

## PurchaseableAsset

Represent a purchaseable asset

Type: {id: [string][84], type: [AssetType][99]}

### Properties

-   `id` **[string][84]** 
-   `type` **[AssetType][99]** 

## PaymentOption

Represents a payment option

For simpl, possible values for action = 'link' | 'pay'

For razorpay, possible values for action = 'pay'

When action is 'pay', proceed(params: SubscriptionParams)

When action is 'link', proceed()

Type: {action: [string][84], proceed: function (): [Promise][78]&lt;any>}

### Properties

-   `action` **[string][84]** 
-   `proceed` **function (): [Promise][78]&lt;any>** 

## PaymentOptions

Represents payment options for current user with this publisher

Type: {}

## Error

Represents error response

Type: {code: [string][84], message: [string][84]}

### Properties

-   `code` **[string][84]** 
-   `message` **[string][84]** 

## CouponValidationRequest

Represents a coupon validation request

Type: {subscriptionPlanId: [string][84], couponCode: [string][84]}

### Properties

-   `subscriptionPlanId` **[string][84]** 
-   `couponCode` **[string][84]** 

## VoucherValidationRequest

Represents a voucher validation request

Type: {subscriptionPlanId: [string][84], voucher: [string][84]}

### Properties

-   `subscriptionPlanId` **[string][84]** 
-   `voucher` **[string][84]** 

## DiscountDetails

Represents coupon discount

Type: {code: [string][84], discount_type: [string][84], title: [string][84], value: [number][79], discounted_price_cents: [number][79], price_cents: [number][79], price_currency: [string][84]}

### Properties

-   `code` **[string][84]** 
-   `discount_type` **[string][84]** 
-   `title` **[string][84]** 
-   `value` **[number][79]** 
-   `discounted_price_cents` **[number][79]** 
-   `price_cents` **[number][79]** 
-   `price_currency` **[string][84]** 

## CouponValidationResponse

Represents coupon validation response

## AssetAttributes

Represents Asset Attributes (e.g. story attributes)

Type: {accessLevel: AccessLevel, accessLevelValue: [number][79]?}

### Properties

-   `accessLevel` **AccessLevel** 
-   `accessLevelValue` **[number][79]?** 

## Asset

Represents an Asset

Type: {id: [string][84], type: [AssetType][99], attributes: [AssetAttributes][100]}

### Properties

-   `id` **[string][84]** 
-   `type` **[AssetType][99]** 
-   `attributes` **[AssetAttributes][100]** 

## Meter

Represents paywall meter counts

Type: {consumed: [number][79], total: [number][79]}

### Properties

-   `consumed` **[number][79]** 
-   `total` **[number][79]** 

## AssetAccess

Represents access of an Asset

Type: {hasAccess: [boolean][85], accessType: AccessTypeEnum?, meter: [Meter][101]?}

### Properties

-   `hasAccess` **[boolean][85]** 
-   `accessType` **AccessTypeEnum?** 
-   `meter` **[Meter][101]?** 

[1]: #accesstype

[2]: #version

[3]: #init

[4]: #parameters

[5]: #setuser

[6]: #parameters-1

[7]: #unsetuser

[8]: #getpaymentoptions

[9]: #parameters-2

[10]: #getassetplans

[11]: #parameters-3

[12]: #getsubscriptionplans

[13]: #hasaccess

[14]: #parameters-4

[15]: #isassetaccessible

[16]: #parameters-5

[17]: #pingbackassetaccess

[18]: #parameters-6

[19]: #purchase

[20]: #parameters-7

[21]: #validatecoupon

[22]: #parameters-8

[23]: #validatevoucher

[24]: #parameters-9

[25]: #getsubscriptions

[26]: #updatesubscription

[27]: #parameters-10

[28]: #getassets

[29]: #getrewards

[30]: #resetwallets

[31]: #downloadinvoice

[32]: #parameters-11

[33]: #isprivatemode

[34]: #getreferralvoucher

[35]: #durationunit

[36]: #subscriptiontype

[37]: #assettype

[38]: #paymenttype

[39]: #environment

[40]: #user

[41]: #properties

[42]: #subscriptionplan

[43]: #properties-1

[44]: #subscriptionasset

[45]: #properties-2

[46]: #paymentparams

[47]: #properties-3

[48]: #subscriptionparams

[49]: #properties-4

[50]: #subscriptionmetadata

[51]: #properties-5

[52]: #initconfig

[53]: #properties-6

[54]: #purchaseableasset

[55]: #properties-7

[56]: #paymentoption

[57]: #properties-8

[58]: #paymentoptions

[59]: #error

[60]: #properties-9

[61]: #couponvalidationrequest

[62]: #properties-10

[63]: #vouchervalidationrequest

[64]: #properties-11

[65]: #discountdetails

[66]: #properties-12

[67]: #couponvalidationresponse

[68]: #assetattributes

[69]: #properties-13

[70]: #asset

[71]: #properties-14

[72]: #meter

[73]: #properties-15

[74]: #assetaccess

[75]: #properties-16

[76]: #initconfig

[77]: #user

[78]: https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise

[79]: https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Number

[80]: #paymentoptions

[81]: #purchaseableasset

[82]: https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Array

[83]: #subscriptionplan

[84]: https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String

[85]: https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Boolean

[86]: #assetaccess

[87]: #subscriptionparams

[88]: #couponvalidationrequest

[89]: #couponvalidationresponse

[90]: #vouchervalidationrequest

[91]: #subscriptionmetadata

[92]: #durationunit

[93]: #paymenttype

[94]: #subscriptiontype

[95]: #paymentparams

[96]: #subscriptionasset

[97]: https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Object

[98]: #environment

[99]: #assettype

[100]: #assetattributes

[101]: #meter