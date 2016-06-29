## Merging and Joining Datasets

```http
POST /datasets/{dataset_id}/variables/ HTTP/1.1
Content-Type: application/json

{
    "function": "select",
    "args": [
        {
            "function": "adapt",
            "args": [
                {
                    "dataset": "/datasets/{other_id}/",
                    "filter": {},
                    "where": {}
                },
                {
                    "variable": "/datasets/{other_id}/variables/{right_key_id}/"
                },
                {
                    "variable": "/datasets/{dataset_id}/variables/{left_key_id}/"
                },
                ... // Other future args
            ]
        }
    ]
}

-----
202 Continue

{
    "element": "shoji:view",
    "value": "/progress/{progress_id}/"
}
```
