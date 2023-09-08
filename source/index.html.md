---
title: STM Partners API v3 Reference

toc_footers:
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - images
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
    "name": "Syria",
    "caption": "Share for children in Syria",
    "imageUrl": "https://images.contentful.com/z0x29akdg5eb/w8sOmPl9hQ8usmiwcQQ66/97f55cfd4bdc95f4d11d053f8c1e1231/Homecards_Syria2.png",
    "story": {
      "summary": "From the onset of the Syrian crisis in 2011, the World Food Programme has been on the frontlines doing whatever it takes to deliver food to millions of people who need it. As the crisis enters its eighth year, your help can make a difference in the lives of those who continue to suffer.",
      "details": "By sharing your meal, you can help to provide much-needed nutrition to children living in this conflict-ridden area. Families will receive staple foods such as rice, bulgur wheat, pulses and vegetable oil, to improve their nutrition in these difficult circumstances.\n<br>&nbsp;<br>\n<b>Together, we can ensure 2,500 children in rural Damascus will have food for 1 year."
    },
  },{
    "campaignId": "yemen",
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

# Donations

## POST /donations

**Inject a donation**

This service injects a donation into the ShareTheMeal reporting system. 

Injecting a donation adds the corresponding amount in the selected currency to the partners’ donation volume of that interval (e.g. month). Depending on the partner agreement, there is usually not a micropayment transaction (partner -> WFP) happening with each transaction, but rather an accumulated transaction at the end of each interval.

`POST https://together.sharethemeal.org/api/v3/partner/donations`

> Request 

```
POST https://together.sharethemeal.org/api/v3/partner/donations
```

```json
{ 
  "campaignId": "syria",
  "amount": 0.8,
  "currency": "USD",
}
```
<aside class="notice">
Note: Make sure to send the POST request as Content-Type: application/json; charset=utf-8
</aside>

### Request Parameters

Location | Parameter | Required | Description
--------- | --------- | ------- | -----------
body | campaignId | Yes | Campaign the donation should be attributed to (e.g. syria)
body | amount | Yes | Float number indicating the amount donated 
body | currency | Yes | ISO 4217 currency code of donation currency, e.g. “USD” or “CAD”

> Response 

```json
{
  "transactionId": "3ceb6a39-3f5f-44dc-8d84-6214e423dce9",
}
```

### Response payload

Attribute | Type | Description
--------- | ----------- | -----------
transactionId | string | Unique per injected donation. Gets generated on ShareTheMeal’s side and can be stored as confirmation receipt on the partner’s side - or to delete the donation in case of an order cancellation.

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

This endpoint replies either with HTTP status code 204 (No Content) in case of successful deletion or 404 (Not Found) in case the transaction id could not be found. We also return 404 when the transaction was previously deleted already.




