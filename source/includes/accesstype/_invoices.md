# Invoices

## GET invoice for a particular subscription

```shell--request
$ curl -H "X-SUBAUTH: <auth-token>"
https://accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions/<subscription_id>/invoices/<invoice_id>/download.json
```

It returns the invoice.pdf file in pdf format