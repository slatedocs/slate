# Groups


## GET all groups at your project
```shell
    curl -H "Content-Type: application/json" \
    -u YOUR_EMAIL:YOUR_TOKEN \
    https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/groups.json
```

> This command: https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/groups.json?developer_email=YOUR_EMAIL&api_token=YOUR_TOKEN, <br>
OR <br>
 this command: curl -H "Content-Type:application/json" \
-H "PTToken: YOUR_TOKEN" \
https://api.practitest.com/api/v2/projects/4566/groups.json , <br>
returns JSON structured like below:


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

`https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/groups.json`



### PAT Support
Supported - if the user has the permissions to edit Groups

<aside class="notice">
  Remember, you can see examples in the dark area to the right.
</aside>
