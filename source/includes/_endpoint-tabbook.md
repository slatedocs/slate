## Tab books

The `tabbook` view of a multitable will generate an excel (.xlsx) workbook containing each variable in the dataset crosstabbed with a given multitable. 

A request to `datasets/{id}/multitables/{id}/tabbook/' will generate a download location to which the exporter will write this file when it is done computing (it may take some time for large datasets). Clients should note the download url, monitor progress, and when complete, GET the download location. 

#### GET

```http
GET /api/datasets/{id}/multitables/{id}/tabbook/ HTTP/1.1
```

```json
{
    "element": "shoji:view",
    "self": "/api/datasets/{id}/multitables/{id}/tabbook/",
    "value": {
        "status": "started",
        "url": "https://s3-url/filename.xlsx",
        "progress": "/api/progress/:{id}/"
    }
}
```

