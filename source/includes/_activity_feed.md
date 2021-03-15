# Activity Feed

## Activities

LossExpress provides a simple way to view events that have taken place within our system, relevant to an organization’s claims. Our Activity Feed provides access to all scoped activities while allowing for a large variety of filtering options to suit any organization’s needs. One of our core tenants at LossExpress is transparency, so you may find that we provide access to _too many_ activities. Feel free to use only what’s important to your organization!

As a general rule, all Activity objects include the following keys:

Key | Description
--- | -----------
createdAt | GMT timestamp marking when the Activity occured in our system
claimId | The LossExpress UUID given to the claim the Activity occurred on
type | A string containing one of the available Activity Types
claimNumber | The claim number entered for the claim the Activity occurred on
data | An object containing relevant information for the Activity
hash | A SHA256 hash uniquely identifying the activity type

## Fetch Activities
> This route returns a paginated set of results that looks like this:

```json
{
  "requestUrl": "https://exapi.lossexpress.com/activities?createdBefore=2021-01-08T22:03:09.598Z",
  "results": [
    ...array of activity objects
  ],
  "pagination": {
    "pageSize": 100,
    "page": 0,
    "totalPages": 3,
    "totalResults": 296
  }
}
```
> Note that the result will return a `requestUrl` object, which will allow you to perfectly replay the request.

This route will allow you to view Activities.

### HTTP Request

`GET https://exapi.lossexpress.com/activities`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
types | all | A comma separated list of types to view
createdBefore | current time | Allows for filtering activities to only those that were created before a certain timestamp
createdAfter | 30 minutes earlier | Allows for filtering activities to only those that were created after a certain timestamp
pageSize | 100 | Sets the size of pages in paginated results. Maximum is currently 500.
pageNumber | 0 | Sets the zero-indexed page number in paginated results.
claimId | | Filters the activities to only contain activities for the specific LossExpress Claim ID.
hash | | Show activity types starting from when the hash's activity and moving into the future

# Activity Types

## List of Types

Below is a list of Activity Types that will be available within the Activity Feed:

Type | Will appear when...
---- | -------------------
account-number-viewed | Account number is viewed
call-made | A call is made by LossExpress
claim-created | A claim is originally created
claim-updated | A claim's primary information is updated
direct-message-added | A direct message is added to a claim
document-added | A document is added to a claim
document-sent-to-lender | A document is sent to a lender
letter-of-guarantee-added | A letter of guarantee is added to a claim
letter-of-guarantee-request-created | A letter of guarantee request is created on a claim
payment-sent | Payment has been sent for a claim
payoff-data-added | Payoff information is added to a claim
payoff-request-created | A payoff request is created on a claim
settlement-counter-added | A lender adds a counter to the proposed settlement amount
settlement-counter-updated | The settlement counter is either accepted or disputed by the carrier

## account-number-viewed

> account-number-viewed example object

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "account-number-viewed",
  "claimNumber": "EXAMPLE1",
  "data": {
    "viewedByLossExpress": true
  }
}
```

This activity type will appear in the feed whenever an account number is viewed by someone on LossExpress.


## call-made

> call-made example object

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "call-made",
  "claimNumber": "EXAMPLE2",
  "data": {
    "callLength": 30 // in minutes
  }
}
```

This activity type will appear in the feed whenever a call was made on behalf of the carrier by LossExpress.

## claim-created

