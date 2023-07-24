---
title: STM Partners API v3 Reference

toc_footers:
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - images
  - faqs
  - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the STM Partners API v3
---

# Introduction

Welcome to the ShareTheMeal Partner API! “Together we can end hunger” - this has been ShareTheMeal’s claim since the app launched back in 2015.

With our in-house development team we are looking forward to supporting you during the integration process and beyond.

For technical questions, please feel free to reach out to [api-support@sharethemeal.org](mailto:api-support@sharethemeal.org)

# Server-to-server Authentication

The ShareTheMeal backend provides REST-based APIs to partners. Request and Response body payloads are in JSON format, as shown with examples below.

- Hostname of the partner TESTING backend is **sandbox.sharethemeal.org**.
- Hostname of the partner PRODUCTION backend is **together.sharethemeal.org**

Supported protocol is HTTPS only on standard port 443.

To authenticate requests, an HTTP header “Authorization: Bearer {YourAccessToken}” needs to be sent with each request. An appropriate user agent header should be specified on every request with the following format: 

```
User-Agent: <product> / <product-version> <comment>
```

# Simple test service

## GET /hello
This service should be the start of your implementation. It can help you verify that you are sending a valid Authorization header.

> Request

```
GET https://together.sharethemeal.org/api/v3/partner/hello
```

> Response 

```json
{
   "hello": "world"
}
```

# Campaigns

## GET /campaigns

**Obtain a list of active campaigns**

The response is localized and contains texts, image URLs and progress information of all the campaigns that users can currently donate to.

`GET https://together.sharethemeal.org/api/v3/partner/campaigns?locale={locale}`

### Request Parameters

Location | Parameter | Required | Description
--------- | --------- | ------- | -----------
Query | locale | No | Locale for the returned text information (e.g. “en-GB” or “ar-001”), defaults to “en-GB”.

> Request

```
https://together.sharethemeal.org/api/v3/partner/campaigns/locale=en-GB
```

> Response 

```json
{
  "campaigns": [{
    "campaignId": "syria",
    "progress": 0.613,
    "name": "Syria",
    "caption": "Share for children in Syria",
    "imageUrl": "https://images.contentful.com/z0x29akdg5eb/w8sOmPl9hQ8usmiwcQQ66/97f55cfd4bdc95f4d11d053f8c1e1231/Homecards_Syria2.png",
    "story": {
      "summary": "From the onset of the Syrian crisis in 2011, the World Food Programme has been on the frontlines doing whatever it takes to deliver food to millions of people who need it. As the crisis enters its eighth year, your help can make a difference in the lives of those who continue to suffer.",
      "details": "By sharing your meal, you can help to provide much-needed nutrition to children living in this conflict-ridden area. Families will receive staple foods such as rice, bulgur wheat, pulses and vegetable oil, to improve their nutrition in these difficult circumstances.\n<br>&nbsp;<br>\n<b>Together, we can ensure 2,500 children in rural Damascus will have food for 1 year."
    },
  },{
    "campaignId": "yemen",
    "progress": 0.21,
    "name": "Yemen",
    "caption": "Give life-saving aid in Yemen",
    "imageUrl": "https://images.ctfassets.net/z0x29akdg5eb/1Or8JB1ll3TRqZKckQH8hm/5d78bc05d75526e29149e23beeff2d7b/WFP_STM_yemen16_homecard.png",
    "story": {
      "summary": "Shared meals will help provide food baskets, cash transfers, school meals and nutrition support in Yemen.",
      "details": "Over 20 million people in Yemen are in need of humanitarian assistance. Ongoing conflict, economic collapse and a global rise in food and fuel prices have pushed the country into one of the world’s biggest hunger crises. As wheat is a staple ingredient in Yemen, the war in Ukraine has exacerbated the situation and the country continues to struggle with malnutrition, with 2.2 million children acutely malnourished.
      <br>The World Food Programme is on the ground continuing to serve 13 million people - one third of the population - with emergency assistance. This includes food baskets, vouchers or cash, prioritising areas with the highest rates of food insecurity.
      <br>WFP is having an impact on many children’s lives, providing daily nutritious school snacks - either date bars or high-energy biscuits - as well as its nutrition programme which supports almost 900,000 children under five."
    },
  }]
}
```

### Response payload

The endpoint returns an attribute `campaigns` which is a list of objects with the following attributes.

Attribute | Type | Description
--------- | ----------- | -----------
campaignId | string | The internal identifier for the campaign, can also be used in /donations requests
progress | float | Float value of completion towards campaign goal. 1.0 = 100%. Can be used to render a progress bar, for example
name |  string | Localized Short Name (“Syria”)
caption |  string | localized caption / topic of campaign (“Share for children in Syria”).
story.summary |  string | Short description text (usually 1-2 sentences)
story.details | string | Longer description text of campaign and goal
imageUrl | string | Square aspect ratio image representing the campaign, see Images API for info about requesting specific variants.

