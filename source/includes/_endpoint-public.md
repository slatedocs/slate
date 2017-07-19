## Public

`/`

`/public/`

```
{
    "views": {
        "signup_resend": "https://app.crunch.io/api/public/signup_resend/",
        "inquire": "https://app.crunch.io/api/public/inquire/",
        "password_reset": "https://app.crunch.io/api/public/password_reset/",
        "signup": "https://app.crunch.io/api/public/signup/",
        "oauth2redirect": "https://app.crunch.io/api/public/oauth2redirect/",
        "change_email": "https://app.crunch.io/api/public/change_email/",
        "login": "https://app.crunch.io/api/public/login/",
        "config": "https://app.crunch.io/api/public/config/",
        "password_change": "https://app.crunch.io/api/public/password_change/"
    }
}
```

### Application configuration

`GET /public/config/`

When accessing Crunch from a configured application via its subdomain:

* https://mycompany.crunch.io/api/public/config/

A GET request on `/public/config/` return a Shoji Entity with the
subdomain's available configurations, if any; if none exists, the body will be empty.


```json
{
    "element": "shoji:entity",
    "body": {
        "name": "Your Company",
        "logo": {
            "small": "https://s.crunch.io/logos/yours_small.png",
            "large": "https://s.crunch.io/logos/yours_large.png"
        },
        "palette": {
            "brand": {
                "primary": "#FFAABB",
                "secondary": "#G4EEBB",
                "message": "#BAA5E7"
            }
        },
        "manifest": {}
    }
}
```

### Crunchbox

A CrunchBox represents a snapshot of a crunch dataset. These snapshots are
intended for public proliferation and therefore the endpoints for interacting with
this data is housed under the unauthed API path.

#### Share

The share endpoint is for retrieving the HTML code for rendering the share page, complete
with the meta data utilized by social sharing platform crawlers in constructing
a share-preview. Among this metadata is a url to a preview image of the rendered crunchbox.

```http
GET /crunchbox/share/ HTTP/1.1
```

Required parameters for this endpoint:

Parameter | Type | Description
----------|------|-------------
data | string | crunchbox widget url (URL encoded)<br>e.g. "https%3A%2F%2Fs.crunch.io%2Fwidget%2Findex.html%23%2Fds%2Fa1b2c3d4e5f6g7h8%2Frow%2F000001%2Fcolumn%2F000000" (the encoded string of "https://s.crunch.io/widget/index.html#/ds/a1b2c3d4e5f6g7h8/row/000001/column/000000")

Optional parameters for this endpoint:

Parameter | Type | Description
----------|------|-------------
ref | string | referring url (URL encoded) to pull content from the referring page for inclusion on the crunchbox share page and provide a link back to the referrer<br>e.g. "http%3A%2F%2Fcrunch.io%2Fcrunching-the-data-of-politics" (the encoded string of "http://crunch.io/crunching-the-data-of-politics")

#### Preview

The preview endpoint is used to preemptively initiate rendering a given crunchbox configuration to a raster image. This image will be requested by social network platform crawlers during construction of the post share preview. The preview-rendering process can be time-consuming. Therefore, it is preferable to initiate it as soon as is reasonable before a request for the image data.

This endpoint returns no data.

```http
POST /crunchbox/preview/ HTTP/1.1
```

Parameter | Type | Description
----------|------|-------------
data | string | crunchbox widget url (URL encoded)<br>e.g. "https%3A%2F%2Fs.crunch.io%2Fwidget%2Findex.html%23%2Fds%2Fa1b2c3d4e5f6g7h8%2Frow%2F000001%2Fcolumn%2F000000" (the encoded string of "https://s.crunch.io/widget/index.html#/ds/a1b2c3d4e5f6g7h8/row/000001/column/000000")
