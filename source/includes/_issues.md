# Issues

## GET all Issues in your project

This endpoint retrieves all Issues.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues.json`

### Query Parameters - [pagination](#pagination)

Parameters* | Description |
--------- | ------- |
filter-id | the Issues filter id -> showing Issues that are in this filter |
filter-user-id | if filter uses current_user criteria in it, you should provide which is the this user ([list of user ids](#users)) |
display-ids | filter Issues with display-ids (separated by commas) |
title_exact | filter by Issue name exact match; case sensitive! |
title_like | filter by Issue name: case insensitive, phrase can be inside the name |
show_tags=true | showing tags|


* none of the parameters are required. If you combine multiple parameters, it will do AND
You can see examples in the dark area to the right.

```shell
# Some request examples:

# Get all issues of project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/issues.json

# Get all issues of project #4566, where filter-id is 323 and title is like login
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/issues.json?filter-id=323&title_like=login

# Get all issues with display ids 2,4 from project #4566
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/issues.json?display-ids=2,4

```

> This command: https://api.practitest.com/api/v2/projects/4566/issues.json?api_token=xx&developer_email=admin%40pt.com&page[number]=1&page[size]=2", returns JSON structured like below:


```json
{
  "data": [
    {
      "id": "1850360",
      "type": "issues",
      "attributes": {
        "project-id": 1230,
        "display-id": 205,
        "title": "first name",
        "instances-count": 0,
        "run-status": "FAILED",
        "last-run": "2017-01-27T13:35:25+00:00",
        "assigned-to-id": null,
        "planned-execution": null,
        "version": null,
        "priority": null,
        "custom-fields": {
        "---f-8282": "High",
        },
        "folder-id": null,
        "created-at": "2017-01-27T12:19:46+00:00",
        "updated-at": "2017-01-27T12:24:07+00:00"
    }
  }
  ],
  "links": {
    "self": "https://api.practitest.com/api/v2/projects/1282/issues.json?api_token=YOUR_TOKEN
YOUR_TOKEN&developer_email=your_EMAIL&name_like=Issuer3&page%5Bnumber%5D=1&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530",
    "next": "https://api.practitest.com/api/v2/projects/1282/issues.json?api_token=YOUR_TOKEN&developer_email=your_EMAIL&title_like=Issuer3&page%5Bnumber%5D=2&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530",
    "last": "https://api.practitest.com/api/v2/projects/1282/issues.json?api_token=YOUR_TOKEN&developer_email=your_EMAIL&title_like=Issuer3&page%5Bnumber%5D=3&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530"
  },
  "meta": {
    "current-page": 1,
    "next-page": 2,
    "prev-page": null,
    "total-pages": 5,
    "total-count": 13
  }
}
```


## Create an Issue

This endpoint creates an Issue in your project.

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues.json`

Parameters | Description | required? |
--------- | ------- |------- |
data/attributes/title | name | true |
data/attributes/description | description | false |
data/attributes/author-id | user-id of author | true |
data/attributes/assigned-to-id | user id of assigned-to user (not Display ID) - [users list](#users)  | false |
data/attributes/version | string of the issue's version | false |
data/attributes/priority | string of the issue's priority | false |
data/attributes/custom-fields | a hash of custom-fields with their value | false |
data/attributes/issue-type | issue type | false |
data/attributes/tags | an array of tags | false |

You can find at the [right area](#create-an-Issue) (shell) an example of the request

```shell
# create an issue
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/issues.json \
-d '{"data": { "type": "issues", "attributes": {"title": "one", "author-id": 4370, "priority": "highest", "custom-fields": { "---f-22": "Windows", "---f-24": ["ClientA", "ClientB"]}}  } }'

# create an issue with description and issue type:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/issues.json \
-d '{"data": { "type": "issues", "attributes": {"title": "TEST Issue", "description": "description", "author-id": 5863, "priority": "2-high", "issue-type": "task"}  } }'
```


## Show a specific Issue

This endpoint shows a specific Issue in your project.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID.json`

Parameters | Description | required? |
--------- | ------- |------- |
show_tags=true | showing tags| false |

Here's the example of the JSON request and response

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/issues/45893.json
```

> This command: https://api.practitest.com/api/v2/projects/4566/issues/45893.json?api_token=YOUR_TOKEN&developer_email=YOUR_EMAIL, returns JSON structured like below:

```json
{
  "data": {
    "id": "1850344",
    "type": "issues",
    "attributes": {
      "project-id": 1230,
      "display-id": 205,
      "title": "first name",
      "instances-count": 0,
      "run-status": "FAILED",
      "last-run": "2017-01-27T13:35:25+00:00",
      "assigned-to-id": null,
      "planned-execution": null,
      "version": null,
      "priority": null,
      "custom-fields": {
      "---f-8282": "High",
      },
      "folder-id": null,
      "created-at": "2017-01-27T12:19:46+00:00",
      "updated-at": "2017-01-27T12:24:07+00:00"
  }
}
}
```


## Update a specific Issue

This endpoint updates a specific Issue.

### HTTP Request

`PUT https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/ISSUE_ID.json`

### Parameters

Available parameters | Description |
--------- | ------- |
data/attributes/title | name | true |
data/attributes/description | description | false |
data/attributes/assigned-to-id | user assigned-to id (not Display ID) - [users list](#users)  | false |
data/attributes/version | string of the issue's version | false |
data/attributes/priority | string of the issue's priority | false |
data/attributes/custom-fields | a hash of custom-fields with their value | false |
data/attributes/issue-type | issue type | false |
data/attributes/tags | an array of tags | false |

You can find at the right area an example of the JSON request and response

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PUT https://api.practitest.com/api/v2/projects/4566/issues/45893.json \
-d '{"data": { "type": "issues", "attributes": {"priority": "highest", "custom-fields": { "---f-22": "Windows", "---f-24": ["ClientA", "ClientB"]}}  } }'

# some more examples:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
-X PUT https://api.practitest.com/api/v2/projects/4566/issues/98019.json \
-d '{"data": { "type": "issues", "attributes": {"priority": "2-high", "version": "1.5", "issue-type": "task" }  } }'


```


```json
{
  "data": {
    "id": "45893",
    "type": "issues",
    "attributes": {
      ...
      "priority": "highest",
      "custom-fields": {
        "---f-22":"my text one",
        "---f-24": ["ClientA", ["ClientB"]]
      },
      ...
      "created-at": "2015-11-17T09:29:22+00:00",
      "updated-at": "2015-11-17T09:29:22+00:00"
    }
  }
}
```

## Delete a specific Issue

This endpoint deletes a specific Issue.

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/issues/YOUR_ISSUE_ID.json`


You can find at the right area an example of the JSON request and response

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/issues/45893.json
```
