# Geostore

## What is Geostore?

Geostore is a geojson database. You can save your geojson or obtain geojson from country, region, Protected areas, etc.

Geostore object contains the next fields:


| Field             | Description                                                       | Type
| ------------------|:-----------------------------------------:                        | -----:
| id                | Id of the geostore                                                | Text
| geojson           | Geojson with the geometry                                         | Object
| hash              | MD5 hash generated from geojson. Is the same that the id          | Object
| provider          | This field is completed, if the geostore was created from a provider | Object
| -- type           | Provider type                             | Text
| -- table          | Table name                                | Text
| -- user           | User of the account                       | Text
| -- filter         | Conditions to obtain the geojson. Is possible put and and or conditions. This conditions must only return one row.   | Text
| areaHa            | Area in Hectares of the geojson                 | Number
| bbox              | Bounding box of the geojson                 | Array


<aside class="notice">
Remember — All endpoint of geostore don't need that you are authenticated.
</aside>

## Create Geostore

You can create a geostore from 4 different ways:

### With a Geojson

If you have your own geojson, you can save it in geostore. To create the geostore, you need to define all the required fields in the request body. The fields that compose a geostore are:

| Field             | Description                               | Type  | Values     | Required |
| ------------------|:-----------------------------------------:| -----:| -----------|  -------:|
| geojson           | Geojson with your geometry                | Object|            | Yes

> To create a Geostore, you have to do a POST with the following body:

```shell
curl -X POST http://api.resourcewatch.org/geostore \
-H "Content-Type: application/json"  -d \
 '{
   "geojson": <yourGeoJSONObject>
  }'
```

> Real example

```shell
curl -X POST http://api.resourcewatch.org/geostore \
-H "Content-Type: application/json"  -d \
 '{
   "geojson":{
      "type":"FeatureCollection",
      "features":[
         {
            "type":"Feature",
            "properties":{

            },
            "geometry":{
               "type":"LineString",
               "coordinates":[
                  [
                     -3.9942169189453125,
                     41.044922165782175
                  ],
                  [
                     -3.995418548583985,
                     41.03767166215326
                  ],
                  [
                     -3.9842605590820312,
                     41.03844854003296
                  ],
                  [
                     -3.9844322204589844,
                     41.04589315472392
                  ],
                  [
                     -3.9942169189453125,
                     41.044922165782175
                  ]
               ]
            }
         },
         {
            "type":"Feature",
            "properties":{

            },
            "geometry":{
               "type":"Polygon",
               "coordinates":[
                  [
                     [
                        -4.4549560546875,
                        40.84706035607122
                     ],
                     [
                        -4.4549560546875,
                        41.30257109430557
                     ],
                     [
                        -3.5211181640624996,
                        41.30257109430557
                     ],
                     [
                        -3.5211181640624996,
                        40.84706035607122
                     ],
                     [
                        -4.4549560546875,
                        40.84706035607122
                     ]
                  ]
               ]
            }
         }
      ]
   }
}'
```

The response will be 200 if the geostore will save correctly and return the geostore object with all information:

> Example response

```json
{
   "data":{
      "type":"geoStore",
      "id":"c9bacccfb9c3fe225dc67545bb93a5cb",
      "attributes":{
         "geojson":{
            "features":[
               {
                  "type":"Feature",
                  "geometry":{
                     "type":"Polygon",
                     "coordinates":[
                        [
                           [
                              -4.4549560546875,
                              40.84706035607122
                           ],
                           [
                              -4.4549560546875,
                              41.30257109430557
                           ],
                           [
                              -3.5211181640624996,
                              41.30257109430557
                           ],
                           [
                              -3.5211181640624996,
                              40.84706035607122
                           ],
                           [
                              -4.4549560546875,
                              40.84706035607122
                           ]
                        ]
                     ]
                  }
               }
            ],
            "crs":{

            },
            "type":"FeatureCollection"
         },
         "hash":"c9bacccfb9c3fe225dc67545bb93a5cb",
         "provider":{

         },
         "areaHa":397372.34122605197,
         "bbox":[
            -4.4549560546875,
            40.84706035607122,
            -3.5211181640624996,
            41.30257109430557
         ]
      }
   }
}
```

### From country

If you need obtain the geostore of a country, you can obtain it with the ISO3 code in the Geostore API.

`GET http://api.resourcewatch.org/geostore/admin/<ISO3>`

```shell
curl -X GET http://api.resourcewatch.org/geostore/admin/<ISO3>
```

> Real example obtaining the geostore of Spain
```shell
curl -X GET http://api.resourcewatch.org/geostore/admin/ESP
```

### From country and region

If you need obtain the geostore of a region in a country, you can obtain it with the ISO3 and region code:

`GET http://api.resourcewatch.org/geostore/admin/<ISO3>/<regionCode>`

```shell
curl -X GET http://api.resourcewatch.org/geostore/admin/<ISO3>/<regionCode>
```

> Real example obtaining the geostore of Madrid's Comunity in Spain

```shell
curl -X GET http://api.resourcewatch.org/geostore/admin/ESP/8
```

### From World Database on Protected Areas (wdpa)

