## Importing Data

There are several ways to build a Crunch dataset. The most appropriate method for you to create a dataset depends primarily on the format in which the data is currently stored.

### Import from a data file

In some cases, you already have a file sitting on your computer which has source data, in a format like CSV or SPSS. You can upload these to Crunch and then attach them to datasets by following these steps.

#### 1. Create a Dataset entity

```http

POST /datasets/ HTTP/1.1
Content-Type: application/shoji
Content-Length: 974
...
{
    "element": "shoji:entity",
    "body": {
        "name": "my survey",
        ...
    }
}
--------
201 Created
Location: /datasets/{dataset_id}/
```

```r
ds <- newDatasetFromFile("my.csv", name="my survey")
# All three steps are handled within newDatasetFromFile
```

POST a Dataset Entity to the datasets catalog.



#### 2. Upload the file

```http
POST /sources/ HTTP/1.1
Content-Type: text/csv
Content-Length: 8874357
Content-Disposition: form-data; name="uploaded_file"; filename="my.csv"
...
"case_id","q1","q2"
234375,3,"sometimes"
234376,2,"always"
...
--------
201 Created
Location: /sources/{source_id}/
```

POST the file to the sources catalog. 


#### 3. Add the Source to the Dataset

```http
POST /datasets/{dataset_id}/batches/ HTTP/1.1
Content-Type: application/json
...
{
    "body": {
        "source": "/sources/{source_id}/"
    }
}
--------
201 Created
Location: /datasets/{dataset_id}/batches/{batch_id}/
```

POST the URL of the just-created source entity (the Location in the 201 response from the previous step) to the batches catalog of the dataset entity created in step 1. 

<aside class="notice">If your file is large, you may wish to have this import job be completed asynchronously in order to avoid hitting a server timeout. To do so, include `"async": true` in the "body" key of the payload. This will change the response status from 201 to 202, and you'll need to poll the server to learn when the import job has been completed. See batches for details.</aside>

### Metadata document + CSV

This approach may be most natural for importing data from databases that store data by rows. You can dump or export your database to Crunch's JSON metadata format, plus a CSV of data, and upload those to Crunch, without requiring much back-and-forth with the API.

#### 1. Create a Dataset entity with variable definitions

```http
POST /datasets/ HTTP/1.1
Content-Type: application/shoji
Content-Length: 974
...
{
    "element": "shoji:entity",
    "body": {
        "name": "my survey",
        ...,
        "table": {
            "element": "crunch:table",
            "metadata": {
                "educ": {"name": "Education", "alias": "educ", "type": "categorical", "categories": [...], ...},
                "color": {"name": "Favorite color", "alias": "color", "type": "text", ...}
            },
            "order": [{"group": "my group", "entities": ["educ", ...]}, ...]
        },
    }
}
--------
201 Created
Location: /datasets/{dataset_id}/
```

POST a Dataset Entity to the datasets catalog, and in the "body", include a Crunch Table object with variable definitions and order.

The "metadata" member in the table is an object containing all variable definitions, keyed by variable alias. See the Object Reference: Variable Definitions discussion for specific requirements for defining variables of various types, as well as the example below.

The "order" member is a Shoji Order object specifying the order, potentially hierarchically nested, of the variables in the dataset. The example below illustrates how this can be used. Shoji is JSON, which means the "metadata" object is explicitly unordered. If you wish the variables to have an order, you must supply an order object rather than relying on any order of the "metadata" object.

#### 2. Add row data

> By file:

```http
POST /datasets/{dataset_id}/batches/ HTTP/1.1
Content-Type: text/csv
Content-Length: 8874357
Content-Disposition: form-data; name="file"; filename="thedata.csv"
...
"educ","color"
3,"red"
2,"yellow"
...
--------
201 Created
Location: /datasets/{dataset_id}/batches/{batch_id}/
```

> By S3 URL:

```http
POST /datasets/{dataset_id}/batches/ HTTP/1.1
Content-Type: application/shoji
Content-Length: 341
...
{
    "element": "shoji:entity",
    "body": {
        "url": "s3://bucket_name/dir/subdir/?accessKey=ASILC6CBA&secretKey=KdJy7ZRK8fDIBQ&token=AQoDYXdzECAa%3D%3D",
        "async": false
    }
}
--------
201 Created
Location: /datasets/{dataset_id}/batches/{batch_id}/
```

POST a CSV file or URL to the new dataset's batches catalog. The CSV must include a header row of variable identifiers, which should be the aliases of the variables (and array subvariables) defined in step (1).

<aside class="success">The CSV may be gzipped. In fact, you are encouraged to gzip it.</aside>

The values in the CSV MUST be the same format as the values you get out of Crunch, and it must match the metadata specified in the previous step. This includes:

* Categorical variables should have data identified by the integer category ids, not strings, and all values must be defined in the "categories" metadata for each variable.
* Datetimes must all be valid ISO 8601 strings
* Numeric variables must have only (unquoted) numeric values
* The only special value allowed is an empty "cell" in the CSV, which will be read as the system-missing value "No Data"

Violation of any of these validation criteria will result in a 409 Conflict response status. To resolve, you can either (1) fix your CSV locally and re-POST it, or (2) PATCH the variable metadata that is invalid and then re-POST the CSV.

