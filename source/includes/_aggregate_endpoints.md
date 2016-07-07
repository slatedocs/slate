# Aggregate Data Endpoints

## `GET v1/api/timeseries`

> ### Example Query

```
http://plenar.io/v1/api/timeseries/?obs_date__ge=2007-11-12&
obs_date__le=2008-11-12&dataset_name__in=crimes_2001_to_present,
cdph_environmental_complaints&agg=year
```

> Count of crime and environmental complaints that were observed after
November 12, 2007 but before November 12, 2008, aggregated by year.

> ### Example Response

```json
{
    "meta": {
        "status": "ok",
        "query": {
            "obs_date__ge": "2007-11-12",
            "data_type": "json",
            "obs_date__le": "2008-11-12",
            "agg": "year",
            "dataset": null,
            "dataset_name__in": [
                "crimes_2001_to_present",
                "cdph_environmental_complaints"
            ],
            "geom": null
        },
        "message": [ ]
    },
    "objects": [
        {
            "attribution": "Chicago Department of Public Health",
            "description": "Environmental complaints received by the Department of Environment (DOE) from January 1993 to December 31, 2011 and by the Department of Public Health (CDPH) since January 1, 2012. On January 1, 2012, the DOE was disbanded and all its inspection, permitting, and enforcement authorities were transferred to the CDPH.",
            "view_url": "http://data.cityofchicago.org/api/views/fypr-ksnz/rows",
            "source_url": "http://data.cityofchicago.org/api/views/fypr-ksnz/rows.csv?accessType=DOWNLOAD",
            "bbox": {
                "type": "Polygon",
                "coordinates": [...]
            },
            "obs_from": "1993-01-04",
            "date_added": "2014-09-10 17:09:39.684758",
            "contributor_email": null,
            "contributor_organization": null,
            "count": 1447,
            "contributor_name": null,
            "items": [...],
            "last_update": "2016-07-01T08:18:19.783959",
            "obs_to": "2016-06-28",
            "human_name": "Environmental Complaints",
            "dataset_name": "cdph_environmental_complaints",
            "update_freq": "daily"
        },
        {
            "attribution": "Chicago Police Department",
            "description": "This dataset reflects reported incidents of crime (with the exception of murders where data exists for each victim) that occurred in the City of Chicago from 2001 to present, minus the most recent seven days. ",
            "view_url": "http://data.cityofchicago.org/api/views/ijzp-q8t2/rows",
            "source_url": "http://data.cityofchicago.org/api/views/ijzp-q8t2/rows.csv?accessType=DOWNLOAD",
            "bbox": {
                "type": "Polygon",
                "coordinates": [...]
            },
            "obs_from": "2001-01-01",
            "date_added": "2014-09-10 22:51:19.214726",
            "contributor_email": null,
            "contributor_organization": null,
            "count": 429324,
            "contributor_name": null,
            "items": [...],
            "last_update": "2016-07-01T09:11:15.178044",
            "obs_to": "2016-06-22",
            "human_name": "Crimes - 2001 to present",
            "dataset_name": "crimes_2001_to_present",
            "update_freq": "daily"
        }
    ]
}
```

This endpoint contains a record for every row in every dataset with brief
temporal and spatial information about the row. This can give a user of the
platform a quick overview about what is available within their constraints.

### Query Parameters

All query parameters are optional.