Is possible obtain the geostore of a World Database on Protected Areas of the world. You only need the id of the protected area (WDPA).
[World Database on Protected Areas web](https://www.protectedplanet.net/)

`GET http://api.resourcewatch.org/geostore/wdpa/<wdpaId>`


```shell
curl -X GET http://api.resourcewatch.org/geostore/wdpa/<wdpaId>
```

> Real example obtaining the geostore of 'Sierra de Guadarrama' protected area

```shell
curl -X GET http://api.resourcewatch.org/geostore/wdpa/555538160
```

### From land use areas

Geostore has the geojson of 4 differents lands use:

#### Oil palm

`GET http://api.resourcewatch.org/geostore/use/oilpalm/<id>`

```shell
curl -X GET http://api.resourcewatch.org/geostore/use/oilpalm/<id>
```

> Real example obtaining the geostore of one Oil palm area

```shell
curl -X GET http://api.resourcewatch.org/geostore/use/oilpalm/556
```

#### Mining

`GET http://api.resourcewatch.org/geostore/use/mining/<id>`

```shell
curl -X GET http://api.resourcewatch.org/geostore/use/mining/<id>
```

> Real example obtaining the geostore of one mining area

```shell
curl -X GET http://api.resourcewatch.org/geostore/use/mining/573
```


#### Wood fiber

`GET http://api.resourcewatch.org/geostore/use/fiber/<id>`

```shell
curl -X GET http://api.resourcewatch.org/geostore/use/fiber/<id>
```

> Real example obtaining the geostore of one Wood fiber area

```shell
curl -X GET http://api.resourcewatch.org/geostore/use/fiber/346
```


#### Congo Basin logging roads

`GET http://api.resourcewatch.org/geostore/use/logging/<id>`

```shell
curl -X GET http://api.resourcewatch.org/geostore/use/logging/<id>
```

> Real example obtaining the geostore of Oil palm area

```shell
curl -X GET http://api.resourcewatch.org/geostore/use/logging/102
```


### From Carto

If your geojson is in carto table, is possible import this geojson in geostore. 
To import the geojson in geostore, you need to define all of the required fields in the request body. The fields that compose a import are:

| Field             | Description                               | Type   | Values     | Required |
| ------------------|:-----------------------------------------:| -----: | -----------|  -------:|
| provider          | Provider of data                          | Object |            | Yes
| -- type           | Provider type                             | Text   | carto      | Yes
| -- table          | Table name                                | Text   |            | Yes
| -- user           | User of the account                       | Text   |            | Yes
| -- filter         | Conditions to obtain the geojson. Is possible put and and or conditions. This conditions must only return one row.   | Text |            | Yes


> To import a Geostore, you have to do a POST with the following body:

```shell
curl -X POST http://api.resourcewatch.org/geostore \
-H "Content-Type: application/json"  -d \
 '{
    "provider":{
        "type": "carto",
        "table": <tableName>,
        "user": <userName>,
        "filter": <conditions>
    }
}'
```

> Real example

```shell
curl -X POST http://api.resourcewatch.org/geostore \
-H "Content-Type: application/json"  -d \
 '{
    "provider":{
        "type": "carto",
        "table": "gfw_mining",
        "user": "wri-01",
        "filter": "cartodb_id=573"
    }
}'
```

> Example response

```json
{
  "data": {
    "type": "geoStore",
    "id": "26f8975c4c647c19a2edaa11f23880a2",
    "attributes": {
      "geojson": {
        "features": [
          {
            "type": "Feature",
            "geometry": {
              "type": "MultiPolygon",
              "coordinates": [
                [
                  [
                    [
                      -74.0957370284411,
                      10.6814701233475
                    ],
                    [
                      -74.0957357154309,
                      10.654348341203
                    ],
                    [
                      -74.1100850695703,
                      10.6543473339623
                    ],
                    [
                      -74.1100876551212,
                      10.6814691125096
                    ],
                    [
                      -74.0957370284411,
                      10.6814701233475
                    ]
                  ]
                ]
              ]
            }
          }
        ],
        "crs": {},
        "type": "FeatureCollection"
      },
      "hash": "26f8975c4c647c19a2edaa11f23880a2",
      "provider": {
        "filter": "cartodb_id=573",
        "user": "wri-01",
        "table": "gfw_mining",
        "type": "carto"
      },
      "areaHa": 471.001953054716,
      "bbox": [
        -74.1100876551212,
        10.6543473339623,
        -74.0957357154309,
        10.6814701233475
      ]
    }
  }
}
```


## Obtain a Geostore

To obtain a geostore, you only need the id of the Geostore. You can perform a GET request for the geostore with its id.

```shell
curl -X GET http://api.resourcewatch.org/geostore/<geostoreId>
```

> Real example obtaining one geostore

```shell
curl -X GET http://api.resourcewatch.org/geostore/use/logging/26f8975c4c647c19a2edaa11f23880a2
```

> Example response

```json
{
  "data": {
    "type": "geoStore",
    "id": "26f8975c4c647c19a2edaa11f23880a2",
    "attributes": {
      "geojson": {
        "features": [
          {
            "type": "Feature",
            "geometry": {
              "type": "MultiPolygon",
              "coordinates": [
                [
                  [
                    [
                      -74.0957370284411,
                      10.6814701233475
                    ],
                    [
                      -74.0957357154309,
                      10.654348341203
                    ],
                    [
                      -74.1100850695703,
                      10.6543473339623
                    ],
                    [
                      -74.1100876551212,
                      10.6814691125096
                    ],
                    [
                      -74.0957370284411,
                      10.6814701233475
                    ]
                  ]
                ]
              ]
            }
          }
        ],
        "crs": {},
        "type": "FeatureCollection"
      },
      "hash": "26f8975c4c647c19a2edaa11f23880a2",
      "provider": {
        "filter": "cartodb_id=573",
        "user": "wri-01",
        "table": "gfw_mining",
        "type": "carto"
      },
      "areaHa": 471.001953054716,
      "bbox": [
        -74.1100876551212,
        10.6543473339623,
        -74.0957357154309,
        10.6814701233475
      ]
    }
  }
}
```


