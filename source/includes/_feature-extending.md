## Merging and Joining Datasets

It is possible to copy over data from another dataset by joining them together.
Doing so will join only non personal variables.

To join and bring over the right dataset it is necessary to POST an `adapt`
function expression to the variables catalog endpoint. This will fire up an
asynchronous task to add all the new variables in the current dataset.


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
    }]
}

-----
HTTP/1.1 202 Accepted


{
    "element": "shoji:view",
    "self": "https://beta.crunch.io/api/datasets/{dataset_id}/variables/",
    "value": "https://beta.crunch.io/api/progress/5be82a/"
}

```

It is also possible to indicate which variables are desired to copy over instead
of copying the full right dataset. To do so it is necessary to use a `select` 
function expression over the right dataset. Will have this shape:

```http
POST /datasets/{dataset_id}/variables/ HTTP/1.1
Content-Type: application/json

{
    "function": "select",
    "args": [{
        "map": {
            "{right_var1_id}/": {
                "variable": "/datasets/{other_id}/variables/{right_var1_id}/"
            },
            "{right_var2_id}/": {
                "variable": "/datasets/{other_id}/variables/{right_var2_id}/"
            },
            "{right_var3_id}/": {
                "variable": "/datasets/{other_id}/variables/{right_var3_id}/"
            }
        }
    }],
    "frame": {
        "function": "adapt",
        "args": [{
            "dataset": "/datasets/{other_id}/"
        }, {
            "variable": "/datasets/{other_id}/variables/{right_key_id}/"
        }, {
            "variable": "/datasets/{dataset_id}/variables/{left_key_id}/"
        }]
    }
}

-----
HTTP/1.1 202 Accepted


{
    "element": "shoji:view",
    "self": "https://beta.crunch.io/api/datasets/{dataset_id}/variables/",
    "value": "https://beta.crunch.io/api/progress/5be82a/"
}

```

Personal variables will be ignored and not copied.