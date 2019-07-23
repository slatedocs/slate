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
            "id": 15,
            "name": "Clap",
            "created_at": "2019-07-18T13:58:53.392Z",
            "updated_at": "2019-07-18T13:58:53.392Z"
        }
    ]
}
```
This endpoint returns list of reactions for an account


## GET Count of Page Reactions by metadata

```shell--request
curl -X GET \
  https://www.metype.com/api/v1/accounts/<account_id>/pages/reactions/<reaction_id>/<page_metadata_key>/<page_metadata_value>/count \
  -H 'Content-Type: application/json'
```

```shell--response

{
    "reactions_count": {
        "value": 5
    }
}
```

This endpoint returns the count of reactions for a given metadata key and value.



For example, if page metadata is
`{
  sections: ["sports", "health"]
}` and count of reactions on pages that belong to sports section is required,
`page_metadata_key` could be `section` and `page_metadata_value` could be `sports`