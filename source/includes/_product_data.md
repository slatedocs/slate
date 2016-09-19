# Product Data

Along with the technical data described in the <a href="#schema">Schema</a> , BBOXX collects telemetry data such as Current, Voltage and Temperature (amongst others) from each unit. This time-series data is held in a separate time-series database.

BBOXX uses <a href="https://docs.influxdata.com/influxdb/v1.0/">InfluxDB</a> as it's time-series database.

## Schema

> InfluxDB schema for a single unit storing I, V, T

```python
name: telemetry            fld     fld       fld         tag
-----------------------------------------------------------------
time                     current voltage temperature product_imei

2016-09-02T08:30:42.645Z    1       2         3      013777946874001
2016-09-02T08:40:53.327Z    1       2         3      013777946874001
2016-09-02T08:41:56.348Z    1       2         3      013777946874001
2016-09-02T08:42:35.505Z    1       2         3      013777946874001
```

Influx uses <a href="https://docs.influxdata.com/influxdb/v1.0/concepts/key_concepts/#measurement">measurements</a>, <a href="https://docs.influxdata.com/influxdb/v1.0/concepts/key_concepts/#field-set">fields</a> and <a href="https://docs.influxdata.com/influxdb/v1.0/concepts/key_concepts/#tag-set">tags</a> to uniquely identify data.

All data recorded from a unit is held in the "telemetry" measurement. The name of the data being recorded is the field name. Each series is then tagged with the <a href="#product">product_imei</a> and the <a href="#product_type">product_type_id</a>.

For example - a unit has product_imei: 013777946874001
This unit has 3 things being recorded:

* current (I)
* voltage (V)
* temperature (T)

The data would therefore be recorded in influx as follows (see right):


A second unit has product_imei: 866771029491460
This unit has 5 things being recorded:

* current (I)
* current_in (I_in)
* current_out (I_out)
* voltage (V)
* temperature (T)

The influx data would therefore be now look like this:

> New schema for the 'telemetry' measurement with a second unit adding data.

```python
name: telemetry            fld     fld       fld     fld   fld       tag
-------------------------------------------------------------------------------
time                     current voltage temperature c_in c_out  product_imei

2016-09-02T08:30:42.645Z    1       2         3                 013777946874001
2016-09-02T08:40:53.327Z    1       2         3                 013777946874001
2016-09-02T08:41:56.348Z    1       2         3                 013777946874001
2016-09-02T08:42:35.505Z    1       2         3                 013777946874001
2016-08-30T10:05:36.873Z    4       5         6       7     8   013950004127933
2016-08-30T10:06:00.734Z    4       5         6       7     8   013950004127933
2016-08-30T16:43:11.984Z    4       5         6       7     8   013950004127933
2016-08-30T16:43:22.646Z    4       5         6       7     8   013950004127933
```

Users can query data relating to each product, specifying fields and tags as desired. See <a href="#reading-data-from-influx">Reading Data From Influx</a> for more information.

## Writing Data to Influx

> Data should be supplied in the following data structure:


```python
data = {
    "measurement": <measurement_name>,
    "tags": { "tag_name": <value> },
    "fields": {
        "field_name": [ [time, value], [time, value], [time, value] ]
        "field_name": [ [time, value], [time, value], [time, value] ]
        "field_name": [ [time, value], [time, value], [time, value] ]
    },
}
```

> Below is a specific example for storing current, voltage and temperature:

```python
data = {
    "measurement": "telemetry",
    "tags": { "some_tag": "tag_value" },
    "fields": {
        "current": [
            ['2016-09-01', 1.0],
            ['2016-09-02', 2.0],
            ['2016-09-03', 3.0]
        ],
        "voltage": [
            ['2016-09-01', 10],
            ['2016-09-02', 20],
            ['2016-09-03', 30]
        ],
        "temperature": [
            ['2016-09-01', 0.1],
            ['2016-09-02', 0.2],
            ['2016-09-03', 0.3]
        ]
    }
}
```

Data is written to influx as a list of timestamp/value pairs. The `measurement`, `field` and `tags` are defined in a data structure as shown on the right.

### Measurements

A `measurement` is a logical container for different series. Examples of sensible measurement names could be:  

* telemetry -_(for Current, Voltage, Temperature, Power)_
* logging - _(for storing logs if required)_
* analysis - _(for storing time-series that are not measured directly)_

### Fields

Each `measurement` may have many `fields`. Each `field` represents a single stream of incoming data. Example of sensible fields could be:  

* current
* voltage
* temperature

### Tags

Values inside a `field` are differentiated by the `tags` on each point. Sensible `tags` could be:  

* product_imei
* product_type_id
* entity_id

The combination of `Measurement/Field/Tag` therefore defines a time-series for a single unit.

For example if we wish to see Current and Voltage data for the unit 013777894567 we would look inside:

* `Measurement`: "telemetry"
* `Fields`: "current, voltage"
* `Tags`: {"product_imei": "013777894567"}

## Writing Data for a Product

> Data can be written to a specific product like this - note that the product_imei is automatically written into the tags and does not need to be specified by the user:

