# Settlement Counter

## Accept or Dispute Counter

> Example Response Body:

```json
{
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "success": true
}
```

> This route will throw a `404: NOT FOUND` if there are no settlement counters present on the claim.

This route allows for either accepting or disputing a settlement counter presented by a lender.

To accept a counter, you must send a new settlement breakdown document. To dispute a counter, you must set `dispute` to true and provide a `reasonForDispute`.

This route will throw an error if there are no settlement counters.

### HTTP Request

`POST https://exapi.lossexpress.com/claims/{claimId}/settlement-counter`

### URL Parameters

Parameter | Description
--------- | -----------
claimId | The LossExpress UUID associated with the claim

### Request Body

This route accepts a JSON payload of an object comprising of:

Body Parameter | Description | Required?
-------------- | ----------- | ---------
dispute | True if it should be disputed, false otherwise (boolean) | Y if dispute
settlementBreakdown | | Y if not dispute
reasonForDispute | Message containing the reason for dispute | Y if dispute
