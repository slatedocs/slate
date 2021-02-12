# Payoff Requests

## Create Payoff Request

This route will create a payoff request on a claim. The request will fail when:

- IF documents with type `settlement breakdown` and `valuation report` are not available (or a document with type `settlement breakdown & valuation report`)

### HTTP Request

`POST https://exapi.lossexpress.com/claims/{claimId}/payoff-request`

### URL Parameters

Parameter | Description
--------- | -----------
claimId | The LossExpress UUID associated with the claim

## Cancel Payoff Request

This route will cancel a payoff request on a claim. This route will return an error if a payoff request has not been added on a claim yet.

This route will not return an error if a payoff request has been previously cancelled or completed.

### HTTP Request

`DELETE https://exapi.lossexpress.com/claims/{claimId}/payoff-request`

### URL Parameters

Parameter | Description
--------- | -----------
claimId | The LossExpress UUID associated with the claim
