## Table

All datasets contain a /table/ endpoint which allows access the full data
values. It provides granular control over the rows and columns for each dataset.

### Fetching values

#### GET

Dataset editors can GET to this resource and obtain a Shoji Table of the 
dataset's data. It will expose all the variables that are visible by the 
authenticated user (Public + personals created by them if requested) as 
well as the exclusion filter applied (if any).

To include the personal variables on the output table the client should
include the `include_personal` GET parameter on the request with a True 
value.

A `metadata` section contains the definitions of all the variables matched
by variable ID with the corresponding entry under `data`.

Dataset viewers can only access the `metadata` portion of the response. This 
means they cannot make use of the `limit` and `offset` parameters to query
data unless the dataset's setting `viewers_can_export` is set to True, else
the server will respond with a 403 response.


```http
GET /datasets/:id/table/ HTTP/1.1
```

```json
{
  "self": "https:\/\/alpha.crunch.io\/api\/datasets\/:id\/table\/",
  "element": "crunch:table",
  "data": {
    "000007": [ 1, 1, 2 ],
    "000004": [ 1, 1, 1 ],
    "000005": [ 1, 0, 1 ],
    "000003": [ "red", "green", "MORE JUNK" ],
    "000000": [ 1, 2, 9 ],
    "000001": [ "2000-01-01T00:00:00", "2000-01-02T00:00:00", { "?": -1 } ],
    "000008": [ 1, 2, 3 ],
    "000009": [ 2, 3, 4 ],
    "00000c": [ [ 1, 1, 2 ], [ 1, 2, 3 ], [ 2, 3, 4 ] ]
  },
  "description": "A Crunch Table of data for this dataset.",
  "metadata": {
    "000004": {
      "alias": "bool1",
      "type": "categorical",
      "name": "mymrset | Response #1",
      "categories": [
        { "numeric_value": 1, "selected": true, "id": 1, "name": "1", "missing": false },
        { "numeric_value": 0, "id": 0, "name": "0", "missing": false },
        { "numeric_value": null, "id": -1, "name": "No Data", "missing": true }
      ],
      "description": "bool1"
    },
    "000005": {
      "alias": "bool2",
      "type": "categorical",
      "name": "mymrset | Response #2",
      "categories": [
        { "numeric_value": 1, "selected": true, "id": 1, "name": "1", "missing": false },
        { "numeric_value": 0, "id": 0, "name": "0", "missing": false },
        { "numeric_value": null, "id": -1, "name": "No Data", "missing": true }
      ],
      "description": "bool2"
    },
    "000003": {
      "alias": "str",
      "type": "text",
      "name": "str",
      "missing_reasons": { "No Data": -1 },
      "description": "40 character string"
    },
    "000000": {
      "alias": "x",
      "type": "categorical",
      "name": "x",
      "categories": [
        { "numeric_value": 1, "id": 1, "name": "red", "missing": false },
        { "numeric_value": 2, "id": 2, "name": "green", "missing": false },
        { "numeric_value": 3, "id": 3, "name": "blue", "missing": false },
        { "numeric_value": 4, "id": 4, "name": "4", "missing": false },
        { "numeric_value": 8, "id": 8, "name": "8", "missing": true },
        { "numeric_value": 9, "id": 9, "name": "9", "missing": false },
        { "numeric_value": null, "id": -1, "name": "No Data", "missing": true }
      ],
      "description": "Numeric variable with value labels"
    },
    "000001": {
      "name": "y",
      "type": "datetime",
      "missing_reasons": { "No Data": -1 },
      "alias": "y",
      "resolution": "s",
      "description": "Date variable"
    },
    "00000c": {
      "alias": "categorical_array",
      "type": "categorical_array",
      "name": "categorical_array",
      "subvariables": ["000007", "000008", "000009"],
      "subreferences": {
        "000009": {"alias": "ca_subvar_1", "name": "ca_subvar_1", "description": ""},
        "000007": {"alias": "ca_subvar_2", "name": "ca_subvar_2", "description": ""},
        "000008": {"alias": "ca_subvar_3", "name": "ca_subvar_3", "description": ""}
      },
      "categories": [
        { "numeric_value": null, "selected": false, "id": 1, "missing": false, "name": "a" },
        { "numeric_value": null, "selected": false, "id": 2, "missing": false, "name": "b" },
        { "numeric_value": null, "selected": false, "id": 3, "missing": false, "name": "c" },
        { "numeric_value": null, "selected": false, "id": 4, "missing": false, "name": "d" },
        { "numeric_value": null, "selected": false, "id": -1, "missing": true, "name": "No Data" }
      ],
      "description": ""
    }
  }
}

```

#### Filtering

This endpoint accepts the same filter parameters described under 
Filtering Endpoints