# API Documentation

## Comment structure
```json
{
  "ops": [
      { // mentions starts
          "attributes": {
              "mention": {
                  "name": "batman",
                  "slug": "batman",
                  "avatar": "null",
                  "id": "420",
                  "target": "_blank",
                  "class": "custom-em"
              },
              "link": "karthik-2"
          },
          "insert": {
              "mentions": true
          }
      },// mnetions end here
      { // plaing text starts here
          "insert": "hey 😀"
      }, // plain text ends here
      {//link type starts here
          "attributes": { // this is the link/URL
              "link": "https://www.metype.com"
          },
          "insert": "https://www.metype.com" // This is the display text of the link
      },
      {//Image type starts here
          "insert": {
              "image": "https://stg-quintype-dropbox.s3-accelerate.amazonaws.com/localhost-1571654905860-a.png" // Url of the uploaded image
          }
      }// Image type ends here
  ]
}
```
* Comment structure is the structure that needs to be followed while creating a comment or perceived for displaying a comment.
* Comment is nothing but an object with `ops` as key and array of objects. The text part of each of the object will eventually become the displayed text but with some styling and functionality.
* Currently supported types are plain text(emoji is part of plain text), links, mentions, image upload.
* An example is shown here to illustrate the comment structure.
* To fetch mentions there is an API available and will be documented.
* To upload images there is an API available and will be documented.

## User