## GET /campaigns/{campaignId} 

**Request basic information about a campaign**

The response is localized and contains texts, image URLs and progress information, e.g. to render in-app or on a website.

`GET https://together.sharethemeal.org/api/v3/partner/campaigns/{campaignId}?locale={locale}`

### Request Parameters

Location | Parameter | Required | Description
--------- | --------- | ------- | -----------
Query | campaignId | Yes | Identifier of the campaign.
Query | locale | No | Locale for the returned text information (e.g. “en-GB” or “ar-001”), defaults to “en-GB”.

<aside class="success">
Mind that the campaignId sent as query parameter should be active. To obtain a list of the active campaigns, see endpoint above
</aside>

> Request

```
https://together.sharethemeal.org/api/v3/partner/campaigns/syria?locale=en-GB
```

> Response 

```json
{
  "campaign": {
    "campaignId": "syria",
    "progress": 0.613,
    "name": "Syria",
    "caption": "Share for children in Syria",
    "imageUrl": "https://images.contentful.com/z0x29akdg5eb/w8sOmPl9hQ8usmiwcQQ66/97f55cfd4bdc95f4d11d053f8c1e1231/Homecards_Syria2.png",
    "story": {
      "summary": "From the onset of the Syrian crisis in 2011, the World Food Programme has been on the frontlines doing whatever it takes to deliver food to millions of people who need it. As the crisis enters its eighth year, your help can make a difference in the lives of those who continue to suffer.",
      "details": "By sharing your meal, you can help to provide much-needed nutrition to children living in this conflict-ridden area. Families will receive staple foods such as rice, bulgur wheat, pulses and vegetable oil, to improve their nutrition in these difficult circumstances.\n<br>&nbsp;<br>\n<b>Together, we can ensure 2,500 children in rural Damascus will have food for 1 year."
    },
  }
}
```

### Response payload

Attribute | Type | Description
--------- | ----------- | -----------
campaignId | string | The internal identifier for the campaign, can also be used in /donations requests
progress | float | Float value of completion towards campaign goal. 1.0 = 100%. Can be used to render a progress bar, for example
name |  string | Localized Short Name (“Syria”)
caption |  string | localized caption / topic of campaign (“Share for children in Syria”).
story.summary |  string | Short description text (usually 1-2 sentences)
story.details | string | Longer description text of campaign and goal
imageUrl | string | Square aspect ratio image representing the campaign, see Images API for info about requesting specific variants.

# Donations

## POST /donations

**Inject a donation**

This service injects a donation into the ShareTheMeal reporting system. 

Injecting a donation adds the corresponding amount in the selected currency to the partners’ donation volume of that interval (e.g. month). Depending on the partner agreement, there is usually not a micropayment transaction (partner->WFP) happening with each transaction, but rather an accumulated transaction at the end of each interval.

The URL included in the response can be forwarded to the user. Clicking on that URL allows the user to “connect” the donated meals to its ShareTheMeal user account, becoming visible in his ShareTheMeal profile. Connecting works for both, existing ShareTheMeal users and users who are installing ShareTheMeal initially through that link (via a mechanism called “deferred deep linking”).

`POST https://together.sharethemeal.org/api/v3/partner/donations`

<aside class="warning">
Note: While in sandbox mode, the POST requests do not insert an actual donation entry, therefore the returned “connect” URL points to a non-existing donation.
</aside>

> Request 

```
POST https://together.sharethemeal.org/api/v3/partner/donations
```

```json
{ 
  "campaignId": "syria",
  "providerUserId": "d5487ac4-799e-4be4-88fd-721ca870a64a",
  "amount": 0.8,
  "currency": "USD",
  "locale": "en-GB"
}
```
<aside class="notice">
Note: Make sure to send the POST request as Content-Type: application/json; charset=utf-8
</aside>

### Request Parameters

Location | Parameter | Required | Description
--------- | --------- | ------- | -----------
body | campaignId | Yes | Campaign the donation should be attributed to (e.g. syria)
body | providerUserId | No | Pass on a user identifier string (e.g. use an identifier from your platform). This allows subsequent donations of the same partner user to be attributed to the same ShareTheMeal user. They can be linked to an existing or a new ShareTheMeal user, adding meals to that user’s profile. Note: Ideally use a more abstract or proprietary identifier and not an identifier like a Facebook ID (which could be interpreted as passing personal-identifiable data to ShareTheMeal)
body | amount | Yes | Float number indicating the amount donated 
body | currency | Yes | ISO 4217 currency code of donation currency, e.g. “USD” or “CAD”
body | locale | No | Locale of ThankYou response, falls back to en-GB.

