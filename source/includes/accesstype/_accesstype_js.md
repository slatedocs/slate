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

### Table of Contents

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
    -   [cancelSubscription][28]
        -   [Parameters][29]
    -   [getAssets][30]
    -   [getRewards][31]
    -   [resetWallets][32]
    -   [downloadInvoice][33]
        -   [Parameters][34]
    -   [isPrivateMode][35]
    -   [getReferralVoucher][36]
-   [DurationUnit][37]
-   [SubscriptionType][38]
-   [AssetType][39]
-   [PaymentType][40]
-   [Environment][41]
-   [User][42]
    -   [Properties][43]
-   [SubscriptionPlan][44]
    -   [Properties][45]
-   [SubscriptionAsset][46]
    -   [Properties][47]
-   [PaymentParams][48]
    -   [Properties][49]
-   [SubscriptionParams][50]
    -   [Properties][51]
-   [SubscriptionMetadata][52]
    -   [Properties][53]
-   [InitConfig][54]
    -   [Properties][55]
-   [PurchaseableAsset][56]
    -   [Properties][57]
-   [PaymentOption][58]
    -   [Properties][59]
-   [PaymentOptions][60]
-   [Error][61]
    -   [Properties][62]
-   [CouponValidationRequest][63]
    -   [Properties][64]
-   [VoucherValidationRequest][65]
    -   [Properties][66]
-   [DiscountDetails][67]
    -   [Properties][68]
-   [CouponValidationResponse][69]
-   [AssetAttributes][70]
    -   [Properties][71]
-   [Asset][72]
    -   [Properties][73]
-   [Meter][74]
    -   [Properties][75]
-   [AssetAccess][76]
    -   [Properties][77]

## AccessType

Available as a global variable on loading accesstype.js

### version

Returns version of the javascript

### init

Initializes AccessTypeJS with publisher specific configuration.
This is an internal method and will be invoked as part of script initialization in Access Type JS script itself

#### Parameters

-   `config` **[InitConfig][78]** 

### setUser

Set the user context immediately after user logs in.

#### Parameters

-   `user` **[User][79]** 

Returns **[Promise][80]&lt;any>** 

### unsetUser

Unset user context when user logs off

Returns **void** 

### getPaymentOptions

Returns payment options available for the given user for a given transaction amount
Payable amount has to be sent as transactionAmountCents, it's generally the price_cents of plan
discounted_price_cents from discount_details has to be sent as transactionAmountCents if a coupon code is applied.
subscriptionPlan object can be sent as second parameter to return only the payment gateways the plan supports. Both parameters
are optional.

#### Parameters

-   `transactionAmountCents` **[number][81]?** 
-   `subscriptionPlan` **[SubscriptionPlan][82]?** 

Returns **[Promise][80]&lt;[PaymentOptions][83]>** 

### getAssetPlans

Returns subscription plans for given param

#### Parameters

-   `asset` **[PurchaseableAsset][84]** 

Returns **[Promise][80]&lt;[Array][85]&lt;[SubscriptionPlan][82]>>** 

### getSubscriptionPlans

Returns list of subscription plans across all subscription groups

Returns **[Promise][80]&lt;[Array][85]&lt;[SubscriptionPlan][82]>>** 

### hasAccess

Deprecated. Returns if user has access to story id

#### Parameters

-   `storyId` **[string][86]** 

Returns **[Promise][80]&lt;[boolean][87]>** 

### isAssetAccessible

Returns if the user has access to an asset or not, along with its reason. It makes use thinmint cookie for identifying the user for server side metering.

#### Parameters

-   `asset` **[PurchaseableAsset][84]** 
-   `disableMeter` **[boolean][87]?** 

Returns **[Promise][80]&lt;any>** 

### pingbackAssetAccess

To be used for updating the meter after asset is accessed. It makes use of thinmint cookie for identifying the user

#### Parameters

-   `asset` **[PurchaseableAsset][84]** 
-   `accessGrant` **any** 

Returns **[Promise][80]&lt;[AssetAccess][88]>** 

### purchase

Create subscription independently without using the callbacks in getPaymentOptions.
Useful for integrating with payment options that AccessTypeJS does not have first class support for

#### Parameters

-   `subscriptionParams` **[SubscriptionParams][89]** 

Returns **[Promise][80]&lt;any>** 

### validateCoupon

Validate coupon with plan

#### Parameters

-   `params` **[CouponValidationRequest][90]** 

Returns **[Promise][80]&lt;[CouponValidationResponse][91]>** 

### validateVoucher

Validate voucher with plan

#### Parameters

-   `params` **[VoucherValidationRequest][92]** 

Returns **[Promise][80]&lt;[VoucherValidationRequest][92]>** 

