# Simulation
## Simulate Transfer Processing

> Example Request:

```shell
curl -X GET "https://api.sandbox.transferwise.tech/v1/simulation/transfers/{transferId}/processing" \
     -H "Authorization: Bearer <your api token>"
```

> Example Response:

```json
{
  "id": 15574445,
  "user": 294205,
  "targetAccount": 7993919,
  "sourceAccount": null,
  "quote": 113379,
  "status": "processing",
  "reference": "good times",
  "rate": 1.2151,
  "created": "2017-03-14 15:25:51",
  "business": null,
  "transferRequest": null,
  "details": {
    "reference": "good times"
  },
  "hasActiveIssues": false,
  "sourceValue": 1000,
  "sourceCurrency": "EUR",
  "targetValue": 895.32,
  "targetCurrency": "GPB"
}
```
You can simulate payment processing by changing transfer statuses using these endpoints. 

This feature is limited to sandbox only.
Please note, simulation doesn't work with email transfers.


### Request
**`GET https://api.sandbox.transferwise.tech/v1/simulation/transfers/{transferId}/processing`**

Changes transfer status from incoming_payment_waiting to processing.

**`GET https://api.sandbox.transferwise.tech/v1/simulation/transfers/{transferId}/funds_converted`**

Changes transfer status from processing to funds_converted.<br/>

**`GET https://api.sandbox.transferwise.tech/v1/simulation/transfers/{transferId}/outgoing_payment_sent`**

Changes transfer status from funds_converted to outgoing_payment_sent.<br/>

**`GET https://api.sandbox.transferwise.tech/v1/simulation/transfers/{transferId}/bounced_back`**

Changes transfer status from outgoing_payment_sent to bounced_back.<br/>

**`GET https://api.sandbox.transferwise.tech/v1/simulation/transfers/{transferId}/funds_refunded`**

Changes transfer status from bounced_back to funds_refunded.

### Response
Transfer entity with changed status. 


