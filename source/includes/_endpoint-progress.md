## Progress

Progress resources provide information about the current state of a long-running server process in Crunch. Some requests at certain endpoints may return 202 status containing a progress URL in the body, at which one can monitor the progress of the request that was accepted and not yet completed.

#### GET

```http
GET /progress/{id}/ HTTP/1.1
```

```json
{
    "element": "shoji:view",
    "self": "https:/app.crunch.io/api/progress/{id}/",
    "value": {
        "progress": 22,
        "message": "exported 2 variables"
    }
}
```

`GET` on a Progress view returns a Shoji View containing information about the status of the indicated process. The "progress" attribute contains a integer between -1 and 100. Positive progress values indicate that the job is being processed, while a negative value indicates that an error occurred in processing. Zero entails that the job has not been started, while 100 indicated completion. Additionally, if the `id` from the request URL does not exist, `GET` will nevertheless return 200 status and indicate `"progress": 100`.

Optionally, the View will provide a message regarding current status.

You must be authenticated to `GET` this resource.
