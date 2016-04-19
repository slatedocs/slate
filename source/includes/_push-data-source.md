# DRAFT Push Data Source DRAFT

> Sample request

```json
{
  "callback" : "https://url.to.post.to/",
  "users": [
    {
      "partner_customer_id": "1234",
      "first_name": "FirstName",
      "last_name": "LastName",
      "email": "flastname@geezeo.com",
      "zip_code": "06000",
      "accounts": [
          {
            "reference_id": "999",
            "account_fi_name": "JOHN Q PUBLIC",
            "account_nickname": "John’s Savings",
            "account_type": "Savings",
            "account_balances": [
              {
                "balance_type": "Current",
                "balance_amount": "1999.99",
                "currency_code": "USD"
              }
            ],
            "transactions": [
              {
                "partner_customer_id":"1234",
                "account_id" : "1234",
                "transaction_id": "12345",
                "transaction_type": "Debit",
                "posted_date": "2009-03-19T11:40:50-04:00",
                "origination_date": "2009-03-19T15:31:36-04:00",
                "amount": "112.03",
                "memo": "DUNKINDONUTS*100094"
              }
            ]
          }
        ]
    }
  ]
}
```

> Sample response

```json
{
  "batch_id" : "abc123"
}
```

> Sample callback

```json
{
  "batch" : {
    "batch_id" : "abc123",
    "total_count": 1,
    "success_count" : 1,
    "error_count" : 0
  },
  "users": [
    {
      "id": 1,
      "partner_customer_id": "1234",
      "first_name": "FirstName",
      "last_name": "LastName",
      "email": "flastname@geezeo.com",
      "zip_code": "06000",
      "accounts": [
          {
            "id": 1,
            "reference_id": "999",
            "account_fi_name": "JOHN Q PUBLIC",
            "account_nickname": "John’s Savings",
            "account_type": "Savings",
            "account_balances": [
              {
                "balance_type": "Current",
                "balance_amount": "1999.99",
                "currency_code": "USD"
              }
            ],
            "transactions": [
              {
                "partner_customer_id":"1234",
                "account_id" : "1234",
                "transaction_id": "12345",
                "transaction_type": "Debit",
                "posted_date": "2009-03-19T11:40:50-04:00",
                "origination_date": "2009-03-19T15:31:36-04:00",
                "amount": "112.03",
                "memo": "DUNKINDONUTS*100094",
                "original_name": "DUNKINDONUTS*100094",
                "nickname" : "Dunkin Donuts",
                "tags" : [
                  {
                    "name": "Coffee",
                    "balance": 10.0
                  }
                ]
              }
            ]
          }
        ]
    }
  ]
}
```

Geezeo provides robust transaction enrichment for partner and aggregated accounts. The first step in any implementation is connecting the platform to a data source for all partner accounts.

Geezeo provides a Push Data Source mechanism for integrations that require real-time data enrichment.

Geezeo’s Push Data Source allows partners to asynchronously submit users, accounts, and transactions via a batch json interface. Partners submit a serialized version of a user with it’s associated accounts and transactions.

Each request submitted to the Push Data Source should provide a callback url where the results will be returned to. Once the Geezeo platform has completed processing the batch, the platform will call back the URL with the results.

All requests to and from the Push Data Source will use JWT tokens to validate authenticity, and forced TLS with certificate validation.

Initial queuing requests will also respond with a unique token for that batch. That token will also be on the response. That token should be used to tracking and troubleshooting.

All data provided to this interface is considered an upsert and will replace the data in the Geezeo platform.

## Callback URL

Requests should include a callback url. Once the Geezeo platform has completed processing the submitted batch, the platform will call the callback URL with the payload in the POST body.

The request will come with a JWT token to ensure authenticity.