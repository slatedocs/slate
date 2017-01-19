# Custom Fields

## GET all custom fields in your project

This endpoint retrieves all custom fields.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/custom_fields.json`

### Query Parameters - [pagination](#pagination)

Here's the example of the JSON request and response that you may get when submitting a GET request

Remember, you can see examples in the dark area to the right.

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/custom_fields.json
```

> This command: https://api.practitest.com/api/v2/projects/4566/custom_fields.json?api_token=xx&developer_email=admin%40pt.com&page[number]=1&page[size]=2", returns JSON structured like below:

```json
{
  "data": [
    {
      "id": "45916",
      "type": "custom-fields",
      "attributes": {
        "name": "che",
        "field-format": "multilist",
        "project-id": 4566,
        "possible-values": [
          "dog",
          "cat"
        ],
        "parent-list-id": null,
        "possible-values-parent-cf-id": 45911,
        "created-at": "2016-12-19T14:00:45+02:00",
        "updated-at": "2016-12-19T14:00:45+02:00"
      }
    },
    {
      "id": "459187",
      "type": "custom-fields",
      "attributes": {
        "name": "Multilist (Dec 19th)",
        "field-format": "multilist",
        "project-id": 4566,
        "possible-values": [
          "one",
          "two",
          "three"
        ],
        "parent-list-id": null,
        "possible-values-parent-cf-id": null,
        "created-at": "2016-12-19T12:41:51+02:00",
        "updated-at": "2016-12-19T12:41:51+02:00"
      }
    }
  ],
  "links": {
    "self": "https://api.practitest.com/api/v2/projects/4566/custom_fields.json?api_token=a519a5d2ea4fad48e24ae929b03c753c68fb799c&developer_email=christine%40pt.com&page%5Bnumber%5D=1&page%5Bsize%5D=2",
    "next": "https://api.practitest.com/api/v2/projects/4566/custom_fields.json?api_token=a519a5d2ea4fad48e24ae929b03c753c68fb799c&developer_email=christine%40pt.com&page%5Bnumber%5D=2&page%5Bsize%5D=2",
    "last": "https://api.practitest.com/api/v2/projects/4566/custom_fields.json?api_token=a519a5d2ea4fad48e24ae929b03c753c68fb799c&developer_email=christine%40pt.com&page%5Bnumber%5D=19&page%5Bsize%5D=2"
  },
  "meta": {
    "current-page": 1,
    "next-page": 2,
    "prev-page": null,
    "total-pages": 19,
    "total-count": 37
  }
}
```
## GET a specific custom field in your project

This endpoint retrieves a specific custom field.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/custom_fields/YOUR_CUSTOM_FIELD_ID.json`

Here's the example of the JSON request and response that you may get when submitting a GET request

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/custom_fields/45893.json
```

> This command: https://api.practitest.com/api/v2/projects/4566/custom_fields/45893.json?api_token=YOUR_TOKEN&developer_email=YOUR_EMAIL, returns JSON structured like below:

```json
{
  "data": {
    "id": "45893",
    "type": "custom-fields",
    "attributes": {
      "name": "Test API2",
      "field-format": "list",
      "project-id": 4566,
      "possible-values": [
        "one",
        "five"
      ],
      "parent-list-id": null,
      "possible-values-parent-cf-id": null,
      "created-at": "2016-12-08T18:26:54+02:00",
      "updated-at": "2016-12-19T16:53:28+02:00"
    }
  }
}
```
## PUT a specific custom field in your project

This endpoint updates a specific custom field.

### HTTP Request

`PUT https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/custom_fields/YOUR_CUSTOM_FIELD_ID.json`

### Query Parameters - [pagination](#pagination)

Parameter | Description |
--------- | ------- |
name | the name of a custom field |
possible-values | values that can be set for a custom field |
parent-list-id | the id of a parent list that can be set for a "linked list" custom field
possible-values-parent-cf-id | the id of an existing list where you can take values for a custom field

Here's the example of the JSON request and response that you may get when submitting a PUT request

Remember, you can see examples in the dark area to the right.

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PUT https://api.practitest.com/api/v2/projects/4566/custom_fields/45893.json \
-d '{"data": { "type": "custom_fields", "attributes": {"name":"Test API3", "possible-values": ["one","six"]}  } }'
```
> The above command returns JSON structured like below:

```json
{
  "data": {
    "id": "45893",
    "type": "custom-fields",
    "attributes": {
      "name": "Test API3",
      "field-format": "list",
      "project-id": 4566,
      "possible-values": [
        "one",
        "six"
      ],
      "parent-list-id": null,
      "possible-values-parent-cf-id": null,
      "created-at": "2016-12-08T18:26:54+02:00",
      "updated-at": "2016-12-20T14:39:24+02:00"
    }
  }
}
