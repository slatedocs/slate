# Shop

## Get List

```shell
curl "http://example.com/api/shop"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": [
    {
      "id": 1,
      "name": "Movies",
      "description": "Watch hundreds of blockbuster films!",
      "items": [
        {
          "id": 1,
          "title": "Black Panther",
          "thumbnail_url": "http://www.imageurl.com/bp/bp-large.png",
          "display_price": 125
        }
      ]
    },
    {
      "id": 2,
      "name": "Esports",
      "description": "Choose from ESports, Adventures, Arcade Games and More!",
      "items": [
        {
          "id": 64,
          "title": "Steam",
          "thumbnail_url": "http://www.imageurl.com/steam/steam-large.png",
          "display_price": 64
        }
      ]
    }
  ]
}
```

This endpoint retrieves the shop contents.

### HTTP Request

`GET http://example.com/api/shop`

### URL Parameters

Parameter | Data Type | Description
--------- | ----------|--------------
q         | String    | The search term for the item list to retrieve
offset    | Integer   | The page in the item list to retrieve
limit     | Integer   | The number of items in the item list to retrieve

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## Get a Specific Item

```shell
curl "http://example.com/api/shop/64"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": {
    "id": 64,
    "title": "Steam",
    "description": "The ultimate entertainment platform...",
    "thumbnail_url": "http://www.imageurl.com/steam/steam-large.png",
    "banner_url": "http://www.imageurl.com/steam/steam-banner.png",
    "display_price": 50,
    "variation_prices": [
      {
        "display_name": "50 Steam Credits",
        "cost": 50,
        "currency": "XON"
      },
      {
        "display_name": "100 Steam Credits",
        "cost": 100,
        "currency": "XON"
      }
    ],
    "genres": [
      {
        "id": 2,
        "name": "Action",
        "icon_url": "http://www.imageurl.com/icons/genre/action.png",
      },
      {
        "id": 3,
        "name": "Movies",
        "icon_url": "http://www.imageurl.com/icons/genre/movies.png",
      }
    ],
    "media_images": [
      "http://www.imageurl.com/steam/steam-1.png"
    ],
    "media_videos": [
      "http://www.vimeo.com/xonio/steam.mp4"
    ]
  }
}
```

This endpoint retrieves the shop contents.

### HTTP Request

`GET http://example.com/api/shop/{id}`

### URL Parameters

Parameter | Data Type | Description
--------- | ----------|--------------
ID        | Integer   | The id of the item to retrieve

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## Buy an Item

```shell
curl "http://example.com/api/shop/"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": {
    "id": 1,
    "code": "CODE1234",
    "file_url": "http://www.drive.google.com/xonio/aoa/aoa.apk",
    "date": "@D:2015-12-10T12:34:56",
    "timestamp": 19267343928,
    "wallet": {
      "load": 480,
      "xon": 520,
      "xonio": 1
    }
  }
}
```

This endpoint process purchase transaction.

### HTTP Request

`POST http://example.com/api/shop/`

### URL Parameters

Parameter | Data Type | Description
--------- | ----------|--------------
user_id   | Integer   | The id of the user that will purchase
item_id   | Integer   | The id of the item to purchase

<aside class="success">
200 - Success
</aside>
<aside class="warning">
400 - Not enough xon credits
</aside>
<aside class="warning">
401 - Unauthorized
</aside>