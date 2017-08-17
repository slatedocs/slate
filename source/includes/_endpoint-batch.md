## Batches

### Catalog

`/datasets/{id}/batches/`

#### GET

A GET request on this resource returns a Shoji Catalog enumerating the batches present in the Dataset. Each tuple in the index includes a "status" member, which may be one of "analyzing", "conflict", "error", "importing", "imported", or "appended".

```json
{
    "element": "shoji:catalog",
    "self": "...datasets/837498a/batches/",
    "index": {
        "0/": {"status": "appended"},
        "2/": {"status": "error"},
        "3/": {"status": "importing"}
    }
}
```

#### POST

A POST to this resource adds a new batch. The request payload can contain (1) the URL of another Dataset, (2) the URL of a Source object, or (3) a Crunch Table definition with variable metadata, row data, or both.

A successful request will return either 201 status, if sufficiently fast, or 202, if the task is large enough to require processing outside of the request cycle. In both cases, the newly created batch entity's URL is returned in the Location header. The 202 response contains a body with a Progress resource in it; poll that URL for updates on the completion of the append. See [Progress](#progress).

Batches are created in `analyzing` state and will be advanced through `importing`, `imported`, and `appended` states if there are no problems. If there was a problem in processing it, its status will be `conflict` or `error`. Note that the response status code will always be 202 for asynchronous or 201 for synchronous creation of the batch whether there were conflicts or not. So you need to GET the new batch's URL to see if the data is good to go (status `appended`).

If an append is already in process on the dataset, the POST request will return 409 status.

##### Appending a dataset

To append a Dataset, POST a Shoji Entity with a dataset URL. You must have at least view (read) permissions on this dataset. Internally, this action will create a Source entity pointing to that dataset.

```json
{
  "element": "shoji:entity",
  "body": {
      "dataset": "<url>"
  }
}
```

The variables from the incoming dataset to be included by default will depend
on the current user's permissions. Those with edit permissions on the incoming dataset will
append all public and hidden (`discarded = true`) variables. Those with only view permissions will
 just include public variables that aren't hidden.

