# Letter of Guarantee Requests

## Create Letter of Guarantee Request

This route will create a letter of guarantee request on a claim. The letter of guarantee request can be added at any time, but will fail when:

- IF documents with type `settlement breakdown` and `valuation report` are not available (or a document with type `settlement breakdown & valuation report`)

### HTTP Request

`POST https://exapi.lossexpress.com/claims/{claimId}/letter-of-guarantee-request`

### URL Parameters

Parameter | Description
--------- | -----------
claimId | The LossExpress UUID associated with the claim

## Cancel Letter of Guarantee Request

This route will cancel a letter of guarantee request on a claim. This route will return an error if a letter of guarantee request has not been added on a claim yet.

This route will not return an error if a letter of guarantee request has been previously cancelled or completed.

### HTTP Request

`DELETE https://exapi.lossexpress.com/claims/{claimId}/letter-of-guarantee-request`

### URL Parameters

Parameter | Description
--------- | -----------
claimId | The LossExpress UUID associated with the claim

