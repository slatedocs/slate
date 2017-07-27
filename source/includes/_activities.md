# Activities

The activities registers actions the users makes, like joining a group, leaving a group or buying a resource.

## Activity Object

> Order Object Example

```json
"id": "a22a227b28",
"description": "has left the Slice Group",
"track-type": "leave-group",
"created-at": "2017-05-30T01:28:37.695Z",
"subjects": {
  "owner_id": "2bc8066314",
  "owner_name": "Gabriel Morillo",
  "group_id": "6f2d1b48d8",
  "group_name": "Slice Group"
}
```

*A activity object contains the following fields*

Attribute | Type | Description
--------- | ------- | -----------
id | **string** | The sunlight defined id representing the group.
description | **text** | Activity description.
track-type | **string** | Type of activity.
created-at | **timestamp** | The time the order was added to Sunlight.
subjects | **json** | Metadata of the subjects involved in the activity.

## Activities List

> Activities List - Example

``` shell
$ curl -X GET \
  https://app.sunlight.is/api/activities \
  -H 'accept: application/vnd.api+json' \
  -H 'authorization: Bearer <your access token>' \
  -H 'content-type: application/json' \
```

> The encoded json response looks like:

```json
HTTP/1.1 200 OK

{
  "data": [
    {
      "type": "activities",
      "id": "0c295bbaea",
      "attributes": {
        "id": "0c295bbaea",
        "description": "Bought 'Platzi Monthly Subscription' on Platzi.",
        "track-type": "bought",
        "created-at": "2017-06-06T20:47:21.698Z",
        "subjects": {
          "owner_id": "2bc8066314",
          "owner_name": "Gabriel Morillo",
          "order_id": "e67c60e651",
          "order_provider": "Platzi",
          "order_url": "https://platzi.com/comprar/mensual/?course=todos",
          "resource_id": "e19aa8719d",
          "resource_name": "Platzi Monthly Subscription"
        }
      },
      "links": {
        "self": "/activities/0c295bbaea"
      },
      "relationships": { }
    },
    {
      "type": "activities",
      "id": "45869407dd",
      "attributes": {
        "id": "45869407dd",
        "description": "has joined the Slice Group Group",
        "track-type": "joined-group",
        "created-at": "2017-05-30T01:28:50.978Z",
        "subjects": {
          "owner_id": "2bc8066314",
          "owner_name": "Gabriel Morillo",
          "group_id": "6f2d1b48d8",
          "group_name": "Slice Group"
        }
      },
      "links": {
          "self": "/activities/45869407dd"
      },
      "relationships": { }
    }
  ],
  "meta": {
    "totalPages": 1,
    "totalResults": 2
  },
  "links": {
    "self": "https://app.sunlight.is/activities?page[number]=1&page[size]=10",
    "first": "https://app.sunlight.is/activities?page[number]=1&page[size]=10",
    "prev": "https://app.sunlight.is/activities?page[number]=0&page[size]=10",
    "next": "https://app.sunlight.is/activities?page[number]=2&page[size]=10",
    "last": "https://app.sunlight.is/activities?page[number]=2&page[size]=10"
  },
  "included": []
}
```

You can fetch a list of activities via a `GET` to `https://app.sunlight.is/api/activities` The activities list is sorted by the `created-at` field and by default is ordered descending, by most recently created first.

<aside class="notice">
  A user can see the activities of other users only if they belong to the same group.
</aside>

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
page[number] | no | What page of results to fetch defaults to first page.
page[size] | no | How many results per page defaults to 10, max is 50.
filter | no | The filter query parameter is reserved for filtering data. Valid Values: `owner-id`, `include-friends`

### Filters

Filter | Description | Uri Example
-------| ----------- | -------------
`id`   | Filter by activity-id | `/activities?filter[id]=0c295bbaea`
`owner-id` | Filter by user-id | `/activities?filter[owner-id]=2bc8066314`
`include-friends` | True if you want to include friends activities  | `/activities?filter[include-friends]=true`
