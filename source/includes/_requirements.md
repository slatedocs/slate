# Requirements

## GET all Requirements in your project
```shell
# Some request examples:

# Get all requirements of project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/requirements.json

# Get all requirements of project #4566, where filter-id is 323 and name is like login
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/requirements.json?filter-id=323&name_like=login

# Get all Requirements with display ids 2,4 from project #4566
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/requirements.json?display-ids=2,4

# Get all requirements of project #4566 with linked entities
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/requirements.json?relationships=true

```

> This command: https://api.practitest.com/api/v2/projects/4566/requirements.json?api_token=xx&developer_email=admin%40pt.com&page[number]=1&page[size]=2", returns JSON structured like below:


```json
{
  "data": [
    {
      "id": "1850360",
      "type": "requirements",
      "attributes": {
        "project-id": 1230,
        "display-id": 205,
        "name": "first name",
        "instances-count": 0,
        "run-status": "FAILED",
        "last-run": "2017-01-27T13:35:25+00:00",
        "assigned-to-id": null,
        "assigned-to-type": null,
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
    "self": "https://api.practitest.com/api/v2/projects/1282/requirements.json?api_token=YOUR_TOKEN
YOUR_TOKEN&developer_email=your_EMAIL&name_like=Issuer3&page%5Bnumber%5D=1&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530",
    "next": "https://api.practitest.com/api/v2/projects/1282/requirements.json?api_token=YOUR_TOKEN&developer_email=your_EMAIL&name_like=Issuer3&page%5Bnumber%5D=2&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530",
    "last": "https://api.practitest.com/api/v2/projects/1282/requirements.json?api_token=YOUR_TOKEN&developer_email=your_EMAIL&name_like=Issuer3&page%5Bnumber%5D=3&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530"
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

This endpoint retrieves all Requirements.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements.json`

### Query Parameters - [pagination](#pagination)

