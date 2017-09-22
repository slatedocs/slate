# Uploads

## Purchase Order Upload

```ruby
require 'rest-client'

RestClient.post(
  'https://app.rubberstamp.io/api/v1/uploads/po',
  {
    po_id: '1',
    uploads_attributes: {
      upload_token: 'myuploadtoken',
      file: 'file upload field value'
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/uploads/po'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "po_id=1"
  -d "uploads_attributes[upload_token]=myuploadtoken"
  -d "uploads_attributes[file]=file upload field value"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "file_file_name": "purchase_order.png",
  "file_content_type": "image/png",
  "url": "https://s3-eu-west-1.amazonaws.com/bucket/uploads/files/000/100/959/original/myAvatar.png?1505993714",
  "upload_token": "myuploadtoken"
}
```

Add upload for Purchase Order, upload it to s3, and then returns the content
in json format.

### HTTP Request

`POST https://app.rubberstamp.io/api/v1/uploads/po`

### URL Parameters

| Params                           | Type    | Description          |
| -----                            | -----   | ------               |
| authentication_token             | header  | Authentication token |
| app_company_id                   | header  | Company ID           |
| po_id                            | integer | Purchase Order ID    |
| uploads_attributes[upload_token] | string  | Upload Token         |
| uploads_attributes[file]         | file    | File field           |


## PO Comment Upload

```ruby
require 'rest-client'

RestClient.post(
  'https://app.rubberstamp.io/api/v1/uploads/poc',
  {
    poc_id: '1',
    uploads_attributes: {
      upload_token: 'myuploadtoken1',
      file: 'file upload field value'
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/uploads/poc'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "poc_id=1"
  -d "uploads_attributes[upload_token]=myuploadtoken1"
  -d "uploads_attributes[file]=file upload field value"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "file_file_name": "purchase_order_comment.png",
  "file_content_type": "image/png",
  "url": "https://s3-eu-west-1.amazonaws.com/bucket/uploads/files/001/100/959/original/myAvatar.png?1505993715",
  "upload_token": "myuploadtoken1"
}
```

Add upload for Purchase Order, upload it to s3, and then returns the content
in json format.

### HTTP Request

`POST https://app.rubberstamp.io/api/v1/uploads/poc`

### URL Parameters

| Params                           | Type    | Description               |
| -----                            | -----   | ------                    |
| authentication_token             | header  | Authentication token      |
| app_company_id                   | header  | Company ID                |
| poc_id                           | integer | Purchase Order Comment ID |
| uploads_attributes[upload_token] | string  | Upload Token              |
| uploads_attributes[file]         | file    | File field                |


## Get Status

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/uploads/status?upload_token=myuploadtoken1',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/uploads/status?upload_token=myuploadtoken1'
  -X GET
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command will returns JSON structured like this:

```json
{
  "id": 1,
  "file_file_name": "purchase_order_comment.png",
  "file_content_type": "image/png",
  "url": "https://s3-eu-west-1.amazonaws.com/bucket/uploads/files/001/100/959/original/myAvatar.png?1505993715",
  "upload_token": "myuploadtoken1"
}
```

Expects `upload_token` to be passed in the url params and return matching upload
object in JSON format.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/uploads/status?upload_token=your token`

### URL Parameters

| Params               | Type   | Description                |
| ------               | ------ | -----------                |
| authentication_token | header | Authentication token       |
| app_company_id       | header | Company ID                 |
| upload_token         | string | Upload Token in url params |

