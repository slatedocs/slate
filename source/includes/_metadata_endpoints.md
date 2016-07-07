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
| **field_type**     | [Postgres data type](https://www.postgresql.org/docs/9.3/static/datatype.html) for given field.                                                                                                |
| **field_name**     | Name of database field. Useful for performing additional queries using the `/v1/api/detail-aggregate/` and `/v1/api/detail/` endpoints. |
