# Direct Messages

## Create Direct Message

> Example Response Body:

```json
{
  "claimId": "c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
  "message": "Test message."
}
```

This route allows for sending a direct message to our Claim Specialists.

### HTTP Request

`POST https://exapi.lossexpress.com/claims/{claimId}/direct-messages`

### URL Parameters

Parameter | Description
--------- | -----------
claimId | The LossExpress UUID associated with the claim

### Request Body

This route accepts a JSON payload of an object comprising of:

Body Parameter | Description | Required?
-------------- | ----------- | ---------
message | The direct message to be sent to LossExpress | Y