> Response 

```json
{
  "success": true,
  "isShareTheMealUser": false,
  "transactionId": "3ceb6a39-3f5f-44dc-8d84-6214e423dce9",
  "connectUrl": "https://sharethemeal.org/connect/?id=p6f17e29e-f771-4e85-880e-51072906503a",
  "connectImageUrl": "https://images.contentful.com/z0x29akdg5eb/1k6QeS9SUuYyYo0iYGo8C0/e98f640c8de7421330280e124f579b64/button_GoToSTM_EN.png",
  "thankYouImageUrl": "https://images.contentful.com/z0x29akdg5eb/5wMZaq8RbOwQyYYSSMs84M/b5385dc759863e9a8c9d4c7e3a6da18a/Partner_ThankYou_Syria_Imad.jpg",
  "thankYouLogosUrl": null,
  "thankYouTextHtml": "<h3>Thank you!<br />Your meals are on the way.</h3>Your shared helps children like Amira in Syria. As the conflict enters its eighth year, you are making a difference in the lives of those who continue to suffer. The World Food Programme is on the frontlines doing whatever it takes to deliver food to millions of people who need it."
}
```

### Response payload

Attribute | Type | Description
--------- | ----------- | -----------
success | boolean | true when injection was successful
isShareTheMealUser | boolean | true when previously the user connected to a donation injection from the same providerUserId. In that case, the meals are automatically appearing in the user’s ShareTheMeal account.
transactionId | string | Unique per injected donation. Gets generated on ShareTheMeal’s side and can be stored as confirmation receipt on the partner’s side - or to delete the donation in case of an order cancellation.
connectUrl | string | URL to be shown in-app and/or which could be included in an email follow-up with the user. Allows user to connect to the injected meals with its ShareTheMeal user.
Users who don’t have the ShareTheMeal app installed yet are being redirected to the App Store / Google Play.
connectImageUrl | string | URL of graphical button image to connect to a previous donation. In case of Delivery Hero, we recommend to use the provided.
textLong | string | Longer description text of campaign and goal
imageUrl | string | Square aspect ratio image representing the campaign, see Images API for info about requesting specific variants graphical button or a rounded “Go to ShareTheMeal” button in your email style instead.
thankYouImageUrl | string | A specifically adapted beneficiary image including required branding elements. You can use this image in-app or in other communications to the user (e.g. email) as it is, ideally followed by the thank you story from thankYouTextHtml. See example template below about suggested image format parameters.
thankYouTextHtml | string | HTML story of one of the beneficiaries in the supported campaign. Includes a thank you header within `<h3>` tags.

### Testing error cases

In the Sandbox environment, the POST /donations endpoint supports a number of test cases which allow you to simulate possible error states. These can be included in the partner’s integration tests, for example.

The different errors can be triggered by providing specific values for the `amount` request parameter. 

Amount | Result
--------- | -----------
400 | Produces a missing parameters in request error. HTTP response code 400.
402 | This case can only occur with pre-paid partner accounts. In practice it will be triggered when the total of injected meals during an accounting period (usually: 1 month) exceed the number of meals donated beforehand for the account, and only there when the agreed soft limit is exceeded. HTTP response code 402.
404 | Produces entity not found error which, in contrast to general 500 below, can occur with invalid combinations of campaignId, currency and locale. HTTP response code 404
500 | Produces internal server error. HTTP response code 500.
Any other value |  Produces successfully injected donation with HTTP response code 201 and `success = true`` in the JSON response body

<aside class="notice">
Please note that these arbitrary values only trigger the errors in the sandbox environment.
</aside>

## DELETE /donations

**Delete a donation**

This service deletes a previously injected donation based on its transaction id. Can be used in case a user cancels the order in the partner’s system.

`DELETE https://together.sharethemeal.org/api/v3/partner/donations/{transactionId}`

> Request 

```
DELETE https://together.sharethemeal.org/api/v3/partner/donations/5ff9a434-e46a-4bac-a014-c7a452a19256
```

### Request Parameters

Location | Parameter | Required | Description
--------- | --------- | ------- | -----------
Path | transactionId | Yes | Identifier of the transaction to be deleted. Use value received in the POST /donations response

> Response 

This endpoint replies either with HTTP status code 204 (No Content) in case of successful deletion or 404 (Not Found) in case the transaction Id could not be found. We also return 404 when the transaction Id was previously deleted already.