### getSubscriptions

Get all subscriptions for a user

Returns **[Promise][80]&lt;any>** 

### updateSubscription

update metadata for a subscription

#### Parameters

-   `subscriptionId` **[number][81]** 
-   `updateParams` **[SubscriptionMetadata][93]** 

Returns **[Promise][80]&lt;any>** 

### cancelSubscription

cancel a subscription

#### Parameters

-   `subscriptionId` **[number][81]** 

Returns **[Promise][80]&lt;any>** 

### getAssets

Get all assets accessible to a user

Returns **[Promise][80]&lt;any>** 

### getRewards

Get all rewards for a user

Returns **[Promise][80]&lt;any>** 

### resetWallets

Reset user wallets
For e.g. when user has changed their linked mobile number

Returns **[Promise][80]&lt;any>** 

### downloadInvoice

Download Invoice for a subscription

#### Parameters

-   `subscriptionId` **[number][81]** 
-   `invoiceId` **[number][81]** 

Returns **[Promise][80]&lt;any>** 

### isPrivateMode

Check if browser is in private mode

### getReferralVoucher

Get Referral code for a user

Returns **[Promise][80]&lt;any>** 

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

Type: (`"razorpay"` \| `"simpl"` \| `"paytm_auto_debit"` \| `"juspay"` \| `"stripe"`)

## Environment

Represents environment

Type: (`"production"` \| `"sandbox"`)

## User

Represents a user

Type: {name: [string][86], emailAddress: [string][86], mobileNumber: [string][86], isLoggedIn: [boolean][87]?}

### Properties

-   `name` **[string][86]** 
-   `emailAddress` **[string][86]** 
-   `mobileNumber` **[string][86]** 
-   `isLoggedIn` **[boolean][87]?** 

## SubscriptionPlan

Represents a subscription plan

Type: {id: [string][86], title: [string][86]?, description: [string][86]?, price_cents: [number][81], price_currency: [string][86], duration_length: [number][81], duration_unit: [DurationUnit][94], supported_payment_providers: [Array][85]&lt;[string][86]>?}

### Properties

-   `id` **[string][86]** 
-   `title` **[string][86]?** 
-   `description` **[string][86]?** 
-   `price_cents` **[number][81]** 
-   `price_currency` **[string][86]** 
-   `duration_length` **[number][81]** 
-   `duration_unit` **[DurationUnit][94]** 
-   `supported_payment_providers` **[Array][85]&lt;[string][86]>?** 

## SubscriptionAsset

Represents an Asset

Type: {id: [string][86], title: [string][86], slug: [string][86]}

### Properties

-   `id` **[string][86]** 
-   `title` **[string][86]** 
-   `slug` **[string][86]** 

## PaymentParams

Represents payment request params

Type: {payment_type: [PaymentType][95], amount_cents: [string][86], amount_currency: [string][86]}

### Properties

-   `payment_type` **[PaymentType][95]** 
-   `amount_cents` **[string][86]** 
-   `amount_currency` **[string][86]** 

## SubscriptionParams

Represents SubscriptionParams which encapsulates the parameters required to make a subscription

Type: {type: [SubscriptionType][96], plan: [SubscriptionPlan][82], payment: [PaymentParams][97], assets: [Array][85]&lt;[SubscriptionAsset][98]>, coupon_code: [string][86]?, options: [Object][99]?}

### Properties

-   `type` **[SubscriptionType][96]** 
-   `plan` **[SubscriptionPlan][82]** 
-   `payment` **[PaymentParams][97]** 
-   `assets` **[Array][85]&lt;[SubscriptionAsset][98]>** 
-   `coupon_code` **[string][86]?** 
-   `options` **[Object][99]?** 

## SubscriptionMetadata

Represents metadata fields required to be updated

Type: {metadata: [Object][99]}

### Properties

-   `metadata` **[Object][99]** 

## InitConfig

Represents InitConfig which encapsulates initialization params.
Used internally only.

Type: {accesstype_host: [string][86], account_key: [string][86], account_name: [string][86], payment_providers: {}, env: [Environment][100]}

### Properties

-   `accesstype_host` **[string][86]** 
-   `account_key` **[string][86]** 
-   `account_name` **[string][86]** 
-   `payment_providers` **{}** 
-   `env` **[Environment][100]** 

## PurchaseableAsset

Represent a purchaseable asset

Type: {id: [string][86], type: [AssetType][101]}

### Properties

-   `id` **[string][86]** 
-   `type` **[AssetType][101]** 

## PaymentOption

Represents a payment option

For simpl, possible values for action = 'link' | 'pay'

For razorpay, possible values for action = 'pay'

When action is 'pay', proceed(params: SubscriptionParams)

