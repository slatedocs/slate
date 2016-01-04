Visitors API
============

## Room visitor

A visitor has a separate representation **for each room**. The returned attributes are different depending on from which room the visitor was requested.

<aside class="warning">
<strong>NOTE</strong> that all the metadata may not be available at the time of a request. In that case, they will be <code>null</code>. An appropriate notification will be sent via channels when the information becomes available.
</aside>

Attribute         | Type       | Description
:-----------------|:-----------|:-----------------
`id`              | string     | Unique identifier for the visitor. This is the same for the same visitor regardless of the room from which the visitor was requested.
`room_id`         | [ID][]     | ID of the room from which this room visitor resource was requested
`is_online`       | boolean    | Whether or not the visitor currently online in the room
`become_online_at` | [date/time][] | When the visitor become online last time. This is always set when `is_online` is `true`.
`session_id`      | string     | Identifier for the latest session for the visitor in this room
`visit_count`     | integer    | During how many distinct sessions the visitor has been active on this room.
`device_type`     | string     | Either `desktop`, `mobile` or `tablet`
`browser_name`    | string     | Name of the browser which the visitor is currently using, without any version number.
`browser_version` | string     | Version of the browser which the visitor is currently using.
`os_name`         | string     | Name of the operating system which the visitor is using
`os_version`      | string     | Version of the operating system which the visitor is using
`user_agent`      | string     | User-Agent header of the visitor browser
`ip_address`      | string     | IP address of the visitor (IPv4)
`ip_organization` | string     | An organization name resolved from the IP address
`geo_city`        | string     | The best guess about the name of the city where the visitor is currently located. This is usually resolved from their IP address.
`geo_country_code`| string     | The best guess about the country where the visitor is currently located. This is usually resolved from their IP address. This is a upper-case, two-letter ISO 3166-1 country code
`geo_country`     | string     | The country as in `country_code`, but represented as the name of the country.
`referrer_url`    | string     | The full URL from which the visitor entered the room during this session
`referrer_hostname` | string     | Hostname from which the visitor entered the room during this session
`referrer_medium`   | string     | Either `internal`, `search`, `email`, `social`, or `website`
`referrer_source`   | string     | The name of the referrer source
`device_screen_width`  | integer | The width resolution of the visitor's screen
`device_screen_height` | integer | The height resolution of the visitor's screen

**TODO:** Pipeline?
**TODO:** Shopping carts?

Changes to a visitor is notified to the following [channels][]:

Channels    | Description
------------|---------------
`/api/v5/orgs/<organization_id>/rooms/<room_id>/online_visitors/<visitor_id>` | For a changed visitor, for each room where the visitor is currently online, and for each organization having access to that room

<aside class="warning">
Note that <strong>there is no</strong> collection channel <code>/api/v5/orgs/&lt;organization_id&gt;/rooms/&lt;room_id&gt;/online_visitors</code> for performance reasons. You need to listen each visitor separately.
</aside>

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
