## Merging and Joining Datasets

```http
POST /datasets/{dataset_id}/variables/ HTTP/1.1
Content-Type: application/json

{
    "function": "adapt",
        "args": [{
            "dataset": "/datasets/{other_id}/"
        }, {
            "variable": "/datasets/{other_id}/variables/{right_key_id}/"
        }, {
            "variable": "/datasets/{dataset_id}/variables/{left_key_id}/"
        }
        // If present, will only join the indicated variables
        , {
            'variables': [
                "/datasets/{other_id}/variables/{variable1_id}/",
                "/datasets/{other_id}/variables/{variable2_id}/",
                "/datasets/{other_id}/variables/{variable3_id}/"
            ]
        }]
}

-----
HTTP/1.1 201 Created

```
