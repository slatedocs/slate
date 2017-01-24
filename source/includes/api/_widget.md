# Widget


## What is a Widget?
Is a graphic representation of a Dataset's data. The most of them are defined with [Vega grammar](#what-is-vega).

Widget contains the next fields:

| Field         | Description           | Type
| ------------- |:-------------:| -----:|
| userId        | Id of the owner                                           | Text
| Application   | Application to which the dataset belongs                  | Array
| slug          | Unique identifier of the widget                           | Text
| name          | Name of the widget                                        | Url
| description   | Description of the widget                                 | Array
| source        | Publisher of the original code                            | Text
| sourceUrl     | Link to publisher page                                    | Url
| layerId       | UuId of the relationship with layer                       | String
| dataset       | UuId of the dataset that the widget belongs               | Text
| authors       | Name of the authors                                       | Text
| queryUrl      | Url with the data of the chart shows                      | Text
| widgetConfig  | Vega configuration                                        | Object
| template      | If it's a template (base schema to create other widgets)  | Boolean
| default       | If it's a default widget for the dataset that it belongs  | Boolean
| status        | Status of the Widget                                      | Text
| published     | If it's available to use                                  | Text
| verified      | If it's verified by other user                            | Text



### What is Vega?

Vega is a visualization grammar, a declarative format for creating, saving and sharing interactive visualization designs. This wiki contains documentation and learning materials for getting up and running with Vega.
[More info](https://github.com/vega/vega/wiki)

## How obtain all widgets

To obtain all widgets:

```shell
curl -X GET http://api.resourcewatch.org/widget
```

<aside class="success">
Remember — the response is jsonapi format
</aside>

> Example response:

```json
{
   "data":[
      {
         "id":"8f67fadd-d8df-4a28-82dd-a22a337d71b9",
         "type":"widget",
         "attributes":{
            "userId":"5858f37140621f11066fb2f7",
            "application":[
               "aqueduct"
            ],
            "slug":"ercentage-of-country-s-population-is-at-high-risk-of-hunger",
            "name":"Percentage of country's population at high risk of hunger.",
            "description":"",
            "source":"",
            "sourceUrl":"",
            "layerId":null,
            "dataset":"f1d24950-c764-4f90-950a-4541f798eb95",
            "authors":"",
            "queryUrl":"query/f1d24950-c764-4f90-950a-4541f798eb95?sql=select * from crops",
            "widgetConfig":{
                ...
            },
            "template":false,
            "default":true,
            "status":"saved",
            "published":true,
            "verified":false
         }
      }
   ],
   "links":{
      "first":"http://api.resourcewatch.org/widget?page%5Bnumber%5D=1",
      "prev":"http://api.resourcewatch.org/widget?page%5Bnumber%5D=1",
      "next":"http://api.resourcewatch.org/widget?page%5Bnumber%5D=2&page%5Bsize%5D=10",
      "last":"http://api.resourcewatch.org/widget?page%5Bnumber%5D=64&page%5Bsize%5D=10",
      "self":"http://api.resourcewatch.org/widget?page%5Bnumber%5D=1&page%5Bsize%5D=10"
   }
}
```

### Filter params

The filters available are:

| Field         | Description           | Type
| ------------- |:-------------:| -----:|
| name          | Filter the widgets whose name contains the filter text    | Text
| dataset       | Filter the widgets by dataset uuid                        | Text
| sort          | Sort json response by specific attribute                  | Text
| status        | Filter widgets on status (pending, active, disabled, all) | Boolean
| published     | Filter widgets on published status (true, false)          | Boolean
| verified      | Filter by verified status (true,false)                    | Boolean
| template      | Filter by template status (true,false)                    | Boolean
| default       | Filter by default status (true,false)                     | Boolean
| app           | Filter widgets on application (prep, gfw, etc..)          | Array


> Return the widgets filtered whose name contains glad

```shell
curl -X GET http://api.resourcewatch.org/widget?name=glad
```

> Return the widgets filtered by dataset

```shell
curl -X GET http://api.resourcewatch.org/widget?dataset=d02df2f6-d80c-4274-bb6f-f062061655c4
curl -X GET http://api.resourcewatch.org/dataset/d02df2f6-d80c-4274-bb6f-f062061655c4/widget
```

> Sort by name

```shell
curl -X GET http://api.resourcewatch.org/widget?sort=name
```

> Filter widgets by status

```shell
curl -X GET http://api.resourcewatch.org/widget?status=failed
```

> Filter widgets by published status

```shell
curl -X GET http://api.resourcewatch.org/widget?published=false
```

> Filter widgets by verified status

```shell
curl -X GET http://api.resourcewatch.org/widget?verified=false
```

> Return the widgets filtered by template

```shell
curl -X GET http://api.resourcewatch.org/widget?template=true
```

> Filter widgets by default option

```shell
curl -X GET http://api.resourcewatch.org/widget?default=true
```

> Return the widgets filtered whose applications contain rw

```shell
curl -X GET http://api.resourcewatch.org/widget?app=rw
```

### Pagination params

| Field           | Description                | Type
| -------------   |:-------------:| -----:|
| page[size]      | Number elements per page   | Number
| page[number]    | Number of page             | Number

> Return the widgets of the page 2 with 5 elements per page

```shell
curl -X GET http://api.resourcewatch.org/widget?page[size]=5&page[number]=2
```

## How obtain a widget for specific dataset

To obtain the widget:

```shell
curl -X GET http://api.resourcewatch.org/dataset/d02df2f6-d80c-4274-bb6f-f062061655c4/widget/20ec7861-5251-40a7-9503-5ee3686a66a3
curl -X GET http://api.resourcewatch.org/widget/20ec7861-5251-40a7-9503-5ee3686a66a3
```

<aside class="success">
Remember — the response is jsonapi format
</aside>

> Example response:

```json
{
  "data": {
    "id": "20ec7861-5251-40a7-9503-5ee3686a66a3",
    "type": "widget",
    "attributes": {
      "userId": "57a0693b49c36b265ba3bec8",
      "application": [
        "rw"
      ],
      "slug": "estimated-c02-emission",
      "name": "Estimated C02 emission",
      "description": null,
      "source": "",
      "sourceUrl": null,
      "layerId": null,
      "dataset": "d02df2f6-d80c-4274-bb6f-f062061655c4",
      "authors": null,
      "queryUrl": "query/d02df2f6-d80c-4274-bb6f-f062061655c4?sql=select country, rank, iso3, total from estimated_co2_emission_filtered",
      "widgetConfig": {
        "data": [
          {
            "name": "table",
            "values": [],
            "transform": [
              {
                "by": "rank",
                "type": "sort"
              }
            ]
          },
          {
            "name": "current",
            "source": "table",
            "transform": [
              {
                "test": "datum.iso3 === 'CHN'",
                "type": "filter"
              },
              {
                "expr": "datum.rank",
                "type": "formula",
                "field": "current_rank"
              }
            ]
          },
          {
            "name": "max",
            "source": "table",
            "transform": [
              {
                "type": "aggregate",
                "summarize": {
                  "rank": [
                    "max"
                  ]
                }
              }
            ]
          },
          {
            "name": "head",
            "source": "table",
            "transform": [
              {
                "type": "cross",
                "with": "current"
              },
              {
                "test": "datum.b.current_rank <= 5 ? datum.a.rank <= 5 : datum.a.rank === 1",
                "type": "filter"
              },
              {
                "expr": "datum.a.rank === datum.b.current_rank ? '#5BB1D2' : '#9aa2a9'",
                "type": "formula",
                "field": "color"
              },
              {
                "expr": "datum.a.rank === datum.b.current_rank ? '500' : '300'",
                "type": "formula",
                "field": "weight"
              }
            ]
          },
          {
            "name": "head_count",
            "source": "head",
            "transform": [
              {
                "type": "aggregate",
                "summarize": {
                  "*": "count"
                }
              }
            ]
          },
          {
            "name": "center",
            "source": "table",
            "transform": [
              {
                "type": "cross",
                "with": "current"
              },
              {
                "type": "cross",
                "with": "max"
              },
              {
                "test": "datum.a.b.current_rank > 5 && datum.a.b.current_rank < datum.b.max_rank - 5 ? datum.a.a.rank >= datum.a.b.current_rank - 2 && datum.a.a.rank <= datum.a.b.current_rank + 2  : false",
                "type": "filter"
              },
              {
                "expr": "datum.a.a.rank === datum.a.b.current_rank ? '#5BB1D2' : '#9aa2a9'",
                "type": "formula",
                "field": "color"
              },
              {
                "expr": "datum.a.a.rank === datum.a.b.current_rank ? '500' : '300'",
                "type": "formula",
                "field": "weight"
              }
            ]
          },
          {
            "name": "center_count",
            "source": "center",
            "transform": [
              {
                "type": "aggregate",
                "summarize": {
                  "*": "count"
                }
              }
            ]
          },
          {
            "name": "tail",
            "source": "table",
            "transform": [
              {
                "type": "cross",
                "with": "current"
              },
              {
                "type": "cross",
                "with": "max"
              },
              {
                "test": "datum.a.b.current_rank >= datum.b.max_rank - 4 ? datum.a.a.rank >= datum.b.max_rank - 4 : datum.a.a.rank === datum.b.max_rank",
                "type": "filter"
              },
              {
                "expr": "datum.a.a.rank === datum.a.b.current_rank ? '#5BB1D2' : '#9aa2a9'",
                "type": "formula",
                "field": "color"
              },
              {
                "expr": "datum.a.b.current_rank <= 5 || datum.a.b.current_rank >= datum.b.max_rank - 4 ? datum.color : 'transparent'",
                "type": "formula",
                "field": "trick_color"
              },
              {
                "expr": "datum.a.b.current_rank <= 5 || datum.a.b.current_rank >= datum.b.max_rank - 4 ? '#9aa2a9' : 'transparent'",
                "type": "formula",
                "field": "rule_trick_color"
              },
              {
                "expr": "datum.a.a.rank === datum.a.b.current_rank ? '500' : '300'",
                "type": "formula",
                "field": "weight"
              }
            ]
          }
        ],
        "marks": [
          {
            "from": {
              "data": "head"
            },
            "type": "text",
            "properties": {
              "enter": {
                "x": {
                  "value": 20
                },
                "y": {
                  "field": "a.rank",
                  "scale": "vertical_head"
                },
                "fill": {
                  "field": "color"
                },
                "text": {
                  "template": "{{datum.a.rank}}"
                },
                "align": {
                  "value": "right"
                },
                "baseline": {
                  "value": "middle"
                },
                "fontSize": {
                  "value": 13
                },
                "fontWeight": {
                  "field": "weight"
                }
              }
            }
          },
          {
            "from": {
              "data": "head"
            },
            "type": "text",
            "properties": {
              "enter": {
                "x": {
                  "value": 30
                },
                "y": {
                  "field": "a.rank",
                  "scale": "vertical_head"
                },
                "fill": {
                  "field": "color"
                },
                "text": {
                  "template": "{{datum.a.country | truncate:10}}"
                },
                "align": {
                  "value": "left"
                },
                "baseline": {
                  "value": "middle"
                },
                "fontSize": {
                  "value": 13
                },
                "fontWeight": {
                  "field": "weight"
                }
              }
            }
          },
          {
            "from": {
              "data": "head"
            },
            "type": "rect",
            "properties": {
              "enter": {
                "x": {
                  "mult": 0.5,
                  "field": {
                    "group": "width"
                  }
                },
                "y": {
                  "field": "a.rank",
                  "scale": "vertical_head",
                  "offset": -6
                },
                "fill": {
                  "field": "color"
                },
                "width": {
                  "mult": 0.5,
                  "field": "a.total",
                  "scale": "bar"
                },
                "height": {
                  "value": 12
                }
              }
            }
          },
          {
            "from": {
              "data": "head_count"
            },
            "type": "group",
            "marks": [
              {
                "type": "rule",
                "properties": {
                  "enter": {
                    "x": {
                      "value": 0
                    },
                    "y": {
                      "value": 0,
                      "offset": -15
                    },
                    "x2": {
                      "field": {
                        "group": "width"
                      }
                    },
                    "stroke": {
                      "value": "#9aa2a9"
                    },
                    "strokeWidth": {
                      "value": 0.5
                    }
                  }
                }
              },
              {
                "from": {
                  "data": "center"
                },
                "type": "text",
                "properties": {
                  "enter": {
                    "x": {
                      "value": 20
                    },
                    "y": {
                      "scale": "vertical_center",
                      "fimeld": "a.a.rank"
                    },
                    "fill": {
                      "field": "color"
                    },
                    "text": {
                      "template": "{{datum.a.a.rank}}"
                    },
                    "align": {
                      "value": "right"
                    },
                    "baseline": {
                      "value": "middle"
                    },
                    "fontSize": {
                      "value": 13
                    },
                    "fontWeight": {
                      "field": "weight"
                    }
                  }
                }
              },
              {
                "from": {
                  "data": "center"
                },
                "type": "text",
                "properties": {
                  "enter": {
                    "x": {
                      "value": 30
                    },
                    "y": {
                      "field": "a.a.rank",
                      "scale": "vertical_center"
                    },
                    "fill": {
                      "field": "color"
                    },
                    "text": {
                      "template": "{{datum.a.a.country | truncate:20}}"
                    },
                    "align": {
                      "value": "left"
                    },
                    "baseline": {
                      "value": "middle"
                    },
                    "fontSize": {
                      "value": 13
                    },
                    "fontWeight": {
                      "field": "weight"
                    }
                  }
                }
              },
              {
                "from": {
                  "data": "center"
                },
                "type": "rect",
                "properties": {
                  "enter": {
                    "x": {
                      "mult": 0.5,
                      "field": {
                        "group": "width"
                      }
                    },
                    "y": {
                      "field": "a.a.rank",
                      "scale": "vertical_center",
                      "offset": -6
                    },
                    "fill": {
                      "field": "color"
                    },
                    "width": {
                      "mult": 0.5,
                      "field": "a.a.total",
                      "scale": "bar"
                    },
                    "height": {
                      "value": 12
                    }
                  }
                }
              },
              {
                "from": {
                  "data": "center_count"
                },
                "type": "group",
                "marks": [
                  {
                    "type": "rule",
                    "properties": {
                      "enter": {
                        "x": {
                          "value": 0
                        },
                        "y": {
                          "value": 0,
                          "offset": -15
                        },
                        "x2": {
                          "field": {
                            "group": "width"
                          }
                        },
                        "stroke": {
                          "value": "#9aa2a9"
                        },
                        "strokeWidth": {
                          "value": 0.5
                        }
                      }
                    }
                  },
                  {
                    "from": {
                      "data": "tail"
                    },
                    "type": "text",
                    "properties": {
                      "enter": {
                        "x": {
                          "value": 20
                        },
                        "y": {
                          "field": "a.a.rank",
                          "scale": "vertical_tail"
                        },
                        "fill": {
                          "field": "color"
                        },
                        "text": {
                          "template": "{{datum.a.a.rank}}"
                        },
                        "align": {
                          "value": "right"
                        },
                        "baseline": {
                          "value": "middle"
                        },
                        "fontSize": {
                          "value": 13
                        },
                        "fontWeight": {
                          "field": "weight"
                        }
                      }
                    }
                  },
                  {
                    "from": {
                      "data": "tail"
                    },
                    "type": "text",
                    "properties": {
                      "enter": {
                        "x": {
                          "value": 30
                        },
                        "y": {
                          "field": "a.a.rank",
                          "scale": "vertical_tail"
                        },
                        "fill": {
                          "field": "color"
                        },
                        "text": {
                          "template": "{{datum.a.a.country | truncate:20}}"
                        },
                        "align": {
                          "value": "left"
                        },
                        "baseline": {
                          "value": "middle"
                        },
                        "fontSize": {
                          "value": 13
                        },
                        "fontWeight": {
                          "field": "weight"
                        }
                      }
                    }
                  },
                  {
                    "from": {
                      "data": "tail"
                    },
                    "type": "rect",
                    "properties": {
                      "enter": {
                        "x": {
                          "mult": 0.5,
                          "field": {
                            "group": "width"
                          }
                        },
                        "y": {
                          "field": "a.a.rank",
                          "scale": "vertical_tail",
                          "offset": -6
                        },
                        "fill": {
                          "field": "color"
                        },
                        "width": {
                          "mult": 0.5,
                          "field": "a.a.total",
                          "scale": "bar"
                        },
                        "height": {
                          "value": 12
                        }
                      }
                    }
                  }
                ],
                "properties": {
                  "enter": {
                    "y": {
                      "mult": 20,
                      "field": "count",
                      "offset": 10
                    },
                    "width": {
                      "field": {
                        "group": "width"
                      }
                    }
                  }
                }
              }
            ],
            "properties": {
              "enter": {
                "x": {
                  "value": 0
                },
                "y": {
                  "mult": 20,
                  "field": "count",
                  "offset": 10
                },
                "width": {
                  "field": {
                    "group": "width"
                  }
                }
              }
            }
          },
          {
            "from": {
              "data": "head_count"
            },
            "type": "group",
            "marks": [
              {
                "from": {
                  "data": "tail"
                },
                "type": "rule",
                "properties": {
                  "enter": {
                    "x": {
                      "value": 0
                    },
                    "y": {
                      "value": 0,
                      "offset": -15
                    },
                    "x2": {
                      "field": {
                        "group": "width"
                      }
                    },
                    "stroke": {
                      "field": "rule_trick_color"
                    },
                    "strokeWidth": {
                      "value": 0.5
                    }
                  }
                }
              },
              {
                "from": {
                  "data": "tail"
                },
                "type": "text",
                "properties": {
                  "enter": {
                    "x": {
                      "value": 20
                    },
                    "y": {
                      "field": "a.a.rank",
                      "scale": "vertical_tail"
                    },
                    "fill": {
                      "field": "trick_color"
                    },
                    "text": {
                      "template": "{{datum.a.a.rank}}"
                    },
                    "align": {
                      "value": "right"
                    },
                    "baseline": {
                      "value": "middle"
                    },
                    "fontSize": {
                      "value": 13
                    },
                    "fontWeight": {
                      "field": "weight"
                    }
                  }
                }
              },
              {
                "from": {
                  "data": "tail"
                },
                "type": "text",
                "properties": {
                  "enter": {
                    "x": {
                      "value": 30
                    },
                    "y": {
                      "field": "a.a.rank",
                      "scale": "vertical_tail"
                    },
                    "fill": {
                      "field": "trick_color"
                    },
                    "text": {
                      "template": "{{datum.a.a.country | truncate:20}}"
                    },
                    "align": {
                      "value": "left"
                    },
                    "baseline": {
                      "value": "middle"
                    },
                    "fontSize": {
                      "value": 13
                    },
                    "fontWeight": {
                      "field": "weight"
                    }
                  }
                }
              },
              {
                "from": {
                  "data": "tail"
                },
                "type": "rect",
                "properties": {
                  "enter": {
                    "x": {
                      "mult": 0.5,
                      "field": {
                        "group": "width"
                      }
                    },
                    "y": {
                      "field": "a.a.rank",
                      "scale": "vertical_tail",
                      "offset": -6
                    },
                    "fill": {
                      "field": "trick_color"
                    },
                    "width": {
                      "mult": 0.5,
                      "field": "a.a.total",
                      "scale": "bar"
                    },
                    "height": {
                      "value": 12
                    }
                  }
                }
              }
            ],
            "properties": {
              "enter": {
                "y": {
                  "mult": 20,
                  "field": "count",
                  "offset": 10
                },
                "width": {
                  "field": {
                    "group": "width"
                  }
                }
              }
            }
          }
        ],
        "scales": [
          {
            "name": "vertical_head",
            "type": "ordinal",
            "range": [
              0,
              20,
              40,
              60,
              80
            ],
            "domain": {
              "data": "head",
              "sort": {
                "op": "min",
                "field": "a.rank"
              },
              "field": "a.rank"
            }
          },
          {
            "name": "vertical_center",
            "type": "ordinal",
            "range": [
              0,
              20,
              40,
              60,
              80
            ],
            "domain": {
              "data": "center",
              "sort": {
                "op": "min",
                "field": "a.a.rank"
              },
              "field": "a.a.rank"
            }
          },
          {
            "name": "vertical_tail",
            "type": "ordinal",
            "range": [
              0,
              20,
              40,
              60,
              80
            ],
            "domain": {
              "data": "tail",
              "sort": {
                "op": "min",
                "field": "a.a.rank"
              },
              "field": "a.a.rank"
            }
          },
          {
            "name": "bar",
            "type": "linear",
            "range": "width",
            "domain": {
              "data": "table",
              "field": "total"
            }
          }
        ],
        "padding": {
          "top": 40,
          "left": 20,
          "right": 20,
          "bottom": 0
        }
      },
      "template": false,
      "default": false,
      "status": "saved",
      "published": true,
      "verified": false
    }
  },
  "meta": {
    "status": "saved",
    "published": true,
    "verified": false,
    "updated_at": "2017-01-17T17:50:45.655Z",
    "created_at": "2016-06-06T15:12:38.749Z"
  }
}
```

## Create a Widget

To create a widget, you need to define all of the required fields in the request body. The fields that compose a widget are:

| Field             | Description                               | Type    | Values                                          | Required |
| ------------------|:-----------------------------------------:| -------:| ---------------------------------------:        |  -------:|
| name              | Name of the widget                        | Text    | Any Text                                        | Yes
| slug              | Slug of the widget                        | Text    | Text without special characters(aaa-bbb)        | No
| description       | Description of the dataset                | Text    | Any text                                        | No
| source            | Publisher of the original code            | Text    | Any text                                        | No
| sourceUrl         | Link to publisher page                    | Text    | Any url                                         | No
| application       | Application to which the widget belongs   | Array   | gfw, forest-atlas, rw, prep, aqueduct, data4sdg | Yes
| authors           | Name of the authors                       | Text    | Any text                                        | No
| queryUrl          | Url with the data of the chart shows      | Text    | Any valid query                                 | No
| widgetConfig      | Vega configuration                        | Object  | Valid object                                    | No
| status            | Status of the Widget                      | Boolean | true - false                                    | No
| published         | If it's available to use                  | Boolean | true - false                                    | No
| verified          | If it's verified by other user            | Boolean | true - false                                    | No
| template          | If it's a template                        | Boolean | true - false                                    | No
| default           | If it's default for dataset               | Boolean | true - false                                    | No
| layerId           | UuId of the relationship with layer       | Text    | Uuid of layer                                   | No
| dataset           | UuId of the dataset                       | Text    | Uuid of Dataset                                 | No


> To create a widget, you have to do a POST with the following body:

```shell
curl -X POST http://api.resourcewatch.org/dataset/<dataset_id>/widget \
-H "Authorization: Bearer <your-token>" \
-H "Content-Type: application/json"  -d \
 '{
   "widget": {
      "application":[
         "your", "apps"
      ],
      "name":"Example Carto Dataset"
   }
}'
```

## Update a Widget

To update a widget, you need to define all of the required fields in the request body. The fields that compose a widget are:

| Field             | Description                               | Type    | Values                                          | Required |
| ------------------|:-----------------------------------------:| -------:| ---------------------------------------:        |  -------:|
| name              | Name of the widget                        | Text    | Any Text                                        | Yes
| slug              | Slug of the widget                        | Text    | Text without special characters(aaa-bbb)        | No
| description       | Description of the dataset                | Text    | Any text                                        | No
| source            | Publisher of the original code            | Text    | Any text                                        | No
| sourceUrl         | Link to publisher page                    | Text    | Any url                                         | No
| application       | Application to which the widget belongs   | Array   | gfw, forest-atlas, rw, prep, aqueduct, data4sdg | Yes
| authors           | Name of the authors                       | Text    | Any text                                        | No
| queryUrl          | Url with the data of the chart shows      | Text    | Any valid query                                 | No
| widgetConfig      | Vega configuration                        | Object  | Valid object                                    | No
| status            | Status of the Widget                      | Boolean | true - false                                    | No
| published         | If it's available to use                  | Boolean | true - false                                    | No
| verified          | If it's verified by other user            | Boolean | true - false                                    | No
| template          | If it's a template                        | Boolean | true - false                                    | No
| default           | If it's default for dataset               | Boolean | true - false                                    | No
| layerId           | UuId of the relationship with layer       | Text    | Uuid of layer                                   | No
| dataset           | UuId of the dataset                       | Text    | Uuid of Dataset                                 | No


> To create a widget, you have to do a POST with the following body:

```shell
curl -X PATCH http://api.resourcewatch.org/dataset/<dataset_id>/widget/<widget_id> \
-H "Authorization: Bearer <your-token>" \
-H "Content-Type: application/json"  -d \
 '{
   "widget": {
      "application":[
         "your", "apps"
      ],
      "name":"Example Carto Dataset"
   }
}'
```

## Delete a Widget

```shell
curl -X DELETE http://api.resourcewatch.org/dataset/<dataset_id>/widget/<widget_id> \
-H "Authorization: Bearer <your-token>" \
-H "Content-Type: application/json"
```
