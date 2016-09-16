# Protocol

>Request:

```curl
curl -X POST -H "Content-Type: application/json" -d '{"0": {"text": "Starbucks", "sic" : 5813}, "1": {"text": "Burger king"}}' http://dev.idamob.ru/SmartTransactionsEndpoint/describeTransactions
```

>Response:

```json
{
  "0": {
    "category": {
      "name": "Restaurants & Cafes",
      "iconURL": "http://static.idamob.ru/smarttransaction/category/${image.type}/restaurants_and_cafes.png",
      "color": 14841934
    },
    "merchant": {
      "name": "Starbucks",
      "logoURL": "http://res.cloudinary.com/instabank/image/upload/c_scale,w_64/v1402049419/ic_starbucks_pgbkrg.png"
    }
  },
  "1": {
    "category": null,
    "merchant": {
      "name": "Burger King",
      "logoURL": "http://res.cloudinary.com/instabank/image/upload/c_scale,w_64/v1402048892/ic_bking_ju8w61.png"
    }
  }
}
```

Сервис SmartTransactions использует JSON over HTTP
