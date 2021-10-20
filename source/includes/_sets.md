# TestSets

## GET all TestSets in your project
```shell
# Some request examples:

# Get all sets of project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/sets.json

# Get all sets of project #4566, where filter-id is 323 and name is like login
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/sets.json?filter-id=323&name_like=login

# Get all TestSets with display ids 2,4 from project #4566
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/sets.json?display-ids=2,4

```

> This command: https://api.practitest.com/api/v2/projects/4566/sets.json?api_token=xx&developer_email=admin%40pt.com&page[number]=1&page[size]=2", returns JSON structured like below:

```json
{
  "data": [
    {
      "id": "1850360",
      "type": "sets",
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
    "self": "https://api.practitest.com/api/v2/projects/1282/sets.json?api_token=YOUR_TOKEN
YOUR_TOKEN&developer_email=your_EMAIL&name_like=Issuer3&page%5Bnumber%5D=1&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530",
    "next": "https://api.practitest.com/api/v2/projects/1282/sets.json?api_token=YOUR_TOKEN&developer_email=your_EMAIL&name_like=Issuer3&page%5Bnumber%5D=2&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530",
    "last": "https://api.practitest.com/api/v2/projects/1282/sets.json?api_token=YOUR_TOKEN&developer_email=your_EMAIL&name_like=Issuer3&page%5Bnumber%5D=3&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530"
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
This endpoint retrieves all TestSets.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/sets.json`

### Query Parameters - [pagination](#pagination)

