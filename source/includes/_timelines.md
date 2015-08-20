Time Series Reporting API
=========================

## General time series usage

All the API endpoints described in this section require some GET parameters defining the time range and stats aggregation interval. You may also define define optional GET parameters to localize and filter the results. The optional GET parameters are described per API endpoint.

The following table describes the GET parameters accepted by all of the reporting stats API endpoints.

Parameter | Format   | Default | Description
:---------|:---------|:--------|------------
`start_time` | [date/time][] | | **Required.** Only return statistics after this moment (inclusive)         |
`end_time` | [date/time][] | | **Required.** Only return statistics before this moment (exclusive)           |
`timezone` | string | UTC | A [timezone][timezone list] in which params and results are expressed. |
`utc_offset` | string | | An alternative to the `timezone` parameter: the timezone expressed in static UTC offset, in hours. |
`time_interval` | string | | **Required.** Get results by selected time interval. Allowed values are `15min`, `1h`, `1d`. |

The chosen start and end date/time should be divisible by the chosen time interval. For example, if time interval is `1d` then the time part of a start/end date should be exactly `00:00:00`. For example: `201502-10T00:00:00`. On the other hand, if time interval is `1h`, then the hour part can be anything but the minutes and seconds must be `00`. Also, if the time interval is `15min`, then the minutes part must be either `00`, `15`, `30` or `45`.

Please note that end time is exclusive, that is, the time slot that starts exactly on that moment is **not** included in the final results. Therefore, in order to get daily stats for 2015-03-05 and 2015-03-06, you should define the start time as `2015-03-05T00:00:00` and end time as `2015-03-07T00:00:00` (the beginning of the next day).

The optional `timezone` parameter may be provided as one of the [tz database timezone names][timezone list]. This timezone describes the "local time" on which the API operates. For example: `timezone=Europe%2FHelsinki` would indicate timezone `Europe/Helsinki`.

You may alternatively use `utc_offset` parameter which, if provided, must start with either `+` or `-` and have two digit offset hour (zero-padded). This describes the offset from the UTC time, in full hours. If timezone or UTC offset is omitted, they default to the UTC time. An example parameter would be: `utc_offset=+02`

If a local time is defined, with either `timezone` or `utc_offset`, the given `start_time` and `end_time` are supposed to be expressed in this "local time". Otherwise, we assume that times are in UTC.

Defining a local time is especially important if you are aggregating daily statistics, i.e. `time_interval` is `1d`. The timezone is used to determine when each day starts and ends.

Every time series endpoint returns a JSON object with an item `results`, containing an array of aggregated timeslot objects. Each object has the attributes described by the following table. The items are in their time order. There will be a time slot for each time interval in the defined range, even if all the numbers would be zeros.

See the following sections for details.

## Time series range limitations

The selected time interval defines the maximum time range between the start and end time. Also, the chosen time interval determines how far in the past the start time can be. These restrictions are described in the following table:

Time interval | Max. time range | Oldest possible start time
--------------|-----------------|---------------------------
**1d**          | 100 days        | (No limit)
**1h**          | 7 days (168h)   | Any of last 140 days
**15min**       | 3 days (72h)    | Any of last 33 days

If the time range is longer than the maximum allowed range, or starts too early, then the server responds with `400 Bad Request` error response.

## Visitor statistics time series

You can get the time-based aggregated visitor statistics by making a GET request:

`GET https://service.giosg.com/api/v3/reporting/visitorstats/timeline`

You may define define these optional GET parameters to localize and filter the visitor stats aggregation results.

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`room_gid` | string | | Only statistics on the room with this Giosg-signed ID string (used in chat).

