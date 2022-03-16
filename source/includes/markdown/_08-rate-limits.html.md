<hr>
<section>

# Rate Limits

<span class="description">
To protect the stability of the API and keep it available to all users, Asana enforces multiple kinds of rate limiting. Requests that hit any of our rate limits will receive a `429 Too Many Requests` response, which contains the standard `Retry-After` header indicating how many seconds the client should wait before retrying the request.
</span>

Limits are allocated per authorization token. Different tokens will have independent limits.

The [client libraries](/docs/official-client-libraries) respect the rate-limited responses and will wait the appropriate amount of time before automatically retrying the request, up to a configurable maximum number of retries.

<a name="standard"></a>
## Standard Rate Limits

> Request

```http
GET https://app.asana.com/api/1.0/users/me HTTP/1.1
Authorization: Bearer <personal_access_token>
```

> Response

```http
HTTP/1.1 429 Too Many Requests
Content-Type: application/json
Retry-After: 30

{
  "errors": [
  {
    "message": "You've made too many requests and hit a rate limit. Please retry after the given amount of time."
  }
  ]
}
```

Our standard rate limiter imposes a quota on how many requests can be made in a given window of time. Our limits are based on minute-long windows, and differ depending on whether the domain is premium or not. We may change these quotas or add new quotas (such as maximum requests per hour) in the future.

| Domain type | Maximum requests per minute |
|---|---|
| Free | 150 |
| Premium | 1500 |

In addition, calls to the [search API](/docs/search-tasks-in-a-workspace) are limited to 60 requests per minute. The [duplication endpoints](/docs/duplicate-a-task) are limited to 5 concurrent jobs.

Although the quota is defined per minute, it is evaluated more frequently than once per minute, so you may not need to wait for a full minute before retrying your request. For requests rejected by this limiter, the `Retry-After` header has the result of this calculation.

Requests rejected by this limiter **still count against the quotas** so that ignoring the `Retry-After` header will result in fewer and fewer requests being accepted during the subsequent tine windows.

<a name="concurrent"></a>
## Concurrent Request Limits

In addition to limiting the total number of requests in a given time window, we also limit the number of requests being handled at any given instant. We may change these limits or add new limits in the future.

| Request type | Maximum concurrent requests |
|---|---|
| Reads `GET` | 50 |
| Writes `POST, PUT, PATCH, DELETE` | 15 |

For example, if you have 50 read requests in-flight and attempt to make another read request, the API will return a `429 Too Many Requests` error. The read and write limits are independent of each other, so the number of read requests you make at one time will have no impact on the number of write requests you can make.

Responses for requests rejected by this concurrent request limiter will contain a `Retry-After` header specifying a duration long enough (in seconds) such that the other in-flight requests are guaranteed to have either completed or timed out.

<a name="cost"></a>
## Cost Limits

Objects in Asana are connected to each other in a graph. Some examples of links in this graph are:

- a task object is linked to a user object as the assignee
- a user is linked to the projects it's following
- a tag is linked to all its tasks
- a task is linked to all its subtasks
- a task is linked to all its custom field values

Depending on the kind of requests you make to our API, our servers have to traverse different parts of the graph. The sizes of these parts directly influence how expensive it is for our servers to build the API responses. For example, fetching just the name and `gid` of a task requires very few resources and no traversal of the graph, but fetching all tasks in a project and all their attributes (assignee, followers, custom fields, likes) can require following several thousand links in the graph.

Because there can be a wide range in the cost of any given API request in terms of the computational resources and database load, the standard rate limits are not always enough to maintain stability of the API. In the past, when we’ve received bursts of expensive requests, our typical course of action has been to block the offending authorization token and reject all future requests, resulting in confusion for both the user and the app developer. Instead, to protect against the extreme cases where API requests require inordinate traversal of the graph, we impose an additional limit based on the computational cost.

The cost we associate with a request isn't equivalent to the number of links in the subset of the graph involved, but it is roughly proportional. The cost of a request is calculated after the response has been fully built and we know how much data we needed to fetch from our databases to build it. This cost is then deducted from a quota, and the response is returned. Because the cost of a request is not known until we’ve built the response, we allow this deduction to result in a net negative quota. The request that causes the quota to become negative will receive the expected response and not be rejected.

When a request is received, if the remaining quota is not positive, the new request is rejected with a `429 Too Many Requests`. As with the standard rate limits, this quota is defined per-minute but is updated on a more frequent interval. The `Retry-After` header will specify how long you must wait for the quota to become positive again.

The **vast** majority of developers will be unaffected by the cost limit, and the quota is set sufficiently high that it only affects users making requests that would compromise the stability of the API. Rather than unconditionally blocking their token from the API, this cost limiter will permit them to continue operation at a slower but safe and stable rate.

## Common issues & pathological cases to avoid

* Deeply nested subtasks (i.e. working sub-subtasks, sub-sub-subtasks, etc.)
* Projects with too many tasks (i.e projects with over 1,000 tasks)
* Too many unreadable tags in a workspace
* Domains with too many projects for typeahead to work well
* Undeleted webhooks


<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