Parameters* | Description |
--------- | ------- |
filter-id | the Requirement's filter id -> showing requirements that are in this filter |
autofilter-value | if filter is an auto-filter, you can provide the 1st level filter value |
sub-autofilter-value | if filter is a 2-level auto-filter, and you provided the 1st level autofilter-value, you can provide the 2nd level filter value |
filter-user-id | if filter uses current_user criteria in it, you should provide which is the this user ([list of user ids](#users)) |
display-ids | filter Requirements with display-ids (separated by commas) |
name_exact | filter by Requirement name exact match; case sensitive! |
name_like | filter by Requirement name: case insensitive, phrase can be inside the name |
relationships | shows entities linked to requirements, should be equal to true  |


* none of the parameters are required. If you combine multiple parameters, it will do AND
You can see examples in the dark area to the right.

### PAT Support
Supported - if the user has the permissions to view Requirements


## Create a Requirement

```shell
# create a Requirement
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/requirements.json \
-d '{"data": { "type": "requirements", "attributes": {"name": "one", "author-id": 4370, "priority": "highest", "custom-fields": { "---f-22": "Windows", "---f-24": ["ClientA", "ClientB"]}}  } }'

# create a Requirement with 2 test-ids:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/requirements.json \
-d '{"data": { "type": "requirements", "attributes": {"name": "one", "author-id": 4370, "priority": "highest"}, "traceability": {"test-ids": [32222,53333]} }}'
```

This endpoint creates a Requirement in your project.

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements.json`

Parameters | Description | required? |
--------- | ------- |------- |
data/attributes/name | name | true |
data/attributes/description | description | false |
data/attributes/author-id | user-id of author | true (unless using PAT) |
data/attributes/assigned-to-id | user or group assigned-to id (not Display ID) - [users list](#users) [groups list](#get-all-groups-at-your-project) | false |
data/attributes/assigned-to-type | assigned-to type (user or group) | false |
data/attributes/version | string of the requirement's version | false |
data/attributes/priority | string of the requirement's priority | false |
data/attributes/custom-fields | a hash of custom-fields with their value | false |
data/attributes/parent-id | a parent's requirement id  | false |
data/traceability/test-ids | an array of test-ids to add to the traceability of the new requirement | false |
data/attributes/tags | an array of tags | false |

* For more information about assigned-to-id and assigned-to-type, refer to [Assigned To](#assigned-to)


You can find at the [right area](#create-a-Requirement) (shell) an example of the request

### PAT Support
Supported - if the user has the permissions to create a Requirement (Requirements - Editor)

The "author-id" parameter is not required, and can only be used (and override PAT user) if it has "impersonation" enabled

## Show a specific Requirement
```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/requirements/45893.json
```

> This command: https://api.practitest.com/api/v2/projects/4566/requirements/45893.json?api_token=YOUR_TOKEN&developer_email=YOUR_EMAIL, returns JSON structured like below:

```json
{
  "data": {
    "id": "1850344",
    "type": "requirements",
    "attributes": {
      "project-id": 1230,
      "display-id": 205,
      "name": "first name",
      "instances-count": 0,
      "run-status": "FAILED",
      "last-run": "2017-01-27T13:35:25+00:00",
      "assigned-to-id": null,
      "assigned-to-type": null,
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

This endpoint shows a specific Requirement in your project.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID.json`

Here's the example of the JSON request and response

Parameters* | Description |
--------- | ------- |
relationships | shows entities linked to requirements, should be equal to true  |

* none of the parameters are required.

### PAT Support
Supported - if the user has the permissions to view Requirements

## Update a specific Requirement

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PUT https://api.practitest.com/api/v2/projects/4566/requirements/45893.json \
-d '{"data": { "type": "requirements", "attributes": {"priority": "highest", "custom-fields": { "---f-22": "Windows", "---f-24": ["ClientA", "ClientB"]}}  } }'

# some more examples:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
-X PUT https://api.practitest.com/api/v2/projects/4566/requirements/98019.json \
-d '{"data": { "type": "requirements", "attributes": {"parent-id": 32213, "priority": "2-high", "version": "1.5", "custom-fields": { "---f-45510": "5381"}}  } }'

curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
-X PUT https://api.practitest.com/api/v2/projects/4566/requirements/98019.json \
-d '{"data": { "type": "requirements", "attributes": {"version": "1.5", "custom-fields": { "---f-45390": "Chrome"}}  } }'
```

```json
{
  "data": {
    "id": "45893",
    "type": "requirements",
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

This endpoint updates a specific Requirement.

### HTTP Request

`PUT https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/REQUIREMENT_ID.json`

### Parameters

Available parameters | Description |
--------- | ------- |
data/attributes/name | name | true |
data/attributes/description | description | false |
data/attributes/assigned-to-id | user or group assigned-to id (not Display ID) - [users list](#users) [groups list](#get-all-groups-at-your-project) | false |
data/attributes/assigned-to-type | assigned-to type (user or group) | false |
data/attributes/version | string of the requirement's version | false |
data/attributes/priority | string of the requirement's priority | false |
data/attributes/custom-fields | a hash of custom-fields with their value | false |
data/attributes/parent-id | a parent's requirement id  | false |
data/attributes/tags | an array of tags | false |
data/attributes/updated-by-user-id | ID (not Display ID) of the user who made a change - [users list](#users) | false |

* updated-by-user-id parameter allows to see changes made via API in history tabs of requirements
* For more information about assigned-to-id and assigned-to-type, refer to [Assigned To](#assigned-to)


You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit a Requirements (Requirements - Editor)

History of a change by PAT user will be created automatically.

The "updated-by-user-id" parameter can only be used (and override PAT user) if it has "impersonation" enabled.


## Delete a specific Requirement
```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/requirements/45893.json
```
This endpoint deletes a specific Requirement.

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/requirements/YOUR_REQUIREMENT_ID.json`


You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to delete Requirements