Imports are done in "strict" mode by default. Strict imports are faster, and using strict mode will alert you if there is any mismatch between data and metadata. However, in some cases, it may be convenient to be more flexible and silently ignore or resolve inconsistencies. For example, you may have a large CSV dumped out of a database, and the data format isn't exactly Crunch's format, but it would be costly to read-munge-write the whole file for minor changes. In cases like this, you may append `?strict=0` to the URL of the POST request to loosen that strictness.

With non-strict imports:

* The CSV may contain columns not described by the metadata; these columns will be ignored, rather than returning an error response
* The metadata may describe variables not contained in the CSV; these variables will be filled with missing values, rather than returning an error response
* And more things to come

In either case, a 201 response to the POST request indicates success. All rows added in a single request become part of a new Batch, whose URL is returned in the response Location. You may inspect the new rows in isolation by following its batch/ link.

The CSV can be sent in one of two ways:

1. Upload a file by POSTing a multipart form
2. POST a Shoji entity with a "url" in the body, containing all necessary auth keys as query parameters. If the URL points to a single file, it should be a CSV or gzipped CSV, as described above. If the URL points to a directory, the contents will be assumed to be (potentially zipped) batches of a CSV and will be concatenated for appending. In the latter case, only the first CSV in the directory listing should contain a header row. For large import jobs, you may set the (optional) "async" body parameter to "true". In this case, the request will respond 202 Continue status, and work will proceed outside the request cycle. As described [above](#3.-add-the-source-to-the-dataset), poll the batch entity to learn when the import job has been completed or if an error occurred. See batches for details.

#### Example

Here's an example [dataset metadata](examples/dataset.json) and corresponding [csv](examples/dataset.csv).

Several things to note:

* Everything–metadata, order, and data–is keyed by variable "alias", not "name", because Crunch believes that names are for people, not computers, to understand. Aliases must be unique across the whole dataset, while variable "names" must only be unique within their group or array variable.
* For categorical variables, all values in the CSV correspond to category ids, not category names, and also not "numeric_values", which need not be unique or present for all categories in a variable.
* The array variables defined in the metadata ("allpets" and "petloc") don't themselves have columns in the CSV, but all of their "subvariables" do, keyed by their aliases. 
* With the exception of those array variable definitions, all variables and subvariables defined in the metadata have columns in the CSV, and there are no columns in the CSV that are not defined in the metadata.
* For internal variables, such as a case identifier in this example, that you don't want to be visible in the UI, you can add them as "hidden" from the beginning by including `"discarded": "true"` in their definition, as in the example of "caseid". 
* Missing values
    * Variables with categories (categorical, multiple_response, categorical_array) have missing values defined as categories with `"missing": "true"`
    * Text, numeric, and datetime variables have missing variables defined as "missing_rules", which can be "value", "set", or "range". See, for example, "q3" and "ndogs".
    * Empty cells in the CSV, if present, will automatically be translated as the "No Data" system missing value in Crunch. See, for example, "ndogs_b".
* Order
    * All variables should be referenced by alias in the "order" object, inside a group's "entities" key. Any omitted variables (in this case, the hidden variable "caseid") will automatically be added to a group named "ungrouped".
    * Variables may appear in multiple groups.
    * Groups may be nested within each other.

### Column-by-column

Crunch stores data by column internally, so if your data are stored in a column-major format as well, importing by column may be the most efficient way to import data.

#### 1. Create a Dataset entity
```http
POST /datasets/ HTTP/1.1
Content-Type: application/shoji
Content-Length: 974
...
{
    "element": "shoji:entity",
    "body": {
        "name": "my survey",
        ...
    }
}
--------
201 Created
Location: /datasets/{dataset_id}/
```

```r
ds <- createDataset("my suryey")
```

POST a Dataset Entity to the datasets catalog, just as in the first import method.

#### 2. Add Variable definitions and column data

```http
POST /datasets/{dataset_id}/variables/ HTTP/1.1
Content-Type: application/shoji
Content-Length: 38475
...
{
    "element": "shoji:entity",
    "body": {
        "name": "Gender",
        "alias": "gender",
        "type": "categorical",
        "categories": [
            {
                "name": "Male",
                "id": 1,
                "numeric_value": null,
                "missing": false
            },
            {
                "name": "Female",
                "id": 2,
                "numeric_value": null,
                "missing": false
            },
            {
                "name": "Skipped",
                "id": 9,
                "numeric_value": null,
                "missing": true
            }
        ],
        "values": [1, 9, 1, 2, 2, 1, 1, 1, 1, 2, 9, 1]
    }
}
--------
201 Created
Location: /datasets/{dataset_id}/variables/{variable_id}/
```

```r
# Here's a similar example. R's factor type becomes "categorical". 
gender.names <- c("Male", "Female", "Skipped")
gen <- factor(gender.names[c(1, 3, 1, 2, 2, 1, 1, 1, 1, 2, 3, 1)],
    levels=gender.names)
# Assigning an R vector into a dataset will create a variable entity.
ds$gender <- gen
```

POST a Variable Entity to the newly created dataset's variables catalog, and include with that Entity definition a "values" key that contains the column of data. Do this for all columns in your dataset. 

<aside class="notice">Note that the lengths of the columns of data you include in the "values" key must be the same for all variables, though if you're importing from a normal, rectangular data store, this should already be the case.</aside>