When action is 'link', proceed()

Type: {action: [string][86], proceed: function (): [Promise][80]&lt;any>}

### Properties

-   `action` **[string][86]** 
-   `proceed` **function (): [Promise][80]&lt;any>** 

## PaymentOptions

Represents payment options for current user with this publisher

Type: {}

## Error

Represents error response

Type: {code: [string][86], message: [string][86]}

### Properties

-   `code` **[string][86]** 
-   `message` **[string][86]** 

## CouponValidationRequest

Represents a coupon validation request

Type: {subscriptionPlanId: [string][86], couponCode: [string][86]}

### Properties

-   `subscriptionPlanId` **[string][86]** 
-   `couponCode` **[string][86]** 

## VoucherValidationRequest

Represents a voucher validation request

Type: {subscriptionPlanId: [string][86], voucher: [string][86]}

### Properties

-   `subscriptionPlanId` **[string][86]** 
-   `voucher` **[string][86]** 

## DiscountDetails

Represents coupon discount

Type: {code: [string][86], discount_type: [string][86], title: [string][86], value: [number][81], discounted_price_cents: [number][81], price_cents: [number][81], price_currency: [string][86]}

### Properties

-   `code` **[string][86]** 
-   `discount_type` **[string][86]** 
-   `title` **[string][86]** 
-   `value` **[number][81]** 
-   `discounted_price_cents` **[number][81]** 
-   `price_cents` **[number][81]** 
-   `price_currency` **[string][86]** 

## CouponValidationResponse

Represents coupon validation response

## AssetAttributes

Represents Asset Attributes (e.g. story attributes)

Type: {accessLevel: AccessLevel, accessLevelValue: [number][81]?}

### Properties

-   `accessLevel` **AccessLevel** 
-   `accessLevelValue` **[number][81]?** 

## Asset

Represents an Asset

Type: {id: [string][86], type: [AssetType][101], attributes: [AssetAttributes][102]}

### Properties

-   `id` **[string][86]** 
-   `type` **[AssetType][101]** 
-   `attributes` **[AssetAttributes][102]** 

## Meter

Represents paywall meter counts

Type: {consumed: [number][81], total: [number][81]}

### Properties

-   `consumed` **[number][81]** 
-   `total` **[number][81]** 

## AssetAccess

Represents access of an Asset

Type: {hasAccess: [boolean][87], accessType: AccessTypeEnum?, meter: [Meter][103]?}

### Properties

-   `hasAccess` **[boolean][87]** 
-   `accessType` **AccessTypeEnum?** 
-   `meter` **[Meter][103]?** 

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

[28]: #cancelsubscription

[29]: #parameters-11

[30]: #getassets

[31]: #getrewards

[32]: #resetwallets

[33]: #downloadinvoice

[34]: #parameters-12

[35]: #isprivatemode

[36]: #getreferralvoucher

[37]: #durationunit

[38]: #subscriptiontype

[39]: #assettype

[40]: #paymenttype

[41]: #environment

[42]: #user

[43]: #properties

[44]: #subscriptionplan

[45]: #properties-1

[46]: #subscriptionasset

[47]: #properties-2

[48]: #paymentparams

[49]: #properties-3

[50]: #subscriptionparams

[51]: #properties-4

[52]: #subscriptionmetadata

[53]: #properties-5

[54]: #initconfig

[55]: #properties-6

[56]: #purchaseableasset

[57]: #properties-7

[58]: #paymentoption

[59]: #properties-8

[60]: #paymentoptions

[61]: #error

[62]: #properties-9

[63]: #couponvalidationrequest

[64]: #properties-10

[65]: #vouchervalidationrequest

[66]: #properties-11

[67]: #discountdetails

[68]: #properties-12

[69]: #couponvalidationresponse

[70]: #assetattributes

[71]: #properties-13

[72]: #asset

[73]: #properties-14

[74]: #meter

[75]: #properties-15

[76]: #assetaccess

[77]: #properties-16

[78]: #initconfig

[79]: #user

[80]: https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise

[81]: https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Number

[82]: #subscriptionplan

[83]: #paymentoptions

[84]: #purchaseableasset

[85]: https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Array

[86]: https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String

[87]: https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Boolean

[88]: #assetaccess

[89]: #subscriptionparams

[90]: #couponvalidationrequest

[91]: #couponvalidationresponse

[92]: #vouchervalidationrequest

[93]: #subscriptionmetadata

[94]: #durationunit

[95]: #paymenttype

[96]: #subscriptiontype

[97]: #paymentparams

[98]: #subscriptionasset

[99]: https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Object

[100]: #environment

[101]: #assettype

[102]: #assetattributes

[103]: #meter
