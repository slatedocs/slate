# Instances

## GET all instances in your project

```shell
# Some request examples:

# Get all instances of project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/instances.json

# Get all instances of project #4566, where TestSet filter-id is 323 and Instance name is like login
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/instances.json?set-filter-id=323&name_like=login

# Get all instances of project #4566, of Test-ids 1111 where they belong to TestSets 32321 or 223254
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/instances.json?test-ids=1111&set-ids=32321,223254

# Get all instances of project #4566, of Test display ids 1,2,3
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/instances.json?test-display-ids=1,2,3

```

> This command: https://api.practitest.com/api/v2/projects/4566/instances.json?api_token=xx&developer_email=admin%40pt.com&page[number]=1&page[size]=2", returns JSON structured like below:

```json
{
  "data": [
    {
      "id": "1850360",
      "type": "instances",
      "attributes": {
        "name": "User login",
        "project-id": 1282,
        "set-id": 96530,
        "set-display-id": 117,
        "test-id": 369093,
        "test-display-id": 2372,
        "custom-fields": {
          "---f-2640": "my text one",
          "---f-2641": ["foo0"]
        },
        "display-id": "117:19",
        "tester-id": 4825,
        "priority": null,
        "last-run-duration": "00:00:00",
        "last-run": "2015-11-18T07:46:57+00:00",
        "run-status": "PASSED",
        "planned-execution": null,
        "version": null,
        "assigned-to-id": null,
        "assigned-to-type": null,
        "created-at": "2015-11-17T09:29:22+00:00",
        "updated-at": "2015-11-17T09:29:22+00:00"
      }
    },
    {
      "id": "1850361",
      "type": "instances",
      "attributes": {
        "name": "User delete",
        "project-id": 1282,
        "set-id": 96530,
        "set-display-id": 117,
        "test-id": 369094,
        "test-display-id": 2373,
        "custom-fields": {},
        "display-id": "117:20",
        "tester-id": 4825,
        "priority": null,
        "last-run-duration": "00:00:00",
        "last-run": "2015-11-19T04:42:30+00:00",
        "run-status": "PASSED",
        "planned-execution": null,
        "version": null,
        "assigned-to-id": null,
        "assigned-to-type": null,
        "created-at": "2015-11-17T09:29:22+00:00",
        "updated-at": "2015-11-17T09:29:22+00:00"
      }
    }
  ],
  "links": {
    "self": "https://api.practitest.com/api/v2/projects/1282/instances.json?api_token=b28a2be5e18491c7779e224ac60c4f815407d923&developer_email=dkd%40dkd.com&name_like=Issuer3&page%5Bnumber%5D=1&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530",
    "next": "https://api.practitest.com/api/v2/projects/1282/instances.json?api_token=b28a2be5e18491c7779e224ac60c4f815407d923&developer_email=dkd%40dkd.com&name_like=Issuer3&page%5Bnumber%5D=2&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530",
    "last": "https://api.practitest.com/api/v2/projects/1282/instances.json?api_token=b28a2be5e18491c7779e224ac60c4f815407d923&developer_email=dkd%40dkd.com&name_like=Issuer3&page%5Bnumber%5D=3&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530"
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

This endpoint retrieves all instances.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/instances.json`

### Query Parameters - [pagination](#pagination)

