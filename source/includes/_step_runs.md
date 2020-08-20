# Step Runs

## GET all step runs in your project
```shell
# Some request examples:

# Get all step runs of project #4566:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/step_runs.json

# Get all step runs of project #4566, where name is like login
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/step_runs.json?name_like=login

# Get all step runs with run ids 23223,43121 from project #4566
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/projects/4566/step_runs.json?runs-ids=23223,43121

```

> This command: https://api.practitest.com/api/v2/projects/4566/steps.json?test-ids=257245api_token=xx&developer_email=admin%40pt.com", returns JSON structured like below:

```json
{
  "data": [
    {
      "id": "374393",
      "type": "step-runs",
      "attributes": {
        "project-id": 4849,
        "run-id": 66126,
        "name": "Login to the system",
        "description": "Open your browser, go to the site http://www.test-test.com and log into the system",
        "expected-results": "You are taken to the personal landing page",
        "actual-results": null,
        "status": "NO RUN",
        "position": 1,
        "created-at": "2020-08-18T15:58:06+03:00",
        "updated-at": "2020-08-18T15:58:06+03:00"
      }
    },
    {
    "id": "374394",
    "type": "step-runs",
    "attributes": {
      "project-id": 4849,
      "run-id": 66126,
      "name": "Go to the User Management Tab",
      "description": "In the upper right corner, press the Users Definition Icon to be taken to this area of the application",
      "expected-results": "Based on your permissions you are taken to the users tab and you can see all the users in the system",
      "actual-results": null,
      "status": "NO RUN",
      "position": 2,
      "created-at": "2020-08-18T15:58:06+03:00",
      "updated-at": "2020-08-18T  15:58:06+03:00"
      }
    }
  ],
  "links": {},
  "meta": {
  "current-page": 1,
  "next-page": null,
  "prev-page": null,
  "total-pages": 1,
  "total-count": 2
  }
}
```

This endpoint retrieves all step runs.

### HTTP Request

<!-- http://localhost:3000/api/v2/projects/4849/step_runs.json?api_token=ef02d0ee6d583554020e82d10161a671a3d0b1fb&runs-ids=66126,66117&status=NO%20RUN -->

`GET [BASE_URL]/api/v2/projects/YOUR_PROJECT_ID/step_runs.json`

### Query Parameters - [pagination](#pagination)

Parameters* | Description |
--------- | ------- |
run-ids | filter step runs with run-ids (separated by commas) |
name_exact | filter by step runs name exact match; case sensitive! |
name_like | filter by step runs name: case insensitive, phrase can be inside the name |
status | filter by step runs name by status;  case sensitive! |

* none of the parameters are required. If you combine multiple parameters, it will do AND
You can see examples in the dark area to the right.

### PAT Support
Supported - if the user has the permissions to view Runs
