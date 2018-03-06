# Reporting

##View Transaction

>Example of json return

```json
{
    "data": {
        "status": {
            "result": "approved",
            "resultCode": "A",
            "status": "pending",
            "statusCode": "P",
            "error": "",
            "message": ""
        },
        "customer": {
            "custID": "0001",
            "name": "Andy Rogers"
        },
        "details": {
            "amount": "1.00",
            "type": "sale",
            "refNum": "129785632",
            "authCode": "965664",
            "transactionDate": "2017-12-01 09:52:09",
            "batchID": 43128,
            "invoice": "1512150926",
            "orderID": null,
            "description": "Onetime Sale",
            "callbackURL": null,
            "submittedBy": null,
            "comments": null,
            "custom": null,
            "lineitems": null,
            "repID": null,
            "source": "vault",
            "trackingCode": null
        },
        "paymentDetails": {
            "payID": 127667,
            "method": "card",
            "lastfour": "XXXXXXXXXXXX2224",
            "token": "4099bce0-97aa-478b-a6b7-f34h11e4658c",
            "cardType": "visa",
            "source": "tokenex"
        },
        "info": {
            "gatewayID": 999,
            "name": "usaepay",
            "referrer": null,
            "clientIP": "64.77.244.00",
            "mid": "100999",
            "userID": 9999,
            "userKey": "P0Rbrj87lHNrQPXr",
            "proccessTime": "668.54"
        }
    }
}
```

View a single transaction record.

### HTTP Request

`GET transactions/<REFNUM>`

##View All Transactions

>Example of pagination in the return.

```json
{
    "data": [
        {}
    ],
    "meta": {
        "pagination": {
            "total": 100,
            "count": 10,
            "per_page": 10,
            "current_page": 1,
            "total_pages": 10,
            "links": {
                "next": "https://api.slycepay.com/v2/transactions?limit=10&page=2"
            }
        }
    }
}
```

View multiple transaction records.

This method makes use of different filter types.

* Comma separated lists. Example: status=pending,settled
* Greater then(gt) and less than(lt) available for numerical values. Example: amount=gt|100
* Dates are in YYYY-MM-DD format. Example: start=2017-10-24

### HTTP Request

`GET transactions/`

### Query Parameters

Parameter | Filter type | Available Values
--------- | ------- | -----------
refnum | List | 
amount | gt/lt | Decimal Numbers
start | Date | YYYY-MM-DD
end | Date | YYYY-MM-DD
status | List | pending, settled, declined, error, void
result | List | approved, declined, error
type | List | sale, refund, recurring, authonly
method | List | card, ach
source | List | keyed, chip, swipe, mobile
cardtype | List | visa, mastercard, discovery
custom1-10 | Single Value | Parameter should be the word "custom" with a number after. Example: `custom4=value`

### Pagination

The returned results are separated into "Pages". The number of results to return per page can be controlled with the parameter `limit` (E.g. limit=20). The default is 20 results, max is 1000.