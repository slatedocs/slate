# Tests

## GET all tests in your project
```shell
# Some request examples:

# Get all tests of project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/tests.json

# Get all tests of project #4566, where filter-id is 323 and name is like login
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/tests.json?filter-id=323&name_like=login

# Get all tests with display ids 2,4 from project #4566
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/tests.json?display-ids=2,4

# Get all tests with linked entities from project #4566
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/tests.json?relationships=true

```

> This command: https://api.practitest.com/api/v2/projects/4566/tests.json?api_token=xx&developer_email=admin%40pt.com&page[number]=1&page[size]=2", returns JSON structured like below:

```json
{
  "data": [
    {
      "id": "1850360",
      "type": "tests",
      "attributes": {
        "project-id": 1230,
        "display-id": 205,
        "name": "first name",
        "description": "My description",
        "steps-count": 0,
        "status": "Ready",
        "run-status": "FAILED",
        "last-run": "2017-01-27T13:35:25+00:00",
        "author-id": 3596,
        "assigned-to-id": null,
        "assigned-to-type": null,
        "cloned-from-id": null,
        "planned-execution": null,
        "version": null,
        "priority": null,
        "duration-estimate": "00:00:00",
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
    "self": "https://api.practitest.com/api/v2/projects/1282/tests.json?api_token=YOUR_TOKEN
YOUR_TOKEN&developer_email=your_EMAIL&name_like=Issuer3&page%5Bnumber%5D=1&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530",
    "next": "https://api.practitest.com/api/v2/projects/1282/tests.json?api_token=YOUR_TOKEN&developer_email=your_EMAIL&name_like=Issuer3&page%5Bnumber%5D=2&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530",
    "last": "https://api.practitest.com/api/v2/projects/1282/tests.json?api_token=YOUR_TOKEN&developer_email=your_EMAIL&name_like=Issuer3&page%5Bnumber%5D=3&page%5Bsize%5D=6&set_filter_id=70859&set_ids=96530"
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
This endpoint retrieves all tests.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests.json`

### Query Parameters - [pagination](#pagination)