Parameters* | Description |
--------- | ------- |
filter-id | the TestSet's filter id -> showing TestSets that are in this filter |
filter-user-id | if filter uses current_user criteria in it, you should provide which is the this user ([list of user ids](#users)) |
display-ids | filter TestSets with display-ids (separated by commas) |
name_exact | filter by TestSet name exact match; case sensitive! |
name_like | filter by TestSet name: case insensitive, phrase can be inside the name |


* none of the parameters are required. If you combine multiple parameters, it will do AND
You can see examples in the dark area to the right.

### PAT Support
Supported - if the user has the permissions to view Runs / TestSets


## Create a TestSet
```shell
# create a Test Set
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/sets.json \
-d '{"data": { "type": "sets", "attributes": {"name": "one", "priority": "highest", "custom-fields": { "---f-22": "Windows", "---f-24": ["ClientA", "ClientB"]}}  } }'

# create a Test Set with 2 test-ids to become instances:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/sets.json \
-d '{"data": { "type": "sets", "attributes": {"name": "one", "priority": "highest"}, "instances": {"test-ids": [32222,53333]} }}'
```
This endpoint creates a TestSet in your project.

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/sets.json`

### Parameters

Parameters | Description | required? |
--------- | ------- |------- |
data/attributes/name | name | true |
data/attributes/assigned-to-id | user or group assigned-to id (not Display ID) - [users list](#users) [groups list](#get-all-groups-at-your-project) | false |
data/attributes/author-id | author user id (not Display ID) - [users list](#users) | false |
data/attributes/assigned-to-type | assigned-to type (user or group) | false |
data/attributes/planned-execution | date field of planned-execution | false |
data/attributes/status | string of status (not run status) | false |
data/attributes/version | string of TestSet version | false |
data/attributes/priority | string of TestSet priority | false |
data/attributes/custom-fields | a hash of custom-fields with their value | false |
data/instances/test-ids | an array of test-ids to add as instances to the new TestSet | false |
data/attributes/tags | an array of tags | false |

* To update / view and delete instances, refer to [instances resource](#instances)
* For more information about assigned-to-id and assigned-to-type, refer to [Assigned To](#assigned-to)


You can find at the [right area](#create-a-Test-Set) (shell) an example of the request

### PAT Support
Supported - if the user has the permissions to run Tests, view and edit Instances / TestSets


## Show a specific TestSet

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/sets/45893.json
```

> This command: https://api.practitest.com/api/v2/projects/4566/sets/45893.json?api_token=YOUR_TOKEN&developer_email=YOUR_EMAIL, returns JSON structured like below:

```json
{
  "data": {
    "id": "1850344",
    "type": "sets",
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

This endpoint shows a specific TestSet in your project.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/sets/YOUR_SET_ID.json`

Here's the example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to view Runs / TestSets


## Update a specific TestSet

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PUT https://api.practitest.com/api/v2/projects/4566/sets/45893.json \
-d '{"data": { "type": "sets", "attributes": {"planned-execution":"2017-03-01T12:43:31Z", "priority": "highest", "custom-fields": { "---f-22": "Windows", "---f-24": ["ClientA", "ClientB"]}}  } }'

# some more examples:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
-X PUT https://api.practitest.com/api/v2/projects/4566/sets/98019.json \
-d '{"data": { "type": "sets", "attributes": {"planned-execution":"2017-03-05T12:43:31Z", "priority": "2-high", "version": "1.5", "custom-fields": { "---f-45510": "5381"}}  } }'

curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
-X PUT https://api.practitest.com/api/v2/projects/4566/sets/98019.json \
-d '{"data": { "type": "sets", "attributes": {"version": "1.5", "custom-fields": { "---f-45390": "Chrome"}}  } }'

```

```json
{
  "data": {
    "id": "45893",
    "type": "sets",
    "attributes": {
      ...
      "planned-execution": "2017-03-01T12:43:31Z",
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
This endpoint updates a specific TestSet.

### HTTP Request

`PUT https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/sets/SET_ID.json`

### Parameters

Available parameters | Description |
--------- | ------- |
data/attributes/name | name |
data/attributes/assigned-to-id | user or group assigned-to id (not Display ID) - [users list](#users) [groups list](#get-all-groups-at-your-project) | false |
data/attributes/assigned-to-type | assigned-to type (user or group) | false |
data/attributes/planned-execution | date field of planned-execution |
data/attributes/version | string of TestSet version |
data/attributes/priority | string of TestSet priority |
data/attributes/custom-fields | a hash of custom-fields with their value |
data/attributes/tags | an array of tags | false |

* For more information about assigned-to-id and assigned-to-type, refer to [Assigned To](#assigned-to)


You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to run Tests, view and edit Instances / TestSets


## Delete a specific TestSet

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/sets/45893.json
```
This endpoint deletes a specific TestSet.

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/sets/YOUR_SET_ID.json`


You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to delete Instances / TestSets (Runs - Admin)


## Clone a TestSet
```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/sets/45893/clone.json \
-d '{"data": { "type": "sets", "attributes": {"name": "my new cloned TestSet", "planned-execution":"2017-03-01T12:43:31Z", "priority": "highest", "custom-fields": { "---f-8282": "High", "---f-24": ["ClientA", "ClientB"]}}  } }'
```

```json
{
  "data": {
    "id": "1850344",
    "type": "sets",
    "attributes": {
      "project-id": 1230,
      "display-id": 205,
      "name": "my new cloned testSset",
      "instances-count": 5,
      "run-status": "NO RUN",
      "last-run": null,
      "assigned-to-id": null,
      "assigned-to-type": null,
      "planned-execution": "2017-03-01T12:43:31Z",
      "version": null,
      "priority": "highest",
      "custom-fields": {
        "---f-8282": "High",
        "---f-24": ["ClientA", "ClientB"]
      },
      "folder-id": null,
      "created-at": "2017-01-27T12:19:46+00:00",
      "updated-at": "2017-01-27T12:24:07+00:00"
    }
  }
}
```

This clones a single TestSet, with new empty instances. Additional parameters can be applied if you need to change attributes

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/sets/SET_ID/clone.json`

### Parameters

Available parameters | Description |
--------- | ------- |
data/attributes/name | name |
data/attributes/assigned-to-id | user or group assigned-to id (not Display ID) - [users list](#users) [groups list](#get-all-groups-at-your-project) | false |
data/attributes/assigned-to-type | assigned-to type (user or group) | false |
data/attributes/planned-execution | date field of planned-execution |
data/attributes/version | string of TestSet version |
data/attributes/priority | string of TestSet priority |
data/attributes/custom-fields | a hash of custom-fields with their value |
data/attributes/tags | an array of tags | false |

* * For more information about assigned-to-id and assigned-to-type, refer to [Assigned To](#assigned-to)


You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to run Tests, view and edit Instances / TestSets
