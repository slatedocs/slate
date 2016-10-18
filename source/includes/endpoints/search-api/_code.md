```shell
curl -X POST \
  -H "Content-Type: application/vnd.api+json" \
  -d '{ \
    "data": { \
      "box": { \
        "x": 4, \
        "y": 4, \
        "width": 24, \
        "height": 24 \
      }, \
      "catalog_id": "some_catalog_id", \
      "image_uri": "data:image/jpeg;base64,...some_image_encoded_on_base64" \
    } \
  }' \
  "http://search.markable.us/v5/search"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "brands": [
      {
        "id": "brand_id_1",
        "name": "Brand Name 1",
        "affiliate": 1,
        "advertiserId": "Advertiser Id 1",
        "photos": [
          {
            "_id": "photo_id_1",
            "full": {
              "src": "https://someurl/image.jpg",
              "width": 1450,
              "height": 1600
            },
            "thumb": {
              "src": "https://someurl/thumb_image.jpg",
              "width": 450,
              "height": 600
            }
          }
        ]
      }
    ],
    "products": [
      {
        "_id": "product_id_1",
        "active": true,
        "advertiserId": "Advertiser Id 1",
        "advertiserName": "Advertiser Name",
        "affiliate": 1,
        "availability": "in-stock",
        "categories": "accessories jewelry cufflink accessories jewelry cufflink accessories jewelry",
        "currency": "USD",
        "gender": "men",
        "imageUrl": "http://someurl/productimage.jpg",
        "manufacturerName": "Manufacture Name",
        "price": 100.00,
        "primaryCategory": "category",
        "productName": "Product Name",
        "retailPrice": 100.00,
        "shortDescription": "Short Description",
        "skuNumber": "1234567890",
        "eventIds": [
          "some_catalog_id"
        ],
        "skus": [
          {
            "size": "S",
            "availability": "in-stock",
            "inventory": 10,
            "sku": 123
          }
        ],
        "sizes": [
          "S"
        ],
        "photos": [
          {
            "_id": "photo_id_2",
            "full": {
              "src": "http://someurl/image_photo_2.jpg",
              "width": 800,
              "height": 1200
            },
            "thumb": {
              "src": "http://someurl/thumb_image_photo_2.jpg",
              "width": 200,
              "height": 300
            }
          }
        ]
      }
    ],
    "type": "products"
  }
}
```

> If an error occurs the above command returns JSON structured like this:

```json
{
  "errors": [
    {
      "id": "some_id",
      "code": "some_code",
      "detail": "Detailed message about the error"
    }
  ],
  "meta": {
  	"url": "/v1/search",
  	"body": {
      "data": {
        "box": {
          "x": 4,
          "y": 4,
          "width": 24,
          "height": 24
        },
        "catalog_id": "some_catalog_id",
        "image_uri": "data:image/jpeg;base64,...some_image_encoded_on_base64"
      }
    }
  }
}
```