To append only certain variables from the incoming dataset, include an `where` attribute in the entity body. See [Frame functions](#frame-functions) for how to compose the `where` expression.

```json
{
  "element": "shoji:entity",
  "body": {
      "dataset": "<url>",
      "where": {
          "function":"select",
          "args": [
                {"map":
                    {"000001": {"variable": "<url>"},
                     "000002": {"variable": "<url>"}}
                }
          ]
      }
  }
}
```

Users with edit permissions on the incoming dataset can select hidden variables to be included, but viewers cannot. Editors and viewers can however both specify their personal variables to be included.

To select a subset of rows to append, include an `filter` attribute in the entity body, containing a Crunch filter expression.

```json
{
  "element": "shoji:entity",
  "body": {
      "dataset": "<url>",
      "where": {
          "function":"select",
          "args": [
                {"map":
                    {"000001": {"variable": "<url>"},
                     "000002": {"variable": "<url>"}}
                }
          ]
      },
      "filter": {
          "function":"<",
          "args": [
                {"variable": "<url>"},
                {"value": "<value>"}
          ]
      }  
  }
}
```


##### Appending a source

POST a Shoji Entity with a Source URL. The user must have permission to view the Source entity. Use Source appending to send data in CSV format that matches the schema of the Dataset.

```json
{
  "element": "shoji:entity",
  "body": {
      "source": "<url>"
  }
}
```

##### Appending a Crunch Table

The variables IDs must match those of the target dataset since their types will be matched based on ID. The data is expected to match the target dataset's variable types. This action will create a new Source entity, its name and description will match those provided on the JSON response, if not provided they'll default to empty string.

```json
{
  "element": "crunch:table",
    "name": "<optional string>",
    "description": "<optional string>",
    "data": {
      "var_url_1": [1, 2, 3, ...],
      "var_url_2": ["a", "b", ...]
    }
}
```

##### Managing Append Failures

In case of failures while appending the batch, the dataset will be automatically reverted
back to the state it was before the append and the batch is automatically deleted.

This behavior can be changed by providing a `autorollback: false` value into the POST
performed to append the data. When `autorollback: false` is provided a savepoint to which
user can revert to is still created, but the dataset is left in errored state for inspection.
The user can then manually revert to the savepoint and delete the associated batch.

```json
{
  "element": "shoji:entity",
  "autorollback": false,
  "body": {
      "source": "<url>"
  }
}
```

In case of appending to an empty dataset you might want to avoid the cost of creating
a savepoint at all as reverting to it will just lead to an empty dataset which you probably
just want to delete, in such case a `savepoint: false` value can be provided which will
totally disable the savepoint support:

```json
{
  "element": "shoji:entity",
  "savepoint": false,
  "body": {
      "source": "<url>"
  }
}
```

#### Checking if an append will cause problems

`/datasets/{id}/batches/compare/`


An append cannot proceed if there are any conditions in the involved datasets
that will cause ambiguous situations. If such datasets were to be appended
the server will return a 409 response.

It is possible to verify these conditions before trying the append using
the batches compare endpoint.

```
GET /datasets/4bc6af/batches/compare/?dataset=http://app.crunch.io/api/datasets/3e2cfb/
```

The response will contain a conflicts key that can contain either `current`,
`incoming` or `union` depending on the type and location of the problem. The response status
will always be 200, with conflicts, described below, or an empty body.

 * `current` refers to issues find on the dataset where new data would be added
 * `incoming` has issues on the far dataset that contains the new data to add
 * `union` expresses problems on the combined variables(metadata) of the final dataset after append.

```json

{
    "union": {...},
    "current": {...},
    "incoming": {...}
}

```

A successful response will not contain any of the keys returning an empty object.


```json

{}

```


The possible keys in the conflicts and verifications made are:

* **Variables missing alias**: All variables should have a valid alias string. This will indicate the IDs of those that don’t.
* **Variables missing name**:  All variables should have a valid name string. This will indicate the IDs of those that don’t.
* **Variables with duplicate alias**: In the event of two or more variables sharing an alias, they will be reported here. When this occurs as a _union_ conflict, it is likely that names and aliases of a variable or subvariable in _current_ and _incoming_ are swapped (e.g., VariantOne:AliasOne, Variant1:Alias1 in current but VariantOne:Alias1, Variant1:AliasOne in incoming).
* **Variables with duplicate name**: Variable names should be unique across non subvariables.
* **Subvariable in different arrays per dataset**: If a subvariable is used for different arrays that are impossible to match, it will be reported here. User action will be needed to fix this.

For each of these, a list of variable IDs will be made available indicating the
conflicting entities. _Union_ conflicting ids generally refer to variables in
the _current_ dataset and may be referenced by alias in _incoming_.


#### Lining up datasets for append/combine

`/datasets/align/`

Given that some datasets may be close to being fit for appending but could need
some work before proceeding, the `align` endpoint provides API expressions
that can be used directly on the append steps as `where` parameter in order
to avoid such conflicts.

Currently, this endpoint will provide an expression that will exclude the 
troubling variables from the append.

 * Exclude different arrays that may share subvariables by alias. 
This is currently not allowed and would reject the append operation.

To use this endpoint, the client needs to provide a list of variables they wish
to line up together as a list of lists.

```json

[
  [
    {"variable": "http://app.crunch.io/api/datasets/abc/variables/123/"},
    {"variable": "http://app.crunch.io/api/datasets/def/variables/234/"},
    {"variable": "http://app.crunch.io/api/datasets/hij/variables/345/"}
  ],
  [
    {"variable": "http://app.crunch.io/api/datasets/abc/variables/678/"},
    {"variable": "http://app.crunch.io/api/datasets/def/variables/789/"},
    {"variable": "http://app.crunch.io/api/datasets/hij/variables/890/"}
  ],
  [
    {"variable": "http://app.crunch.io/api/datasets/abc/variables/1ab/"},
    {"variable": "http://app.crunch.io/api/datasets/def/variables/ab2/"},
    {"variable": "http://app.crunch.io/api/datasets/hij/variables/b23/"}
  ]
]

```

The example above indicates that the client wishes to line up three variables
from three datasets as indicated by the groups. 

From the input, the endpoint wil analyze the groups and return an expression 
which will only include those variables that can be appended without conflict
among all of them. This expression is ready to be used as a `where` parameter
on the append `/batches/` endpoint.

The payload needs to be sent as JSON encoded `variables` POST parameter:

```http
POST /datasets/align/
```

```json
{
"element": "shoji:entity",
"body": {
    "variables": [
      [
        {"variable": "http://app.crunch.io/api/datasets/abc/variables/123/"},
        {"variable": "http://app.crunch.io/api/datasets/def/variables/234/"},
        {"variable": "http://app.crunch.io/api/datasets/hij/variables/345/"}
      ],
      [
        {"variable": "http://app.crunch.io/api/datasets/abc/variables/678/"},
        {"variable": "http://app.crunch.io/api/datasets/def/variables/789/"},
        {"variable": "http://app.crunch.io/api/datasets/hij/variables/890/"}
      ],
      [
        {"variable": "http://app.crunch.io/api/datasets/abc/variables/1ab/"},
        {"variable": "http://app.crunch.io/api/datasets/def/variables/ab2/"},
        {"variable": "http://app.crunch.io/api/datasets/hij/variables/b23/"}
      ]
    ]}
}
```

The response will be a `shoji:view` containing the `where` expression used for
each dataset:

```json
{
  "element": "shoji:view",
  "value": {
    "abc": {"function": "select", "args": [{"map": {
      "678": {"variable": "678"},
      "1ab": {"variable": "1ab"}
    }}]},
    "def": {"function": "select", "args": [{"map": {
      "789": {"variable": "789"},
      "ab2": {"variable": "ab2"}
    }}]},
    "hij": {"function": "select", "args": [{"map": {
      "890": {"variable": "890"},
      "b23": {"variable": "b23"}
    }}]}
  }
}
```
Following the example above, in the case that the first group could not be
appended because conflicts between their variables, it will be excluded
from the final expressions.

Later, using the expressions obtained, it is possible to append all the datasets
to a new one without conflicts.

```http
POST /datasets/abd/batches/
```

```json
{
    "element": "shoji:entity",
    "body": {
      "dataset": "http://app.crunch.io/api/datasets/abc/",
      "where": {"function": "select", "args": [{"map": {
          "678": {"variable": "678"},
          "1ab": {"variable": "1ab"}
        }}]}
    }
}

```

```http
POST /datasets/abd/batches/
```

```json
{
    "element": "shoji:entity",
    "body": {
      "dataset": "http://app.crunch.io/api/datasets/def/",
      "where": {"function": "select", "args": [{"map": {
          "789": {"variable": "789"},
          "ab2": {"variable": "ab2"}
        }}]}
    }
}

```

```http
POST /datasets/abd/batches/
```

```json
{
    "element": "shoji:entity",
    "body": {
      "dataset": "http://app.crunch.io/api/datasets/hij/",
      "where": {"function": "select", "args": [{"map": {
          "890": {"variable": "890"},
          "b23": {"variable": "b23"}
        }}]}
    }
}

```


### Entity

`/datasets/{id}/batches/{id}/`

A GET on this resource returns a Shoji Entity describing the batch, and a link to its Crunch Table (see next).

```json
{
    "conflicts": {},
    "source_children": {},
    "target_children": {},
    "source_columns": 3500,
    "source_rows": 235490,
    "target_columns": 3499,
    "target_rows": 120000,
    "error": "",
    "progress": 100.0,
    "source": "<url>",
    "status": "appended"
}
```

#### The conflicts object

Each batch has a "conflicts" member describing any unresolvable differences found between variables in the two datasets. On a successful append, this object will be empty; if the batch status is "conflict", the object will contain conflict information keyed by id of the variable in the target dataset. The conflict data for each variable follows this shape:

```json
{
    "metadata": {
        "name": "<string>",
        "alias": "<string>",
        "type": "<string>",
        "categories": [{}]
    },
    "source_id": "<id of the matching variable in the source frame",
    "source_metadata": {
        "name, etc": "as above"
    },
    "conflicts": [{
        "message": "<string>"
    }]
}
```

Each conflict has four attributes: `metadata` about the variable on the target dataset (unless it is a variable that only exists on the source dataset), `source_id` and `source_metadata`, which describe the corresponding variable in the source frame (if any), and a `conflicts` member. The `conflicts` member contains an array with a list of individual conflicts that indicate what situations were found during batch preparation.

If there are conflicts in your batch, address the conflicting issues in your datasets, DELETE the batch entity from the failed append attempt, and POST a new one.

#### Table

`/datasets/{id}/batches/{id}/table/{?offset,limit}`

A GET returns the rows of data from the Dataset for the identified batch as a Crunch Table.
