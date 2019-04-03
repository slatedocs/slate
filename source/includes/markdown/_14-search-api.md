## Search API

To mirror the functionality of the Asana web app's advanced search feature, the Asana API has a task search endpoint that allows you to build complex filters to find and retrieve the exact data you need.

<a id="using-search"></a>
### Using the search API
You can search for tasks in a workspace by making a `GET` request to `/workspaces/workspace-id/tasks/search`. The result will be a list of tasks such as what is returned from the `GET /projects/project-id/tasks` endpoint. The usual [field selectors](/developers/documentation/getting-started/input-output-options) are available on this endpoint for choosing what pieces of each task to return.

The following query parameters will be supported. None of the parameters are required, but at least one non-sort parameter must be specified. Excluding a parameter means it is ignored in the search, but specifying `null` for a parameter explicitly searches for unset values. Specifying the same query parameter more than once is undefined behavior, and may return an error.


<a id="parameters"></a>
### Search query parameters

#### Text

| Parameter name | Accepted type |
|---|---|
| `text` | String, performs full-text search on both task name and description |

#### Assignee

| Parameter name | Accepted type |
|---|---|
| `assignee.any` | Comma-separated list of user identifiers |
| `assignee.not` | Comma-separated list of user identifiers |
| `assignee_status` | String, one of `inbox`, `today`, `upcoming`, or `later` |

A user identifier can either be an ID, an email address, or the string `"me"`. Values in `assignee.any` and `assignee.not` must be mutually exclusive.

#### Containers

| Parameter name | Accepted type |
|---|---|
| `projects.any` | Comma-separated list of project IDs |
| `projects.not` | Comma-separated list of project IDs |
| `projects.all` | Comma-separated list of project IDs |
| `sections.any` | Comma-separated list of section or column IDs |
| `sections.not` | Comma-separated list of section or column IDs |
| `sections.all` | Comma-separated list of section or column IDs |
| `tags.any` | Comma-separated list of tag IDs |
| `tags.not` | Comma-separated list of tag IDs |
| `tags.all` | Comma-separated list of tag IDs |
| `teams.any` | Comma-separated list of team IDs |

For any given attribute, the values specified for the any, all, and not operators must be mutually exclusive.

#### People

| Parameter name | Accepted type |
|---|---|
| `followers.any` | Comma-separated list of user identifiers |
| `followers.not` | Comma-separated list of user identifiers |
| `created_by.any` | Comma-separated list of user identifiers |
| `created_by.not` | Comma-separated list of user identifiers |
| `assigned_by.any` | Comma-separated list of user identifiers |
| `assigned_by.not` | Comma-separated list of user identifiers |
| `liked_by.any` | Comma-separated list of user identifiers |
| `liked_by.not` | Comma-separated list of user identifiers |
| `commented_on_by.any` | Comma-separated list of user identifiers |
| `commented_on_by.not` | Comma-separated list of user identifiers |

A user identifier can either be an ID, an email address, or the string me. For any given attribute, the values specified for the any, all, and not operators must be mutually exclusive.

#### Dates

| Parameter name | Accepted type |
|---|---|
| `due_on.before` | ISO 8601 date string |
| `due_on.after` | ISO 8601 date string |
| `due_on` | ISO 8601 date string or `null` |
| `due_at.before` | ISO 8601 datetime string |
| `due_at.after` | ISO 8601 datetime string |
| `start_on.before` | ISO 8601 date string |
| `start_on.after` | ISO 8601 date string |
| `start_on` | ISO 8601 date string or `null` |
| `created_on.before` | ISO 8601 date string |
| `created_on.after` | ISO 8601 date string |
| `created_on` | ISO 8601 date string or `null` |
| `created_at.before` | ISO 8601 datetime string |
| `created_at.after` | ISO 8601 datetime string |
| `completed_on.before` | ISO 8601 date string |
| `completed_on.after` | ISO 8601 date string |
| `completed_on` | ISO 8601 date string or `null` |
| `completed_at.before` | ISO 8601 datetime string |
| `completed_at.after` | ISO 8601 datetime string |
| `modified_on.before` | ISO 8601 date string |
| `modified_on.after` | ISO 8601 date string |
| `modified_on` | ISO 8601 date string or `null` |
| `modified_at.before` | ISO 8601 datetime string |
| `modified_at.after` | ISO 8601 datetime string |

