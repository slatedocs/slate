# Projects

## GET all projects

This endpoint retrieves all projects.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects.json`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page[number] | 1 | the page number starting from 1
page[size] | 100 | number of entities displayed per page

Note: The example query parameters above use unencoded [ and ] characters simply for readability. In practice, these characters must be percent-encoded as page%5Bnumber%5D and page%5Bsize%5D

[Here's](#authentication) the examples of the JSON requests and responses that you may get when submitting a GET request

Remember, you can see examples in the dark area to the right.

### PAT Support
Shows user's projects of the account.



## Show a specific project
```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/22.json
```


> This command returns JSON structured like below:

```json

{
  "data": {
    "id": "22",
    "type": "projects",
    "attributes": {
      "name": "Verticals",
      "created-at": "2021-10-04T12:01:05Z",
      "automation-support": true,
      "enable-delete-issues": false,
      "time-management-support": true
    }
  }
}

```


This endpoint shows a specific project

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/PROJECT_ID.json`
