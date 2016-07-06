---
title: Plenario API Documentation

language_tabs:
  - html: Examples

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>
  - <a href='http://www.urbanccd.org/#urbanccd'>Made by UrbanCCD and</a>
  - <a href='http://www.uchicago.edu/'>University of Chicago</a>

includes:
  - errors

search: true
---

# Introduction

> ### In this rightmost column, you'll see example API calls and responses.

Plenario is a centralized hub for open datasets from around the world, ready to search and download.

The Plenario RESTful API can be used to perform custom geospatial and temporal queries. We currently have 13 endpoints.

A few things to know:

* All API calls should be made with `HTTP GET`
* All API responses are in [JSON format](http://www.json.org/)
* All methods are accessed via: `http://plenar.io/v1/api/SOME-ENDPOINT`

<aside class=warning>Most responses are truncated with <b>ellipses</b> (...) due to extreme length.</aside>

# Metadata Endpoints

## `GET /v1/api/datasets/`

> ### Example Query

```
http://plenar.io/v1/api/datasets/
```

> List of all Plenario's datasets.

> ### Example Response

```json
{
    "meta": {
        "status": "ok",
        "query": { },
        "message": [
            [ ]
        ],
        "total": 118
    },
    "objects": [
        {
            "attribution": "Los Angeles Police Department",
            "description": "LAPD Crime and Collision Raw Data for 2013",
            "view_url": "https://data.lacity.org/api/views/iatr-8mqm/rows",
            "columns": [
                {
                    "field_type": "VARCHAR",
                    "field_name": "status"
                },
                {
                    "field_type": "DATE",
                    "field_name": "date_occ"
                },
                {
                    "field_type": "VARCHAR",
                    "field_name": "location_1"
                },
                {
                    "field_type": "INTEGER",
                    "field_name": "crm_cd"
                },
                {
                    "field_type": "DOUBLE PRECISION",
                    "field_name": "area"
                },
                ...
            ],
            "last_update": "2015-04-17T19:30:44.922015",
            "obs_from": "2013-01-01",
            "bbox": {
                "type": "Polygon",
                "coordinates": [
                    [
                        [
                            -117.7071,
                            33.706
                        ],
                        [
                            -117.7071,
                            34.7907
                        ],
                        ...
                    ]
                ]
            },
            "human_name": "LAPD Crime and Collision Raw Data for 2013",
            "obs_to": "2013-12-31",
            "date_added": "2015-04-17T19:30:44.922015",
            "source_url": "https://data.lacity.org/api/views/iatr-8mqm/rows.csv?accessType=DOWNLOAD",
            "dataset_name": "lapd_crime_and_collision_raw_data_for_2013",
            "update_freq": "yearly"
        },
    ]
}
```

This is the "data about the data" endpoint. It contains a record for each dataset; use this endpoint to list available datasets and metadata.

### Query Parameters

All query parameters are optional.

|**Parameter Name**  | **Parameter Default** | **Parameter Description**|
|--------------- | ----------------- | :--------------------|
|**dataset_name**  | none              | Machine version of a specific dataset name|

### Response

One record shape per dataset.

| **Attribute Name** 	| **Attribute Description**                                                                   	|
|----------------	|------------------------------------------------------------------------------------------	|
| **description**    	| Verbose, official description of the dataset.                                            	|
| **source_url**     	| If available, the URL where the data was originally sourced.                             	|
| **obs_from**       	| Oldest date available in the dataset.                                                     	|
| **obs_to**         	| Newest date available in the dataset.                                                    	|
| **human_name**     	| Human-friendly name for the dataset.                                                     	|
| **dataset_name**   	| Machine name for the dataset. Values are passed into the queries below as `dataset_name` 	|
| **update_freq**    	| Update frequency.                                                                        	|

## `GET /v1/api/fields/<dataset_name>/`

> ### Example Query

```
http://plenar.io/v1/api/fields/crimes_2001_to_present/
```

> Field definitions for Chicago crime report dataset

Gives you a listing of all the fields and their data types for the given dataset. This is useful for figuring out how to structure a query against the `/v1/api/detail/`, `/v1/api/shapes/`, or `/v1/api/detail-aggregate/` endpoints.

### Query Parameters

This API endpoint has no query parameters.

### Response

> ### Example Response

```json
{
    "meta": {
        "status": "ok",
        "query": { },
        "message": [
            [ ]
        ],
        "total": 1
    },
    "objects": [
        {
            "field_type": "INTEGER",
            "field_name": "y_coordinate"
        },
        {
            "field_type": "INTEGER",
            "field_name": "year"
        },
        {
            "field_type": "BOOLEAN",
            "field_name": "domestic"
        },
        ...
    ]
}
```

| Attribute Name | Attribute Description                                                                                                              |
|----------------|------------------------------------------------------------------------------------------------------------------------------------|
| field_type     | [Postgres data type](https://www.postgresql.org/docs/9.3/static/datatype.html) for given field.                                                                                                |
| field_name     | Name of database field. Useful for performing additional queries using the `/v1/api/detail-aggregate/` and `/v1/api/detail/` endpoints. |


# Aggregate Data Endpoints

## `GET v1/api/timeseries`

> ### Example Query

```
http://plenar.io/v1/api/timeseries/?obs_date__ge=2007-11-12&
obs_date__le=2008-11-12&dataset_name__in=crimes_2001_to_present,
cdph_environmental_complaints&agg=day
```

> Count of crime and environmental complaints that were observed after November 12, 2007 but before November 12, 2008, aggregated by day

> ### Example Response

```json
{
    "meta": {
        "status": "ok",
        "query": {
            "obs_date__ge": "2007-11-12",
            "data_type": "json",
            "obs_date__le": "2008-11-12",
            "agg": "day",
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

This endpoint contains a record for every row in every dataset with brief temporal and spatial information about the row. This can give a user of the platform a quick overview about what is available within their constraints.

### Query Parameters

All query parameters are optional.

| **Parameter Name**       | **Parameter Default** | **Parameter Description**                                                                                                                                                                                                                                          |
|----------------------|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **agg**                  | week              | Time resolution to aggregate observation counts by. Supported values: *day*, *week*, *month*, *quarter*, *year*                                                                                                                                                   |
| **obs_date__ge**         | 90 days ago       | Obversations greater than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                                                                     |
| **obs_date__le**         | today's date      | Observations less than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                                                                        |
| **dataset_name**         | none              | Machine version of the dataset name as you get it from the `/v1/api/datasets` endpoint. If not provided, returns all available datasets. More than one dataset can be requested by using `dataset_name__in` and listing multiple comma separated dataset names. |
| **location_geom_within** | none              | A URL encoded [GeoJSON](http://geojson.org/) polygon representing the area of interest                                                                                                                                                                         |
| **data_type**            | json              | Response data format. Current options are `json`, `geojson`, and `csv`.    

### Response

The API responds with a list of datasets with a dense matrix of counts grouped by temporal aggregation.

| **Attribute Name** | **Attribute Description**             |
|--------------------|-------------------------------------- |
| **dataset_name**     | Machine version  of that dataset name |
| **items**            | Returns as either `count` and `datetime`|

<aside class=notice>The ellipses in place of <i>coordinates</i> values replace GeoJSON longitude and latitude; those in place of <i>items</i> replace formatted JSON data for crimes and complaints, aggregated by week</aside>

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
| **[dataset_field]***     | none              | Any available dataset field. Discoverable via the `/v1/api/fields/<dataset_name>/` endpoint. Any number of these query parameters can be chained together and are linked together with a SQL `AND` under the hood. |
| **agg**                  | week              | Time resolution to aggregate observation counts by.   Supported values: * day * week * month * quarter * year                                                                                                      |
| **obs_date__ge**         | 90 days ago       | Obversations greater than or equal to a given date.  Dates must be formatted as YYYY-MM-DD                                                                                                                         |
| **obs_date__le**         | 90 days ago       | Obversations less than or equal to a given date.  Dates must be formatted as YYYY-MM-DD                                                                                                                            |
| **location_geom_within** | none              | A URL encoded [GeoJSON](http://geojson.org/) polygon representing the area of interest                                                                                                                             |
| **data_type**            | json              | Response data format. Current options are `json` and `csv`.                                                                                                                                                        |

### Response

The API responds with a list of counts grouped by temporal aggregation and dataset name.

| Attribute Name | Attribute Description      |
|----------------|----------------------------|
| count          | Record count               |
| datetime       | Temporal aggregation group |

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
| dataset_name         | none              | *Required*. Machine version of the dataset name as you get it from the `/v1/api/` endpoint.                                                                                                                        |
| [dataset_field]*     | none              | Any available dataset field. Discoverable via the `/v1/api/fields/<dataset_name>/` endpoint. Any number of these query parameters can be chained together and are linked together with a SQL `AND` under the hood. |
| resolution           | 500               | Square grid size (in meters).                                                                                                                                                                                      |
| obs_date__ge         | 90 days ago       | Obversations greater than or equal to a given date.  Dates must be formatted as YYYY-MM-DD                                                                                                                         |
| obs_date__le         | 90 days ago       | Obversations less than or equal to a given date.  Dates must be formatted as YYYY-MM-DD                                                                                                                            |
| location_geom_within | none              | A URL encoded [GeoJSON](http://geojson.org/) polygon representing the area of interest                                                                                                                             |
| buffer               | 100               | If `location_geom__within` is a [GeoJSON LineString](http://geojson.org/geojson-spec.html#linestring), the size of the buffer around that line to query (in meters).                                               |

### Response

**See right**; Plenario will output a GeoJSON with a feature for each grid square containing a `count` property of observations within that square.

# Raw Data Endpoints

## Query Operators for Raw Data

This list of **Query Operators** can be used for any given query `dataset_field` or query parameter provided by the raw data endpoints (besides syntactical exceptions; `__like` and `__ilike` cannot be used with integers, for example).  

<aside class="notice">For example, <code>ward__ge=48</code> translates to "ward >= 48" in SQL</aside>

| Operator | Description                                                          |
|----------|----------------------------------------------------------------------|
| __gt     | greater than (`>`)                                                   |
| __ge     | greater than or equal to (`>=`)                                      |
| __lt     | less than (`<`)                                                      |
| __le     | less than or equal to (`<=`)                                         |
| __ne     | not equal (`!=`)                                                     |
| __like   | like value with % wildcards, case sensitive (`LIKE`, `'State%'`)     |
| __ilike  | like value with % wildcards, case insensitive (`ILIKE`,  `'state%'`) |
| __in     | within a list of provided values (`IN ('list', 'of', 'values')`)     |  

## `GET /v1/api/detail`

> ### Example Query

```
http://plenar.io/v1/api/detail/?dataset_name=crimes_2001_
to_present&obs_date__ge=2016-5-1&iucr=0110
```

> A list of all Chicago homicides (IUCR code 0110) since May 1<sup>st</sup>, 2016

> ### Example Response

```json
{
    "meta": {
        "status": "ok",
        "query": {
            "obs_date__ge": "2016-05-01",
            "data_type": "json",
            "obs_date__le": "2016-07-01T14:49:32.720091",
            "iucr": "0110",
            "dataset": "crimes_2001_to_present",
            "shape": null,
            "geom": null,
            "offset": 0,
            "metatable": "meta_master"
        },
        "message": [ ],
        "total": 121
    },
    "objects": [
        {
            "id": 22444,
            "case_number": "HZ247790",
            "date": "2016-05-02T01:35:00",
            "block": "059XX N RIDGE AVE",
            "iucr": "0110",
            "primary_type": "HOMICIDE",
            "description": "FIRST DEGREE MURDER",
            "location_description": "STREET",
            "arrest": false,
            "domestic": false,
            "beat": 2012,
            "district": 20,
            "ward": 40,
            "community_area": "77",
            "fbi_code": "01A",
            "x_coordinate": 1164091,
            "y_coordinate": 1939858,
            "year": 2016,
            "updated_on": "2016-05-09T15:51:54",
            "latitude": 41.990596764,
            "longitude": -87.671796648,
            "location": "(41.990596764, -87.671796648)"
        },
        ...
      ]
    }
```

Query a particular dataset and get back the raw individual records.

### Query Parameters

All query parameters are optional except for `dataset_name`.

| Parameter Name       | Parameter Default | Parameter Description                                                                                                                                                                                              |
|----------------------|-------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| dataset_name         | none              | *Required*. Machine version of the dataset name as you get it from the `/v1/api/` endpoint.                                                                                                                        |
| [dataset_field]*     | none              | Any available dataset field. Discoverable via the `/v1/api/fields/<dataset_name>/` endpoint. Any number of these query parameters can be chained together and are linked together with a SQL `AND` under the hood. |
| obs_date__ge         | 90 days ago       | Obversations greater than or equal to a given date.  Dates must be formatted as YYYY-MM-DD                                                                                                                         |
| obs_date__le         | 90 days ago       | Obversations less than or equal to a given date.  Dates must be formatted as YYYY-MM-DD                                                                                                                            |
| location_geom_within | none              | A URL encoded [GeoJSON](http://geojson.org/) polygon representing the area of interest                                                                                                                             |
| data_type            | json              | Response data format. Current options are `json` and `csv`                                                                                                                                                         |
| geom                 | none              | Join to a shape dataset; columns in the shape dataset can also be used as filters with the `[dataset_field]*` parameter                                                                                            |
| offset               | none              | Used to paginate through results of more than 1000.  Example: `offset=1000` will fetch the second page of results.                                                                                                 |

### Responses

**See right**; the API responds with a list of raw records for the particular dataset. The fields returned will vary per dataset. Response is limited to 1000 results, which can be paginated by using the `offset` parameter.

## `GET v1/api/weather-stations/`

> ### Example Query

```
http://plenar.io/v1/api/weather-stations/?state=IL
```

> A list of weather stations in Illinois.

> ### Example Response

```json
{
    "meta": {
        "status": "ok",
        "query": {
            "state": "IL"
        },
        "message": ""
    },
    "objects": [
        {
            "begin": "2006-01-01",
            "elevation": 178,
            "country": "US",
            "state": "IL",
            "location": {
                "type": "Point",
                "coordinates": [
                    -88.419,
                    41.425
                ]
            },
            "end": "2014-03-13",
            "station_name": "MORRIS MUNI J R WAS",
            "call_sign": "KC09",
            "wban_code": "04867"
        },
        ...
    ]
}
```

Query weather stations from NOAA's [Quality Controlled Local Climatological Data](http://www.ncdc.noaa.gov/?prior=N).

### Query Parameters

All query parameters are optional.

| Parameter    | Description                                                                                                       |
|--------------|-------------------------------------------------------------------------------------------------------------------|
| station_name | Name of weather station                                                                                           |
| call_sign    | Call sign of weather station                                                                                      |
| wban_code    | Weather Bureau Army Navy (WBAN) code of weather station                                                           |
| begin        | Date of first weather observation                                                                                 |
| end          | Date of last weather observation                                                                                  |
| elevation    | Elevation of station (in feet)                                                                                    |
| county       | County name                                                                                                       |
| state        | Two-digit state code                                                                                              |
| location     | Latitude and longitude location of weather station. Can be queried with a GeoJSON shape using `location__within`. |

### Responses

**See right**; `weather-stations` gives a list of weather stations and attributes (described above) that match the provided query parameters.

## `GET /v1/api/weather/daily`

> ### Example Query

```
http://plenar.io/v1/api/weather/daily/?wban_code=14819&
date__ge=2016-06-01
```

> All daily weather observations at Chicago's Midway Airport (WBAN code 14819, `station_name` CHICAGO/MIDWAY) since June 1<sup>st</sup>, 2016.

> ### Example Response

```json
{
    "meta": {
        "status": "ok",
        "query": {
            "date__ge": "2016-06-01",
            "wban_code": "14819"
        },
        "message": "",
        "total": 30
    },
    "objects": [
        {
            "observations": [
                {
                    "max5_direction_cardinal": "VRB",
                    "max2_windspeed": null,
                    "snowfall": null,
                    "dewpoint_avg": null,
                    "date": "2016-06-30",
                    "temp_avg": null,
                    "id": 7214974,
                    "max2_direction_cardinal": "VRB",
                    "temp_max": null,
                    "max2_winddirection": "VRB",
                    "wetbulb_avg": null,
                    "latitude": null,
                    "max5_windspeed": null,
                    "avg_windspeed": null,
                    "old_station_type": null,
                    "max5_winddirection": "VRB",
                    "precip_total": null,
                    "resultant_winddirection": "VRB",
                    "departure_from_normal": null,
                    "sealevel_pressure": null,
                    "resultant_winddirection_cardinal": "VRB",
                    "weather_types": null,
                    "snowice_depth": null,
                    "longitude": null,
                    "snowice_waterequiv": null,
                    "resultant_windspeed": null,
                    "temp_min": null,
                    "station_pressure": null,
                    "wban_code": "14819"
                },
                ...
            ],
            "station_info": {
                "begin": "1928-10-04",
                "elevation": 188.4,
                "country": "US",
                "state": "IL",
                "location": {
                    "type": "Point",
                    "coordinates": [
                        -87.752,
                        41.786
                    ]
                },
                "end": "2014-03-13",
                "station_name": "CHICAGO/MIDWAY",
                "call_sign": "KMDW",
                "wban_code": "14819"
            }
        }
    ]
}
```

Query daily weather observations from NOAA's [Quality Controlled Local Climatological Data](http://cdo.ncdc.noaa.gov/qclcd/QCLCD?prior=N).

### Query Parameters

All query parameters are optional.

| Parameter                        | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| wban_code                        | The Weather Bureau Army Navy (WBAN) number is the unique identifier for weather stations                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| date                             | Date of the observations in SQL date form (e.g. '2003-10-05')                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| temp_max                         | The maximum temperature for the day in Farenheit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| temp_min                         | The minimum temperature for the day in Farenheit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| temp_avg                         | The average temperature for the day in Farenheit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| departure_from_normal            | The departure from the normal average temperature for the day in Fahrenheit                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| dewpoint_avg                     | The average dewpoint, i.e. the temperature at which water vapor condenses into water at the same rate at which it evaporates (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                      |
| wetbulb_avg                      | The average temperature the air would have had at 100% humidity (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| weather_types                    | A multidimensional PostgreSQL array which contains values from [Federal Meterological Handbook No. 1: Surface Weather Observations and Reports](http://www.ofcm.gov/fmh-1/fmh1.htm), in the following six-tuple: [vicinity, intensity, desc, precip, obscuration, other]. For example, in the event of an observation of a thunderstorm with heavy rain and snow with fog, one might see: `[NULL, +, TS, RA, DG, NULL]`.But if it were also snowing, there would be an additional six-tuple: `[NULL, NULL, NULL, SN, NULL, NULL]` |
| snowice_depth                    | In inches, the current depth of snow/ice. A 'trace' (T) is encoded as 0.005                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| snowice_waterequiv               | This would be the depth of water in inches if you could melt the snowpack instantaneously                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| snowfall                         | Snowfall in inches on this day                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| precip_total                     | Total precipitation in inches, during the 24-hour period ending in local standard time                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| station_pressure                 | Average pressure in inches of mercury                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| sealevel_pressure                | Average sea-level pressure in inches of mercury                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| resultant_windspeed              | The magnitude (in miles per hour) of "resultant" wind, which is obtained by converting recorded wind speeds and directions over a 24-hour period into a single vector with a single magnitude and direction                                                                                                                                                                                                                                                                                                                       |
| resultant_winddirection_cardinal | The above wind direction converted to human-readable direction, e.g. N, NE, NNE, NNW                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| max5_windspeed                   | The maximum windspeed of recorded 5-second averages (in degrees)                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| max5_winddirection               | The maximum windspeed of recorded 5-second averages (in degrees)                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| max5_direction_cardinal          | The maximum windspeed of recorded 5-second averages (in cardinal directions)                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| max2_windspeed                   | The maximum windspeed of recorded 2-minute averages (in degrees)                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| max2_winddirection               | The maximum windspeed of recorded 2-minute averages (in degrees)                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| max2_direction_cardinal          | The maximum windspeed of recorded 2-minute averages (in cardinal directions)                                                                                                                                                                                                                                                                                                                                                                                                                                                      |

### Responses

**See right**. Weather observations and attributes (described above) that match the provided query parameters. Response is limited to 500 results, which can be paginated by using the `offset` parameter.

## `GET /v1/api/weather/hourly`

> ### Example Query

```
http://plenar.io/v1/api/weather/hourly/?wban_code=14819&
datetime__ge=2016-06-24
```
> All hourly weather observations at CHICAGO/MIDWAY since June 24<sup>th</sup>, 2016.

> ### Example Response

```json
{
    "meta": {
        "status": "ok",
        "query": {
            "datetime__ge": "2016-06-24",
            "wban_code": "14819"
        },
        "message": "",
        "total": 23
    },
    "objects": [
        {
            "observations": [
                {
                    "wind_direction": "110",
                    "datetime": "2016-06-24T23:53:00",
                    "report_type": "AA",
                    "wetbulb_fahrenheit": 65,
                    "id": 391713839,
                    "station_type": 12,
                    "sky_condition": "CLR",
                    "hourly_precip": null,
                    "drybulb_fahrenheit": 72,
                    "latitude": null,
                    "wban_code": "14819",
                    "old_station_type": null,
                    "visibility": 10,
                    "wind_direction_cardinal": "ESE",
                    "sealevel_pressure": 30.05,
                    "weather_types": null,
                    "wind_speed": 5,
                    "sky_condition_top": "CLR",
                    "longitude": null,
                    "relative_humidity": 68,
                    "dewpoint_fahrenheit": 61,
                    "station_pressure": 29.41
                },
                ...
            ],
            "station_info": {
                "begin": "1928-10-04",
                "elevation": 188.4,
                "country": "US",
                "state": "IL",
                "location": {
                    "type": "Point",
                    "coordinates": [
                        -87.752,
                        41.786
                    ]
                },
                "end": "2014-03-13",
                "station_name": "CHICAGO/MIDWAY",
                "call_sign": "KMDW",
                "wban_code": "14819"
            }
        }
    ]
}
```

Query hourly weather observations from NOAA\'s [Quality Controlled Local Climatological Data](http://cdo.ncdc.noaa.gov/qclcd/QCLCD?prior=N).

### Query Parameters

All query parameters are optional.

| Parameter               | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| wban_code               | The WBAN (Weather Bureau Army Navy) number is the unique identifier for weather stations                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| datetime                | In SQL datetime form (e.g. '2003-10-05 23:04:00')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| old_station_type        | (Valid for all dates before May 1st, 2007) * AO1: automated station without a precipitation discriminator (no rain/snow sensor) * AO2; automated station with precipitation discriminator                                                                                                                                                                                                                                                                                                                                          |
| station_type            | * 0 AMOS now AWOS, also USAF stations * 4 MAPSO * 5 Navy METAR * 6 Navy Airways (obsolete) * 8 SOD; Keyed from 10C * 9 SOD; Keyed B-16, F6, Navy Forms * 11 ASOS (NWS) * 12 ASOS (FAA) * 15 Climate Reference Network                                                                                                                                                                                                                                                                                                              |
| sky_condition           | Up to three strings representing up to three layers of cloud cover. Each string is one of the below abbreviations with (in the case of clouds) a three-digit height following, representing hundreds of feet.  * CLR: Clear below 12,000 feet * FEW: > 0/8 - 2/8 sky cover * SCT (SCATTERED): 3/8 - 4/8 sky cover * BKN (BROKEN): 5/8 - 7/8 sky cover * OVC (OVERCAST): 8/8 sky cover                                                                                                                                              |
| sky_condition_top       | This parameter represents the highest observed sky condition (in hundreds of feet), taken from `sky_condition`.                                                                                                                                                                                                                                                                                                                                                                                                                    |
| visibility              | Distance at which objects can be discerned, in statute miles                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| weather_types           | A multidimensional PostgreSQL array which contains values from [Federal Meterological Handbook No. 1: Surface Weather Observations and Reports](http://www.ofcm.gov/fmh-1/fmh1.htm), in the following six-tuple: [vicinity, intensity, desc, precip, obscuration, other]. For example, in the event of an observation of a thunderstorm with heavy rain and snow with fog, one might see: `[NULL, +, TS, RA, DG, NULL]`. But if it were also snowing, there would be an additional six-tuple: `[NULL, NULL, NULL, SN, NULL, NULL]` |
| drybulb_fahrenheit      | Current temperature at current level of humidity (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| wetbulb_fahrenheit      | The temperature the air **would** have at 100% humidity (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| dewpoint_fahrenheit     | The temperature at which water vapor condenses into water at the same rate at which it evaporates (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                                                  |
| relative_humidity       | Expressed as a percentage (0 to 100), the ratio of the partial pressure of water vapor to the saturated vapor pressure at the current temperature                                                                                                                                                                                                                                                                                                                                                                                  |
| wind_speed              | Observed wind speed (averaged?) (in miles per hour)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| wind_direction          | Observed wind direction (averaged?) in degrees (0 to 360)                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| wind_direction_cardinal | Observed wind direction (averaged?) as a human-readable direction, e.g. N, NE, NNE, NNW                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| station_pressure        | Average pressure in inches of Mercury                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| sealevel_pressure       | Average sea-level pressure in inches of Mercury                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| report_type             | Standard reports are denoted 'AA' and special reports (e.g. for tornadoes) are 'SP'. * AA: METAR (AVIATION ROUTINE WEATHER REPORT) - HOURLY * SP: METAR SPECIAL REPORT * CRN05: Climate Reference Network                                                                                                                                                                                                                                                                                                                          |
| hourly_precip           | Precipitation total (in inches)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

### Responses

Hourly weather observations and attributes (described above) that match the provided query parameters. Response is limited to 500 results, which can be paginated using the `offset` parameter.

## `GET /v1/api/weather/metar`

> ### Example Query

```
http://plenar.io/v1/api/weather/metar/?wban_code=94846&
datetime__ge=2016-06-29&datetime__le=2016-06-30
```

> All metar weather observations at CHICAGO/MIDWAY between June 30<sup>th</sup> and July 1<sup>st</sup>, 2016.

> ### Example Response

```json
{
    "meta": {
        "status": "ok",
        "query": {
            "datetime__le": "2016-06-30",
            "datetime__ge": "2016-06-29",
            "wban_code": "94846"
        },
        "message": "",
        "total": 24
    },
    "objects": [
        {
            "observations": [
                {
                    "wind_direction": "90",
                    "datetime": "2016-06-29T23:51:00",
                    "precip_24hr": null,
                    "id": 8903473,
                    "sky_condition": "SCT065 BKN230",
                    "call_sign": "KORD",
                    "latitude": null,
                    "wban_code": "94846",
                    "precip_1hr": null,
                    "visibility": 10,
                    "wind_direction_cardinal": "E",
                    "temp_fahrenheit": 73.94,
                    "sealevel_pressure": 30.0437219724,
                    "weather_types": [ ],
                    "wind_speed": 12,
                    "wind_gust": null,
                    "precip_6hr": null,
                    "precip_3hr": null,
                    "sky_condition_top": "BKN230",
                    "longitude": null,
                    "dewpoint_fahrenheit": 46.94,
                    "station_pressure": 30.05
                },
                ...
            ],
            "station_info": {
                "begin": "1946-10-01",
                "elevation": 205.4,
                "country": "US",
                "state": "IL",
                "location": {
                    "type": "Point",
                    "coordinates": [
                        -87.934,
                        41.995
                    ]
                },
                "end": "2014-03-13",
                "station_name": "CHICAGO/O HARE ARPT",
                "call_sign": "KORD",
                "wban_code": "94846"
            }
        }
    ]
}
```

Query METAR weather observations. METARs (Meterological Terminal Air Reports) are a frequently updated (every hour or more) form of surface weather data.

METAR data is only stored for recent dates (e.g. the last 2-3 days) for which there is not yet an hourly QCLCD (quality-controlled) observation. If METARs are unavailable for a range of recent dates, check the [hourly weather API](http://localhost:4567/?html#get-v1-api-weather-hourly).

### Query Parameters

All query parameters are optional

| Parameter               | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| wban_code               | The WBAN (Weather Bureau Army Navy) number is the unique identifier for weather stations                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| call-sign               |  Call sign of weather station                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| datetime                | In SQL datetime form (e.g. '2003-10-05 23:04:00')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| sky_condition           | Up to three strings representing up to three layers of cloud cover. Each string is one of the below abbreviations with (in the case of clouds) a three-digit height following, representing hundreds of feet.  * CLR: Clear below 12,000 feet * FEW: > 0/8 - 2/8 sky cover * SCT (SCATTERED): 3/8 - 4/8 sky cover * BKN (BROKEN): 5/8 - 7/8 sky cover * OVC (OVERCAST): 8/8 sky cover                                                                                                                                              |
| sky_condition_top       | This parameter represents the highest observed sky condition (in hundreds of feet), taken from `sky_condition`.                                                                                                                                                                                                                                                                                                                                                                                                                    |
| visibility              | Distance at which objects can be discerned, in statute miles                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| weather_types           | A multidimensional PostgreSQL array which contains values from [Federal Meterological Handbook No. 1: Surface Weather Observations and Reports](http://www.ofcm.gov/fmh-1/fmh1.htm), in the following six-tuple: [vicinity, intensity, desc, precip, obscuration, other]. For example, in the event of an observation of a thunderstorm with heavy rain and snow with fog, one might see: `[NULL, +, TS, RA, DG, NULL]`. But if it were also snowing, there would be an additional six-tuple: `[NULL, NULL, NULL, SN, NULL, NULL]` |
| temp_fahrenheit         | Current temperature at current level of humidity (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| dewpoint_fahrenheit     | The temperature at which water vapor condenses into water at the same rate at which it evaporates (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                                                  |
| relative_humidity       | Expressed as a percentage (0 to 100), the ratio of the partial pressure of water vapor to the saturated vapor pressure at the current temperature                                                                                                                                                                                                                                                                                                                                                                                  |
| wind_speed              | Observed wind speed (averaged?) (in miles per hour)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| wind_direction          | Observed wind direction (averaged?) in degrees (0 to 360)                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| wind_direction_cardinal | Observed wind direction (averaged?) as a human-readable direction, e.g. N, NE, NNE, NNW                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| station_pressure        | Average pressure in inches of mercury                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| sealevel_pressure       | Average sea-level pressure in inches of mercury                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| precip_1hr              | Precipitation total in the last 1 hour (in inches)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| precip_3hr              | Precipitation total in the last 3 hours (in inches)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| precip_6hr              | Precipitation total in the last 6 hours (in inches)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| precip_24hr             | Precipitation total in the last 24 hours (in inches)                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |

### Responses

Metar weather observations and attributes (described above) that match the provided query parameters. Response is limited to 500 results, which can be paginated by using the `offset` parameter.

# Shape Data Endpoints

## `GET /v1/api/shapes`

> ### Example Query

```
http://plenar.io/v1/api/shapes/
```

> This query yields information about every shape dataset.

> ### Example Response

```json
{
    "meta": {
        "status": "ok",
        "message": ""
    },
    "objects": [
        {
            "attribution": "City of Chicago",
            "description": "Major streets in Chicago. ",
            "view_url": "",
            "num_shapes": 16065,
            "source_url": "https://data.cityofchicago.org/download/ueqs-5wr6/application/zip",
            "bbox": "{\"type\":\"Polygon\",\"coordinates\":[[[-87.9320823353882,41.6445840278876],[-87.9320823353882,42.0230311371132],[-87.5244576278484,42.0230311371132],[-87.5244576278484,41.6445840278876],[-87.9320823353882,41.6445840278876]]]}",
            "date_added": "2016-04-20",
            "human_name": "Major Streets",
            "dataset_name": "major_streets",
            "update_freq": "yearly"
        },
        ...
    ]
}
```

This endpoint contains a record for each shape dataset in Plenario.

### Query Parameters

Specify `location_geom_within` to only view metadata about shape datasets in a particular area.

| Parameter Name       | Parameter Default | Parameter Description                                                           |
|----------------------|-------------------|---------------------------------------------------------------------------------|
| location_geom_within | none              | A URL encoded [GeoJSON](geojson.org) polygon representing the area of interest. |

### Responses

One record shape per dataset.

| Attribute Name | Attribute Description                                         |
|----------------|---------------------------------------------------------------|
| description    | Verbose, official description of the dataset.                 |
| source_url     | If available, the URL where the data was originally sourced.  |
| update_freq    | Update frequency                                              |
| dataset_name   | the name by which you can query the shape dataset             |
| human_name     | a nicer name to refer to the shape dataset in user interfaces |
| date_added     | the date the shape dataset was added to Plenario              |

## `GET /v1/api/shapes/<dataset_name>`

> ### Example Query

```
http://plenar.io/v1/api/shapes/chicago_pedestrian_streets
?data_type=json
```

> Get a GeoJSON document with Chicago's streets that are reserved for pedestrian traffic.

> ### Example Response

> User will be presented with a document download in the format of their choice.

Download this shape dataset in the format of your choosing. Optionally, provide `location_geom__within` to only download the subset of the shape dataset that intersects with your spatial filter.

### Query Parameters

| Parameter Name       | Parameter Default | Parameter Description                                                           |
|----------------------|-------------------|---------------------------------------------------------------------------------|
| **data_type**            | `json`            | `json` for GeoJSON, `shapefile` for ESRI Shapefile, or `kml` for KML            |
| **location_geom_within** | noone             | A URL encoded [GeoJSON](geojson.org) polygon representing the area of interest. |

### Response

A document with a shape dataset.

## `GET /v1/api/shapes/<polygon_dataset_name>/<point_dataset_name>/`

> ### Example Query

```
http://plenar.io/v1/api/shapes/boundaries_neighborhoods/
individual_landmarks/?obs_date__ge=1900-09-22&
obs_date__le=2015-10-1
```

> Count the number of historical landmarks in each Chicago neighborhood.

> ### Example Response

*Experimental endpoint. Could change without warning.*

Given a point dataset and a polygon dataset, return a document of all of the polygons in the polygon dataset together with the counts of the points that intersect them.

### Query Parameters

| Parameter Name        | Parameter Default | Parameter Description                                                                                                                                                                                                                                                               |
|-----------------------|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [dataset_field]*      | none              | Any available dataset field. Discoverable via the `/v1/api/fields//` endpoint. Any number of these query parameters can be chained together and are linked together with a SQL `AND` under the hood. Use the provided [query operators](#query-operators-for-raw-data) if desired. |
| obs_date__ge          | 90 days ago       | Obversations greater than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                                                                                      |
| obs_date__le          | today's date      | Obversations less than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                                                                                         |
| location_geom__within | none              | A URL encoded [GeoJSON](geojson.org) polygon representing the area of interest.                                                                                                                                                                                                     |
| data_type             | json              | Response data format. Current options are `json`, `geojson` and `csv`.                                                                                                                                                                                                              |

### Responses

A document of polygons from the given dataset and the count of the points that intersect them.

#Response Format

All JSON API calls return their data in the `objects` block. Additional information is returned in the `meta` block:

| Parameter   | Description                                                       |
|-------------|-------------------------------------------------------------------|
| **status**  | *ok* if the query is successful, *error* if not.                  |
| **query**   | Original query parameters passed in.                              |
| **message** | If `status` is *error*, a detailed message as to what went wrong. |

# Advanced Filtering

Users are able to add additional filters (including and/or functions) using the following syntax

op col val





{"op": "and/or", "val": [
  {"op": "stuff" ...},
  {"op": "more stuff" ...},
  {"op": "or", "val": [
    {}
  ]}
]}
