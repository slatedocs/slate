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
`is_present`       | boolean    | Whether or not the visitor is currently present in the room
`session_id`      | string     | Identifier for the latest session for the visitor in this room
`priority`        | integer     | Current priority of the visitor
`visit_count`     | integer    | During how many distinct sessions the visitor has been active on this room.
`device_type`     | string     | Either `desktop`, `mobile` or `tablet`
`device_screen_width`  | integer | The width resolution of the visitor's screen
`device_screen_height` | integer | The height resolution of the visitor's screen
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
`referrer_hostname` | string   | Hostname from which the visitor entered the room during this session
`referrer_medium`   | string   | Either `internal`, `search`, `email`, `social`, or `website`
`referrer_source`   | string   | The name of the referrer source
`original_referrer_url` | string | The full URL from which the visitor originally entered the room
`original_referrer_hostname` | string | Hostname from which the visitor originally entered the room
`original_referrer_medium` | string | Either `internal`, `search`, `email`, `social`, or `website`
`original_referrer_source` | string | The name of the original referrer source
`current_page_url` | string | URL of the web page at which the visitor is currently, at this room.
`current_page_canonical_url` | string | Canonical URL of the web page at which the visitor is currently, at this room. Same than `current_page_url` if no canonical URL is available.
`current_page_title` | string | Title of the web page at which the visitor is currently, at this room.
`shopping_cart_currency` | string     | The currency of the visitor's shopping cart in the room, if the visitor has any, otherwise `null`. Currency is a upper-case [ISO 4217 currency code](http://www.xe.com/iso4217.php), e.g. `EUR`.
`shopping_cart_total_value` | string  | The total value of the visitor's shopping cart in the room, if the visitor has any. Value `null` means the shopping cart is not defined. The value is presented as a decimal string, e.g. `59.00` in the currency defined by `shopping_cart_currency`.
`shopping_cart_total_subscription_value` | string  | The total monthly subscription value of the visitor's shopping cart in the room, if the visitor has any. Value `null` means the shopping cart is not defined. The value is presented as a decimal string, e.g. `59.00` in the currency defined by `shopping_cart_currency` and <strong>per month</strong>.
`shopping_cart_locked_at` | [date/time][] | When the visitor checked out their shopping cart in this room. It is `null` if the cart is not yet checked out or the cart is not defined.

<aside class="warning">
The following attributes also exists but they are <strong>deprecated</strong>, so you should avoid using them.
</aside>

Attribute             | Type       | Description
:---------------------|:-----------|:-----------------
`pipeline_step_index` | integer | Number of the current pipeline step of the visitor starting from 1, or `null` if not in a pipeline.
`pipeline_step_title` | string | Name of the current pipeline step of the visitor, or `null` if not in a pipeline.
`pipeline_step_count` | integer | The total number of steps in the pipeline, or `null` if not in a pipeline.

### Get a a groups of priority visitor at a room

Returns a subset of room visitors. This collection contains visitors that have the most priority.

`/api/v5/orgs/<org_id>/rooms/<room_id>/priority_visitors`

This API endpoint returns a [paginated collection][].


### Get a single visitor at a room

You can get a single visitor at the given room.

`/api/v5/orgs/<org_id>/rooms/<room_id>/present_visitors/<visitor_id>`

### Channels

Changes to a visitor is notified to the following [channels][]:

Channels    | Description
------------|---------------
`/api/v5/orgs/<organization_id>/rooms/<room_id>/priority_visitors` | For each room where the visitor is currently online, and for each organization having access to that room.
`/api/v5/orgs/<organization_id>/rooms/<room_id>/present_visitors/<visitor_id>` | For a changed visitor, for each room where the visitor is currently online, and for each organization having access to that room

Channels are notified with a `added` notification whenever a visitor becomes online at that specific room (i.e. the `is_online` attribute on the [room visitor][] changes). Similarly, it is notified with a `removed` notification whenever we have not heard about the visitor (in that specific room) for a while, making the visitor offline at the room.

If any attribute of the room visitor changes, the channel receives a `changed` notification.