> claim-created example object

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "claim-created",
  "claimNumber": "EXAMPLE3",
  "data": {
    "accountNumber": "TEST-AN",
    "adjusterName": "Mike Mclaren",
    "adjusterEmailAddress": "mike@lossexpress.com",
    "adjusterPhoneNumber": "+13332225555",
    "causeOfLoss": "Fire",
    "dateOfLoss": "2020-10-20",
    "deductible": 400,
    "financeType": "Retail",
    "insurerType": "First Party",
    "lenderName": "Test Lender",
    "lenderId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
    "odometer": 39993,
    "ownersName": "Test Owner",
    "ownersPhoneNumber": "+12223334444",
    "ownerRetained": false,
    "ownersStreetAddress": "12200 Test Avenue Dallas TX 75204",
    "settlementAmount": 5553,
    "titleRemittanceAddress": "1000 Main Street Dallas TX 75204",
    "vehicle": {
      "make": "TEST",
      "model": "Car",
      "year": 2034
    },
    "vehicleLocation": "1200 Main Street Dallas TX 75204",
    "vin": "1N4AL3AP8JC231503"
  }
}
```

This activity type will appear in the feed whenever a claim is created in our system by a carrier. This activity will contain in its data all claim information that had
been passed on create along with Make/Model/Year information for the VIN passed, if available. Any information not sent on creation will not appear in the data object and
would appear as <code>undefined</code> when parsed.

If desired, we do give carriers the ability to not have account numbers added to this event type for security purposes.

<aside class="notice">For more information regarding the formats/types passed in the <code>data</code> object, please see the Create Claim route.</aside>

## claim-updated

> claim-updated example object

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "claim-updated",
  "claimNumber": "EXAMPLE3",
  "data": {
    "update": { // contains the updated information
      "accountNumber": "TEST-AN1"
    },
    "previous": { // contains the information just prior to update
      "accountNumber": "TEST-AN"
    }
  }
}
```

This activity type will appear in the feed whenever _primary claim information_ is updated. In LossExpress, we define primary claim information as any piece of data that can be sent in the update or create claim routes.

Note that this activity type could be triggered by actions made by LossExpress. Some examples that could cause LossExpress to trigger this activity type:

- Account number was empty or incorrect, so was updated when talking to the lender.
- Finance type was set to Retail but was actually a Lease.
- Lender name was incorrect or updated.

<aside class="warning">This activity type will not fire for any claims that have had no activity for two weeks.</aside>

## direct-message-added

> direct-message-added example object (sent by LossExpress)

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "direct-message-added",
  "claimNumber": "EXAMPLE3",
  "data": {
    "sentByLossExpress": true,
    "message": "Settlement amount appears to differ from documents. Please update.",
  }
```

> direct-message-added example object (sent by carrier user)

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "direct-message-added",
  "claimNumber": "EXAMPLE3",
  "data": {
    "sentByLossExpress": false,
    "message": "The LoG looks to have the wrong settlement amount, please get an LoG with the proper amount. Thanks!",
    "sentBy": "User Name"
  }
}
```

This activity type will appear in the feed whenever a direct message is added to a claim, either by LossExpress or by a carrier user.

## document-added

> document-added example object

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "document-added",
  "claimNumber": "EXAMPLE3",
  "data": {
    "type": "settlement breakdown",
    "documentUrl": "https://exapi.lossexpress.com/documents/555ae9da-9222-4de5-81fe-fe1ac590fa0f"
  }
}
```

This activity type will appear in the feed whenever a document has been added to a claim.

<aside class="warning">Letters of Guarantee added to the claim will not trigger this activity type.</aside>

## document-sent-to-lender

> document-sent-to-lender example object

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "document-sent-to-lender",
  "claimNumber": "EXAMPLE3",
  "data": {
    "documentUrl": "https://exapi.lossexpress.com/documents/555ae9da-9222-4de5-81fe-fe1ac590fa0f"
  }
}
```

This activity type is added to the feed whenever a document is sent by LossExpress to the lender for a particular claim. The <code>documentUrl</code> contains a link to the document that was sent to the lender.

## letter-of-guarantee-added

> letter-of-guarantee-added example object

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "letter-of-guarantee-added",
  "claimNumber": "EXAMPLE3",
  "data": {
    "documentUrl": "https://exapi.lossexpress.com/documents/555ae9da-9222-4de5-81fe-fe1ac590fa0f"
  }
}
```

This activity type is added to the feed whenever a letter of guarantee is added to a claim. The <code>documentUrl</code> contains a link to the letter of guarantee that was received.

<aside class="warning">This activity could be added to the feed even if a letter of guarantee request wasn't created in LossExpress. In those scenarios, a letter of guarantee request will be automatically created at the same time as the letter of guarantee is added to the claim.</aside>

## letter-of-guarantee-request-created

> letter-of-guarantee-request-created example object

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "letter-of-guarantee-request-created",
  "claimNumber": "EXAMPLE3",
  "data": {
    "estimatedResponseTime": "2021-01-20T22:03:09.598Z"
  }
}
```

