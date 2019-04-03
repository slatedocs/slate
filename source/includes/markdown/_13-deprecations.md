## Deprecations

<a name="communication" class="jump-anchor"></a>
### Communicating about breaking changes

Whenever possible, the Asana API aims to preserve backwards compatibility for its users. Apps you write on top of the API now should, in ideal situations, continue to work indefinitely. However, there are a few rare cases where breaking changes are required. For example:

- When we identify a stability threat, we may need to partially limit or entirely deprecate the culprit feature in the API.
- When making a change in a backwards compatible way results in a cluttered, brittle, and confusing interface to Asana.
- When *not* making a breaking change poses a security vulnerability, such as when we migrated from SSLv3 to TLS 1.0.

If a breaking change is required, the API team will provide a number of resources to help our developers get through the change:

- We will communicate early, and through a variety of channels. We recommend that you subscribe to our developer newsletter and join the [developers community forum](https://community.asana.com/c/developersAPI), and periodically check [our blog](/developers/news).
- We will provide a clear description of the change, how it affects your requests, and a migration plan to follow to transition through the deprecation.
- We will designate a deprecation period during which you will be able to choose between both old and new behavior from the API, allowing you to test out the change without having to put your entire app at risk.

<a name="response-header" class="jump-anchor"></a>
### Response header notifications

While the previously mentioned communication channels are the best place to learn about upcoming changes, the API _itself_ will also alert you of upcoming changes. Shortly after we post communication, the API will begin sending `Asana-Change` headers in the responses. These headers will have two or three pieces of information:

- The unique name of the change
- A URL to our blog post describing the change 
- Optionally, a flag indicating that your specific request would be affected.

This header may be present multiple times in the response if there are multiple ongoing changes. Here's an example of one of these headers:

```text
Asana-Change: name=security_headers;info=https://asa.na/api-sh;affected=true
Asana-Change: name=other_change;info=https://asa.na/api-oc
```

**Note:** If your request is *not* affected, we will not claim `affected=false`. This is in case, during the deprecation, we detect that the change has a larger scope than initially thought. A request going from "you **may** be affected" to "you definitely **are** affected" is an acceptable update, but a request going from "you definitely are **not** affected" to "you definitely **are** affected" is not an acceptable update.

<a name="request-header" class="jump-anchor"></a>
### Request header options

During the deprecation period, you can test out how the API will behave by sending additional headers in your requests. Sending an `Asana-Enable` header including comma-separated names of features will turn those features on for that request. Sending an `Asana-Disable` header will do the opposite and turn those features off for that request.

If no header is specified, the default behavior will be determined by how far into the deprecation period we are:

- Before the start of the deprecation period (the "start date") the feature will be disabled, and it will not be possible to enable it.
- After the start date, the feature will be disabled by default, but you can begin choosing whether to enable or disable it.
- In roughly the middle of the deprecation period (the "activation date") the default behavior will switch and the feature will be enabled by default. You can continue to disable it with the appropriate header.
- At the end of the deprecation period (the "end date") the feature will be enabled and you will no longer be able to manually disable it.

The start, activation, and end dates will clearly be documented in our communications. These days may be pushed into the future if we discover that developers need more time to migrate their apps, but they are guaranteed to never occur sooner than documented.

These dates are arranged such that, if a developer happens to miss our communication and their app breaks when the default behavior changes on the activation date, they can begin sending the `Asana-Disable` header to restore the old behavior and use the remaining half of the deprecation period to make their app compatible.

Here's an example of how these headers would look:

```text
Asana-Enable: security_headers,another_change
Asana-Disable: a_third_change
```

Aside from reserving the right to push the date of changes to a future date, the precise *time* during the activation date isn't specified. However, since the default will only affect your integration if you do not pass either the `Asana-Enable` or `Asana-Disable` headers for a particular deprecation you can ensure predictable behavior of our API for your app during the entire period, including throughout the activation date.

The way we recommend you implement these changes in your integration is this:

- Whenever you detect a new Asana-Change header, log these requests and be sure to take note that a change is coming. Recall that the `info` key in the header will contain a link with the details.
- Identify the nature of the upcoming deprecation and decide if your integration is sensitive to the change, paying particular attention to the cases where we return `affected=true`.
- If changes are necessary in your integration, test the new behavior manually by making requests with `Asana-Enable` set to the name of the deprecation. This should provide a clear example of the new behavior as it is implemented in our API.
- Implement the changes in your integration in such a way that it can handle the new behavior **and** be sure to pass the `Asana-Enable` header when you make requests. This will ensure that you will always get the new behavior regardless of when the default behavior changes.

At this point, your integration has been migrated to the new behavior. At any point after the end date the `Asana-Enable` header will be ignored by the Asana API and you can feel free to remove it. (We strongly recommend keeping it all the way through the end date in case of unforseen circumstances that cause us to temporarily reset the default behavior from the new implementation to the deprecated behavior.)

<a name="client-libraries" class="jump-anchor"></a>
### Client library support

The latest version of our [official client libraries](/developers/documentation/getting-started/client-libraries) for Python, Java, PHP, and Javascript all support sending custom headers and are able to use our deprecations framework. Consult the individual libraries for how to send headers with each request.


<a name="active-deprecations" class="jump-anchor"></a>
### Active deprecations

Here is a table of recent, ongoing, and upcoming deprecations, including their header names, links to resources, and relevant dates where available. If dates are available, the next date to occur for that change is bolded.

| Deprecation | Header name | Start date | Activation date | End date |
|-------------|-------------|------------|-----------------|----------|
| [Security headers](https://asa.na/api-sh) | `security_headers` | 2018-08-03 | 2018-09-28 | 2018-11-15 |
| [New rich text](https://asa.na/api-rich-text) | `new_rich_text` | 2018-08-07 | 2018-10-15 | 2018-12-17 |
| [New task subtypes](https://asa.na/api-task-subtypes) | `new_task_subtypes` | 2018-10-01 | **See [1]** | 1 mo. after activation |
| [New sections](https://asa.na/api-sections) | `new_sections` | 2019-01-28 | **See [2]** | **See [2]** |
| [String IDs](https://asa.na/api-string-ids) | `string_ids` | 2019-02-12 | 2019-08-13 | 2020-02-11 |

**[1]** The activation date for this change will be one month after the public launch of the new task subtype. The end date for this change will be two months after the public launch.

**[2]** This migration is happening simultaneously with the rollout of a change to the Asana web app, and so the timeline for it is subject to change with ongoing development of the web app. Refer to the [deprecation details](https://asa.na/api-sections) for the most current information.
