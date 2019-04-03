## Batch API

There are many cases where you want to accomplish a variety of work in the Asana API but want to minimize the number of HTTP requests you make. For example:

* Modern browsers limit the number of requests that a single web page can make at once.
* Mobile apps will use more battery life to keep the cellular radio on when making a series of requests.
* There is an overhead cost to developing software that can make multiple requests in parallel.
* Some cloud platforms handle parallelism poorly, or disallow it entirely.

To make development easier in these use cases, Asana provides a **batch API** that enables developers to perform multiple "actions" by making only a single HTTP request.

<a id="making-a-batch-request"></a>
### Making a Batch Request

To make a batch request, send a `POST` request to `/batch`. Like other `POST` endpoints, the body should contain a `data` envelope. Inside this envelope should be a single `actions` field, containing a list of "action" objects. Each action represents a standard request to an existing endpoint in the Asana API.

Actions you send to the batch API can have the following fields:

| Field | Description |
|-------|-------------|
| `relative_path` | <code class="table-example">"/tasks/123"</code> <code class="table-example">"/users/me"</code> **Required:** The path of the desired endpoint relative to the API's base URL. Query parameters are not accepted here; put them in `data` instead. |
| `method` | <code class="table-example">"get"</code> <code class="table-example">"post"</code> **Required:** The HTTP method you wish to emulate for the action. |
| `data` | <code class="table-example">{ assignee: "me", project: 13579 }</code> For `GET` requests, this should be a map of query parameters you would have normally passed in the URL. Options and pagination are not accepted here; put them in `options` instead. For `POST`, `PATCH`, and `PUT` methods, this should be the content you would have normally put in the `data` field of the body.
| `options` | [Pagination](/developers/documentation/getting-started/pagination) (`limit` and `offset`) and [output options](/developers/documentation/getting-started/input-output-options) (`fields` or `expand`) for the action. "Pretty" JSON output is not an available option on individual actions; if you want pretty output, specify that option on the parent request. |

**The maximum number of actions allowed in a single batch request is 10.** Making a batch request with no actions in it will result in a `400 Bad Request`.

When the batch API receives the list of actions to execute, it will dispatch those actions to the already-implemented endpoints specified by the `relative_path` and `method` for each action. This happens in parallel, so all actions in the request will be processed simultaneously. There is no guarantee of the execution order for these actions, nor is there a way to use the output of one action as the input of another action (such as creating a task and then commenting on it).

The response to the batch request will contain (within the `data` envelope) a list of result objects, one for each action. The results are guaranteed to be in the same order as the actions in the request, e.g., the first result in the response corresponds to the first action in the request.

Each result object will contain three fields:

| Field | Description |
|-------|-------------|
| `status_code` | The HTTP status code that the invoked endpoint returned. |
| `headers` | A map of HTTP headers specific to this result. This is primarily used for returning a `Location` header to accompany a `201 Created` result. The parent HTTP response will contain all common headers. |
| `body` | The JSON body that the invoked endpoint returned. |

The batch API will always attempt to return a `200 Success` response with individual result objects for each individual action in the request. Only in certain cases (such as missing authorization or malformed JSON in the body) will the entire request fail with another status code. Even if every individual action in the request fails, the batch API will still return a `200 Success` response, and each result object in the response will contain the errors encountered with each action.

<a name="rate-limiting"></a>
### Rate Limiting

The batch API fully respects all of our [rate limiting](/developers/documentation/getting-started/rate-limits). This means that a batch request counts against *both* the standard rate limiter and the concurrent request limiter as though you had made a separate HTTP request for every individual action. For example, a batch request with five actions counts as five separate requests in the standard rate limiter, and counts as five concurrent requests in the concurrent request limiter. The batch request itself incurs no cost.

If *any* of the actions in a batch request would exceed any of the enforced limits, the *entire* request will fail with a `429 Too Many Requests` error. This is to prevent the unpredictability of which actions might succeed if not all of them could succeed.

<a name="restrictions"></a>
### Restrictions

