Visitors API
============

## Room visitor

A visitor has a separate representation **for each room**. The returned attributes are different depending on from which room the visitor was requested.

**NOTE**: Not all visitor metadata may be available at the time of a request. In that case, they will be `null`. An appropriate notification will be sent via channels when the information becomes available.

Attribute         | Type       | Description
:-----------------|:-----------|:-----------------
`id`              | string     | Unique identifier for the visitor. This is the same for the same visitor regardless of the room from which the visitor was requested.
`room_id`         | [ID][]     | ID of the room from which this room visitor resource was requested
`is_online`       | boolean    | Whether or not the visitor currently online in the room
`become_online_at` | [date/time][] | When the visitor become online last time. This is always set when `is_online` is `true`.
`session_id`      | string     | Identifier for the latest session for the visitor in this room
`visit_count`     | integer    | During how many distinct sessions the visitor has been active on this room.
`device_type`     | string     | Either `desktop`, `mobile` or `tablet`
`browser`         | string     | Browser which the visitor is currently using
`os`              | string     | Operating system which the visitor is using
`language_code`   | string     | The language of the visitor's browser as a lower-case, two-letter ISO 639-1 language code
`user_agent`      | string     | User-Agent header of the visitor browser
`ip_address`      | string     | IP address of the visitor
`ip_company`      | string     | Company resolved from the IP address
`isp`             | string     | The best guess about the name of the Internet Service Provider for the visitor's Internet connection.
`country_code`    | string     | The best guess about the country where the visitor is currently located. This is usually resolved from their IP address. This is a upper-case, two-letter ISO 3166-1 country code
`country`         | string     | The country as in `country_code`, but represented as the name of the country.
`city`            | string     | The best guess about the name of the city where the visitor is currently located. This is usually resolved from their IP address.
`referrer_domain` | string     | Hostname from which the visitor entered the room during this session
`referrer_url`    | string     | The full URL from which the visitor entered the room during this session
`referrer_kind`   | string     | Either `website`, `direct`, `search`, `partner` or `int`
`screen_width`    | integer    | The width resolution of the visitor's screen
`screen_height`   | integer    | The height resolution of the visitor's screen

**TODO:** Pipeline?
**TODO:** Shopping carts?

### Get a collection of visitors currently online at a room

You can get a collection of visitors that are currently online at a room.

`/api/v5/orgs/<org_id>/rooms/<room_id>/online_visitors`

This API endpoint returns a [paginated collection][].

**TODO**: The ordering??

The corresponding channel is notified with a `added` notification whenever a visitor becomes online at that specific room (i.e. the `is_online` attribute on the [room visitor][] changes). Similarly, it is notified with a `removed` notification whenever we have not heard about the visitor (in that specific room) for a while, making the visitor offline at the room.

If any attribute of the room visitor changes, the channel receives a `changed` notification.

### Get a single visitor at a room

You can get a single visitor at the given room.

`/api/v5/orgs/<org_id>/rooms/<room_id>/visitors/<visitor_id>`
