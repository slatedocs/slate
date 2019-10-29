# API Documentation

## Authentication

Authentication is done using JWT and sent as param check [here] (#generating-jwt) to understand generation of JWT.

Right now APIs support only third party login.

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

API response reference: </br>

Name | type | description |
-----|------|-------------|
signed_id | boolean | `true` when user is signed in  |
current_user | object | this indicates the signed-in user details |
name | string | name of the signed-in user |
avatar | string | url of the profile picture of the signed-in user |
id | integer | unique id of the signed-in user |
slug | string | slug on `metype.com` where the user can see their profile data |
guest | boolean | `false` when user is signed-in and vice-versa |
bio | string | Short bio of the signed in user |
accounts | array | unique ids of metype accounts which are administered by the signed-in user |
is_guest | boolean | `false` when user is signed-in and vice-versa |
provider | string | authentication provider usuall one of google, twitter, facebook or null |

### Logout

For third party login any API on metype will avoid user's state when JWT is not present.

## Terminology

* Page: A web page which contains content. This directly maps to a each unique URL on your site.
* Comment Realm: A conversation, or a discussion in a page. A page can have more than one conversations.
* Author: User who created the comment.
* Hidden: An action indicating the user deleted one's own comment.
* Delete: An action indicating an admin/moderator deleted the comment.
* Published: A state indicating if a comment is published.
* Parent comment: First level of comment.
* Child comment: Metype supports two levels of hierarchy. A reply to a main thread is usually a child comment.


## Comment

This is documents APIs related to comments APIs. It also gives information about the API contents to use them to build UI.



### API response reference

```JSON
{
  "total_count": 126,
  "comments": [{
    "id": 168,
    "comment_realm_id": 1,
    "page_id": 1,
    "body": {
        "ops": []
    },
    "created_at": "2019-10-23T10:20:17.980Z",
    "parent_comment_id": 167,
    "author_id": 109,
    "hidden_by_id": null,
    "hidden_at": null,
    "deleted_by_id": null,
    "deleted_at": null,
    "reactions": {},
    "edited_at": null,
    "is_spam": false,
    "is_published": true,
    "toxicity": 0,
    "page_url": "http://localhost:3000/page",
    "hero_image_url": null,
    "headline": null,
    "hidden": false,
    "deleted": false,
    "realm_comment_count": 126,
    "author": {},
    "mentions": []
  }],
  "total_parent_comments_count": 119
}
```

Name| type | Description
----|------|------------
id  | integer | Unique idenity for the Comment.
comment_realm_id  | integer | Unique identity of Comment realm.
page_id | integer | Unique identity of page.
body | object | Contents of this are explained [here] (?json#comment-body-structure)
created_at | string | This is time stamp indicating when comment was created.
parent_comment_id | integer | The id of parent comment. Present when it's a child comment.
author_id | integer | Unique id of user who created the comment.
hidden_by_id | integer | Unique id of user who hid the comment. Holds same value as author_id. Present only when user hid their comment.
hidden_at | string | This is time stamp indicating when comment was hidden.
deleted_by_id | integer | Unique id of admin who deleted the comment.
deleted_at | string | This is time stamp indicating comment deleted time.
reactions | object | Contents of this are explained here.
edited_at | string | This is time stamp indicating when comment was edited.
is_spam | boolean | `True` when comment is recognised as spam and vice-versa.
is_published | boolean | `True` when comment is published and vice-versa.
toxicity | float | Indicates the amount(percentage) of toxicity. Range is between 0.0 and 100.
page_url | string | The URL to which the page belongs/refers to.
hero_image_url | string | The URL of the image of the page which is tagged as `og:image`
headline | string | The title of the story of the page which tagged as `og:title`
hidden | bool | `True` when hidden by author of the comment and vice-versa.
deleted | bool | `True` when deleted by admin/moderator of the account
realm_comment_count | integer | Number of published comments in a comment_realm.
author | object | Contents of this are explained [here] (#get-user-info)
mentions | array | Array of users mentioned in the comment. For more info check here.
total_count | integer | Number of published comments in a page.
total_parent_comments_count | integer | Number of parent comments in a page.


### Comment body structure

```json
{
  "ops": [
      {
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
      },
      {
          "insert": "hey 😀"
      },
      {
        "attributes": {
            "link": "https://www.metype.com"
        },
        "insert": "https://www.metype.com"
      },
      {
        "insert": {
            "image": "https://stg-quintype-dropbox.s3-accelerate.amazonaws.com/localhost-1571654905860-a.png" // Url of the uploaded image
        }
      }
  ]
}
```

* Comment structure is the structure that needs to be followed while creating a comment or perceived for displaying a comment.
* Comment is nothing but an object with `ops` as key and array of objects. The text part of each of the object will eventually become the displayed text but with some styling and functionality.
* Currently supported types are plain text(emoji is part of plain text), links, mentions, image upload and structures as shown below

Description | type | Example|
----|------|-------------------------|
Plain text/emoji  | Object | ```{ "insert": "hey 😀"}```
Link  | Object |```{ "attributes": { "link": "https://www.metype.com" }, "insert": "https://www.metype.com" }```
Mention  | Object | ```{ "attributes": { "mention": { "name": "batman", "slug": "batman", "avatar": "null", "id": "420", "target": "_blank","class": "custom-em" }, "link": "karthik-2" }, "insert": { "mentions": true }}```
Image | Object | ```{ "insert": { "image": "https://s3.amazonaws.com/a.png" }}```

* An example of whole comment body is [here] (?json#comment-body-structure). Do check.
* To fetch mentions there is an API available and check [here] ().
* To upload images there is an API available and [here] ().

### Comment POST

```shell--request
curl -X POST \
  https://www.metype.com/api/v1/accounts/<account_id>/pages/<page_id>/comments.json \
  -H 'Content-Type: application/json' \
  -H 'Origin: http://localhost:3000' \
  -d '{
    "comment": {
        "body": {
            "ops": [
                {
                    "insert": "hey"
                }
            ],
            "captcha_response": "captcha" // for guest_commenting
        },
    },
    "jwt": "jwt",
    "mobile": true, // to differentiate mobile client for recaptcha support
  }'
```

```shell--response
{
    "total_count": 121,
    "comment": {
        "id": 166,
        "comment_realm_id": 1,
        "page_id": 1,
        "body": {
            "ops": [
                {
                    "insert": "hey\n"
                }
            ]
        },
        "created_at": "2019-10-21T11:33:28.416Z",
        "parent_comment_id": null,
        "author_id": 109,
        "hidden_by_id": null,
        "hidden_at": null,
        "deleted_by_id": null,
        "deleted_at": null,
        "reactions": {},
        "edited_at": null,
        "is_spam": false,
        "is_published": true,
        "toxicity": 0.0,
        "page_url": "http://localhost:3000/iframe-test-widget",
        "hero_image_url": null,
        "headline": null,
        "hidden": false,
        "deleted": false,
        "realm_comment_count": 121,
        "author": {
            "name": "bat",
            "avatar": null,
            "id": 109,
            "slug": "karthik-2",
            "guest": false,
            "bio": "",
            "accounts": []
        },
        "mentions": []
    },
    "total_parent_comments_count": 116
}
```

This endpoint creates a comment and gives the details of the comment created.

For reference of comment body structure check [here] (#comment-body-structure).

For reference of comment response structure check [here] (#api-response-reference)

Additional data to be posted to support guest_commenting

|Name| type| Description | optional |
|----|-----|-------------|----------|
|captcha_response| string | Recaptcha response validate response | yes, but needed for guest commenting |
|mobile| boolean | To indicate the rquest source is mobile | yes, but needed for guest commenting and source is mobile |

### Comment PUT

```shell--request
curl -X PUT \
  https://www.metype.com/api/v1/accounts/<account_id>/pages/<page_id>/comments/<comment_id> \
  -H 'Content-Type: application/json' \
  -d '{
    "comment": {
        "ops": [
            {
                "insert": "edited comment content"
            }
        ]
    },
    "jwt": "jwt"
}'
```

```shell--response
{
  "comment": {
      "comment_realm_id": 1,
      "author_id": 109,
      "body": {
          "ops": [
              {
                  "insert": "hey_edit_2"
              }
          ]
      },
      "edited_at": "2019-10-23T06:22:59.791Z", // edited_at timestamp
      "id": 166,
      "page_id": 1,
      "created_at": "2019-10-21T11:33:28.416Z",
      "parent_comment_id": null,
      "hidden_by_id": null,
      "hidden_at": null,
      "deleted_by_id": null,
      "deleted_at": null,
      "reactions": {},
      "is_spam": false,
      "is_published": true,
      "toxicity": 0.0,
      "page_url": "http://localhost:3000/iframe-test-widget",
      "hero_image_url": null,
      "headline": null,
      "hidden": false,
      "deleted": false,
      "realm_comment_count": 121,
      "author": {
          "id": 109,
          "name": "bat",
          "avatar": null,
          "guest": false,
          "bio": "",
          "slug": "karthik-2",
          "accounts": []
      },
      "mentions": []
  }
}
```

This endpoint is used to edit an existing comment.

For reference of comment response structure check [here] (#api-response-reference)

### Comment POST(hide)

```shell--request
curl -X POST \
  https://www.metype.com/api/v1/accounts/<account_id>/pages/<page_id>/comments/<comment_id/hide \
  -H 'Content-Type: application/json' \
  -d '{
    "jwt": "jwt"
}'
```

```shell--response
{
    "comment": {
        "comment_realm_id": 1,
        "hidden_at": "2019-10-23T09:16:17.122Z", // hidden_at time stamp
        "hidden_by_id": 109, // hidden_by user_id
        "id": 166, // comment_id
        "page_id": 1,
        "created_at": "2019-10-21T11:33:28.416Z",
        "parent_comment_id": null,
        "deleted_at": null,
        "reactions": {},
        "is_spam": false,
        "is_published": true,
        "page_url": "http://localhost:3000/iframe-test-widget",
        "hero_image_url": null,
        "headline": null,
        "hidden": true,
        "deleted": false,
        "realm_comment_count": 121
    }
}
```

This endpoint is used to hide an existing comment.

In the response `hidden`, `hidden_at` are the keys of importance here.


### Comment POST(reply)
```shell--request
curl -X POST \
  http://localhost:3000/api/v1/accounts/<account_id>/pages/<page_id>/comments.json \
  -H 'Content-Type: application/json' \
  -d '{
    "comment": {
        "parent_comment_id": <comment_id>,
        "body": {
            "ops": [
                {
                    "attributes": {
                        "mention": {
                            "name": "batman",
                            "slug": "batman",
                            "avatar": "https://www.google.com/avatar",
                            "id": "1",
                            "target": "_blank",
                            "end-point": "undefined",
                            "class": "custom-em"
                        },
                        "link": "batman"
                    },
                    "insert": {
                        "mentions": true
                    }
                },
                {
                    "insert": "Hey"
                }
            ]
        }
    },
    "jwt": "jwt"
}'
```

```shell--response
{
    "total_count": 124,
    "comment": {
        "id": 169,
        "comment_realm_id": 1,
        "page_id": 1,
        "body": {
            "ops": [
                {
                    "attributes": {
                        "mention": {
                            "name": "batman",
                            "slug": "batman",
                            "avatar": https://www.google.com/avatarg/s50/photo.jpg",
                            "id": "1",
                            "target": "_blank",
                            "end-point": "undefined",
                            "class": "custom-em"
                        },
                        "link": "batman"
                    },
                    "insert": {
                        "mentions": true
                    }
                },
                {
                    "insert": "Hey yo\n"
                }
            ]
        },
        "created_at": "2019-10-23T10:23:22.678Z",
        "parent_comment_id": 167, // presence of parent_comment_id indicates the thread this belongs
        "author_id": 109,
        "hidden_by_id": null,
        "hidden_at": null,
        "deleted_by_id": null,
        "deleted_at": null,
        "reactions": {},
        "edited_at": null,
        "is_spam": false,
        "is_published": true,
        "toxicity": 0.0,
        "page_url": "http://localhost:3000/iframe-test-widget",
        "hero_image_url": null,
        "headline": null,
        "hidden": false,
        "deleted": false,
        "realm_comment_count": 124,
        "author": {
            "name": "bat",
            "avatar": null,
            "id": 109,
            "slug": "karthik-2",
            "guest": false,
            "bio": "",
            "accounts": []
        },
        "mentions": [ // mentions in a comment this is used to show the user profile
            {
                "id": 1,
                "name": "batman",
                "avatar": "https://www.google.com/avatar",
                "guest": false,
                "bio": "",
                "slug": "batman",
                "accounts": [ // account which is owned by this particular user.
                    2
                ]
            }
        ]
    },
    "total_parent_comments_count": 117
}
```

This endpoint is not too different from `comment_creation` API. It is comment creation API with additional value of `parent_comment_id`.

### GET comments

```shell--request
curl -X GET \
  'https://www.metype.com/api/v1/accounts/<accout_id>/pages/<page_id>/comments.json?parent_comments_limit=1&parent_comments_offset=0&sort_order=desc&child_comments_sort_order=asc'
```

```shell--response
{
    "total_count": 133,
    "comment_channel": "comments-EA",
    "comments": [
        {
            "id": 178,
            "comment_realm_id": 1,
            "page_id": 1,
            "body": {
                "ops": [
                    {
                        "insert": "e\n"
                    }
                ]
            },
            "created_at": "2019-10-25T06:43:17.193Z",
            "parent_comment_id": null,
            "author_id": 109,
            "hidden_by_id": null,
            "hidden_at": null,
            "deleted_by_id": null,
            "deleted_at": null,
            "reactions": {},
            "edited_at": null,
            "is_spam": false,
            "is_published": true,
            "toxicity": 0.0,
            "page_url": "http://localhost:3000/iframe-test-widget",
            "hero_image_url": null,
            "headline": null,
            "hidden": false,
            "deleted": false,
            "realm_comment_count": 133,
            "author": {
                "id": 109,
                "name": "bat",
                "avatar": null,
                "guest": false,
                "bio": "",
                "slug": "karthik-2",
                "accounts": []
            },
            "mentions": []
        }
    ],
    "total_parent_comments_count": 125
}
```

Supported parameters

Name | type | description
-----|------|------------
parent_comments_limit | integer | Number of main comments/threads to fetch in the API.
parent_comments_offset | integer | The offset of the parent comments.
sort_order | string | `desc` when latest parent comments should be fetched and `asc` for the other way round.
child_comments_sort_order | string | `desc` when latest child comments should be fetched and `asc` for the other way round.

`parent_comments_limit` value should be equal to `initial_load_comments_limit` that's available in config API.


## Account Config

### GET
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
      ],
      "confidential_commenting": false,
      "guest_contributions": false,
      "comment_reactions": [
        {
            "id": 39,
            "label": "Like",
            "custom": false,
            "short_code": null
        }
      ],
      "page_reactions": [
        {
            "id": 10,
            "label": "100%",
            "custom": false,
            "short_code": ":100:"
        },
        {
            "id": 11,
            "label": "Celebrate",
            "custom": false,
            "short_code": ":tada:"
        },
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
| confidential_commenting |boolean| indicates if confidential commenting can be allowed while posting a comment|
| guest_contributions |string| indicates if guest contributions are allowed in feed/widget|
| comment_reactions | array of objects | array of reactions |
| page_reactions | array of objects | array of reactions |

Reaction object in comment reactions, page reactions is explained here:

|key|type|description|
|--|--|--|
|id|integer|Unique id account's reaction|
|label|string|Display label of the reaction|
|custom|boolean|indicates if the reaction is custom or not|
|short_code|string|short code for the emoji that can be translated to unicode|


Key points that needs your attention:

1. When `prevent_profane_comment` is true and `pre_moderate_profane_comment` is false, the comment should not be posted when any of the `prohibited_words` are part of the comment.
2. When `prevent_profane_comment` is true and `pre_moderate_profane_comment` is true or when only `pre_moderate_profane_comment` is true the comment can be posted and backend will take care of pre-moderation.
3. Colours that are returned in the config API are hex strings and by defaults we return default values.
4. There is no option to choose colors using UI but our backend supports the feature. If you need changes on these please reach out to us at `metype@quintype.com`

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

Contributions allow metype users to create user generated content, which is pushed to the account's Quintype CMS.


### Contribution Terminology

```js
let html = "<p>sample text</p>";
let encodedHtml = btoa(encodeURIComponent(html))
```

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

When you want to create a contribution these are the two things that are needed:

1. Base64 URI encoded string of html(Ex: Find it under JS tab on the right).

2. A JSON object in a particular format(Ex: Find it under JSON tab on the right).

### Create contribution

```shell--request
curl -X POST \
  'https://www.metype.com/api/v1/accounts/<account_id>/contributions?jwt=jwt' \
  -H 'Content-Type: application/json' \
  -H 'Origin: http://localhost:3000' \
  -d '{
    "contribution": {
        "headline": "title",
        "html": "JTNDcCUzRXNhbXBsZSUyMHRleHQlM0MlMkZwJTNF", // base64 URI encoded html
        "body": {
            "ops": [
                {
                    "insert": "story"
                }
            ]
        },
        "contributor_details": {
            "name": "name",
            "email": "a@b.com",
            "phone": "929292022",
            "bio": "bio"
        }
    }
}'
```

```shell--response
{
    "contribution": {
        "id": 12,
        "story": "<p>sample text</p>",
        "user_id": 109,
        "account_id": 2,
        "body": {
            "ops": [
                {
                    "insert": "story"
                }
            ]
        },
        "headline": "title",
        "created_at": "2019-10-22T11:25:06.920Z",
        "updated_at": "2019-10-22T11:25:06.920Z",
        "contributor_details": {
            "name": "name",
            "email": "a@b.com",
            "phone": "929292022",
            "bio": "bio"
        }
    },
    "message": "Success"
}
```
* This endpoint is used to create a contribution.
* Contributions API is supported for accounts who can use 3rd party login and need to disable guest contribution in metype [admin panel](https://www.metype.com/admin) .
* To implement and generate JWT check the documentation [here](#third-party-login)

<aside class="notice">
Currently this is a feature useful to content sites powered by Quintype.
</aside>



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
