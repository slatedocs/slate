# Users Projects

<aside class="notice">
  Available for Ultimate accounts only
</aside>



## GET List all projects the user has access to
```shell
curl -H "Content-Type: application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
https://api.practitest.com/api/v2/users/USER_ID/projects.json
# IS THE SAME AS:
curl -H "Content-Type: application/json" \
https://api.practitest.com/api/v2/users/USER_ID/projects.json?developer_email=YOUR_EMAIL&api_token=YOUR_TOKEN
```



> This command returns JSON structured like below:

```json
{
  "data": [
    {
      "id": "2",
      "type": "projects",
      "attributes": {
        "name": "jira cloud",
        "created-at": "2019-04-18T14:03:38Z",
        "automation-support": false,
        "enable-delete-issues": false,
        "time-management-support": true,
        "groups": [
          {
            "id": 5,
            "name": "Administrators"
          }
        ]
      }
    }
  ],
  "links": {
    "self": "http://localhost:3000/api/v2/users/2/projects.json?page%5Bnumber%5D=1&page%5Bsize%5D=100",
    "first": "http://localhost:3000/api/v2/users/2/projects.json?page%5Bnumber%5D=1&page%5Bsize%5D=100",
    "prev": null,
    "next": null,
    "last": "http://localhost:3000/api/v2/users/2/projects.json?page%5Bnumber%5D=1&page%5Bsize%5D=100"
  },
  "meta": {
    "current-page": 1,
    "next-page": null,
    "prev-page": null,
    "total-pages": 1,
    "total-count": 1
  }
}
```
<aside class="notice">
  Available for Ultimate accounts only
</aside>

This endpoint retrieves all projects that the user has access to.

### HTTP Request

`https://api.practitest.com/api/v2/users/USER_ID/projects.json`

### Query Parameters - [pagination](#pagination)

Here's the examples of the JSON requests and response that you may get when submitting a GET request




## Update a user project (add user access to specific project and group)

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PUT https://api.practitest.com/api/v2/users/USER_ID/projects.json
-d '{"data": {"projects": [{"id": 2, "groups": [{"id": 5}]}]}}'

```

<aside class="notice">
  Available for Ultimate accounts only
</aside>


Add access to specific project and group.

Adds the user to groups of a project. Multiple projects and multiple groups can be specified.
All projects you want to give this user access to should be specified. If the user had access to projects A and B and you call this endpoint again with only project B, access to A will be revoked.

### HTTP Request

`PUT https://api.practitest.com/api/v2/users/USER_ID/groups.json`

### Parameters

Parameters | Description | required? |
--------- | ------- |------- |
data/projects |An array of projects ids and groups ids for each | true |

projects and groups array - for example: `[{"id": 2, "groups": [{"id": 5}, {"id": 6}]}, {"id": 4, "groups": [{"id": 11}]}]` - means -> add the user to project #2 and groups #5 and #6, in addition add the user to project #4 and to group #11


## Delete a user projects (revoke access)

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/users/USER_ID/projects.json
```

<aside class="notice">
  Available for Ultimate accounts only
</aside>

Revokes access to all project for specific user.

### HTTP Request

`DELETE https://api.practitest.com/api/v2/users/USER_ID/projects.json`
