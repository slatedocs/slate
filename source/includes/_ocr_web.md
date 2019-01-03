# OCR Web


## Scan a Picture

```shell
curl -X POST \
  https://api.chekin.io/api/v1/tools/ocr/picture/ \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: application/json' \
  -d '{
        "picture_file": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAABHNCSVQICAgIfAhkiAAABERJREFUeAHtmk1S2zAYhj85XXVDMrAnPQHpCTDLhgXuCZqeAHoChhOQG+DewF1Al7g34Aake5jAqmyQ+kqJSWASkD35EeNXMxr/RD+fnlc/n+SIMJAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACYRAQPkYkZzfZCJqVz5Gn7K91p1PHqapRiDyyqakKTY+SMcrPRNVJuAniKiBq8FoClIZtV9GP0GMjAXBKGFYKgE/QaIod1YoEy/VGhYufoJIMULUDpktl4CXl2VNSC5urXe1IQqe1pfWwL5bR0h+D9vKyPa8uo2R+2y/dTXv99Dff/A20JhclDoQ/RgjT+qdr2JCB17LjongSBhMlUZZTw/3WsxrZaKLofPYFAMkzCWKTtbZgV4zddZv/oIolaOAA4gS45oiLjRYAURrlO/gQwDdNHb8Ovq4mYzle7ycPwJGwtmptY08PZTTwz7qe7a/lS7U4CUVNmnmGxU4YEZfA9Bdtr/ZeiO518/J+bAjSn9D4gSx/SLTPUZGDiWuIBJi4w49Hc9+YVz2EVLb8qFh9Pk9TGXegtg2Jee3A/S6bbTua9bdyuy7siG5HDbVw+OB0eoIZXWm8qPnS+ZEiBr5oqYZTF99lHuIcn9hlCRT9QV5W06Qi9sjtOIUguQQZK9Mi8ZT0jHyJBCiOc5rRUjhKGRlen+petEB5J8eujxrdkh87C4nyKhxAxS8gfgj627a3vdqeBLCzudPwfzB1Jeual7HKElRtZ26vGx+MnMNN777EGfa6GDR9MZ2nmIKO5xnM4SIk4ubSyyq1xgRRZ6fzm3ubsWrEsPZ59Yi3FlvLfBQaoQUbYHX0oO3dTZ+tutKqgx280bgGekY13hqfSimpf6i1oXCDt/rMhwS37rLpqskiK0EvT/B3qAP8FjkZwQjf/E2xZF9P4Qj+1A2tjNIPXvlvw95lg3u0MjLypwwYvcmpuOSGOxXcPaVdf1d1BdFL+nR7l3wTUekjThADDJUFqRoTSFM8RzuFfsZkV1sPmNcc8QgQ6lFPcgW+BqFDa1v0nWmq48g7+QTQn0EWWe3L1E3BSkBaxVJayPI5GjGeVqrYFupjtoIUonOGjLVS5DRZhWn1jj2DzTUSxBV7D90Eqge3n9yCNX+cnapKHUZlBzjYPQsxJFS+SyrHIlwUr84GMWJDzaM9oukwZ8Bo6kjFY0jFmWaYhonq/zSWDtBbNcYn/4eQQz7sWz24eikD630G0otBZmwhjj2o5v9z7J+bOPwEbEIBiOmMZi4y8V7XkmABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABN4Hgf9R1jRAiigWLAAAAABJRU5ErkJggg=="
    }
    '
```


> The above command returns JSON structured like this:

```json
  {
    "id": 15,
    "picture_file": "https://s3.eu-west-2.amazonaws.com/chekinapptest/uploads/pictures/1fa97ecc020911e9a283d64b2af3b94e.jpg?X-Amz-Expires=3600&X-Amz-Credential=AKIAJMSXFFSPIIN6XG4Q%2F20181217%2Feu-west-2%2Fs3%2Faws4_request&X-Amz-Date=20181217T143622Z&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-SignedHeaders=host&X-Amz-Signature=3a60e7e16d71b93c567616d52946909f6cf7400a63a930789d8d3668f4e117cb",
    "mrz_detected": false,
    "status": "NEW",
    "type_doc": null,
    "country": null,
    "date_of_birth": null,
    "expiration_date": null,
    "names": null,
    "surname": null,
    "nationality": null,
    "number": null,
    "sex": null,
    "valid_composite": false,
    "valid_date_of_birth": false,
    "valid_expiration_date": false,
    "valid_number": false,
    "valid_score": null
  }
```

This endpoint allows you to upload the image of the document to be processed.


### HTTP Request

`POST https://api.chekin.io/api/v1/tools/ocr/picture/`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
picture_file | true | Image of the document to scan.


## Get Scan status & Data

```shell
curl -X GET \
  https://api.chekin.io/api/v1/tools/ocr/data/458/ \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: application/json'
```


> The above command returns JSON structured like this:

```json
  {
    "id": 458,
    "picture_file": "https://s3.eu-west-2.amazonaws.com/chekinmrzweb/uploads/pictures/3be5c68efe0f11e89b7c0242ac110003.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJMSXFFSPIIN6XG4Q%2F20190103%2Feu-west-2%2Fs3%2Faws4_request&X-Amz-Date=20190103T005930Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=9f813e7c917554491a9eb3808488267c4d6f126a2fae58c8bddbedbb2c2366f5",
    "mrz_detected": true,
    "status": "COM",
    "type_doc": "P",
    "country": "ESP",
    "date_of_birth": "400515",
    "expiration_date": "160803",
    "names": "MARTIN",
    "surname": "SANCHEZ",
    "nationality": "ESP",
    "number": "09953192H",
    "sex": "M",
    "valid_composite": true,
    "valid_date_of_birth": true,
    "valid_expiration_date": true,
    "valid_number": true,
    "valid_score": 100
  }
```

This endpoint allows you to obtain the status of the processing and the data extracted from the documents.
###The processing status can be:
Status type | Description
----------- |  -----------
NEW | Image of the stored document without processing.
PRO | The image is being processed to extract the data.
COM | Image processing has successfully completed.
ERR | Error during image processing.

The valid_score field tells us how good the result of the data extraction has been. It has a range [0 - 100], obtaining better results the greater the value of the field.


### HTTP Request

`GET https://api.chekin.io/api/v1/tools/ocr/data/<ID>/`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
ID | true | ID that refers to a specific image processing.
