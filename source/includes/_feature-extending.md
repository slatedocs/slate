## Merging and Joining Datasets

Crunch supports joining variables from one dataset to another by a key variable that maps rows from one to the other. To add a snapshot of those variables to the dataset, POST an `adapt`
function expression to its variables catalog.

```http
POST /api/datasets/{dataset_id}/variables/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json

{
    "function": "adapt",
    "args": [{
        "dataset": "https://beta.crunch.io/api/datasets/{other_id}/"
    }, {
        "variable": "https://beta.crunch.io/api/datasets/{other_id}/variables/{right_key_id}/"
    }, {
        "variable": "https://beta.crunch.io/api/datasets/{dataset_id}/variables/{left_key_id}/"
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

A successful request returns 202 Continue status with a progress resource in the response body; poll that to track the status of the asynchronous job that adds the data to your dataset.

Currently Crunch only supports left joins: all rows of the left (current) dataset will be kept, and only rows from the right (incoming) dataset that have a key value present in the left dataset will be brought in. Rows in the left dataset that do not have a corresponding row in the right dataset will be filled with missing values for the incoming variables.

The join key must be of type "numeric" or "text", must be the same type in both datasets, and must have unique values within each dataset.

### Joining a subset of variables

To select certain variables to bring over from the right dataset, include `select`
function expression around the `adapt` function described above:

```http
POST /api/datasets/{dataset_id}/variables/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json

{
    "function": "select",
    "args": [{
        "map": {
            "{right_var1_id}/": {
                "variable": "https://beta.crunch.io/api/datasets/{other_id}/variables/{right_var1_id}/"
            },
            "{right_var2_id}/": {
                "variable": "https://beta.crunch.io/api/datasets/{other_id}/variables/{right_var2_id}/"
            },
            "{right_var3_id}/": {
                "variable": "https://beta.crunch.io/api/datasets/{other_id}/variables/{right_var3_id}/"
            }
        }
    }],
    "frame": {
        "function": "adapt",
        "args": [{
            "dataset": "https://beta.crunch.io/api/datasets/{other_id}/"
        }, {
            "variable": "https://beta.crunch.io/api/datasets/{other_id}/variables/{right_key_id}/"
        }, {
            "variable": "https://beta.crunch.io/api/datasets/{dataset_id}/variables/{left_key_id}/"
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

### Joining a subset of rows

Rows to consider from the right dataset can also be filtered.
To do so, include a `filter` attribute on the payload, containing either a filter expression, wrapped under `{"expression": <expr>}`, or
an existing filter entity URL (from the right-side dataset), wrapped as `{"filter": <url>}`.

```http
POST /api/datasets/{dataset_id}/variables/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json

{
    "function": "adapt",
    "args": [{
        "dataset": "https://beta.crunch.io/api/datasets/{other_id}/"
    }, {
        "variable": "https://beta.crunch.io/api/datasets/{other_id}/variables/{right_key_id}/"
    }, {
        "variable": "https://beta.crunch.io/api/datasets/{dataset_id}/variables/{left_key_id}/"
    }],
    "filter": {
        "expression": {
            "function": "==",
            "args": [
                {"variable": "https://beta.crunch.io/api/datasets/{other_id}/variables/{variable_id}/"},
                {"value": "<value>"}
            ]
        }
    }
}
```

You can filter both rows and variables in the same request. Note that the "filter" parameter remains at the top-level function in the expression, which when specifying a variable subset is "select" instead of "adapt":

```http
POST /api/datasets/{dataset_id}/variables/ HTTP/1.1
Host: beta.crunch.io
Content-Type: application/json

{
    "function": "select",
    "args": [{
        "map": {
            "{right_var1_id}/": {
                "variable": "https://beta.crunch.io/api/datasets/{other_id}/variables/{right_var1_id}/"
            },
            "{right_var2_id}/": {
                "variable": "https://beta.crunch.io/api/datasets/{other_id}/variables/{right_var2_id}/"
            },
            "{right_var3_id}/": {
                "variable": "https://beta.crunch.io/api/datasets/{other_id}/variables/{right_var3_id}/"
            }
        }
    }],
    "frame": {
        "function": "adapt",
        "args": [{
            "dataset": "https://beta.crunch.io/api/datasets/{other_id}/"
        }, {
            "variable": "https://beta.crunch.io/api/datasets/{other_id}/variables/{right_key_id}/"
        }, {
            "variable": "https://beta.crunch.io/api/datasets/{dataset_id}/variables/{left_key_id}/"
        }]
    },
    "filter": {
        "filter": "https://beta.crunch.io/api/datasets/{other_id}/filters/{filter_id}/"
    }
}
```
