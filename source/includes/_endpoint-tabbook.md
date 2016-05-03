## Tab books

The `tabbook` view of a multitable will generate an excel (.xlsx) workbook 
containing each variable in the dataset crosstabbed with a given multitable. 

A POST request to `/datasets/{id}/multitables/{id}/tabbook/` will generate a download 
location to which the exporter will write this file when it is done computing 
(it may take some time for large datasets). Clients should note the download url, 
monitor progress, and when complete, GET the download location.
 
The server will return a 202 response indicating that the export job started with
a Location header indicating where the final exported file will be available.

The response's body will contain the URL for the progress url where to query
the state of the export job.

Requesting the same job, if still in progress, will return the same 202 response 
indicating the original progress to check. If the export is finished, the server
will 302 redirect to the destination for download.

If there have been changes on the dataset attributes, a new tabbook will be
generated regardless of the status of any other pending exports.
 

#### POST

```http
POST /api/datasets/a598c7/multitables/45fd58/tabbook/ HTTP/1.1
```

----


```http
HTTP/1.1 202 Accepted
Location: https://s3-url/filename.xlsx
```

```json
{
    "element": "shoji:view",
    "self": "https://beta.crunch.io/api/datasets/a598c7/multitables/{id}/tabbook/",
    "value": "https://beta.crunch.io/api/progress/5be83a/"
}
```