| **Parameter Name**       | **Parameter Default** | **Parameter Description**                                                                                                                                                                                                                                          |
|----------------------|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **agg**                  | week              | Time resolution to aggregate observation counts by. Supported values: <ul><li>day</li><li>week</li><li>month</li><li>quarter</li><li>year</li></ul>                                                                                                                                                   |
| **obs_date__ge**         | 90 days ago       | Obversations greater than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                                                                     |
| **obs_date__le**         | today's date      | Observations less than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                                                                        |
| **dataset_name**         | none              | Machine version of the dataset name as you get it from the `/v1/api/datasets` endpoint. If not provided, returns all available datasets. More than one dataset can be requested by using `dataset_name__in` and listing multiple comma separated dataset names. |
| **location_geom_within** | none              | A URL encoded [GeoJSON](http://geojson.org/) polygon representing the area of interest                                                                                                                                                                         |
| **data_type**            | json              | Response data format. Current options are `json`, `geojson`, and `csv`.    
| **[dataset]__filter** | none  | See [advanced filtering](#advanced-filtering) for more info.

<aside class=notice>To make a multifaceted query, combine additional parameters using an ampersand (&)</aside>

### Response

The API responds with a list of datasets with a dense matrix of counts grouped
by temporal aggregation.

| **Attribute Name** | **Attribute Description**                              |
| ------------------ | ------------------------------------------------------ |
| **_meta_**         |                                                        |
| **status**         | Indicates query success, can be `ok` or `error`.       |
| **query**          | Shows values used in the query.                        |
| **message**        | Reports errors or warnings (if any).                   |
| **_objects_**      |                                                        |
| **bbox**           | Spacial bounds that contain all the records.           |
| **count**          | Total number of records found within obs_date bounds.  |
| **dataset_name**   | Machine version of a specific dataset name.            |
| **items**          | Counts of aggregated records and delimiting datetimes. |
| **update_freq**    | Frequency with records are refreshed and updated.      |

<aside class=notice>The ellipses in place of <i>coordinates</i> values replace
GeoJSON longitude and latitude; those in place of <i>items</i> replace
formatted JSON data for crimes and complaints, aggregated by week.</aside>

## `GET v1/api/detail-aggregate/`

> ### Example Query

```
http://plenar.io/v1/api/detail-aggregate/?agg=year&
dataset_name=crimes_2001_to_present&obs_date__ge
=2012-1-1&iucr=0110
```

> This URL queries Chicago crime reports since Jan 1st 2012,
aggregated by year with IUCR code of '0110' (homicide)

> ### Example Response

```json
{
    "count": 2133,
    "meta": {
        "status": "ok",
        "query": {
            "agg": "year",
            "obs_date__ge": "2012-1-1",
            "iucr": "0110",
            "dataset_name": "crimes_2001_to_present"
        },
        "message": [ ]
    },
    "objects": [
        {
            "count": 503,
            "datetime": "2012-01-01"
        },
        {
            "count": 420,
            "datetime": "2013-01-01"
        },
        {
            "count": 422,
            "datetime": "2014-01-01"
        },
        {
            "count": 487,
            "datetime": "2015-01-01"
        },
        {
            "count": 301,
            "datetime": "2016-01-01"
        }
    ]
}
```

Very similar to the `/v1/api/timeseries/` API endpoint, but for one dataset. Additional dataset-specific query parameters can be used to filter the results.

### Query Parameters

All query parameters are optional except for `dataset_name`.

| Parameter Name       | Parameter Default | Parameter Description                                                                                                                                                                                              |
|----------------------|-------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **dataset_name**         | none              | **Required**. Machine version of the dataset name as you get it from the `/v1/api/` endpoint.                                                                                                                        |
| **[dataset_field]***     | none              | Any available dataset field. Discoverable via the `/v1/api/fields/<dataset_name>/` endpoint. Any number of these query parameters can be chained together and are linked together with a SQL `AND` under the hood. For any given `dataset_field`, the query can be modified with [query operators](#query-operators-for-raw-data)|
| **agg**                  | week              | Time resolution to aggregate observation counts by.   Supported values: <ul><li>day</li><li>week</li><li>month</li><li>quarter</li><li>year</li></ul>                                                                                                      |
| **obs_date__ge**         | 90 days ago       | Obversations greater than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                         |
| **obs_date__le**         | 90 days ago       | Obversations less than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                            |
| **location_geom_within** | none              | A URL encoded [GeoJSON](http://geojson.org/) polygon representing the area of interest                                                                                                                             |
| **data_type**            | json              | Response data format. Current options are `json` and `csv`.                                                                                                                                                        |
| **[dataset]__filter** | none  | See [advanced filtering](#advanced_filtering) for more info. |

### Response

The API responds with a list of counts grouped by temporal aggregation and dataset name.

| **Attribute Name** | **Attribute Description**                              |
| ------------------ | ------------------------------------------------------ |
| **_meta_**         |                                                        |
| **status**         | Indicates query success, can be `ok` or `error`.       |
| **query**          | Shows values used in the query.                        |
| **message**        | Reports errors or warnings (if any).                   |
| **_objects_**      |                                                        |
| **count**          | Total number of records found within obs_date bounds.  |
| **datetime**       | Temporal delimiter.                                    |

## `GET v1/api/grid`

> ### Example Query

```
http://plenar.io/v1/api/grid/?obs_date__le=2014%2F09%2F05&
obs_date__ge=2014%2F03%2F09&dataset_name=
311_service_requests_tree_trims&ward__in=2%2C42%2C32
```

> 311 tree trim requests between March 9, 2014 and September 5th, 2014 for Wards 2, 42 and 32

> ### Example Response

~~~~
{
   "type":"FeatureCollection",
   "features":[
      {
         "geometry":{
            "type":"Polygon",
            "coordinates":[
               [
                  [
                     -87.69635961403962,
                     41.876826253090584
                  ],
                  [
                     -87.69635961403962,
                     41.88132164531356
                  ],
                  [
                     -87.70239743700178,
                     41.88132164531356
                  ],
                  [
                     -87.70239743700178,
                     41.876826253090584
                  ],
                  [
                     -87.69635961403962,
                     41.876826253090584
                  ]
               ]
            ]
         },
         "type":"Feature",
         "properties":{
            "count":7
         }
      }

      ...

   ]
}
~~~~

Query a single dataset and return a GeoJSON grid heatmap.

### Query Parameters

All query parameters are optional except for `dataset_name`.

| Parameter Name       | Parameter Default | Parameter Description                                                                                                                                                                                              |
|----------------------|-------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **dataset_name**         | none              | **Required**. Machine version of the dataset name as you get it from the `/v1/api/` endpoint.                                                                                                                        |
| **[dataset_field]***     | none              | Any available dataset field. Discoverable via the `/v1/api/fields/<dataset_name>/` endpoint. Any number of these query parameters can be chained together and are linked together with a SQL `AND` under the hood. For any given `dataset_field`, the query can be modified with [query operators](#query-operators-for-raw-data)|
| **resolution**         | 500               | Square grid size (in meters).                                                                                                                                                                                      |
| **obs_date__ge**         | 90 days ago       | Obversations greater than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                         |
| **obs_date__le**         | 90 days ago       | Obversations less than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                            |
| **location_geom_within** | none              | A URL encoded [GeoJSON](http://geojson.org/) polygon representing the area of interest                                                                                                                             |
| **buffer**               | 100               | If `location_geom__within` is a [GeoJSON LineString](http://geojson.org/geojson-spec.html#linestring), the size of the buffer around that line to query (in meters).                                               |
| **[dataset]__filter** | none  | See [advanced filtering](#advanced-filtering) for more info.

### Response

**See right**

Plenario will output a GeoJSON with a feature for each grid square containing
a `count` property of the number of observations within that square.
