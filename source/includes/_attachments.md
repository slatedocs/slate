#<a name="attachments-section"></a> Attachments

## Attributes

Attr. name | Constraints
---------- | -----------
url           | The url for the file
small_url     | Only if the file is an image. A version of the attachment scaled to fit 500 x 500 px.
thumbnail_url | Only if the file is an image. A version of the attachment scaled to fit 100 x 100 px.

## Relationships

Relationship name | Constraints
----------------- | -----------
book_entry | REQUIRED when uploading attachments. The invoice, ticket or paysheet that this attachment is related to

## Uploading an attachment

> Example request

```shell
curl "https://getquipu.com/attachments"
  -X POST \
  -H "Authorization: Bearer 4cbc2f18d5e7bcfb44f46c5ed72c5e94fd059f7f4d... " \
  -H "Accept: application/vnd.quipu.v1+json" \
  -F "file=@/path/to/the/file.jpg" \
  -F "book_entry_id=3308976"
```

> Example response

```shell
{
  "data": {
    "id": "2311315",
    "type": "attachments",
    "attributes": {
      "url": "/uploads/book_entry_attachments/2311315-36eb52a2959af9d2dcbddc356549b125/image.png",
      "small_url": "/uploads/book_entry_attachments/2311315-36eb52a2959af9d2dcbddc356549b125/preview_image.png",
      "thumbnail_url": "/uploads/book_entry_attachments/2311315-36eb52a2959af9d2dcbddc356549b125/thumbnail_image.png"
    },
    "relationships": {
      "book_entry": {
        "data": {
          "id": "3308976",
          "type": "invoices"
        }
      }
    }
  }
}
```

`POST /attachments`

<aside class="notice">
  Atention: the <code>Content-Type</code> for the request must be <code>multipart/form-data</code>. The <code>Accept</code> header needs to be like any other call.
</aside>

## Getting an attachment

> Example request

```shell
curl "https://getquipu.com/attachments/2311315" \
  -H "Authorization: Bearer 4cbc2f18d5e7bcfb44f46c5ed72c5e94fd059f7f4d... " \
  -H "Accept: application/vnd.quipu.v1+json"
```

`GET /attachments/:id`

> Example response

```shell
{
  "data": {
    "id": "2311315",
    "type": "attachments",
    "attributes": {
      "url": "/uploads/book_entry_attachments/2311315-36eb52a2959af9d2dcbddc356549b125/image.png",
      "small_url": "/uploads/book_entry_attachments/2311315-36eb52a2959af9d2dcbddc356549b125/preview_image.png",
      "thumbnail_url": "/uploads/book_entry_attachments/2311315-36eb52a2959af9d2dcbddc356549b125/thumbnail_image.png"
    },
    "relationships": {
      "book_entry": {
        "data": {
          "id": "3308976",
          "type": "invoices"
        }
      }
    }
  }
}
```

## Removing an attachment

`DELETE /attachments/:id`

```shell
curl "https://getquipu.com/attachments/2311315" \
  -X DELETE \
  -H "Authorization: Bearer 4cbc2f18d5e7bcfb44f46c5ed72c5e94fd059f7f4d... " \
  -H "Accept: application/vnd.quipu.v1+json"
```
