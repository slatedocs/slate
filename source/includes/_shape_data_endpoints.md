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
            "bbox": "{\"type\":\"Polygon\",\"coordinates\":[...]}",
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

> ### Example Queries

```
http://plenar.io/v1/api/shapes/pedestrian_streets?data_type=json
```

> Get a GeoJSON document with Chicago's streets that are reserved for pedestrian traffic.

```
http://plenar.io/v1/api/shapes/pedestrian_streets?data_type=json
&pedestrian_streets__filter={"op": "eq", "col": "name", "val": "PEDESTRIAN
STREET RETAIL"}
```

> Limit that document to only streets marked as "PEDESTRIAN STREET RETAIL".


> ### Example Response

> User will be presented with a document download in the format of their choice.

Download this shape dataset in the format of your choosing. Optionally, provide `location_geom__within` to only download the subset of the shape dataset that intersects with your spatial filter.

### Query Parameters

| Parameter Name       | Parameter Default | Parameter Description                                                           |
|----------------------|-------------------|---------------------------------------------------------------------------------|
| **data_type**            | `json`            | `json` for GeoJSON, `shapefile` for ESRI Shapefile, or `kml` for KML            |
| **location_geom_within** | noone             | A URL encoded [GeoJSON](geojson.org) polygon representing the area of interest. |
| **[dataset]__filter** | none | See [advanced filtering](#advanced-filtering) for more info. |

### Response

A document with a shape dataset.

## `GET /v1/api/shapes/<polygon_dataset_name>/<point_dataset_name>/`

> ### Example Query

```
http://plenar.io/v1/api/shapes/boundaries_neighborhoods/individual_landmarks/
?obs_date__ge=1900-09-22&obs_date__le=2015-10-1&boundaries_neighborhoods__filter=
{"op": "eq", "col": "sec_neigh", "val": "BRONZEVILLE"}
```

> Count the number of historical landmarks in Chicago neighborhood Bronzeville.

> ### Example Response

```json
{
    "type": "FeatureCollection", 
    "features": [
        {
            "geometry": {
                "type": "MultiPolygon", 
                "coordinates": [...]
            }, 
            "type": "Feature", 
            "properties": {
                "shape_area": 48492503.1554, 
                "pri_neigh": "Grand Boulevard", 
                "sec_neigh": "BRONZEVILLE", 
                "shape_len": 28196.837157, 
                "count": 9
            }
        }, ...
    ]
}
```

Given a point dataset and a polygon dataset, return a document of all of the 
polygons in the polygon dataset together with the counts of the points that 
intersect them.

### Query Parameters

| Parameter Name        | Parameter Default | Parameter Description                                                                                                                                                                                                                                                               |
|-----------------------|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **[dataset_field]***      | none              | Any available dataset field. Discoverable via the `/v1/api/fields//` endpoint. Any number of these query parameters can be chained together and are linked together with a SQL `AND` under the hood. Use the provided [query operators](#query-operators-for-raw-data) if desired. |
| **obs_date__ge**          | 90 days ago       | Obversations greater than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                                                                                      |
| **obs_date__le**          | today's date      | Obversations less than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                                                                                         |
| **location_geom__within** | none              | A URL encoded [GeoJSON](geojson.org) polygon representing the area of interest.                                                                                                                                                                                                     |
| **data_type**             | json              | Response data format. Current options are `json`, `geojson` and `csv`.                                                                                                                                                                                                              |
| **[dataset]__filter** | none | See [advanced filtering](#advanced-filtering) for more info. |

### Responses

A document of polygons from the given dataset and the count of the points that intersect them.

