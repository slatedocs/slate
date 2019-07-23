# API Documentation

## GET Account Reactions

```shell--request
curl -X GET \
  https://www.metype.com/api/v1/accounts/<account_id>/reactions \
  -H 'Content-Type: application/json'
```

```shell--response

{
    "account_reactions": [
        {
            "id": 6,
            "name": "Happy",
            "created_at": "2019-07-18T13:58:53.374Z",
            "updated_at": "2019-07-18T13:58:53.374Z"
        },
        {
            "id": 7,
            "name": "Sad",
            "created_at": "2019-07-18T13:58:53.376Z",
            "updated_at": "2019-07-18T13:58:53.376Z"
        },
        {
            "id": 8,
            "name": "Cool",
            "created_at": "2019-07-18T13:58:53.378Z",
            "updated_at": "2019-07-18T13:58:53.378Z"
        },
        {
            "id": 15,
            "name": "Clap",
            "created_at": "2019-07-18T13:58:53.392Z",
            "updated_at": "2019-07-18T13:58:53.392Z"
        }
    ]
}
```
This endpoint returns list of reactions for an account


## GET Page details

```shell--request
curl -X GET \
  https://www.metype.com/api/v1/accounts/<account_id>/pages/<encoded_page_url> \
  -H 'Content-Type: application/json'
}'
```

```shell--response
{
  "page": {
    "url": "http://localhost:3000/iframe-test-widget",
    "headline": "headline here",
    "image": null,
    "metadata": {
      "section": [
        "cooking",
        "healthy"
      ],
      "author_id": 109
    }
  }
}
```

This endpoint returns the details of a page if it exists, else returns 404. It accepts Base64 Encoded url of the page as `encoded_page_url`.


## GET Count of Page Reactions by metadata

```shell--request
curl -X GET \
  'https://www.metype.com/api/v1/accounts/<account_id>/pages/reactions/<reaction_id>/<page_metadata_key>/<page_metadata_value>/count'
```

```shell--response

{
    "reactions_count": {
        "value": 5
    }
}
```

This endpoint returns the count of reactions for a given metadata key and value.