Not every API endpoint can be accessed through the batch API. Specifically, the following actions cannot be taken and will result in a `400 Bad Request` for that action:

* Uploading [attachments](/developers/api-reference/attachments)
* Creating, getting, or deleting [organization exports](/developers/api-reference/organization_exports)
* Any SCIM operations
* Nested calls to the batch API

<a name="example"></a>
### Example

    # Body
    $ cat body.json
    {
      "data": {
        "actions": [
          {
            "method": "get",
            "relative_path": "/users/me"
          },
          {
            "method": "get",
            "relative_path": "/tasks/124816",
            "options": {
              "fields": [
                "name",
                "notes",
                "completed"
              ]
            }
          },
          {
            "method": "get",
            "relative_path": "/tasks",
            "data": {
              "assignee": "me",
              "workspace": 1337
            },
            "options": {
              "limit": 3,
              "fields": [
                "name"
              ]
            }
          },
          {
            "method": "post",
            "relative_path": "/workspaces/1337/tasks",
            "data": {
              "assignee": "me",
              "name": "Made via the batch API"
            }
          },
          {
            "method": "put",
            "relative_path": "/tasks/1997",
            "data": {
              "due_on": "2018-03-14"
            },
            "options": {
              "fields": [
                "name",
                "due_on",
                "modified_at"
              ]
            }
          },
          {
            "method": "get",
            "relative_path": "/not_found"
          }
        ]
      }
    }

    # Request
    $ curl --request POST -H "Authorization: Bearer <token>" -d @body.json \
        "https://app.asana.com/api/1.0/batch"

    # Response
    HTTP/1.1 200
    {
      "data": [
        {
          "body": {
            "data": {
              "id": 1235,
              "email": "tbizarro@example.com",
              "name": "Tim Bizarro",
              "workspaces": [
                {
                  "id": 1337,
                  "name": "My Favorite Workspace"
                }
              ]
            }
          },
          "status_code": 200,
          "headers": {}
        },
        {
          "body": {
            "data": {
              "id": 1967,
              "completed": false,
              "name": "Hello, world!",
              "notes": "How are you today?"
            }
          },
          "status_code": 200,
          "headers": {}
        },
        {
          "body": {
            "data": [
              {
                "id": 2002,
                "name": "Dog food"
              },
              {
                "id": 2003,
                "name": "Squeak toy"
              },
              {
                "id": 2004,
                "name": "Leash"
              }
            ],
            "next_page": {
              "offset": "eyJ0eXAiOJiKV1iQLCJhbGciOiJIUzI1NiJ9",
              "path": "/tasks?offset=eyJ0eXAiOJiKV1iQLCJhbGciOiJIUzI1NiJ9",
              "uri": "https://app.asana.com/api/1.0/tasks?assignee=me&workspace=1337&opt_fields=name&limit=3offset=eyJ0eXAiOJiKV1iQLCJhbGciOiJIUzI1NiJ9"
            }
          },
          "status_code": 200,
          "headers": {}
        },
        {
          "body": {
            "data": {
              "id": 2035,
              "created_at": "2018-03-03T01:02:06.696Z",
              "modified_at": "2018-03-03T01:02:06.696Z",
              "name": "Made via the batch API",
              "notes": "",
              "assignee": {
                "id": 1235,
                "name": "Tim Bizarro"
              },
              "completed": false,
              "assignee_status": "inbox",
              "completed_at": null,
              "due_on": null,
              ...
            }
          },
          "status_code": 201,
          "headers": {
            "location": "/api/1.0/tasks/2035"
          }
        },
        {
          "body": {
            "data": {
              "id": 2001,
              "due_on": "2018-03-14",
              "modified_at": "2018-03-03T01:02:06.696Z"
            }
          },
          "status_code": 200,
          "headers": {}
        },
        {
          "body": {
            "errors": [
              {
                "message": "No matching route for request",
                "help": "For more information on API status codes and how to handle them, read the docs on errors: https://asana.com/developers/documentation/getting-started/errors"
              }
            ]
          },
          "status_code": 404,
          "headers": {}
        }
      ]
    }