```json
{
  "results": [
    {
      "start_time": "2015-03-07T15:00:00",
      "total_visitors": 135,
      "desktop_visitors": 85,
      "mobile_visitors": 30,
      "tablet_visitors": 20
    },
    {
      "start_time": "2015-03-07T16:00:00",
      "total_visitors": 137,
      "desktop_visitors": 84,
      "mobile_visitors": 32,
      "tablet_visitors": 21
    },
    {
      "start_time": "2015-03-07T17:00:00",
      "total_visitors": 130,
      "desktop_visitors": 82,
      "mobile_visitors": 29,
      "tablet_visitors": 19
    }
  ]
}
```

Attribute | Format | Description
:---------|:-------|------------
`start_time` | [date/time][] | The starting time of this aggregation. Its duration is equal to the selected time interval, e.g. 1 hour. This time is in the "local" time if a timezone is defined, otherwise it is in UTC.
`total_visitors` | integer | Total number of unique visitors on this timeslot
`desktop_visitors` | integer | Number of unique desktop computer visitors on this timeslot
`mobile_visitors` | integer | Number of unique mobile phone visitors on this timeslot
`tablet_visitors` | integer | Number of unique tablet visitors on this timeslot

## Chat statistics time series

You can get the time-based aggregated chat statistics by making a GET request:

`GET https://service.giosg.com/api/v3/reporting/chatstats/timeline`

You may define define these optional GET parameters to localize and filter the chat stats aggregation results.

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`room_gid` | string | | Only statistics on the room with this Giosg-signed ID string (used in chat).
`personnel_gid` | string | | Only statistics for this operator, defined as Giosg-signed ID string used in chats
`personnel_email` | string | | Only statistics for this operator, defined by email address
`tag` | string | | Only statistics for chats that has been tagged with the given string. Can be given multiple times, when chat is included if it has any of the tags.
`min_message_count` | integer | 0 | Only statistics for chats with at least this number of total messages, by either visitor or operator, excluding autosuggest messages.
`is_ended` | true/false/none | | If `true`, then only include chats that have actually ended. If `false`, only include chats that have not been ended yet. If omitted or empty string, then do not filter.

```json
{
  "results": [
    {
      "start_time": "2015-03-07T15:00:00",
      "real_chats": 20,
      "total_chats": 26,
      "chats_by_autosuggest": 14,
      "total_autosuggests": 200,
      "missed_chats": 2,
      "average_wait_time": 14.45,
      "max_wait_time": 127.91,
      "chats_by_operator": 4,
      "chats_by_visitor": 6,
      "average_duration": 193.339,
      "average_active_duration": 98.369
    },
    {
      "start_time": "2015-03-07T16:00:00",
      "real_chats": 24,
      "total_chats": 30,
      "chats_by_autosuggest": 10,
      "total_autosuggests": 180,
      "missed_chats": 5,
      "average_wait_time": 17.45,
      "max_wait_time": 100.05,
      "chats_by_operator": 6,
      "chats_by_visitor": 8,
      "average_duration": 163.084,
      "average_active_duration": 92.863
    }
  ]
}
```

