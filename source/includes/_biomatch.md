# Biometric Matching


## Extract face on ID image

```shell
curl -X POST \
  https://api.chekin.io/api/v1/tools/biomatch/identification/ \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: multipart/form-data' \
  -d '{
        "picture_file": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAABHNCSVQICAgIfAhkiAAABERJREFUeAHtmk1S2zAYhj85XXVDMrAnPQHpCTDLhgXuCZqeAHoChhOQG+DewF1Al7g34Aake5jAqmyQ+kqJSWASkD35EeNXMxr/RD+fnlc/n+SIMJAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACYRAQPkYkZzfZCJqVz5Gn7K91p1PHqapRiDyyqakKTY+SMcrPRNVJuAniKiBq8FoClIZtV9GP0GMjAXBKGFYKgE/QaIod1YoEy/VGhYufoJIMULUDpktl4CXl2VNSC5urXe1IQqe1pfWwL5bR0h+D9vKyPa8uo2R+2y/dTXv99Dff/A20JhclDoQ/RgjT+qdr2JCB17LjongSBhMlUZZTw/3WsxrZaKLofPYFAMkzCWKTtbZgV4zddZv/oIolaOAA4gS45oiLjRYAURrlO/gQwDdNHb8Ovq4mYzle7ycPwJGwtmptY08PZTTwz7qe7a/lS7U4CUVNmnmGxU4YEZfA9Bdtr/ZeiO518/J+bAjSn9D4gSx/SLTPUZGDiWuIBJi4w49Hc9+YVz2EVLb8qFh9Pk9TGXegtg2Jee3A/S6bbTua9bdyuy7siG5HDbVw+OB0eoIZXWm8qPnS+ZEiBr5oqYZTF99lHuIcn9hlCRT9QV5W06Qi9sjtOIUguQQZK9Mi8ZT0jHyJBCiOc5rRUjhKGRlen+petEB5J8eujxrdkh87C4nyKhxAxS8gfgj627a3vdqeBLCzudPwfzB1Jeual7HKElRtZ26vGx+MnMNN777EGfa6GDR9MZ2nmIKO5xnM4SIk4ubSyyq1xgRRZ6fzm3ubsWrEsPZ59Yi3FlvLfBQaoQUbYHX0oO3dTZ+tutKqgx280bgGekY13hqfSimpf6i1oXCDt/rMhwS37rLpqskiK0EvT/B3qAP8FjkZwQjf/E2xZF9P4Qj+1A2tjNIPXvlvw95lg3u0MjLypwwYvcmpuOSGOxXcPaVdf1d1BdFL+nR7l3wTUekjThADDJUFqRoTSFM8RzuFfsZkV1sPmNcc8QgQ6lFPcgW+BqFDa1v0nWmq48g7+QTQn0EWWe3L1E3BSkBaxVJayPI5GjGeVqrYFupjtoIUonOGjLVS5DRZhWn1jj2DzTUSxBV7D90Eqge3n9yCNX+cnapKHUZlBzjYPQsxJFS+SyrHIlwUr84GMWJDzaM9oukwZ8Bo6kjFY0jFmWaYhonq/zSWDtBbNcYn/4eQQz7sWz24eikD630G0otBZmwhjj2o5v9z7J+bOPwEbEIBiOmMZi4y8V7XkmABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABN4Hgf9R1jRAiigWLAAAAABJRU5ErkJggg=="
    }
    '
```


> The above command returns JSON structured like this:

```json
  {
    "id": 2,
    "picture_file": "https://s3.eu-west-2.amazonaws.com/chekinapptest/uploads/identifications/f028266e150211e9a283d64b2af3b94e.jpg?X-Amz-Date=20190110T180957Z&X-Amz-SignedHeaders=host&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJMSXFFSPIIN6XG4Q%2F20190110%2Feu-west-2%2Fs3%2Faws4_request&X-Amz-Expires=3600&X-Amz-Signature=c176e805360ad8bf073931b53214df73ca81333f2d3fc289f6ae3807b51b0ab0",
    "status": "NEW",
    "is_face_detected": false
  }

```

This endpoint allows you to upload the image of the document to be processed.

### HTTP Request

`POST https://api.chekin.io/api/v1/tools/biomatch/identification/`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
picture_file | true | Image of the document to extract the face.


## Get face extraction status & results

```shell
curl -X GET \
  https://api.chekin.io/api/v1/tools/biomatch/identification/2/ \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: application/json'
```


