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

### iconURL

URL для доступа к логотипу категории на мобильном распознает параметр для удобства расположения на сервере и оптимизации размеров - _http://.../**${image.type}**/name.png_ и будет автоматически в зависимости от платформы подменять его на **ios-small** или **android-small**

comment | url
пришло от сервиса | ``http://static.idamob.ru/smarttransaction/category/**${image.type}**/restaurants_and_cafes.png``
на iPhone стало | [http://static.idamob.ru/smarttransaction/category/ios-small/restaurants_and_cafes.png](http://static.idamob.ru/smarttransaction/category/ios-small/restaurants_and_cafes.png)
на Android стало | [http://static.idamob.ru/smarttransaction/category/ios-small/restaurants_and_cafes.png](http://static.idamob.ru/smarttransaction/category/android-small/restaurants_and_cafes.png)

### logoURL

URL для доступа к логотипу мерчента на мобильном распознает параметр для удобства скелинга картинки и оптимизации трафика и размеров _http://.../**c_scale,w_64**/name.png_

size | url
64х64 | [http://res.cloudinary.com/instabank/image/upload/c_scale,w_64/v1402049419/ic_starbucks_pgbkrg.png](http://res.cloudinary.com/instabank/image/upload/c_scale,w_64/v1402049419/ic_starbucks_pgbkrg.png)
640x640 | [http://res.cloudinary.com/instabank/image/upload/c_scale,w_640/v1402049419/ic_starbucks_pgbkrg.png](http://res.cloudinary.com/instabank/image/upload/c_scale,w_640/v1402049419/ic_starbucks_pgbkrg.png)