This activity type is added to the feed whenever a letter of guarantee request is created for a claim.

Note that although we _typically_ request letters of guarantee whenever we reach out to a lender, we do not follow-up on the status of letters of guarantee nor can we absolutely guarantee that a letter of guarantee will be added to a claim unless a letter of guarantee request is created on a claim.

<aside class="warning"><code>estimatedResponseTime</code> may not exist on every activity for this type, and is merely an estimate based on _prior_ letter of guarantee request response times for that lender.</aside>

## payment-sent

> payment-sent example object

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "payment-sent",
  "claimNumber": "EXAMPLE3",
  "data": {
    "checkAmount": 20000,
    "sentAt": "2021-01-08T22:03:09.598Z",
    "sentTo": {
      "streetAddress": "1000 Main Street",
      "streetAddress2": "Ste. 500",
      "city": "Dallas",
      "state": "TX",
      "zipCode": "75204"
    },
    "sentVia": "USPS",
    "trackingNumber": "EXAMPLENUMBER"
  }
}
```

This activity type is added to the feed whenever acknowledgement that payment has been sent has been added to LossExpress; this can be trigged by either the carrier or our payment processing partner, if that partner is enabled in the carrier's system and set-up properly in LossExpress.

<aside class="warning"><code>sentTo</code> and <code>trackingNumber</code> may not exist on every activity for this type.</aside>

## payoff-data-added

> payoff-data-added example object

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "payoff-data-added",
  "claimNumber": "EXAMPLE3",
  "data": {
    "payoffAmount": 10222.33,
    "perDiem": 2.3,
    "validThroughDate": "2021-01-18T00:00:00.000Z",
    "remittanceInformation": {
      "standard": {
        "makeCheckPayableTo": "ALLY FINANCIAL",
        "attn": "ATTN LINE",
        "streetAddress": "1000 Main Street",
        "streetAddress2": "Ste. 500",
        "city": "Dallas",
        "state": "TX",
        "zipCode": "75204"
      },
      "overnight": {
        "makeCheckPayableTo": "ALLY FINANCIAL",
        "attn": "ATTN LINE",
        "streetAddress": "1000 Main Street",
        "streetAddress2": "Ste. 500",
        "city": "Dallas",
        "state": "TX",
        "zipCode": "75204"
      }
    }
  }
}
```

This activity type is added to the feed whenever payoff data is added to a claim.

<aside class="warning">This activity may be called multiple times in the claim and may not contain all information. Only information changed or added will be available in this activity type.</aside>

## payoff-request-created

> payoff-request-created example object

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "payoff-request-created",
  "claimNumber": "EXAMPLE3",
  "data": {}
}
```

This activity type is added to the feed whenever a payoff request is created on a particular claim.

## settlement-counter-added

> settlement-counter-added example object

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "settlement-counter-added",
  "claimNumber": "EXAMPLE3",
  "data": {
    "description": "missing options",
    "documentUrl": "https://exapi.lossexpress.com/documents/555ae9da-9222-4de5-81fe-fe1ac590fa0f"
  }
}
```

This activity type is added to the feed whenever a settlement counter is added to a claim by a lender. Typically, this comes with a document that can be accessed via the <code>documentUrl</code>.

## settlement-counter-updated

> settlement-counter-updated example object (dispute)

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "settlement-counter-updated",
  "claimNumber": "EXAMPLE3",
  "data": {
    "disputed": true,
    "reasonForDispute": "Vehicle is not missing any options, verified in person."
  }
}
```

> settlement-counter-updated example object (accepted)

```json
{
  "hash": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "createdAt": "2021-01-08T22:03:09.598Z",
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "type": "settlement-counter-updated",
  "claimNumber": "EXAMPLE3",
  "data": {
    "disputed": false,
    "documentUrl": "https://exapi.lossexpress.com/documents/555ae9da-9222-4de5-81fe-fe1ac590fa0f"
  }
}
```

This activity type is added to the feed whenever a settlement counter is either accepted or disputed by the carrier. <code>documentUrl</code> will contain a link to the settlment breakdown passed to the lender with the new settlement amount.
