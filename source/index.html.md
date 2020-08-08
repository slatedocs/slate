---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - JSON
  #- ruby
  #- python
  #- javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true
---

# Introduction

This documentation is the reference for JNJRnD Phase 1B **APIs and IO Structures**

The following are the modules

1. Cost Calculator
2. Save Simulation
3. Edit Monte-Carlo



# Cost Calculator
## NLP API Output changes

The following is the sample question for *cost calculator*

`How much would phase 2 diabetes cost?`

* The "type" will be "cost_calculator"

`"action": {`<br/>
`    "type": "cost_calculator"`<br/>
`}`<br/>

* New field "OUTSOURCING" added into "Chart Filter". And it is only for JRD dataset

`"OUTSOURCING": {`<br/>
`    "label": "OUTSOURCING",`<br/>
`    "selection": "dropdown-multi",`<br/>
`    "dataset": [`<br/>
`        "JRD"`<br/>
`    ],`<br/>
`    "visible": true`<br/>
`}`<br/>

### HTTP Request

`GET http://104.199.249.254:5064`

### Query Parameters

Parameter | Value | Description
--------- | ------- | -----------
query | how much would phase 2 diabetes cost | The question which has been asked by the user
user | jnjrd | The NLP domain
user_id | varsha@lymbyc.com | The user's email id of Lumi Application

> API Request

```shell
curl "http://104.199.249.254:5064/?\
query=how+long+would+a+phase+2+diabetes+study+take\
&user=jnjrd&user_id=varsha@lymbyc.com"
```


> API Response