```python
    url = "http://smartapi.bboxx.co.uk/v2/products/<imei>/rm_data"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    data = json.dumps({
        "measurement": "telemetry",
        "tags": {"some_tag": "tag_value"},
        "fields": {
            "current": [
                ['2016-09-01', 1.0],
                ['2016-09-02', 2.0],
                ['2016-09-03', 3.0]
            ],
            "voltage": [
                ['2016-09-01', 10],
                ['2016-09-02', 20],
                ['2016-09-03', 30]
            ],
            "temperature": [
                ['2016-09-01', 0.1],
                ['2016-09-02', 0.2],
                ['2016-09-03', 0.3]
            ]
        }
    })


    r = requests.post(url=url, data=data, headers=headers)

    print r.text
    >>> {
      "staus": "success"
      "message": "9 data-point(s) successfully written to influx",
      "data": null,
    }
```
Data for a single product data is written using the `/v2/products/<imei>/rm_data` endpoint.

### POST
     | value
 ----:|:---
endpoint | `/v2/products/<imei>/rm_data`
method | `POST`
url_params | `product_imei` <font color="DarkGray">_(varchar(15))_</font>
query params |  None
body | List of valid data-points
permissions | <font color="Jade">__`TECHNICAL`__</font>
response | `200`

<aside class="notice">Note! The <a href="#product">product_imei</a> tag doesn't need to be specified it will be added automatically.</aside>


## Writing General Data

> More general data can be written like this:

```python
    url = "http://smartapi.bboxx.co.uk/v2/influx/write_data"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    data = json.dumps([{
        "measurement": "analysis",
        "fields": {
            "curve-data": [ 
                ["2016-01-01T00:01:20", 1], 
                ["2016-01-01T00:01:21", 2], 
                ["2016-01-01T00:01:22", 3], 
                ["2016-01-01T00:01:23", 4] ],
        },
        "tags": {
            "analysis-type": "state-of-health"
            "product_imei": "000000000000000"
        }
    }])


    r = requests.post(url=url, data=data, headers=headers)

    print r.text
    >>> {
      "staus": "success"
      "message": "4 data-point(s) successfully written to influx",
      "data": null,
    }
```

If a user wishes to store data that doesn't relate to a specific product they can use the more general `/v2/influx/write_data` endpoint.

<aside class="notice">Note that this endpoint cannot auto-assign a <a href="#product">product_imei</a> tag so all fields and tags must be explicitly stated in the request.</aside>


### POST
     | value
 ----:|:---
endpoint | `/v2/influx/write_data`
method | `POST`
url_params | None
query params |  None
body | List of valid data-points
permissions | <font color="Jade">__`TECHNICAL`__</font>
response | `200`

## Reading data for a Product

> A `GET` request with no parameters will return the default query for the product.

```python
    url = "http://smartapi.bboxx.co.uk/v2/products/000000000000000/rm_data"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)
```

> Any number of parameters can be explicitly specified, the other parameters will be filled with the default options.

```python
    url = "http://smartapi.bboxx.co.uk/v2/products/000000000000000/rm_data"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    params = {
        "start": "2016-01-01"
    }

    r = requests.get(url=url, headers=headers)
```

> Complex queries can be built using the `where` clause parameters

```python
    url = "http://smartapi.bboxx.co.uk/v2/products/000000000000000/rm_data"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    params = {
        "start": '2016-01-01',
        "end": '2016-01-02',
        "limit": 100,
        "where": "voltage > 1.0"
    }

    r = requests.get(url=url, params=params, headers=headers)
```

Users can `GET` data for a particular product using the same rm_data endpoint `/v2/products/<imei>/rm_data`

As expected a `GET` request to this endpoint returns data relating that product.

Users can filter the data they received by providing filters in the parameters of the `GET` request. Each parameter is optional and if not provided will be filled by the default option.

Defaults will be defined separately for each <a href="#product_type">product_type</a> so different products will return different data structures.

### Parameters

 name | description | default
 ----:|:--- | ---
"start" | start-time | 7 days ago
"end" | end-time | now()
"fields" | fields to query | ["current", "voltage", "temperature"]
"measurement" | measurement to query | "telemetry"
"limit" | number of data-points to return | No limit
"where" | An optional WHERE-clause | None
"tags" | tags to query | {}

For example:

If a user queries `/v2/products/<imei>/rm_data` and includes the following parameters:

* start: "2016-01-01"

Then they can expect to receive `current`, `voltage`, and `temperature` data for the unit specified from the `Telemetry` measurement before 2016-01-01 and `now()`. Since `now()` is the default endtime and I,V,T are the default fields.

A second query with parameters:

* start: "2016-01-01"
* end: "2016-02-01"
* limit: 100
* where: "'voltage' > 14.0"

Would return the first 100 datapoints in January where voltage > 14.0V for the unit.

## Reading General Data

A `GET` request to `/v2/influx/data` allows the user to read more general data from influx. The parameter syntax and defaults are the same.
<aside class="notice">Note! A <a href="#product">product_imei</a> must be explicity stated if required when using this endpoint.</aside>




