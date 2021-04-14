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
Shows user's projects inside the account.





## GET all groups at your project
```shell
    curl -H "Content-Type: application/json" \
    -u YOUR_EMAIL:YOUR_TOKEN \
    https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/groups.json
```

> This command: https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/groups.json?developer_email=YOUR_EMAIL&api_token=YOUR_TOKEN, returns JSON structured like below:


```json
{
  "data": [
    {
      "id": "353",
      "type": "groups",
      "attributes": {
        "name": "Administrators",
        "created-at": "2020-12-09T17:00:24+02:00"
      }
    },
    {
      "id": "355",
      "type": "groups",
      "attributes": {
        "name": "Developers",
        "created-at": "2020-12-09T17:00:24+02:00"
      }
    },
    {
      "id": "354",
      "type": "groups",
      "attributes": {
        "name": "Testers",
        "created-at": "2020-12-09T17:00:24+02:00"
      }
    }
  ],
  "links": {},
  "meta": {
    "current-page": 1,
    "next-page": null,
    "prev-page": null,
    "total-pages": 1,
    "total-count": 3
  }
}
```

This endpoint retrieves all groups for specific project.

### HTTP Request

`https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/groups`


<aside class="notice">
  Remember, you can see examples in the dark area to the right.
</aside>
