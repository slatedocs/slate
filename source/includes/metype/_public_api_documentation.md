# API Documentation

## GET Account Config
```shell--request
curl --request GET \
  --url https://www.metype.com/api/v1/accounts/<account_id>/config \
  -H 'Content-Type: application/json'
```

```shell--response

{
  "data": {
    "id": "2",
    "type": "config",
    "attributes": {
      "guest_commenting": false,
      "prevent_profane_comment": true,
      "pre_moderate_profane_comment": true,
      "image_uploads": false,
      "hyper_links_in_comments": false,
      "initial_load_comments_limit": 4,
      "page_reactions_headline": "What's your reaction?",
      "claps_reaction_headline": null,
      "top_pages": true,
      "primary_color": null,
      "secondary_color": null,
      "background_color": null,
      "font_color": null,
      "third_party_login": true,
      "prohibited_words": [
        "bad", "cuss"
      ]
    }
  }
}

```
This endpoint returns configuration for an account

The important data inside this response is the data refering `attributes` key. Below is the information about different keys and their purpose

| key | type | use|
|--|--|--|
| guest_commenting |boolean|indicates guest commenting is enabled or not|
| prevent_profane_comment |boolean|indicates a profane comment can be posted or not.|
| pre_moderate_profane_comment |boolean|indicates if profane comment will be pre-moderated|
| image_uploads |boolean|indicates image uploads are enabled or not|
| hyper_links_in_comments |boolean|indicates hyper links in comment shoudl be allowed or not|
| initial_load_comments_limit |integer| indicates number of comments that should visible in commenting widget during the first load|
| page_reactions_headline |string| indicates the headline that is shown to encourage page reactions|
| claps_reaction_headline |string| indicates the headline that is shown to encourage claps|
| top_pages |boolean| indicates if top/trending pages should be visible in commenting widget/feed|
| primary_color |string| primary colour of the widget|
| secondary_color |string| secondary colour of the widget|
| background_color |string| background colour of the widget|
| font_color |string| font colour of the widget|
| third_party_login |boolean| indicates if the account uses own(true) login or metype(false) login|
| prohibited_words |array| words that will determine a profane comment according to account configuration|

Key points that needs your attention:

1. When `prevent_profane_comment` is true and `pre_moderate_profane_comment` is false, the comment should not be posted when any of the `prohibited_words` are part of the comment.
2. When `prevent_profane_comment` is true and `pre_moderate_profane_comment` is true or when only `pre_moderate_profane_comment` is true the comment can be posted and backend will take care of pre-moderation.
3. Colours that are returned in the config API are hex strings and by defaults we return default values.
4. There is no option to choose colors using UI but our backend supports the feature. If you need changes on these please reach out to us at `metype@quintype.com`


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
