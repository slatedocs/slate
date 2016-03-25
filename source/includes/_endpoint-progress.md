## Progress

Progress resources provide information about the current state of a long-running server process in Crunch. Some requests at certain endpoints may return 202 status and include a Location header pointing to a Progress resource, at which one can monitor the progress of the request that was accepted and not yet completed (i.e. 202 status).

#### GET

```http
GET /progress/{id}/ HTTP/1.1
```

```json
{
    "element": "shoji:view",
    "self": "https:/beta.crunch.io/api/progress/{id}/",
    "value": {
        "progress": "22.5",
        "message": "exported 2 variables",
        "dataset_id": "{id}"
    }
}
```

`GET` on a Progress view returns a Shoji View containing information about the status of the indicated process. The "progress" attribute contains a value between 0.0 and 100.0, stringified. If the `id` from the request URL does not exist, `GET` will nevertheless return 200 status and indicate `"progress": "100"`.

Optionally, the View will provide a message regarding current status.

You must be authenticated to `GET` this resource.
