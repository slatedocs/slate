Real-time Reporting API
=======================

## Room real-time statistics

Return a [paginated collection][] of real-time statistics for the rooms you have access to

`GET https://service.giosg.com/api/v4/reporting/realtime/rooms`

This endpoint accepts the following GET parameters.

Parameter        | Type    | Default | Description
-----------------|---------|---------|------------
`room_id`        | string  |         | filter results to only these (comma delimited) rooms
`include_shared` | boolean | false   | include shared rooms to the results
`timezone`       | string  | UTC     | Name of the [timezone](http://en.wikipedia.org/wiki/List_of_tz_database_time_zones "List of tz database time zones") to use for time based aggregation e.g. `Europe/Helsinki`


A response contains following fields:

```json
{
  "results": [
    {
      "room_id": "e6a850ca-e1d3-11e4-9706-38b1dbe48b5b",
      "room_name": "domain.com",
      "currently_open_chats": 8,
      "free_capacity": 4,
      "waiting_chats": 3,
      "average_wait_time": 14.6,
      "max_wait_time": 24.2,
      "missed_chats": 2,
      "real_chats": 76,
      "current_visitors": 123
    },
    ...
  ]
}
```

Attribute            | Type     | Description
---------------------|----------|------------
room_id              | string   | [UUID][] string identifier
room_name            | string   | Room name.
currently_open_chats | integer  | Currently open chats.
free_capacity        | integer  | Free capacity across all online operator in the room.
waiting_chats        | integer  | Currently waiting chats.
average_wait_time    | float    | Average wait time of the currently waiting visitors.
max_wait_time        | float    | Maximum wait time of the currently waiting visitors.
real_chats           | integer  | Real chat conversations today.
missed_chats         | integer  | Chats missed by operators today.
current_visitors     | integer  | Currently active visitors on the webpage.


## User real-time statistics

Return a [paginated collection][] of real-time statistics for operators

`GET https://service.giosg.com/api/v4/reporting/realtime/users`

This endpoint accepts the following GET parameters.

Parameter        | Type     | Default | Description
-----------------|----------|---------|------------
`user_id`        | integer  |         | filter results to only these (comma delimited) users

A response contains following fields:

```json
{
  "results": [
    {
      "user_id": 1,
      "email": "name@domain.com",
      "is_logged_id": true,
      "is_online": true,
      "currently_open_chats": 3,
      "free_capacity": 2,
      "rooms": [
        {
          "room_id": "e6a850ca-e1d3-11e4-9706-38b1dbe48b5b",
          "room": {
            "currently_open_chats": 2,
            "id": "e6a850ca-e1d3-11e4-9706-38b1dbe48b5b",
            "name": "domain.com"
          }
        },
        ...
      ],
      "teams": [
        {
          "team_id": 1
        },
        ...
      ]
    },
    ...
  ]
}
```

Attribute            | Type     | Description
---------------------|----------|------------
user_id              | integer  |
email                | string   |
currently_open_chats | integer  | Currently open chats.
free_capacity        | integer  | Free capacity.
rooms                | array of objects |
teams                | array of objects |
