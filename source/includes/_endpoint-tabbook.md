### Tab books

`/datasets/{dataset_id}/multitables/{multitable_id}/tabbook/`

The default `tabbook` view of a multitable will generate an excel (.xlsx) workbook
containing each variable in the dataset crosstabbed with a given multitable.

#### POST

A successful POST request to `/datasets/{dataset_id}/multitables/{multitable_id}/tabbook/` will generate a download
location to which the exporter will write this file when it is done computing
(it may take some time for large datasets). The server will return a 202 response indicating that the export job started with
a Location header indicating where the final exported file will be available. The response's body will contain the URL for the progress URL where to query
the state of the export job. Clients should note the download URL,
monitor progress, and when complete, GET the download location. See [Progress](#progress) for details.

Requesting the same job, if still in progress, will return the same 202 response
indicating the original progress to check. If the export is finished, the server
will 302 redirect to the destination for download.

If there have been changes on the dataset attributes, a new tab book will be
generated regardless of the status of any other pending exports.

```http
POST /api/datasets/a598c7/multitables/7ab1e/tabbook/ HTTP/1.1
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

Alternatively, you can request a JSON output for your tab book by adding an Accept request header.

```http
POST /api/datasets/a598c7/multitables/7ab1e/tabbook/ HTTP/1.1
Accept: application/json
```

```json
{
    "meta": {
        "dataset": {
            "name": "weighted_simple_alltypes",
            "notes": ""
        },
        "layout": "many_sheets",
        "sheets": [
            {
                "display_settings": {
                    "countsOrPercents": {
                        "value": "percent"
                    },
                    "currentTab": {
                        "value": 0
                    },
                    "decimalPlaces": {
                        "value": 0
                    },
                    "percentageDirection": {
                        "value": "colPct"
                    },
                    "showEmpty": {
                        "value": false
                    },
                    "slicesOrGroups": {
                        "value": "groups"
                    },
                    "valuesAreMeans": {
                        "value": false
                    },
                    "vizType": {
                        "value": "table"
                    }
                },
                "filters": null,
                "name": "x",
                "weight": "z"
            },
            ... (one entry for each sheet)  
        ],
        "template": [
            {
                "query": [
                    {
                        "args": [
                            {
                                "variable": "000002"
                            }
                        ],
                        "function": "bin"
                    }
                ]
            },
            {
                "query": [
                    {
                        "args": [
                            {
                                "variable": "00000a"
                            },
                            {
                                "value": null
                            }
                        ],
                        "function": "rollup"
                    }
                ]
            }
        ]
    },
    "sheets": [
        {
            "result": [
                {
                    "result": {
                        "counts": [
                            1,
                            1,
                            1,
                            1,
                            1,
                            1,
                            0
                        ],
                        "dimensions": [
                            {
                                "derived": false,
                                "references": {
                                    "alias": "x",
                                    "description": "Numeric variable with value labels",
                                    "name": "x"
                                },
                                "type": {
                                    "categories": [
                                        {
                                            "id": 1,
                                            "missing": false,
                                            "name": "red",
                                            "numeric_value": 1
                                        },
                                        {
                                            "id": 2,
                                            "missing": false,
                                            "name": "green",
                                            "numeric_value": 2
                                        },
                                        {
                                            "id": 3,
                                            "missing": false,
                                            "name": "blue",
                                            "numeric_value": 3
                                        },
                                        {
                                            "id": 4,
                                            "missing": false,
                                            "name": "4",
                                            "numeric_value": 4
                                        },
                                        {
                                            "id": 8,
                                            "missing": true,
                                            "name": "8",
                                            "numeric_value": 8
                                        },
                                        {
                                            "id": 9,
                                            "missing": false,
                                            "name": "9",
                                            "numeric_value": 9
                                        },
                                        {
                                            "id": -1,
                                            "missing": true,
                                            "name": "No Data",
                                            "numeric_value": null
                                        }
                                    ],
                                    "class": "categorical",
                                    "ordinal": false
                                }
                            }
                        ],
                        "measures": {
                            "count": {
                                "data": [
                                    0.0,
                                    0.0,
                                    1.234,
                                    0.0,
                                    3.14159,
                                    0.0,
                                    0.0
                                ],
                                "metadata": {
                                    "derived": true,
                                    "references": {},
                                    "type": {
                                        "class": "numeric",
                                        "integer": false,
                                        "missing_reasons": {
                                            "No Data": -1
                                        },
                                        "missing_rules": {}
                                    }
                                },
                                "n_missing": 5
                            }
                        },
                        "n": 6
                    }
                },
                {
                    "result": {
                        "counts": [
                            1,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1,
                            1,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0
                        ],
                        "dimensions": [
                            {
                                "derived": false,
                                "references": {
                                    "alias": "x",
                                    "description": "Numeric variable with value labels",
                                    "name": "x"
                                },
                                "type": {
                                    "categories": [
                                        {
                                            "id": 1,
                                            "missing": false,
                                            "name": "red",
                                            "numeric_value": 1
                                        },
                                        {
                                            "id": 2,
                                            "missing": false,
                                            "name": "green",
                                            "numeric_value": 2
                                        },
                                        {
                                            "id": 3,
                                            "missing": false,
                                            "name": "blue",
                                            "numeric_value": 3
                                        },
                                        {
                                            "id": 4,
                                            "missing": false,
                                            "name": "4",
                                            "numeric_value": 4
                                        },
                                        {
                                            "id": 8,
                                            "missing": true,
                                            "name": "8",
                                            "numeric_value": 8
                                        },
                                        {
                                            "id": 9,
                                            "missing": false,
                                            "name": "9",
                                            "numeric_value": 9
                                        },
                                        {
                                            "id": -1,
                                            "missing": true,
                                            "name": "No Data",
                                            "numeric_value": null
                                        }
                                    ],
                                    "class": "categorical",
                                    "ordinal": false
                                }
                            },
                            {
                                "derived": true,
                                "references": {
                                    "alias": "z",
                                    "description": "Numberic variable with missing value range",
                                    "name": "z"
                                },
                                "type": {
                                    "class": "enum",
                                    "elements": [
                                        {
                                            "id": -1,
                                            "missing": true,
                                            "value": {
                                                "?": -1
                                            }
                                        },
                                        {
                                            "id": 1,
                                            "missing": false,
                                            "value": [
                                                1.0,
                                                1.5
                                            ]
                                        },
                                        {
                                            "id": 2,
                                            "missing": false,
                                            "value": [
                                                1.5,
                                                2.0
                                            ]
                                        },
                                        {
                                            "id": 3,
                                            "missing": false,
                                            "value": [
                                                2.0,
                                                2.5
                                            ]
                                        },
                                        {
                                            "id": 4,
                                            "missing": false,
                                            "value": [
                                                2.5,
                                                3.0
                                            ]
                                        },
                                        {
                                            "id": 5,
                                            "missing": false,
                                            "value": [
                                                3.0,
                                                3.5
                                            ]
                                        }
                                    ],
                                    "subtype": {
                                        "class": "numeric",
                                        "missing_reasons": {
                                            "No Data": -1
                                        },
                                        "missing_rules": {}
                                    }
                                }
                            }
                        ],
                        "measures": {
                            "count": {
                                "data": [
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    1.234,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    3.14159,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0
                                ],
                                "metadata": {
                                    "derived": true,
                                    "references": {},
                                    "type": {
                                        "class": "numeric",
                                        "integer": false,
                                        "missing_reasons": {
                                            "No Data": -1
                                        },
                                        "missing_rules": {}
                                    }
                                },
                                "n_missing": 5
                            }
                        },
                        "n": 6
                    }
                },
                {
                    "result": {
                        "counts": [
                            1,
                            0,
                            0,
                            1,
                            0,
                            0,
                            0,
                            1,
                            0,
                            0,
                            1,
                            0,
                            0,
                            0,
                            1,
                            0,
                            0,
                            1,
                            0,
                            0,
                            0
                        ],
                        "dimensions": [
                            {
                                "derived": false,
                                "references": {
                                    "alias": "x",
                                    "description": "Numeric variable with value labels",
                                    "name": "x"
                                },
                                "type": {
                                    "categories": [
                                        {
                                            "id": 1,
                                            "missing": false,
                                            "name": "red",
                                            "numeric_value": 1
                                        },
                                        {
                                            "id": 2,
                                            "missing": false,
                                            "name": "green",
                                            "numeric_value": 2
                                        },
                                        {
                                            "id": 3,
                                            "missing": false,
                                            "name": "blue",
                                            "numeric_value": 3
                                        },
                                        {
                                            "id": 4,
                                            "missing": false,
                                            "name": "4",
                                            "numeric_value": 4
                                        },
                                        {
                                            "id": 8,
                                            "missing": true,
                                            "name": "8",
                                            "numeric_value": 8
                                        },
                                        {
                                            "id": 9,
                                            "missing": false,
                                            "name": "9",
                                            "numeric_value": 9
                                        },
                                        {
                                            "id": -1,
                                            "missing": true,
                                            "name": "No Data",
                                            "numeric_value": null
                                        }
                                    ],
                                    "class": "categorical",
                                    "ordinal": false
                                }
                            },
                            {
                                "derived": true,
                                "references": {
                                    "alias": "date",
                                    "description": null,
                                    "name": "date"
                                },
                                "type": {
                                    "class": "enum",
                                    "elements": [
                                        {
                                            "id": 0,
                                            "missing": false,
                                            "value": "2014-11"
                                        },
                                        {
                                            "id": 1,
                                            "missing": false,
                                            "value": "2014-12"
                                        },
                                        {
                                            "id": 2,
                                            "missing": false,
                                            "value": "2015-01"
                                        }
                                    ],
                                    "subtype": {
                                        "class": "datetime",
                                        "missing_reasons": {
                                            "No Data": -1
                                        },
                                        "missing_rules": {},
                                        "resolution": "M"
                                    }
                                }
                            }
                        ],
                        "measures": {
                            "count": {
                                "data": [
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    1.234,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    3.14159,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0
                                ],
                                "metadata": {
                                    "derived": true,
                                    "references": {},
                                    "type": {
                                        "class": "numeric",
                                        "integer": false,
                                        "missing_reasons": {
                                            "No Data": -1
                                        },
                                        "missing_rules": {}
                                    }
                                },
                                "n_missing": 5
                            }
                        },
                        "n": 6
                    }
                }
            ]
        },
        ... (one entry for each sheet)
    ]
}
```

#### POST body parameters

At the top level, the tab book endpoint can take filtering and variable limiting parameters.

Name | Type | Default | Description | Example
------ | ---- | ------- | ----------- | -------------
filter | object | null | Filter by Crunch Expression.  Variables used in the filter should be fully-expressed urls. | [{"filter":"https://app.crunch.io/api/datasets/45fc0d5ca0a945dab7d05444efa3310a/filters/5f14133582f34b8b85b408830f4b4a9b/"}]
where  | object | null | Crunch Expression signifying which variables to use |{<br>"function": "select",<br>"args": [<br>{<br>"map": {<br>"https://app.crunch.io/api/datasets/45fc0d5ca0a945dab7d05444efa3310a/variables/000004/": {<br>"variable": "https://app.crunch.io/api/datasets/45fc0d5ca0a945dab7d05444efa3310a/variables/000004/"<br>},<br>"https://app.crunch.io/api/datasets/45fc0d5ca0a945dab7d05444efa3310a/variables/000003/": {<br>"variable": "https://app.crunch.io/api/datasets/45fc0d5ca0a945dab7d05444efa3310a/variables/000003/"<br>}<br>}<br>}<br>]<br>}
options| object | {}| further options defining the tabbook output.
weight | url | null| Provide a weight for the tabbook generation, if the weight is omitted from the request, the currently selected weight is used. If "null" is provided, then the tabbook generation will be unweighted. | "http://app.crunch.io/api/datasets/45fc0d5ca0a945dab7d05444efa3310a/variables/5f14133582f34b8b85b408830f4b4a9b/"



##### Options
Options for generating tab books

Name | Type | Default | Description | Example
------ | ---- | ------- | ----------- | -------------
display_settings | object | {} | a set of settings to define how the output should be displayed | See Below.
layout | string | many_sheets | "many_sheets" indicates each variable should have its own Sheet in the  xls spreadsheet.  "single_sheet" indicates all output should be in the same sheet.| single_sheet


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