> The above command returns JSON structured like this:

```json
  {
    "id": 2,
    "picture_file": "https://s3.eu-west-2.amazonaws.com/chekinapptest/uploads/identifications/f028266e150211e9a283d64b2af3b94e.jpg?X-Amz-Date=20190110T180957Z&X-Amz-SignedHeaders=host&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJMSXFFSPIIN6XG4Q%2F20190110%2Feu-west-2%2Fs3%2Faws4_request&X-Amz-Expires=3600&X-Amz-Signature=c176e805360ad8bf073931b53214df73ca81333f2d3fc289f6ae3807b51b0ab0",
    "status": "COM",
    "is_face_detected": true
  }

```


This endpoint allows you to obtain the status of the processing and if the face has been found.

###The processing status can be:

Status type | Description
----------- |  -----------
NEW | Image of the stored document without processing.
PRO | The image is being processed to extract the face.
COM | Image processing has successfully completed.
ERR | Error during image processing.


### HTTP Request

`GET https://api.chekin.io/api/v1/tools/biomatch/identification/<ID>/`

### URL Parameters

Parameter | Required | Description
--------- | -------- | -----------
ID | true | identifier that refers to a specific image processing.



## Extract face on Selfie image

```shell
curl -X POST \
  https://api.chekin.io/api/v1/tools/biomatch/person/ \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: multipart/form-data' \
  -d '{
        "picture_file": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAABHNCSVQICAgIfAhkiAAABERJREFUeAHtmk1S2zAYhj85XXVDMrAnPQHpCTDLhgXuCZqeAHoChhOQG+DewF1Al7g34Aake5jAqmyQ+kqJSWASkD35EeNXMxr/RD+fnlc/n+SIMJAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACYRAQPkYkZzfZCJqVz5Gn7K91p1PHqapRiDyyqakKTY+SMcrPRNVJuAniKiBq8FoClIZtV9GP0GMjAXBKGFYKgE/QaIod1YoEy/VGhYufoJIMULUDpktl4CXl2VNSC5urXe1IQqe1pfWwL5bR0h+D9vKyPa8uo2R+2y/dTXv99Dff/A20JhclDoQ/RgjT+qdr2JCB17LjongSBhMlUZZTw/3WsxrZaKLofPYFAMkzCWKTtbZgV4zddZv/oIolaOAA4gS45oiLjRYAURrlO/gQwDdNHb8Ovq4mYzle7ycPwJGwtmptY08PZTTwz7qe7a/lS7U4CUVNmnmGxU4YEZfA9Bdtr/ZeiO518/J+bAjSn9D4gSx/SLTPUZGDiWuIBJi4w49Hc9+YVz2EVLb8qFh9Pk9TGXegtg2Jee3A/S6bbTua9bdyuy7siG5HDbVw+OB0eoIZXWm8qPnS+ZEiBr5oqYZTF99lHuIcn9hlCRT9QV5W06Qi9sjtOIUguQQZK9Mi8ZT0jHyJBCiOc5rRUjhKGRlen+petEB5J8eujxrdkh87C4nyKhxAxS8gfgj627a3vdqeBLCzudPwfzB1Jeual7HKElRtZ26vGx+MnMNN777EGfa6GDR9MZ2nmIKO5xnM4SIk4ubSyyq1xgRRZ6fzm3ubsWrEsPZ59Yi3FlvLfBQaoQUbYHX0oO3dTZ+tutKqgx280bgGekY13hqfSimpf6i1oXCDt/rMhwS37rLpqskiK0EvT/B3qAP8FjkZwQjf/E2xZF9P4Qj+1A2tjNIPXvlvw95lg3u0MjLypwwYvcmpuOSGOxXcPaVdf1d1BdFL+nR7l3wTUekjThADDJUFqRoTSFM8RzuFfsZkV1sPmNcc8QgQ6lFPcgW+BqFDa1v0nWmq48g7+QTQn0EWWe3L1E3BSkBaxVJayPI5GjGeVqrYFupjtoIUonOGjLVS5DRZhWn1jj2DzTUSxBV7D90Eqge3n9yCNX+cnapKHUZlBzjYPQsxJFS+SyrHIlwUr84GMWJDzaM9oukwZ8Bo6kjFY0jFmWaYhonq/zSWDtBbNcYn/4eQQz7sWz24eikD630G0otBZmwhjj2o5v9z7J+bOPwEbEIBiOmMZi4y8V7XkmABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABN4Hgf9R1jRAiigWLAAAAABJRU5ErkJggg=="
    }
    '
```


