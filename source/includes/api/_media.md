# Media
The Media resource lets you upload your media files to Bandwidth API servers so they can be used in applications without requiring a separate hosting provider. You can upload files up to `65MB` and file storage is free for an unlimited number of files. Files you upload can only be accessed by you when you supply your API access `token` and `secret`. They are not available to anonymous users. Bandwidth API supports the `Cache-Control` header when you upload files.

<aside class="notice">
You can upload files up to `65MB` and file storage is free for an unlimited number of files.
</aside>

## GET media
Gets a list of your media files. No query parameters are supported.

### Example: List Your Media Files


```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/media \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
client.Media.list()
then(function (media) {
  console.log(media);
});
```

> The above command returns JSON structured like this:

```
[
  {
    "contentLength": 561276,
    "mediaName": "{mediaName1}",
    "content": "api.catapult.inetwork.com/.../media/{mediaName1}"
  },
  {
    "contentLength": 2703360,
    "mediaName": "{mediaName2}",
    "content": "https://api.catapult.inetwork.com/.../media/{mediaName2}"
  },
  {
    "contentLength": 2257901,
    "mediaName": "{mediaName3}",
        "content": "https://api.catapult.inetwork.com/.../media/{mediaName3}"
  }
]
```

## PUT media/{mediaName}
Uploads a file the normal HTTP way. You may add headers to the request in order to provide some control to your media-file.

| Header         | Description                                                                                                                        | Mandatory |
|:---------------|:-----------------------------------------------------------------------------------------------------------------------------------|:----------|
| Content-Length | Indicates the size of the entity-body.                                                                                             | Yes       |
| Cache-Control  | General-header field is used to specify directives that MUST be obeyed by all caching mechanisms along the request/response chain. | No        |
| Content-Type   | The media type of the entity-body.                                                                                                 | No        |

### Example: Upload an MP3 File

## GET media/{mediaName}
Downloads a media file you previously uploaded.

### Example: Download an MP3 File

## DELETE media/{mediaName}
Deletes a media file from Bandwidth API server. Make sure you don't have any application scripts still using the media before you delete. If you accidentally delete a media file, you can immediately upload a new file with the same name.

### Example: Delete an MP3 File
