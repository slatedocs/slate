<hr>
<section>

# Deprecations

## Communicating about breaking changes
<a name="communication" class="jump-anchor"></a>

<span class="description">
Whenever possible, the Asana API aims to preserve backwards compatibility for its users. Apps you write on top of the API now should, in ideal situations, continue to work indefinitely. However, there are a few rare cases where breaking changes are required. For example:
</span>

- When we identify a stability threat, we may need to partially limit or entirely deprecate the culprit feature in the API.
- When making a change in a backwards compatible way results in a cluttered, brittle, and confusing interface to Asana.
- When *not* making a breaking change poses a security vulnerability, such as when we migrated from SSLv3 to TLS 1.0.

If a breaking change is required, the API team will provide a number of resources to help our developers get through the change:

- We will communicate early, and through a variety of channels. We recommend that you join the [developers community forum](https://community.asana.com/c/developersAPI) to learn about changes to the API.
- We will provide a clear description of the change, how it affects your requests, and a migration plan to follow to transition through the deprecation.
- We will designate a deprecation period during which you will be able to choose between both old and new behavior from the API, allowing you to test out the change without having to put your entire app at risk.

## Response header notifications
<a name="response-header" class="jump-anchor"></a>

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

## Request header options
<a name="request-header" class="jump-anchor"></a>

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

## Client library support
<a name="client-libraries" class="jump-anchor"></a>

The latest version of our [official client libraries](/docs/official-client-libraries) for Python, Java, PHP, and JavaScript all support sending custom headers and are able to use our deprecations framework. Consult the individual libraries for how to send headers with each request.

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