> The above command returns JSON structured like this:

```json
  {
    "id": 2,
    "picture_file": "https://s3.eu-west-2.amazonaws.com/chekinapptest/uploads/identifications/f028266e150211e9a283d64b2af3b94e.jpg?X-Amz-Date=20190110T180957Z&X-Amz-SignedHeaders=host&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJMSXFFSPIIN6XG4Q%2F20190110%2Feu-west-2%2Fs3%2Faws4_request&X-Amz-Expires=3600&X-Amz-Signature=c176e805360ad8bf073931b53214df73ca81333f2d3fc289f6ae3807b51b0ab0",
    "status": "NEW",
    "is_face_detected": false
  }

```

This endpoint allows you to upload the image of the selfie to be processed.

### HTTP Request

`POST https://api.chekin.io/api/v1/tools/biomatch/person/`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
picture_file | true | Image of the selfie to extract the face.


## Get face extraction status & results

```shell
curl -X GET \
  https://api.chekin.io/api/v1/tools/biomatch/identification/2/ \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: application/json'
```


> The above command returns JSON structured like this:

```json
  {
    "id": 2,
    "picture_file": "https://s3.eu-west-2.amazonaws.com/chekinapptest/uploads/identifications/f028266e150211e9a283d64b2af3b94e.jpg?X-Amz-Date=20190110T180957Z&X-Amz-SignedHeaders=host&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJMSXFFSPIIN6XG4Q%2F20190110%2Feu-west-2%2Fs3%2Faws4_request&X-Amz-Expires=3600&X-Amz-Signature=c176e805360ad8bf073931b53214df73ca81333f2d3fc289f6ae3807b51b0ab0",
    "status": "COM",
    "is_face_detected": true
  }

```


This endpoint allows you to obtain the status of the processing and if the face has been found.

###The processing status can be:

Status type | Description
----------- |  -----------
NEW | Image of the stored document without processing.
PRO | The image is being processed to extract the face.
COM | Image processing has successfully completed.
ERR | Error during image processing.


### HTTP Request

`GET https://api.chekin.io/api/v1/tools/biomatch/person/<ID>/`

### URL Parameters

Parameter | Required | Description
--------- | -------- | -----------
ID | true | identifier that refers to a specific image processing.



## Compare extracted faces

```shell
curl -X POST \
  https://api.chekin.io/api/v1/tools/biomatch/compare/ \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: application/json' \
  -d '{
      	"identification_picture": 2,
      	"person_picture": 2
      }
     '
```


> The above command returns JSON structured like this:

```json
  {
    "id": 2,
    "identification_picture": 2,
    "person_picture": 2,
    "status": "NEW",
    "distance": null,
    "is_match": false
  }

```

This endpoint allows you to compare the faces extracted on ID image & Selfie image.

### HTTP Request

`POST https://api.chekin.io/api/v1/tools/biomatch/compare/`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
identification_picture | true | identifier of the extraction process of the face in the ID image.
person_picture | true | identifier of the extraction process of the face in the Selfie image.


## Get results of face comparison

```shell
curl -X GET \
  https://api.chekin.io/api/v1/tools/biomatch/compare/2/ \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: application/json'
```


> The above command returns JSON structured like this:

```json
  {
    "id": 2,
    "identification_picture": 2,
    "person_picture": 2,
    "status": "COM",
    "distance": 0.41156753794555,
    "is_match": true
  }

```


This endpoint allows you to obtain the results of the comparison between the extracted faces in the ID image and Selfie image.

The distance obtained has a range of values [0-1], when the value is closer to one, the faces are less similar, and when the value approaches zero, the faces are more similar

For security reasons and to prevent the same photo from being uploaded on two occasions, we have decided to take into account limits to validate the identity of the people.

The limit established for identity verification to be valid is that the distance must be included in the following range of values [0.35-0.6]. If distances are obtained outside this range, the verification will be considered invalid.

###The processing status can be:

Status type | Description
----------- |  -----------
NEW | Image of the stored document without processing.
PRO | The image is being processed to extract the face.
COM | Image processing has successfully completed.
ERR | Error during image processing.


### HTTP Request

`GET https://api.chekin.io/api/v1/tools/biomatch/compare/<ID>/`

### URL Parameters

Parameter | Required | Description
--------- | -------- | -----------
ID | true | identifier that refers to a face comparison.
