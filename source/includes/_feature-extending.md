## Merging and Joining Datasets

Making a minimal change from our Join API, switching PATCH to POST, and adding args:

```http
POST /datasets/{dataset_id}/joins/ HTTP/1.1
Content-Type: application/json

{
    "left_key": "",
    "right_key": "",
    "where": {},
    "filter": {},
    "method": {
        "all_left": true,
        "all_right": false
    }
}

-----
202 Continue

{
    "element": "shoji:view",
    "value": "/progress/{progress_id}/"
}
```

Or, reorganizing the args and looking more to the future:

```http
POST /datasets/{dataset_id}/joins/ HTTP/1.1
Content-Type: application/json

{
    "left": {
        "key": [""],
        "keep_all": true
    },
    "right": {
        "key": [""],
        "keep_all": false,
        "where": {},
        "filter": {}
    }
}

-----
202 Continue

{
    "element": "shoji:view",
    "value": "/progress/{progress_id}/"
}
```