Attribute | Format | Description
:---------|:-------|------------
`start_time` | integer | The starting time of this aggregation. Its duration is equal to the selected time interval, eg. 1 hour. This time is in the "local" time if a timezone was defined, otherwise it is in UTC.
`real_chats` | integer | Total number of chats that are real conversations
`total_chats` | integer | Total number of chats on this time slot
`chats_by_autosuggest` | integer | Number of chats started from autosuggest of this time slot
`total_autosuggests` | integer | Total number of sent autosuggests (may or may not have started a chat
`missed_chats` | integer | Chats missed by operators

<aside class="warning">
The following wait time stats are available only for chat sessions started on 2015-03-02 and later! For earlier stats, they are null.
</aside>

Attribute | Format | Description
:---------|:-------|------------
`average_wait_time` | integer | Average waiting time in seconds, or null if not available
`max_wait_time` | integer | Maximum waiting time in seconds, or null if not available
`chats_by_operator` | integer | Number of chats started by operator on this time slot
`chats_by_visitor` | integer | Number of chats started by visitor on this time slot
`average_duration` | integer | Average duration of chats, in seconds
`average_active_duration` | integer | Averate duration of chats excluding any idle time, in seconds

## Per-room chat statistics time series

You can get the time-based aggregated chat statistics per-room by making a GET request:

`GET https://service.giosg.com/api/v3/reporting/chatstats/rooms/timeline`

You may define define these optional GET parameters to localize and filter the chat stats aggregation results.

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`room_gid` | string | | Only statistics on the room with this Giosg-signed ID string (used in chat).
`personnel_gid` | string | | Only statistics for this operator, defined as Giosg-signed ID string used in chats
`personnel_email` | string | | Only statistics for this operator, defined by email address
`tag` | string | | Only statistics for chats that has been tagged with the given string. Can be given multiple times, when chat is included if it has any of the tags.
`min_message_count` | integer | 0 | Only statistics for chats with at least this number of total messages, by either visitor or operator, excluding autosuggest messages.
`is_ended` | true/false/none | | If `true`, then only include chats that have actually ended. If `false`, only include chats that have not been ended yet. If omitted or empty string, then do not filter.

```json
{
  "count": 57, 
  "num_pages": 3, 
  "per_page": 25, 
  "current_page": 1, 
  "next_page": 2, 
  "previous_page": null,
  "next_page_url": "https://service.giosg.com/api/v3/reporting/chats/rooms/timeline?page=2",
  "previous_page_url": null,
  "results": [
    {
      "start_time": "2015-03-07T15:00:00",
      "rooms": [
        {
          "room_gid": "6ysdboogj2zc6i34ciaafd33h2tjzkyr4stes3cabdai37qm",
          "real_chats": 20,
          "total_chats": 26,
          "chats_by_autosuggest": 14,
          "total_autosuggests": 200,
          "missed_chats": 2,
          "average_wait_time": 14.45,
          "max_wait_time": 127.91,
          "chats_by_operator": 4,
          "chats_by_visitor": 6,
          "average_duration": 193.339,
          "average_active_duration": 98.369
        },
        {
          "room_gid": "ahpalbmjr5y6cel4deaaebdsmbm25lir4sbfg3cabdai37qm",
          "real_chats": 23,
          "total_chats": 29,
          "chats_by_autosuggest": 16,
          "total_autosuggests": 206,
          "missed_chats": 1,
          "average_wait_time": 16.12,
          "max_wait_time": 120.04,
          "chats_by_operator": 6,
          "chats_by_visitor": 4,
          "average_duration": 120.556,
          "average_active_duration": 90.920
        }
      ]
    },
    {
      "start_time": "2015-03-07T16:00:00",
      "rooms": [
        {
          "real_chats": 20,
          "total_chats": 26,
          "chats_by_autosuggest": 14,
          "total_autosuggests": 200,
          "missed_chats": 2,
          "average_wait_time": 14.45,
          "max_wait_time": 127.91,
          "chats_by_operator": 4,
          "chats_by_visitor": 6,
          "average_duration": 193.339,
          "average_active_duration": 98.369
        },
        {
          "start_time": "2015-03-07T16:00:00",
          "real_chats": 24,
          "total_chats": 30,
          "chats_by_autosuggest": 10,
          "total_autosuggests": 180,
          "missed_chats": 5,
          "average_wait_time": 17.45,
          "max_wait_time": 100.05,
          "chats_by_operator": 6,
          "chats_by_visitor": 8,
          "average_duration": 163.084,
          "average_active_duration": 92.863
        }
      ]
    }
  ]
}
```

<aside class="notice">
This endpoint returns a paginated collection!
</aside>

Unlike the other time series endpoints, this endpoint returns a [paginated collection][].

Attribute | Format | Description
:---------|:-------|------------
`start_time` | integer | The starting time of this aggregation. Its duration is equal to the selected time interval, eg. 1 hour. This time is in the "local" time if a timezone was defined, otherwise it is in UTC.
`rooms` | array of objects | Statistics for every room, with same attributes than the chat statistics time series, except the `start_time`. Instead, it has the attribute `room_gid` containing the Giosg-signed token identifying the room.

## Operator statistics time series

You can get the time-based aggregated operator statistics by making a GET request.

`GET https://service.giosg.com/api/v3/reporting/operatorstats/timeline`

<aside class="warning">
<strong>Note</strong> that this API provides data only starting from 2015-05-12!
</aside>

You may define these optional GET parameters to filter the operator stats aggregation results.

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`room_gid` | string | | Only statistics on the room with this Giosg-signed ID string (used in chat).
`personnel_gid` | string | | Only statistics for this operator, defined as Giosg-signed ID string used in chats
`personnel_email` | string | | Only statistics for this operator, defined by email address

```json
{
  "results": [
    {
      "start_time": "2015-03-07T15:00:00",
      "online_operators": 23,
      "logged_in_operators": 30,
      "chatting_operators": 25
    },
    {
      "start_time": "2015-03-07T16:00:00",
      "online_operators": 20,
      "logged_in_operators": 35,
      "chatting_operators": 20
    },
    {
      "start_time": "2015-03-07T17:00:00",
      "online_operators": 6,
      "logged_in_operators": 10,
      "chatting_operators": 2
    }
  ]
}
```

Attribute | Format | Description
:---------|:-------|------------
`start_time` | [date/time][] | The starting time of this aggregation. Its duration is equal to the selected time interval, e.g. 1 hour. This time is in the "local" time if a timezone was defined, otherwise it is in UTC.
`online_operators` | integer | Number of operators online
`logged_in_operators` | integer | Number of operators logged in
`chatting_operators` | integer | Number of operators chatting

## Sales statistics time series

<aside class="notice">
This endpoint has been updated on August 2015 to a new version <strong>v4</strong>!
</aside>

**Please use this version instead of the [deprecated version v3](https://docs.giosg.com/doku.php?id=public:technical-documentation:backend-api:reporting-api#get_api_v3_reporting_salesstats_timeline), as it will be removed in the future!**

You can get the aggregated shopping cart (giosg BASKET) statistics by making a GET request.

`GET https://service.giosg.com/api/v4/reporting/salesstats/timeline`

You may define define these optional GET parameters to localize and filter the sales stats aggregation results.

Parameter | Format | Default | Description
:---------|:-------|:--------|------------
`room_gid` | string | | Only statistics on the room with this Giosg-signed ID string (used in chat). If not given, sales stats will be calculated from all company's rooms.

```json
{
  "results": [
    {
      "start_time": "2015-03-07T15:00:00",
      "total_sales": "2300.35",
      "chat_sales": "1800.20",
      "total_monthly_sales": "94.00", 
      "monthly_chat_sales": "37.50",
      "purchased_carts": 245,
      "purchased_carts_with_chat": 200
    },
    {
      "start_time": "2015-03-07T16:00:00",
      "total_sales": "2345.80",
      "chat_sales": "1740.99",
      "total_monthly_sales": "45.00", 
      "monthly_chat_sales": "13.00",
      "purchased_carts": 239,
      "purchased_carts_with_chat": 160
    }
  ]
}
```

Attribute | Format | Description
:---------|:-------|------------
`start_time` | [date/time][] | The starting time of this aggregation. Its duration is equal to the selected time interval, e.g. 1 hour. This time is in the "local" time if the timezone was defined, otherwise it is in UTC.
`total_sales` | string | Total sales, as a decimal string
`chat_sales` | string | Sales related to a chat conversation that has at least 3 messages, as a decimal string
`total_monthly_sales` | string | Total monthly billable sales, as a decimal string
`monthly_chat_sales` | string | Monthly billable sales related to a chat conversation that has at least 3 messages
`purchased_carts` | string | Count of carts that have been locked/purchased.
`purchased_carts_with_chat` | string | Count of carts with conversation that have been locked/purchased