```json
{
    "status_code": "200",
    "status_txt": "MQL Generation Success",
    "data": [
        {
            "subdomain": "jnj_research",
            "sub-domain description": "",
            "rank": 1,
            "mql": [
                {
                    "dimension": {
                        "diabetes": {
                            "DISEASE AREA (KMR)": {
                                "label": "DISEASE AREA (KMR)",
                                "order": "desc",
                                "narrow_down_candidate": "true",
                                "selection": "single",
                                "values": [
                                    "DIABETES MELLITUS"
                                ]
                            }
                        },
                        "phase 2": {
                            "TRIAL PHASE": {
                                "label": "TRIAL PHASE",
                                "order": "desc"
                            },
                            "TRIAL PHASE GROUP": {
                                "label": "TRIAL PHASE GROUP",
                                "order": "desc"
                            }
                        }
                    },
                    "filter": {
                        "and": {
                            "eq": {
                                "phase 2": [
                                    "II"
                                ],
                                "diabetes": [
                                    "DIABETES MELLITUS"
                                ]
                            }
                        }
                    },
                    "action": {
                        "type": "cost_calculator"
                    },
                    "query_type": "aggregation",
                    "db_type": "activity",
                    "type": "transaction",
                    "db_name": "jrd_activity_p1b_v1",
                    "weight": 0.7583333333333333,
                    "id": "leni_jnjrd_010c4a25bf4d4559ad0abf4d139145ee_0",
                    "Chart Filter": {
                        "TRIAL PHASE GROUP": {
                            "label": "TRIAL PHASE GROUP",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "JRD",
                                "CORTELLIS"
                            ],
                            "visible": true
                        },
                        "OUTSOURCING": {
                            "label": "OUTSOURCING",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "JRD"
                            ],
                            "visible": true
                        },
                        "PRODUCT NAME": {
                            "label": "PRODUCT NAME",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "JRD",
                                "CORTELLIS"
                            ],
                            "visible": true
                        },
                        "IDENTIFIERS": {
                            "label": "IDENTIFIERS",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "CORTELLIS"
                            ],
                            "visible": true
                        },
                        "PROTOCOL ID": {
                            "label": "PROTOCOL ID",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "JRD"
                            ],
                            "visible": true
                        },
                        "THERAPEUTIC AREA": {
                            "label": "THERAPEUTIC AREA",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "JRD"
                            ],
                            "visible": true
                        },
                        "DISEASE AREA (KMR)": {
                            "label": "DISEASE AREA (KMR)",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "JRD"
                            ],
                            "visible": true
                        },
                        "PRIMARY INDICATION (JRD)": {
                            "label": "PRIMARY INDICATION (JRD)",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "JRD"
                            ],
                            "visible": true
                        },
                        "TRIAL PHASE": {
                            "label": "TRIAL PHASE",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "JRD",
                                "CORTELLIS"
                            ],
                            "visible": true
                        },
                        "PRODUCT TYPE": {
                            "label": "PRODUCT TYPE",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "JRD",
                                "CORTELLIS"
                            ],
                            "visible": true
                        },
                        "NUMBER OF SUBJECTS": {
                            "label": "NUMBER OF SUBJECTS",
                            "dataset": [
                                "JRD",
                                "CORTELLIS"
                            ],
                            "visible": true
                        },
                        "NUMBER OF SITES": {
                            "label": "NUMBER OF SITES",
                            "dataset": [
                                "JRD"
                            ],
                            "visible": true
                        },
                        "NUMBER OF COUNTRIES": {
                            "label": "NUMBER OF COUNTRIES",
                            "dataset": [
                                "JRD"
                            ],
                            "visible": true
                        },
                        "FIRST PATIENT IN": {
                            "label": "FIRST PATIENT IN",
                            "dataset": [
                                "JRD",
                                "CORTELLIS"
                            ],
                            "visible": true
                        },
                        "LAST PATIENT OUT": {
                            "label": "LAST PATIENT OUT",
                            "dataset": [
                                "JRD",
                                "CORTELLIS"
                            ],
                            "visible": true
                        },
                        "PROTOCOL ISSUED": {
                            "label": "PROTOCOL ISSUED",
                            "dataset": [
                                "JRD"
                            ],
                            "visible": true
                        },
                        "STUDY STAGE": {
                            "label": "STUDY STAGE",
                            "default_value": [
                                "Conduct"
                            ],
                            "selection": "dropdown-single",
                            "dataset": [
                                "JRD",
                                "CORTELLIS"
                            ],
                            "visible": false
                        },
                        "PROJECT TYPE": {
                            "label": "PROJECT TYPE",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "JRD"
                            ],
                            "visible": true
                        },
                        "PROJECT NAME": {
                            "label": "PROJECT NAME",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "JRD"
                            ],
                            "visible": true
                        },
                        "STRATEGIC PRIORITY": {
                            "label": "STRATEGIC PRIORITY",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "JRD"
                            ],
                            "visible": true
                        },
                        "INDICATION (KMR)": {
                            "label": "INDICATION (KMR)",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "JRD"
                            ],
                            "visible": true
                        },
                        "SPONSOR ONLY": {
                            "label": "SPONSOR ONLY",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "CORTELLIS"
                            ],
                            "visible": true
                        },
                        "COLLABORATOR ONLY": {
                            "label": "COLLABORATOR ONLY",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "CORTELLIS"
                            ],
                            "visible": true
                        },
                        "DRUG PIPELINE TARGET-BASED ACTIONS": {
                            "label": "DRUG PIPELINE TARGET-BASED ACTIONS",
                            "selection": "dropdown-multi",
                            "visible": true,
                            "dataset": [
                                "CORTELLIS"
                            ]
                        },
                        "DRUG PIPELINE TECHNOLOGIES": {
                            "label": "DRUG PIPELINE TECHNOLOGIES",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "CORTELLIS"
                            ],
                            "visible": true
                        },
                        "ACTIVE CONTROLS": {
                            "label": "ACTIVE CONTROLS",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "CORTELLIS"
                            ],
                            "visible": true
                        },
                        "INDICATION": {
                            "label": "INDICATION",
                            "selection": "dropdown-multi",
                            "dataset": [
                                "CORTELLIS"
                            ],
                            "visible": true
                        }
                    }
                }
            ]
        }
    ]
}
```


<!--<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>-->

# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

