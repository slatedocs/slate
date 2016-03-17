## Progress

The progress api provides information about the current state of a given backend process in crunch.
The api will never 404, so if you provide an invalid progress_id, it will return as if the process is completed (progress: "100").
This has to do with the way stores persistence, when a process completes, it deletes the persistence for that particular
progress entity.  Optionally, the progress will provide a message regarding current status.  There will be a progress
value which is a float encapsulated in a string for performance reasons.  You must be authenticated to utilize this resource.


### Catalog

#### GET

```http
GET /progress/{id}/ HTTP/1.1
```
```shell
```
```r
```

```python
```

```json
{
    element: "shoji:view",
    self: "https://api/progress/{id}/",
    value: {
        progress: "22.5",
        message: "exported 2 variables",
        dataset_id: "{id}"
    }
}
```

