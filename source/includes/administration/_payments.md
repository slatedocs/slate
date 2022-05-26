## Payments

Retreive the history of payment transactions for an organization.

<!-------------------- LIST PAYMENTS -------------------->

### List payments

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/payments?organizationId=07d88499-a17f-4a68-8888-bbec953xxx1d"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "paymentTraceReference": "925613851809199",
      "paymentReference": "20210930033702-qfm04yt",
      "totalAmount": 5338.72,
      "confirmationNumber": "6155D9A173DE0841F48B291C2A24BE80AFB153CD",
      "deleted": false,
      "id": "07d88499-a17f-4a68-8560-bbec953cec1d",
      "invoice": {
        "createdDate": "2021-09-01T14:21:11Z",
        "invoiceId": "91438A1596",
        "id": "6f34d8a4-6256-4e43-96a9-6bfde2b21585"
      },
      "paymentDate": "2021-10-12T17:34:53Z",
      "taxAmount": 253.0,
      "currencyCode": "CAD",
      "status": "SUCCESS",
      "extraInfo": {
        "approvalStatus": "1",
        "procStatus": "0",
        "procStatusMessage": "Approved",
        "respCodeMessage": "",
        "respCode": "00"
      }
    },
    {
      "paymentTraceReference": "925613851809132",
      "paymentReference": "20210930033702-qfm032D",
      "errorMsg": "Transport error: 412 Error: Precondition Failed",
      "totalAmount": 5338.72,
      "confirmationNumber": "6155D9A173DE0841F48B291C2A24BE80AFB153WE",
      "id": "a8139387-b286-49e4-a458-afbaf1c604f7",
      "invoice": {
        "createdDate": "2021-09-01T14:21:11Z",
        "invoiceId": "91438A1596",
        "id": "6f34d8a4-6256-4e43-96a9-6bfde2b21585"
      },
      "paymentDate": "2021-10-11T17:34:50Z",
      "taxAmount": 1.0,
      "currencyCode": "USD",
      "status": "FAIL"
    }
  ]
}
```

<code>GET /payments?organizationId=:orgId</code>

Retrieve a list of payment processed for an organization.

Query Params | &nbsp;
---- | -----------
`organizationId`<br/>*UUID* | The ID of the organization for which we want to see the payments.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | A payment's unique identifier.
`invoice`<br/>*Object* | The invoice associated to the payment.
`invoice.id`<br/>*UUID* | The UUID of the invoice.
`invoice.invoiceId`<br/>*String* | The human readable invoice id.
`invoice.createdDate`<br/>*date* | The created date of the invoice.
`paymentReference`<br/>*String* | Payment reference sent to the payment provider to indentify the transaction.
`paymentTraceReference`<br/>*String* | Additional reference used to find a payment on the payment provider side.
`errorMsg`<br/>*String* | The error message returned by the payment provider if the payment failed.
`totalAmount`<br/>*BigDecimal* | The total amount of the invoice charged on the card.
`taxAmount`<br/>*BigDecimal* | The tax amount that was included in the charge.
`confirmationNumber`<br/>*String* | Confirmation number returned from the payment provider.
`paymentDate`<br/>*date* | The date on which the payment was sent to the provider.
`currencyCode`<br/>*String* | The currency of the payment.
`status`<br/>*String* | Status of the payment. One of `SUCCESS`, `PENDING`, `FAIL`.
`extraInfo`</br>*String*| Additional information set in the payment transaction.


<!-------------------- RETRIEVE A PAYMENT -------------------->

### Retrieve a payment

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/payments/07d88499-a17f-4a68-8560-bbec953ert1d"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "paymentTraceReference": "925613851809199",
    "paymentReference": "20210930033702-qfm04yt",
    "totalAmount": 5338.72,
    "confirmationNumber": "6155D9A173DE0841F48B291C2A24BE80AFB153CD",
    "id": "07d88499-a17f-4a68-8560-bbec953ert1d",
    "invoice": {
      "createdDate": "2021-09-01T14:21:11Z",
      "invoiceId": "91438A1596",
      "id": "6f34d8a4-6256-4e43-96a9-6bfde2b21585"
    },
    "paymentDate": "2021-10-12T17:34:53Z",
    "taxAmount": 253.0,
    "currencyCode": "CAD",
    "status": "SUCCESS",
    "extraInfo": {
      "approvalStatus": "1",
      "procStatus": "0",
      "procStatusMessage": "Approved",
      "respCodeMessage": "",
      "respCode": "00"
    }
  }
}
```

<code>GET /payments/:id</code>

Retrieve a payment.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | A payment's unique identifier.
`invoice`<br/>*Object* | The invoice associated to the payment.
`invoice.id`<br/>*UUID* | The UUID of the invoice.
`invoice.invoiceId`<br/>*String* | The human readable invoice id.
`invoice.createdDate`<br/>*date* | The created date of the invoice.
`paymentReference`<br/>*String* | Payment reference sent to the payment provider to indentify the transaction.
`paymentTraceReference`<br/>*String* | Additional reference used to find a payment on the payment provider side.
`errorMsg`<br/>*String* | The error message returned by the payment provider if the payment failed.
`totalAmount`<br/>*BigDecimal* | The total amount of the invoice charged on the card.
`taxAmount`<br/>*BigDecimal* | The tax amount that was included in the charge.
`confirmationNumber`<br/>*String* | Confirmation number returned from the payment provider.
`paymentDate`<br/>*date* | The date on which the payment was sent to the provider.
`currencyCode`<br/>*String* | The currency of the payment.
`status`<br/>*String* | Status of the payment. One of `SUCCESS`, `PENDING`, `FAIL`.
`extraInfo`</br>*String*| Additional information set in the payment transaction.
