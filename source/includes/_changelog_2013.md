# 2013

## December

### Option Value Objects

The original design of our Stores API treated every entity in our entire domain model as an individually addressable resource with a unique URL ID.

This approach has worked well in terms of providing great coverage across the entire set of objects on our platform, but it requires clients to fire off a large volume of HTTP requests to work with aggregate objects.

Our platform team is on a mission to simplify, simplify, simplify, and these aggregate sub-resources are one of the main targets in our sights.

This week, we rolled out support for embedded value objects in the [Option Set Options][1] resource. Each `option` object now has a `values` property containing a list of all value objects assigned to that option.

Providing all the relevant data in one place avoids some of the complex traversals that were previously required to read the complete state of options and option values.

[1]: /api/v2#option-sets-options

## November

### Orders Date Filters

We've just released a small update to the [Orders Resource][2] to improve the way that filtering by date works.

We now support filtering orders by **date modified** as well as **date created**. The full list of available date parameters is:

| Filter | Description |
| --- | --- |
|  **min_date_created**  |  Use this field to list orders created after a certain date |
|  **max_date_created**  |  Use this field to list orders created before a certain date |
|  **min_date_modified**  |  Use this field to list orders updated after a certain date |
|  **max_date_modified**  |  Use this field to list orders updated before a certain date |

We've also added support for [ISO 8601][3] format, which is better suited to use in querystring parameters than the original [RFC 2822][4] header format.

Previous requests that looked like:

    `/api/v2/orders?max_date_modified=Thu%2C+28+Nov+2013+00%3A00%3A51+GMT`

Can now be written in a much simpler way:

    `/api/v2/orders?max_date_modified=2013-11-28`
    `/api/v2/orders?max_date_modified=2013-11-28T23:53:10Z`

One of the most useful aspects of the ISO 8601 syntax is support for partial date values. For example, you can search for all orders by month or by year, simply by specifying the month and date parts:

    `/api/v2/orders?max_date_modified=2013`
    `/api/v2/orders?max_date_modified=2013-12`

We'll be rolling out ISO 8601 support across the rest of the API over the next few weeks, which should make filtering collections by date much more user friendly.

Support for the existing RFC 2822 format hasn't changed, so existing apps won't require updates, though we do recommend you give this new date format a try!

[2]: /api/v2#orders
[3]: http://en.wikipedia.org/wiki/ISO_8601
[4]: http://tools.ietf.org/html/rfc5322

## July

### Redirects Resource

Today, we're pleased to announce the addition of [Redirects][5] to the Stores API.

Redirects are mappings that trigger an `HTTP 301` response with a location header pointing from an incoming 'virtual' URL to an actual URL on a storefront. They're extremely useful in situations where you're migrating an existing website to Bigcommerce and want to transition old page URLs seamlessly while preserving SEO rankings.

The redirects resource exposes very similar functionality to that of the Bigcommerce Control Panel. The forward destination of a redirect can be generated automatically based on a pre-defined resource in Bigcommerce (linking to a product, category or brand) or it can be any manually defined URL path.

Read the [reference documentation][5] and take it for a spin!

[5]: /api/v2#redirects