Parameters* | Description |
--------- | ------- |
filter-id | the test's filter id -> showing tests that are in this filter of the Test Library |
filter-user-id | if filter uses current_user criteria in it, you should provide which is the this user ([list of user ids](#users)) |
display-ids | filter tests with display-ids (separated by commas) |
name_exact | filter by test name exact match; case sensitive! |
name_like | filter by test name: case insensitive, phrase can be inside the name |
relationships | shows entities linked to tests, should be equal to true  |


* none of the parameters are required. If you combine multiple parameters, it will do AND
You can see examples in the dark area to the right.

### PAT Support
Supported - if the user has the permissions to view Tests


## Create a test
```shell
# create a test
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/tests.json \
-d '{"data": { "type": "tests", "attributes": {"name": "one", "author-id": 22, "priority": "highest", "custom-fields": { "---f-22": "Windows", "---f-24": ["ClientA", "ClientB"]}}  } }'

# create a test with 2 steps:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/tests.json \
-d '{"data": { "type": "tests", "attributes": {"name": "one", "author-id": 22, "priority": "highest"}, "steps": {"data": [{"name": "step one", "description": "Step 1 description", "expected-results": "result"}, {"name": "step two", "expected-results": "result2"}] }}}'
```

This endpoint creates a test in your project.

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests.json`

### Parameters

Parameters | Description | required? |
--------- | ------- |------- |
data/attributes/name | name | true |
data/attributes/author-id | user-id of author - [users list](#users) | true (unless using PAT) |
data/attributes/description | Test description | false |
data/attributes/assigned-to-id | user or group assigned-to id (not Display ID) - [users list](#users)  | false |
data/attributes/assigned-to-type | assigned-to type (user or group) | false |
data/attributes/planned-execution | date field of planned-execution | false |
data/attributes/status | string of status (not run status) | false |
data/attributes/version | string of test version | false |
data/attributes/priority | string of test priority | false |
data/attributes/custom-fields | a hash of custom-fields with their value | false |
data/steps/data* | an array of steps override the exit code | false |
data/attributes/tags | an array of tags | false |

* Steps array includes steps json hash, with these attributes: name (255 char. maximum), description, expected-results.
To update / view and delete steps, refer to steps resources (to be released)
* For more information about assigned-to-id and assigned-to-type, refer to [Assigned To](## Assigned To)


You can find at the [right area](#create-an-test) (shell) an example of the request


### PAT Support
Supported - if the user has the permissions to create Tests.

The "author-id" parameter is not required, and can only be used (and override PAT user) if it has "impersonation" enabled

## Show a specific test

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/tests/45893.json
```

> This command: https://api.practitest.com/api/v2/projects/4566/tests/45893.json?api_token=YOUR_TOKEN&developer_email=YOUR_EMAIL, returns JSON structured like below:

```json
{
  "data": {
    "id": "1850344",
    "type": "tests",
    "attributes": {
      "project-id": 1230,
      "display-id": 205,
      "name": "first name",
      "description": "My description",
      "steps-count": 0,
      "status": "Ready",
      "run-status": "FAILED",
      "last-run": "2017-01-27T13:35:25+00:00",
      "author-id": 3596,
      "assigned-to-id": null,
      "assigned-to-type": null,
      "cloned-from-id": null,
      "planned-execution": null,
      "version": null,
      "priority": null,
      "duration-estimate": "00:00:00",
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
This endpoint shows a specific test in your project.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests/YOUR_TEST_ID.json`

Here's the example of the JSON request and response

Parameters* | Description |
--------- | ------- |
relationships | shows entities linked to tests, should be equal to true  |

* none of the parameters are required.

### PAT Support
Supported - if the user has the permissions to view Tests


## Update a specific test
```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PUT https://api.practitest.com/api/v2/projects/4566/tests/45893.json \
-d '{"data": { "type": "tests", "attributes": {"planned-execution":"2017-03-01T12:43:31Z", "priority": "highest", "custom-fields": { "---f-22": "Windows", "---f-24": ["ClientA", "ClientB"]}}  } }'

# some more examples:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
-X PUT https://api.practitest.com/api/v2/projects/4566/tests/98019.json \
-d '{"data": { "type": "tests", "attributes": {"planned-execution":"2017-03-05T12:43:31Z", "priority": "2-high", "version": "1.5", "custom-fields": { "---f-45510": "5381"}}  } }'

curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
-X PUT https://api.practitest.com/api/v2/projects/4566/tests/98019.json \
-d '{"data": { "type": "tests", "attributes": {"version": "1.5", "custom-fields": { "---f-45390": "Chrome"}}  } }'

```

```json
{
  "data": {
    "id": "45893",
    "type": "tests",
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
This endpoint updates a specific test.

### HTTP Request

`PUT https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests/TEST_ID.json`

### Parameters

Available parameters | Description |
--------- | ------- |
data/attributes/name | name |
data/attributes/description | Test description |
data/attributes/assigned-to-id | user or group assigned-to id (not Display ID) - [users list](#users)  | false |
data/attributes/assigned-to-type | assigned-to type (user or group) | false |
data/attributes/planned-execution | date field of planned-execution |
data/attributes/status | string of status (not run status) |
data/attributes/version | string of test version |
data/attributes/priority | string of test priority |
data/attributes/custom-fields | a hash of custom-fields with their value |
data/attributes/tags | an array of tags | false |
data/attributes/updated-by-user-id | ID (not Display ID) of the user who made a change - [users list](#users) | false |

* updated-by-user-id parameter allows to see changes made via API in history tabs of tests
* For more information about assigned-to-id and assigned-to-type, refer to [Assigned To](## Assigned To)


You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Tests.

History of a change by PAT user will be created automatically.

The "updated-by-user-id" parameter can only be used (and override PAT user) if it has "impersonation" enabled.


## Delete a specific test

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/tests/45893.json
```

This endpoint deletes a specific test.

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests/YOUR_TEST_ID.json`


You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to delete Tests.


## Run statuses count
```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/tests/run_statuses_count.json
```


```json
{
  "data":{
    "type":"tests",
    "run-statuses-count":{
      "PASSED":0,
      "FAILED":0,
      "NOT COMPLETED":0,
      "NO RUN":2,
      "BLOCKED":0
    }
  }
}
```
This gives statistics data of run statuses of your project's tests

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests/run_statuses_count.json`

You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to view Tests
