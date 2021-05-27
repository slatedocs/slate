# Steps

## GET all steps in your project
```shell
# Some request examples:

# Get all steps of project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/steps.json

# Get all steps of project #4566, where name is like login
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/steps.json?name_like=login

# Get all steps with test ids 23223,43121 from project #4566
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/steps.json?test-ids=23223,43121

```

> This command: https://api.practitest.com/api/v2/projects/4566/steps.json?test-ids=257245api_token=xx&developer_email=admin%40pt.com", returns JSON structured like below:

```json
{
  "data": [
    {
      "id": "1443767",
      "type": "steps",
      "attributes": {
        "project-id": 914,
        "kind": "ManualStep",
        "test-id": 257245,
        "test-to-call-id": null,
        "name": "login",
        "description": "login to the first page",
        "expected-results": "you should be able to login",
        "position": 1,
        "created-at": "2015-01-29T20:17:54+00:00",
        "updated-at": "2015-01-29T20:17:54+00:00"
      }
    },
    {
      "id": "1443768",
      "type": "steps",
      "attributes": {
        "project-id": 914,
        "kind": "ManualStep",
        "test-id": 257245,
        "test-to-call-id": null,
        "name": "dashboard page",
        "description": "goto dashboard page, see graphs",
        "expected-results": "validate all graphs are equal",
        "position": 2,
        "created-at": "2015-01-29T20:17:54+00:00",
        "updated-at": "2015-01-29T20:17:54+00:00"
      }
    },
    {
      "id": "1443769",
      "type": "steps",
      "attributes": {
        "project-id": 914,
        "kind": "CallToTest",
        "test-id": 257245,
        "test-to-call-id": 97733,
        "name": "Call To Test #2: dashboard testing",
        "description": "",
        "expected-results": "",
        "position": 3,
        "created-at": "2015-01-29T20:17:55+00:00",
        "updated-at": "2015-01-29T20:17:55+00:00"
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

This endpoint retrieves all steps.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/steps.json`

### Query Parameters - [pagination](#pagination)

Parameters* | Description |
--------- | ------- |
test-ids | filter steps with test-ids (separated by commas) |
name_exact | filter by step name exact match; case sensitive! |
name_like | filter by step name: case insensitive, phrase can be inside the name |

* none of the parameters are required. If you combine multiple parameters, it will do AND
You can see examples in the dark area to the right.

### PAT Support
Supported - if the user has the permissions to view Tests


## Show a specific step

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/steps/45893.json
```

> This command: https://api.practitest.com/api/v2/projects/4566/steps/1443768.json?api_token=YOUR_TOKEN&developer_email=YOUR_EMAIL, returns JSON structured like below:

```json
{
  "data": {
    "id": "1443768",
    "type": "steps",
    "attributes": {
      "project-id": 914,
      "kind": "ManualStep",
      "test-id": 257245,
      "test-to-call-id": null,
      "name": "dashboard page",
      "description": "goto dashboard page, see graphs",
      "expected-results": "validate all graphs are equal",
      "position": 2,
      "created-at": "2015-01-29T20:17:54+00:00",
      "updated-at": "2015-01-29T20:17:54+00:00"
    }
  }
}
```
This endpoint shows a specific step in your project.

### HTTP Request

`GET https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/steps/YOUR_STEP_ID.json`

In the right area see the example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to view Tests

## Update a specific step

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PUT https://api.practitest.com/api/v2/projects/4566/steps/45893.json
-d '{"data": { "type": "steps", "attributes": {"name": "Updated step name", "description": "a new description", "expected-results": "New expected results"}  }}'

```

```json
{
  "data": {
    "id": "45893",
    "type": "steps",
    "attributes": {
      "project-id": 4566,
      "kind": "ManualStep",
      "test-id": 9510,
      "test-to-call-id": null,
      "name": "Updated step name",
      "description": "a new description",
      "expected-results": "New expected results",
      "position": 8,
      "created-at": "2021-05-19T15:08:20Z",
      "updated-at": "2021-05-27T15:08:47Z"
    }
  }
}
```
This endpoint updates a specific step.

### HTTP Request

`PUT https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/tests/STEP_ID.json`

In the right area see the example of the JSON request and response
### Parameters

Available parameters | Description |
--------- | ------- |
data/attributes/name | Step name |
data/attributes/description | Step description |
data/attributes/expected-results | Expected results of the step |


You can find at the right area an example of the JSON request and response
### PAT Support
Supported - if the user has the permissions to edit Tests

## Create a step
```shell
# create a step
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/steps.json \
-d '{"data": { "type": "steps", "attributes": {"test-id": 9510, "steps": [{"name": "Step 1 from API", "description":  "New Step description", "expected-results": "Step created"}] }  }}'

# create 3 steps:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/projects/4566/steps.json \
-d '{"data": { "type": "steps", "attributes":  {"test-id": 9510, "steps": [{"name": "Step 1", "description":  "New description 1", "expected-results": ""}, {"name": "Step 2", "description":  "New description 2", "expected-results": "WOW!"}, {"name": "Step 3", "description":  "New description 3", "expected-results": "my expected results"}] }  }}'
```

This endpoint creates steps in your project.

### HTTP Request

`POST https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/stesps.json`

### Parameters

Parameters | Description |
--------- | ------- |
data/attributes/test-id | Test system-id
data/attributes/steps | an array of steps |

* Steps array includes steps json hash, with these attributes: name (255 char. maximum), description, expected-results.
* Users can create 100 steps(maximum) by sending one request. See a curl example in the dark area to the right.


### PAT Support
Supported - if the user has the permissions to edit Tests.

## Delete a specific step
```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X DELETE https://api.practitest.com/api/v2/projects/4566/steps/45893.json
```
This endpoint deletes a specific step.

### HTTP Request

`DELETE https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/steps/YOUR_STEP_ID.json`


You can find at the right area an example of the JSON request and response

### PAT Support
Supported - if the user has the permissions to edit Tests