Parameters* | Description |
--------- | ------- |
set-filter-id | the testSet's filter id -> showing instances of TestSets which are in this filter |
set-filter-user-id | if filter uses current_user criteria in it, you should provide which is the this user ([list of user ids](#users)) |
test-ids | filter instances that are related to a certain test_id (NOT display-id!) |
set-ids | filter by TestSets ids, separated by comma (system-id) |
name_exact | filter by instance name exact match; case sensitive! |
name_like | filter by instance name: case insensitive, phrase can be inside the name |
display-id | filter instances based on an instance display-id (can be used to convert display to system id) |
test-display-ids | filter instances based on a certain or multiple Test display-ids (comma separated) |

* none of the parameters are required. If you combine multiple parameters, it will do AND
You can see examples in the dark area to the right.

### PAT Support
Supported - if the user has the permissions to view runs / instances


## Create an instance

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/instances.json \
-d '{"data": { "type": "instances", "attributes": {"test-id": 233, "set-id": 33, "priority": "highest", "custom-fields": { "---f-22": "Windows", "---f-24": ["ClientA", "ClientB"]}}  } }'

# example with creating multiple instances
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4520/instances.json \
-d '{"data": [{ "type": "instances", "attributes": {"test-id": 72926, "set-id": 22140}}, { "type": "instances", "attributes": {"test-id": 72927, "set-id": 22140}}, { "type": "instances", "attributes": {"test-id": 72927, "set-id": 22141}}]}'
```

This endpoint creates an instance in your project.

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/instances.json`

### Parameters

Parameters | Description | required? |
--------- | ------- |------- |
data/attributes/set-id | TestSet id (not display id) | true |
data/attributes/test-id* | Test id (not display id) | true |
data/attributes/planned-execution | date field of planned-execution | false |
data/attributes/version | string of instance version | false |
data/attributes/priority | string of instance priority | false |
data/attributes/assigned-to-id | user or group assigned-to id (not Display ID) - [users list](#users) [groups list](#get-all-groups-at-your-project) | false |
data/attributes/assigned-to-type | assigned-to type (user or group) | false |
data/attributes/custom-fields | a hash of custom-fields with their value | false |

* Users can create 20 instances (maximum) by sending one request. See a curl example in the dark area to the right.
* For more information about assigned-to-id and assigned-to-type, refer to [Assigned To](#assigned-to)

You can find at the [right area](#create-an-instance) (shell) an example of the request

### PAT Support
Supported - if the user has the permissions to create instances


## Show a specific instance

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/instances/45893.json
```

> This command: https://api.practitest.com/api/v2/projects/4566/instances/45893.json?api_token=YOUR_TOKEN&developer_email=YOUR_EMAIL, returns JSON structured like below:

```json
{
  "data": {
    "id": "1850344",
    "type": "instances",
    "attributes": {
      "name": "SmokeTest_ECR_Purchase&ReversalIssuer30",
      "project-id": 1282,
      "set-id": 96530,
      "set-display-id": 117,
      "test-id": 369077,
      "test-display-id": 2356,
      "custom-fields": {},
      "display-id": "117:3",
      "tester-id": 4825,
      "priority": null,
      "last-run-duration": "00:00:00",
      "last-run": "2015-11-18T04:57:21+00:00",
      "run-status": "PASSED",
      "planned-execution": null,
      "version": null,
      "assigned-to-id": null,
      "assigned-to-type": null,
      "created-at": "2015-11-17T09:29:22+00:00",
      "updated-at": "2015-11-17T09:29:22+00:00"
    }
  }
}
```

This endpoint shows a specific instance in your project.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/instances/YOUR_INSTANCE_ID.json`

Here's the example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to view runs / instances


## Update a specific instance

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PUT https://api.practitest.com/api/v2/projects/4566/instances/45893.json \
-d '{"data": { "type": "instances", "attributes": {"planned-execution":"2017-03-01T12:43:31Z", "priority": "highest", "custom-fields": { "---f-22": "Windows", "---f-24": ["ClientA", "ClientB"]}}  } }'

# some more examples:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
-X PUT https://api.practitest.com/api/v2/projects/4566/instances/98019.json \
-d '{"data": { "type": "instances", "attributes": {"planned-execution":"2017-03-05T12:43:31Z", "priority": "2-high", "version": "1.5", "custom-fields": { "---f-45510": "5381"}}  } }'

curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
-X PUT https://api.practitest.com/api/v2/projects/4566/instances/98019.json \
-d '{"data": { "type": "instances", "attributes": {"version": "1.5", "custom-fields": { "---f-45390": "Chrome"}}  } }'

```


```json
{
  "data": {
    "id": "45893",
    "type": "instances",
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

This endpoint updates a specific instance.

### HTTP Request

`PUT https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/instances/YOUR_INSTANCE_ID.json`

### Parameters

Available parameters | Description |
--------- | ------- |
data/attributes/planned-execution | date field of planned-execution |
data/attributes/version | string of instance version |
data/attributes/priority | string of instance priority |
data/attributes/assigned-to-id | user or group assigned-to id (not Display ID) - [users list](#users) [groups list](#get-all-groups-at-your-project) | false |
data/attributes/assigned-to-type | assigned-to type (user or group) | false |
data/attributes/custom-fields | a hash of custom-fields with their value |

* For more information about assigned-to-id and assigned-to-type, refer to [Assigned To](#assigned-to)

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit instances


## Delete a specific instance

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/instances/45893.json
```

This endpoint deletes a specific instance.

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/instances/YOUR_INSTANCE_ID.json`


You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to delete instances (Runs - Admin)