For any given date attribute `X`, you can specify either:

- No parameters
- Only `X_on`
- One or both of `X_on.before` and `X_on.after`
- One or both of `X_at.before` and `X_at.after`

Any other configuration is invalid. It is not possible to search for, e.g., a due date after a particular datetime and before a particular date.

Specifying both a lower and upper bound for an attribute where the lower bound is greater than the upper bound is invalid.

#### Attributes

| Parameter name | Accepted type |
|---|---|
| `is_blocking` (incomplete tasks with dependents) | Boolean |
| `is_blocked` (tasks with incomplete dependencies) | Boolean |
| `has_attachment` | Boolean |
| `completed` | Boolean |
| `is_subtask` | Boolean |

#### Custom fields

| Parameter name | Custom field type | Accepted type |
|---|---|---|
| `custom_fields.<id>.is_set` | All | Boolean |
| `custom_fields.<id>.value` | Text | String |
| `custom_fields.<id>.value` | Number | Number |
| `custom_fields.<id>.value` | Enum | Enum option ID |
| `custom_fields.<id>.starts_with` | Text only | String |
| `custom_fields.<id>.ends_with` | Text only | String |
| `custom_fields.<id>.contains` | Text only | String |
| `custom_fields.<id>.less_than` | Number only | Number |
| `custom_fields.<id>.greater_than` | Number only | Number |

For example, if the ID of the custom field is 12345, these query parameter to find tasks where it is set would be `custom_fields.12345.is_set=true`. To match an exact value for an enum custom field, use the ID of the desired enum option and not the name of the enum option: `custom_fields.12345.value=67890`. 

Searching for multiple exact matches of a custom field is not supported.

#### Sorting

| Parameter name | Accepted type |
|---|---|
| `sort_by` | String, one of `due_date`, `created_at`, `completed_at`, `likes`, or `modified_at`, defaults to `modified_at` |
| `sort_ascending` | Boolean, default `false` |

<a id="limitations"></a>
### Limitations

#### Premium access

Like the Asana web product's advance search feature, this search endpoint will only be available to premium Asana users. A user is premium if any of the following is true:

- The workspace in which the search is being performed is a premium workspace
- The user is a member of a premium team inside the workspace

Even if a user is only a member of a premium team inside a non-premium workspace, search will allow them to find data anywhere in the workspace, not just inside the premium team. Making a search request using credentials of a non-premium user will result in a `402 Payment Required` error.

#### Pagination

Search results are not stable; repeating the same query multiple times may return the data in a different order, even if the data do not change. Because of this, the traditional [pagination](/developers/documentation/getting-started/pagination) available elsewhere in the Asana API is not available here. However, you can paginate manually by sorting the search results by their creation time and then modifying each subsequent query to exclude data you have already seen. Page sizes are limited to a maximum of 100 items, and can be specified by the `limit` query parameter.

#### Eventual consistency

Changes in Asana (regardless of whether they’re made though the web product or the API) are forwarded to our search infrastructure to be indexed. This process can take between 10 and 60 seconds to complete under normal operation, and longer during some production incidents. Making a change to a task that would alter its presence in a particular search query will not be reflected immediately. This is also true of the advanced search feature in the web product.

#### Rate limits

You may receive a `429 Too Many Requests` response if you hit any of our [rate limits](/developers/documentation/getting-started/rate-limits).

<a id="example"></a>
### Example


    # Request
    $ curl -H "Authorization: Bearer <token>" "https://app.asana.com/api/1.0/workspaces/32894/tasks/search?completed=false&assignee.any=me,other@example.com&custom_fields.8832.is_set=true&created_on.after=2018-07-15&opt_fields=name,assignee.email,completed&limit=3"

    # Response
    HTTP/1.1 200
    {
      "data": [
        {
          "id" : 423678,
          "name" : "Some task",
          "completed": false,
          "assignee": {
            "id": 79483,
            "email": "me@example.com"
          }
        },
        {
          "id" : 641668,
          "name" : "Another task"
          "completed": false,
          "assignee": {
            "id": 79495,
            "email": "other@example.com"
          }
        },
        {
          "id" : 463814,
          "name" : "Yet another task"
          "completed": false,
          "assignee": {
            "id": 79483,
            "email": "me@example.com"
          }
        }
      ]
    }