* Right now APIs support only third login.
* To understand how to generate JWT supported by metype check [this](#generating-jwt)

### GET User info

This endpoint returns the information of a user.

```shell--request
curl -X GET \
  'https://www.metype.com/api/v1/accounts/<account_id>/current_user?jwt=<jwt>'
```

```shell--response
{
    "signed_in": true,
    "current_user": {
        "name": "name",
        "avatar": "http://avata.com/avatar",
        "id": 109,
        "slug": "name-2",
        "guest": false,
        "bio": "",
        "accounts": []
    },
    "is_guest": false,
    "provider": null
}
```

### Logout

For third party login any API on metype will avoid user's state when JWT is not present.

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
| guest_contributions |string| indicates if guest contributions are allowed in feed/widget|

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

## Bookmarks

Bookmarks allow users to mark URLs to be read later. All Bookmark APIs operate on bookmarks for a single user, and all Bookmark APIs must be authenticated. See [Single Sign On](#single-sign-on-sso) for information on how to create an access token.

All Bookmark APIs follow the [json:api](https://jsonapi.org) specification.

### Create or Update a Boomark

```shell--request
curl --request POST \
  --url https://www.metype.com/api/v1/accounts/:account_id/pages/aHR0cDovL3Rlc3QuaG9zdC8/bookmark \
  -H 'Content-Type: application/json' \
  --data-binary '{
    "data": {
      "type": "bookmark",
      "attributes": {
        "read_at": "2019-09-02",
        "metadata": {
          "any": "value"
        }
      }
    }
  }'
```

This endpoint can be used to create or update a bookmark. This API returns a 201 if the operation was sucessful. The parameters that can be passed in are as follows:

| key | type | use|
|--|--|--|
|account_id|integer|Metype account id|
|page_id|string|Base64 encoded url of the page, encoded with [Web Safe Base 64](http://www.base64url.com)|
|read_at|timestamp or null|Timestamp the bookmark was read at. This can be set to null if the bookmark is unread|
|metadata|object|Any additional parameters to be stored|

Please see the 'request' tab on the right for a sample request

### Fetch a Bookmark by URL

```shell--request
curl --request GET \
  --url https://www.metype.com/api/v1/accounts/:account_id/pages/aHR0cDovL3Rlc3QuaG9zdC8/bookmark
```

```shell--response
{
   "data" : {
      "type" : "bookmark",
      "attributes" : {
        "url" : "http://test.host/",
        "headline" "This is a sample page",
        "hero_image_url" : "https://developers.quintype.com/images/logo.svg",
        "metadata" : {},
        "created_at" : "2019-10-04T10:15:13.719Z",
        "updated_at" : "2019-10-04T10:15:13.719Z",
        "read_at" : null
      }
   }
}
```

This endpoint can be used to fetch the bookmark on a given page. This endpoint will return a 200 if the bookmark is found, and a 404 otherwise. The parameters that can be passed in are as follows:

| key | type | use|
|--|--|--|
|account_id|integer|Metype account id|
|page_id|string|Base64 encoded url of the page, encoded with [Web Safe Base 64](http://www.base64url.com)|

Please see the 'request' and 'response' tabs on the right for a sample request

### Delete a Bookmark

```shell--request
curl --request DELETE \
  --url https://www.metype.com/api/v1/accounts/:account_id/pages/aHR0cDovL3Rlc3QuaG9zdC8/bookmark
```

This endpoint can be used to delete a bookmark on a given page. This endpoint will return a 204. The parameters that can be passed in are as follows:

| key | type | use|
|--|--|--|
|account_id|integer|Metype account id|
|page_id|string|Base64 encoded url of the page, encoded with [Web Safe Base 64](http://www.base64url.com)|

Please see the 'request' tab on the right for a sample request

### Get All Bookmarks for a User

```shell--request
curl --request GET \
  --url https://www.metype.com/api/v1/accounts/:account_id/bookmarks
```

```shell--response
{
   "data" : [{
      "type" : "bookmark",
      "attributes" : {
        "url" : "http://test.host/",
        "headline" "This is a sample page",
        "hero_image_url" : "https://developers.quintype.com/images/logo.svg",
        "metadata" : {},
        "created_at" : "2019-10-04T10:15:13.719Z",
        "updated_at" : "2019-10-04T10:15:13.719Z",
        "read_at" : null
      }
   }]
}
```

This endpoint can be used to fetch all bookmark for a given user. The parameters that can be passed in are as follows:

| key | type | use|
|--|--|--|
|account_id|integer|Metype account id|
|status|string|If set to 'read', then only return bookmarks that have been read. If set to 'unread', then only return unread bookmarks. By default, all bookmarks are returned|
|page|integer|Page of Bookmarks to return|

Please see the 'request' and 'response' tabs on the right for a sample request

## Contributions

Contributions allow metype users to create user generated content, which is pushed to the account's CMS.

All Contributions APIs follow the [json:api](https://jsonapi.org) specification.


### Contribution Terminology

* When you want to create a contribution there are two things expected
  1. Base64 URI encoded string of html
  2. A JSON object a particular format

Example of encoding strigified html is available on the right:

```js
let html = "<p>sample text</p>";
let encodedHtml = btoa(encodeURIComponent(html))
```

Example of json object is shown on the right

```json
//JSON object
{
    "ops": [
        {//bold text
            "attributes": {
                "bold": true
            },
            "insert": "bold "
        },
        {// italic text
            "attributes": {
                "italic": true
            },
            "insert": "italic "
        },
        {// underlined text
            "attributes": {
                "underline": true
            },
            "insert": "underlined "
        },
        {//regular text
            "insert": "quote"
        },
        {//block quote
            "attributes": {
                "blockquote": true
            },
            "insert": "quote\n"
        },
        {// heading
            "attributes": {
                "header": 2
            },
            "insert": "heading\n"
        },
        {// ordered list
            "insert": "ol1"
        },
        {
            "attributes": {
                "list": "ordered"
            },
            "insert": "\n"
        },
        {
            "insert": "ol2"
        },
        {
            "attributes": {
                "list": "ordered"
            },
            "insert": "\n"
        },
        {// unordered list
            "insert": "uorl1"
        },
        {
            "attributes": {
                "list": "bullet"
            },
            "insert": "\n"
        },
        {
            "insert": "uorl2"
        },
        {
            "attributes": {
                "list": "bullet"
            },
            "insert": "\n"
        },
        {// link
            "attributes": {
                "link": "https://www.youtube.com/watch?v=nPezCIqTZ-k"
            },
            "insert": "ka"
        },
        {
            "insert": "\n\n"
        },
        {// video
            "insert": {
                "video": "https://www.youtube.com/embed/nPezCIqTZ-k?showinfo=0"
            }
        },
        {
            "insert": "\n\n"
        },
        {// image
            "insert": {
                "image": "https://stg-quintype-dropbox.s3-accelerate.amazonaws.com/localhost-1571302176958-a.png"
            }
        }
    ]
}
```

### Create contribution



```shell-request
curl 'https://www.metype.com/api/v1/accounts/<account_id>/contributions?jwt=jwt' -H 'Origin: <Whitelisted url>'
 '{"contribution": {
      "headline":"title",
      "html":"encoded_html",
      "body":{"ops":[{"insert":"story"}]},
      "contributor_details": {
        "name":"name",
        "email":"a@b.com",
        "phone":"929292022",
        "bio":"bio"
  }}}'
```

```shell--response
{
    "contribution": {
        "id": 11,
        "story": "<p>story</p>",
        "user_id": 161,
        "account_id": 2,
        "body": {
            "ops": [
                {
                    "insert": "story"
                }
            ]
        },
        "headline": "title",
        "created_at": "2019-10-17T09:41:42.624Z",
        "updated_at": "2019-10-17T09:41:42.624Z",
        "contributor_details": {
            "name": "name",
            "email": "a@b.com",
            "phone": "929292022",
            "bio": "profile"
        }
    },
    "message": "Success"
}
```

### Get All Contributions for a User

```shell--request
curl --request GET \
  --url https://www.metype.com/api/v1/accounts/:account_id/contributions
```

```shell--response
{
   "data" : [{
      "type" : "contribution",
      "attributes" : {
        "id": 42,
        "headline": "This is a sample headline",
        "story": "<p>This is the body</p>",
        "created_at" : "2019-10-04T10:15:13.719Z",
        "external_id": "metype-42"
      }
   }]
}
```

This endpoint can be used to fetch all contributions for a given user. The parameters that can be passed in are as follows:

| key | type | use|
|--|--|--|
|page|integer|Page of Contributions to return (50 per page)|

Please see the 'request' and 'response' tabs on the right for a sample request
