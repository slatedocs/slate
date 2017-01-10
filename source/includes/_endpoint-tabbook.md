## Tab books

The default `tabbook` view of a multitable will generate an excel (.xlsx) workbook 
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
    "self": "https://app.crunch.io/api/datasets/a598c7/multitables/{id}/tabbook/",
    "value": "https://app.crunch.io/api/progress/5be83a/"
}
```

Alternatively, you can request a json output for your tabbook.  To do this, simply
add an accept header to your request as follows:

```http
POST /api/datasets/a598c7/multitables/45fd58/tabbook/ HTTP/1.1
Accept: application/json
```

#### Endpoint Parameters

At the top level, the tab book endpoint can take filtering and variable limiting parameters.

Name | Type | Default | Description | Example
------ | ---- | ------- | ----------- | ------------- 
filter | object | None | Filter by Crunch Expression.  Variables used in the filter should be fully-expressed urls. | [{"filter":"https://app.crunch.io/api/datasets/45fc0d5ca0a945dab7d05444efa3310a/filters/5f14133582f34b8b85b408830f4b4a9b/"}]
where  | object | None | Crunch Expression signifying which variables to use |{<br>"function": "select",<br>"args": [<br>{<br>"map": {<br>"https://app.crunch.io/api/datasets/45fc0d5ca0a945dab7d05444efa3310a/variables/000004/": {<br>"variable": "https://app.crunch.io/api/datasets/45fc0d5ca0a945dab7d05444efa3310a/variables/000004/"<br>},<br>"https://app.crunch.io/api/datasets/45fc0d5ca0a945dab7d05444efa3310a/variables/000003/": {<br>"variable": "https://app.crunch.io/api/datasets/45fc0d5ca0a945dab7d05444efa3310a/variables/000003/"<br>}<br>}<br>}<br>]<br>}
options| object | {}| further options defining the tabbook output.



##### Options
Options for generating tab books

Name | Type | Default | Description | Example
------ | ---- | ------- | ----------- | ------------- 
display_settings | object | {} | a set of settings to define how the output should be displayed | See Below.
weight | url | None| ""http://app.crunch.io/api/datasets/45fc0d5ca0a945dab7d05444efa3310a/variables/5f14133582f34b8b85b408830f4b4a9b/"


###### Display Settings

Further tab book viewing options.

Name | Type | Default | Description | Example
------ | ---- | ------- | ----------- | ------------- 
decimalPlaces| object | 0 | number of decimal places to diaplay| {"value": 0}
vizType| object |table|Visialization Type|{value:table},
countsOrPercents| object |percent| use counts or percents|{value:percent}
percentageDirection| object |row or column based percents||{value:colPct}
slicesOrGroups| object |groups| slices or groups |{value:groups}
valuesAreMeans| object |false| are values means? |{value:false}
