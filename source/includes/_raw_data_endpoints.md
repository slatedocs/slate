# Raw Data Endpoints

## Query Operators for Raw Data

This list of **Query Operators** can be used for any given query `dataset_field` or query parameter provided by the raw data endpoints (besides syntactical exceptions; `__like` and `__ilike` cannot be used with integers, for example).  

<aside class="notice">For example, <code>ward__ge=48</code> translates to "ward >= 48" in SQL</aside>

| Operator | Description                                                          |
|----------|----------------------------------------------------------------------|
| **__gt**     | greater than (`>`)                                                   |
| **__ge**     | greater than or equal to (`>=`)                                      |
| **__lt**     | less than (`<`)                                                      |
| **__le**     | less than or equal to (`<=`)                                         |
| **__ne**     | not equal (`!=`)                                                     |
| **__like**   | like value with % wildcards, case sensitive (`LIKE`, `'State%'`)     |
| **__ilike**  | like value with % wildcards, case insensitive (`ILIKE`,  `'state%'`) |
| **__in**     | within a list of provided values (`IN ('list', 'of', 'values')`)     |  
| **__eq**  |  equal to (`=`) |

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
| **dataset_name**         | none              | **Required**. Machine version of the dataset name as you get it from the `/v1/api/datasets` endpoint. If not provided, returns all available datasets. More than one dataset can be requested by using `dataset_name__in` and listing multiple comma separated dataset names.                                                                                                                       |
| **[dataset_field]***     | none              | Any available dataset field. Discoverable via the `/v1/api/fields/<dataset_name>/` endpoint. Any number of these query parameters can be chained together and are linked together with a SQL `AND` under the hood. For any given `dataset_field`, the query can be modified with [query operators](#query-operators-for-raw-data) |
| **obs_date__ge**         | 90 days ago       | Obversations greater than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                         |
| **obs_date__le**         | 90 days ago       | Obversations less than or equal to a given date.  Dates must be formatted as **YYYY-MM-DD**                                                                                                                            |
| **location_geom_within** | none              | A URL encoded [GeoJSON](http://geojson.org/) polygon representing the area of interest                                                                                                                             |
| **data_type**            | json              | Response data format. Current options are `json`, `geojson` and `csv`                                                                                                                                                         |
| **geom**                 | none              | Join to a shape dataset; columns in the shape dataset can also be used as filters with the `[dataset_field]*` parameter                                                                                            |
| **offset**               | none              | Used to paginate through results of more than 1000.  Example: `offset=1000` will fetch the second page of results.                                                                                  |
| **[dataset]__filter** | none  | See [advanced filtering](#advanced-filtering) for more info. |

### Responses

**See right**

The API responds with a list of raw records for the particular dataset. The
fields returned will vary per dataset. Response is limited to 1000 results,
which can be paginated by using the `offset` parameter.

| **Attribute Name** | **Attribute Description**                              |
| ------------------ | ------------------------------------------------------ |
| **_meta_**         |                                                        |
| **status**         | Indicates query success, can be `ok` or `error`.       |
| **query**          | Shows values used in the query.                        |
| **message**        | Reports errors or warnings (if any).                   |
| **total**          | Total number of records found.                         |
| **_objects_**      | Contains row values of raw dataset information.        |

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
| **station_name** | Name of weather station                                                                                           |
| **call_sign**    | Call sign of weather station                                                                                      |
| **wban_code**    | Weather Bureau Army Navy (WBAN) code of weather station                                                           |
| **begin**        | Date of first weather observation                                                                                 |
| **end**          | Date of last weather observation                                                                                  |
| **elevation**    | Elevation of station (in feet)                                                                                    |
| **county**       | County name                                                                                                       |
| **state**        | Two-digit state code                                                                                              |
| **location**     | Latitude and longitude location of weather station. Can be queried with a GeoJSON shape using `location__within`. |

For any given parameter above, the query can be modified with [query operators](#query-operators-for-raw-data).

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
| **wban_code**                        | The Weather Bureau Army Navy (WBAN) number is the unique identifier for weather stations                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| **date**                             | Date of the observations in SQL date form (e.g. '2003-10-05')                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **temp_max**                         | The maximum temperature for the day in Farenheit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **temp_min**                         | The minimum temperature for the day in Farenheit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **temp_avg**                         | The average temperature for the day in Farenheit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **departure_from_normal**            | The departure from the normal average temperature for the day in Fahrenheit                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| **dewpoint_avg**                     | The average dewpoint, i.e. the temperature at which water vapor condenses into water at the same rate at which it evaporates (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                      |
| **wetbulb_avg**                      | The average temperature the air would have had at 100% humidity (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| **weather_types**                    | A multidimensional PostgreSQL array which contains values from [Federal Meterological Handbook No. 1: Surface Weather Observations and Reports](http://www.ofcm.gov/fmh-1/fmh1.htm), in the following six-tuple: [vicinity, intensity, desc, precip, obscuration, other]. For example, in the event of an observation of a thunderstorm with heavy rain and snow with fog, one might see: `[NULL, +, TS, RA, DG, NULL]`.But if it were also snowing, there would be an additional six-tuple: `[NULL, NULL, NULL, SN, NULL, NULL]` |
| **snowice_depth**                    | In inches, the current depth of snow/ice. A 'trace' (T) is encoded as 0.005                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| **snowice_waterequiv**               | This would be the depth of water in inches if you could melt the snowpack instantaneously                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| **snowfall**                         | Snowfall in inches on this day                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| **precip_total**                     | Total precipitation in inches, during the 24-hour period ending in local standard time                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| **station_pressure**                 | Average pressure in inches of mercury                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| **sealevel_pressure**                | Average sea-level pressure in inches of mercury                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| **resultant_windspeed**              | The magnitude (in miles per hour) of "resultant" wind, which is obtained by converting recorded wind speeds and directions over a 24-hour period into a single vector with a single magnitude and direction                                                                                                                                                                                                                                                                                                                       |
| **resultant_winddirection_cardinal** | The above wind direction converted to human-readable direction, e.g. N, NE, NNE, NNW                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| **max5_windspeed**                   | The maximum windspeed of recorded **5-second** averages (in degrees)                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **max5_winddirection**               | The maximum windspeed of recorded **5-second** averages (in degrees)                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **max5_direction_cardinal**          | The maximum windspeed of recorded **5-second** averages (in cardinal directions)                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| **max2_windspeed**                   | The maximum windspeed of recorded **2-minute** averages (in degrees)                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **max2_winddirection**               | The maximum windspeed of recorded **2-minute** averages (in degrees)                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **max2_direction_cardinal**          | The maximum windspeed of recorded **2-minute** averages (in cardinal directions)                                                                                                                                                                                                                                                                                                                                                                                                                                                      |

For any given parameter above, the query can be modified with [query operators](#query-operators-for-raw-data).

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
| **wban_code**               | The WBAN (Weather Bureau Army Navy) number is the unique identifier for weather stations                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| **datetime**                | In SQL datetime form (e.g. '2003-10-05 23:04:00')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **old_station_type**        | (Valid for all dates before May 1st, 2007) <ul><li>AO1: automated station without a precipitation discriminator (no rain/snow sensor)</li><li>AO2; automated station with precipitation discriminator</li></ul>                                                                                                                                                                                                                                                                                                                                          |
| **station_type**            | <ul><li>0 AMOS now AWOS, also USAF stations</li><li>4 MAPSO</li><li>5 Navy METAR</li><li>6 Navy Airways (obsolete)</li><li>8 SOD; Keyed from 10C</li><li>9 SOD; Keyed B-16, F6, Navy Forms</li><li>11 ASOS (NWS)</li><li>12 ASOS (FAA)</li><li>15 Climate Reference Network</li></ul>                                                                                                                                                                                                                                                                                                             |
| **sky_condition**           | Up to three strings representing up to three layers of cloud cover. Each string is one of the below abbreviations with (in the case of clouds) a three-digit height following, representing hundreds of feet. <ul><li>CLR: Clear below 12,000 feet</li><li>FEW: > 0/8 - 2/8 sky cover</li><li>SCT (SCATTERED): 3/8 - 4/8 sky cover</li><li>BKN (BROKEN): 5/8 - 7/8 sky cover</li><li>OVC (OVERCAST): 8/8 sky cover</li></ul>                                                                                                                                              |
| **sky_condition_top**       | This parameter represents the highest observed sky condition (in hundreds of feet), taken from `sky_condition`.                                                                                                                                                                                                                                                                                                                                                                                                                    |
| **visibility**              | Distance at which objects can be discerned, in statute miles                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| **weather_types**           | A multidimensional PostgreSQL array which contains values from [Federal Meterological Handbook No. 1: Surface Weather Observations and Reports](http://www.ofcm.gov/fmh-1/fmh1.htm), in the following six-tuple: [vicinity, intensity, desc, precip, obscuration, other]. For example, in the event of an observation of a thunderstorm with heavy rain and snow with fog, one might see: `[NULL, +, TS, RA, DG, NULL]`. But if it were also snowing, there would be an additional six-tuple: `[NULL, NULL, NULL, SN, NULL, NULL]` |
| **drybulb_fahrenheit**      | Current temperature at current level of humidity (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| **wetbulb_fahrenheit**      | The temperature the air **would** have at 100% humidity (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| **dewpoint_fahrenheit**     | The temperature at which water vapor condenses into water at the same rate at which it evaporates (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **relative_humidity**       | Expressed as a percentage (0 to 100), the ratio of the partial pressure of water vapor to the saturated vapor pressure at the current temperature                                                                                                                                                                                                                                                                                                                                                                                  |
| **wind_speed**              | Observed wind speed (averaged?) (in miles per hour)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **wind_direction**          | Observed wind direction (averaged?) in degrees (0 to 360)                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| **wind_direction_cardinal** | Observed wind direction (averaged?) as a human-readable direction, e.g. N, NE, NNE, NNW  |
| **station_pressure**        | Average pressure in inches of mercury                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| **sealevel_pressure**       | Average sea-level pressure in inches of mercury                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| **report_type**             | Standard reports are denoted 'AA' and special reports (e.g. for tornadoes) are 'SP'. <ul><li>AA: METAR (AVIATION ROUTINE WEATHER REPORT) - HOURLY</li><li>SP: METAR SPECIAL REPORT</li><li>CRN05: Climate Reference Network</li></ul>                                                                                                                                                                                                                                                                                                                          |
| **hourly_precip**           | Precipitation total (in inches)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

For any given parameter above, the query can be modified with [query operators](#query-operators-for-raw-data).

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
| **wban_code**               | The WBAN (Weather Bureau Army Navy) number is the unique identifier for weather stations                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| **call-sign**               |  Call sign of weather station                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| **datetime**                | In SQL datetime form (e.g. '2003-10-05 23:04:00')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **sky_condition**           | Up to three strings representing up to three layers of cloud cover. Each string is one of the below abbreviations with (in the case of clouds) a three-digit height following, representing hundreds of feet. <ul><li>CLR: Clear below 12,000 feet</li><li>FEW: > 0/8 - 2/8 sky cover</li><li>SCT (SCATTERED): 3/8 - 4/8 sky cover</li><li>BKN (BROKEN): 5/8 - 7/8 sky cover</li><li>OVC (OVERCAST): 8/8 sky cover</li></ul>                                                                                                                                              |
| **sky_condition_top**       | This parameter represents the highest observed sky condition (in hundreds of feet), taken from `sky_condition`.                                                                                                                                                                                                                                                                                                                                                                                                                    |
| **visibility**              | Distance at which objects can be discerned, in statute miles                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| **weather_types**           | A multidimensional PostgreSQL array which contains values from [Federal Meterological Handbook No. 1: Surface Weather Observations and Reports](http://www.ofcm.gov/fmh-1/fmh1.htm), in the following six-tuple: [vicinity, intensity, desc, precip, obscuration, other]. For example, in the event of an observation of a thunderstorm with heavy rain and snow with fog, one might see: `[NULL, +, TS, RA, DG, NULL]`. But if it were also snowing, there would be an additional six-tuple: `[NULL, NULL, NULL, SN, NULL, NULL]` |
| **temp_fahrenheit**         | Current temperature at current level of humidity (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| **dewpoint_fahrenheit**     | The temperature at which water vapor condenses into water at the same rate at which it evaporates (in Fahrenheit)                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **relative_humidity**       | Expressed as a percentage (0 to 100), the ratio of the partial pressure of water vapor to the saturated vapor pressure at the current temperature                                                                                                                                                                                                                                                                                                                                                                                  |
| **wind_speed**              | Observed wind speed (averaged?) (in miles per hour)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **wind_direction**          | Observed wind direction (averaged?) in degrees (0 to 360)                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| **wind_direction_cardinal** | Observed wind direction (averaged?) as a human-readable direction, e.g. N, NE, NNE, NNW                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| **station_pressure**        | Average pressure in inches of mercury                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| **sealevel_pressure**       | Average sea-level pressure in inches of mercury                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| **precip_1hr**              | Precipitation total in the last 1 hour (in inches)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **precip_3hr**              | Precipitation total in the last 3 hours (in inches)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **precip_6hr**              | Precipitation total in the last 6 hours (in inches)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **precip_24hr**             | Precipitation total in the last 24 hours (in inches)                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |

For any given parameter above, the query can be modified with [query operators](#query-operators-for-raw-data).

### Responses

Metar weather observations and attributes (described above) that match the provided query parameters. Response is limited to 500 results, which can be paginated by using the `offset` parameter.
