<hr>
<section>

# Pagination

<span class="description">
Paginating requests for object sets that may be large is highly recommended. For requests that will return large result
sets the API may truncate the result or timeout attempting to gather the data. Pagination ensures a more reliable
experience by limiting requests to a smaller number of objects at a time, ultimately getting you the results faster;
should there be more results, the API will return an offset that will allow you to access the next page.
</span>

#### Strongly prefer paginated requests

For all new features in the Asana API, we're making pagination **required** by
specifying a value for the **limit** parameter. Though they may return more
results, our current unpaginated requests are still ultimately subject to a
timeout limit, which means requests that work successfully one day may fail later due
to factors such as server load and network latency.

Pagination limits provide a mechanism to specify a page size that we should
always be able to serve regardless of these factors. To prevent current
integrations from breaking, pagination is not enabled by default on
"grandfathered" endpoints; instead, you can request paginated results by
providing the optional **limit** parameter in your query. We will be working to
deprecate requests to these endpoints in the future.

> Request

```shell
!
curl "https://app.asana.com/api/1.0/tasks?project=1337&limit=5&offset=eyJ0eXAiOJiKV1iQLCJhbGciOiJIUzI1NiJ9" \
  -H "Authorization: Bearer <personal_access_token>"
```

> Response

```json
{
  "data": [
    {
      "id": 1000,
      "name": "Task 1",
      ...
    },
    ...
  ],
  "next_page": {
    "offset": "yJ0eXAiOiJKV1QiLCJhbGciOiJIRzI1NiJ9",
    "path": "/tasks?project=1337&limit=5&offset=yJ0eXAiOiJKV1QiLCJhbGciOiJIRzI1NiJ9",
    "uri": "https://app.asana.com/api/1.0/tasks?project=1337&limit=5&offset=yJ0eXAiOiJKV1QiLCJhbGciOiJIRzI1NiJ9"
  }
}
```

Note that all of Asana's official [client
libraries](/docs/official-client-libraries) support
pagination by default.

When making a paginated request, the API will return a number of results as specified by the **limit** parameter.
If more results exist, then the response will contain a **next_page** attribute, which will include an **offset**, a
relative **path** attribute, and a full **uri** attribute. If there are no more pages available, **next_page** will be
null and no offset will be provided. Do note that an offset token will expire after some time, as data may have changed.

When making paginated requests you are able to page through all objects for a particular query up to 100 objects at a time.
Alternatively your query will be truncated at about 1000 objects. In addition, when issuing non-paginated requests to
organizations with a large number of objects queries may time out before returning. For these reasons, we recommend that
you paginate all requests to the API.

| Parameter | Description |
|---|---|
| Limit | `20` The number of objects to return per page. The value must be between 1 and 100. |
| Offset | `eyJ0eXAiOJiKV1iQLCJhbGciOiJIUzI1NiJ9` An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. <br><br><strong>Note:</strong> You can only pass in an offset that was returned to you via a previously paginated request. |

**This method returns paginated results for tasks from a project.**

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
