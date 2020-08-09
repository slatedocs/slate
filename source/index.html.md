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



## Leni-ms: Askleni API IO Changes

### HTTP Request
`http://localhost:3000/rest/v3/askleni`


* A new field `question_type` added inside `data`

`"question_type": "cost_calculator"`


* A new filter added inside `intermediate_filters`


`{`<br/>
`   "values": [`<br/>
`        {`<br/>
`            "METRIC TYPE": "Total Cost per patient",`<br/>
`            "label": "Total Cost per patient",`<br/>
`            "value": "Total Cost per patient",`<br/>
`            "selected": true,`<br/>
`            "key": "metric_0"`<br/>
`        },`<br/>
`        {`<br/>
`            "METRIC TYPE": "FTE Cost per patient",`<br/>
`            "label": "FTE Cost per patient",`<br/>
`            "value": "FTE Cost per patient",`<br/>
`            "selected": false,`<br/>
`            "key": "metric_1"`<br/>
`        },`<br/>
`        {`<br/>
`            "METRIC TYPE": "OOP Cost per patient",`<br/>
`            "label": "OOP Cost per patient",`<br/>
`            "value": "OOP Cost per patient",`<br/>
`            "selected": false,`<br/>
`            "key": "metric_2"`<br/>
`        }`<br/>
`    ],`<br/>
`    "label": "Metric Type"`<br/>
`}`<br/>

* A new field `metric_type_boxplot_data` added inside `data`

* `additional_params` values are changed

`"additional_params": {`<br/>
&emsp;&emsp;`    "patient_count": {`<br/>
&emsp;&emsp;&emsp;`        "label": "No. Of patients for simulation",`<br/>
&emsp;&emsp;&emsp;`        "type": "number",`<br/>
&emsp;&emsp;&emsp;`        "value": 11`<br/>
&emsp;`    },`<br/>
&emsp;&emsp;`    "proposed_budget": {`<br/>
&emsp;&emsp;&emsp;`        "label": "Proposed Bugdet(USD Thousands)",`<br/>
&emsp;&emsp;&emsp;`        "type": "number",`<br/>
&emsp;&emsp;&emsp;`        "value": 0`<br/>
&emsp;`    }`<br/>
`}`<br/>

* Cart section will have only JRD filters and table. There will not be INDUSTRY filters in cost calculator

> API Request

```shell
curl "http://localhost:3000/rest/v3/askleni\
?question=How%20much%20would%20a%20phase%202%20diabetes\
%20cost&user=varsha@lymbyc.com&from=web&cache=true"
```


> API Response

```json
{
    "output": [
        {
            "inferences": [
                {
                    "ignore": false,
                    "id": "leni_jnjrd_0172b5cb597349b891d84aa05b83055c_0",
                    "context_tokens": [
                        {
                            "variables": [
                                {
                                    "key": "TRIAL PHASE GROUP",
                                    "selected": true
                                },
                                {
                                    "key": "TRIAL PHASE"
                                }
                            ],
                            "ignore": false,
                            "token": "phase 2"
                        },
                        {
                            "variables": [
                                {
                                    "selection": false,
                                    "key": "INDICATION (KMR)",
                                    "selected": true,
                                    "filter_options": [
                                        {
                                            "label": "RESPIRATORY SYNCYTIAL VIRUS",
                                            "selected": true
                                        },
                                        {
                                            "label": "RESPIRATORY SYNCYTIAL VIRUS VACCINE"
                                        }
                                    ]
                                },
                                {
                                    "selection": false,
                                    "key": "DISEASE AREA (KMR)",
                                    "filter_options": [
                                        {
                                            "label": "RESPIRATORY INFECTIONS",
                                            "selected": true
                                        },
                                        {
                                            "label": "ACUTE RESPIRATORY DISORDERS"
                                        },
                                        {
                                            "label": "OTHER RESPIRATORY DISORDERS"
                                        }
                                    ]
                                }
                            ],
                            "ignore": false,
                            "token": "respiratory"
                        }
                    ],
                    "dataset": "JNJ RND",
                    "last_modified": "2020-06-09 17:11:53"
                }
            ],
            "subdomain": "jnj_research",
            "sub-domain description": ""
        }
    ],
    "status_code": "200",
    "data": [
        {
            "reason": "output generation success",
            "comments": [],
            "inference": {
                "ignore": false,
                "id": "leni_jnjrd_0172b5cb597349b891d84aa05b83055c_0",
                "context_tokens": [
                    {
                        "variables": [
                            {
                                "key": "TRIAL PHASE GROUP",
                                "selected": true
                            }
                        ],
                        "ignore": false,
                        "token": "phase 2"
                    },
                    {
                        "variables": [
                            {
                                "selection": false,
                                "key": "INDICATION (KMR)",
                                "selected": true,
                                "filter_options": [
                                    {
                                        "label": "RESPIRATORY SYNCYTIAL VIRUS",
                                        "selected": true
                                    },
                                    {
                                        "label": "RESPIRATORY SYNCYTIAL VIRUS VACCINE"
                                    }
                                ]
                            }
                        ],
                        "ignore": false,
                        "token": "respiratory"
                    }
                ],
                "dataset": "JNJ RND",
                "last_modified": "2020-06-09 17:11:53"
            },
            "question": "How much would phase 2 diabetes cost",
            "cached_output": true,
            "question_type": "cost_calculator",
            "intermediate_filters": [
                {
                    "values": [
                        {
                            "label": "Disease Area",
                            "value": "Disease Area",
                            "key": "level_0",
                            "selected": true
                        },
                        {
                            "label": "Indication",
                            "value": "Indication",
                            "key": "level_1",
                            "selected": false
                        }
                    ],
                    "label": "Level"
                },
                {
                    "values": [
                        {
                            "indications": [
                                {
                                    "parent_key": "disease_0",
                                    "label": "HIV/AIDS",
                                    "value": "HIV/AIDS",
                                    "key": "indication_0",
                                    "selected": true
                                }
                            ],
                            "parent_key": "level_0",
                            "label": "VIRAL",
                            "value": "VIRAL",
                            "selected": true,
                            "key": "disease_0"
                        }
                    ],
                    "label": "Disease Area"
                },
                {
                    "values": [
                        {
                            "METRIC TYPE": "Total Cost per patient",
                            "label": "Total Cost per patient",
                            "value": "Total Cost per patient",
                            "selected": true,
                            "key": "metric_0"
                        },
                        {
                            "METRIC TYPE": "FTE Cost per patient",
                            "label": "FTE Cost per patient",
                            "value": "FTE Cost per patient",
                            "selected": false,
                            "key": "metric_1"
                        },
                        {
                            "METRIC TYPE": "OOP Cost per patient",
                            "label": "OOP Cost per patient",
                            "value": "OOP Cost per patient",
                            "selected": false,
                            "key": "metric_2"
                        }
                    ],
                    "label": "Metric Type"
                }
            ],
            "applied_variables": [],
            "applied_filters": [
                {
                    "field": "LEVEL",
                    "applied": [
                        "DA"
                    ],
                    "label": "Level"
                },
                {
                    "field": "TRIAL PHASE GROUP",
                    "applied": [
                        "II"
                    ],
                    "label": "Trial Phase Group"
                }
            ],
            "chart_filters": [
                {
                    "dataset_name": "jrd",
                    "fields": [
                        {
                            "display_label": "DISEASE AREA (KMR)",
                            "visible": true,
                            "applied": [
                                "RESPIRATORY INFECTIONS"
                            ],
                            "values": [
                                {
                                    "DISEASE AREA (KMR)": "ADVANCED CANCER"
                                },
                                {
                                    "DISEASE AREA (KMR)": "ANXIETY/STRESS DISORDERS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "ARTERY DISEASE CORONARY"
                                },
                                {
                                    "DISEASE AREA (KMR)": "ARTERY DISEASE PERIPHERAL"
                                },
                                {
                                    "DISEASE AREA (KMR)": "ARTHRITIS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "BACTERIAL"
                                },
                                {
                                    "DISEASE AREA (KMR)": "BONE/TISSUE CANCER"
                                },
                                {
                                    "DISEASE AREA (KMR)": "BREAST CANCER"
                                },
                                {
                                    "DISEASE AREA (KMR)": "CANCER RELATED DISORDERS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "CHORIORETINAL DISEASES"
                                },
                                {
                                    "DISEASE AREA (KMR)": "DEMENTIA"
                                },
                                {
                                    "DISEASE AREA (KMR)": "DEVELOPMENTAL DISORDERS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "DIABETES MELLITUS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "GYNECOLOGIC CANCER"
                                },
                                {
                                    "DISEASE AREA (KMR)": "HEART ARRHYTHMIAS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "HEART FAILURE"
                                },
                                {
                                    "DISEASE AREA (KMR)": "HEMATOLOGIC CANCER"
                                },
                                {
                                    "DISEASE AREA (KMR)": "HEPATITIS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "HYPERTENSION"
                                },
                                {
                                    "DISEASE AREA (KMR)": "INFLAMMATORY (NON ARTHRITIS)"
                                },
                                {
                                    "DISEASE AREA (KMR)": "INFLAMMATORY BOWEL DISEASE"
                                },
                                {
                                    "DISEASE AREA (KMR)": "INFLAMMATORY/IMMUNE SKIN DISORDERS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "LIVER DISEASE"
                                },
                                {
                                    "DISEASE AREA (KMR)": "LUNG CANCER"
                                },
                                {
                                    "DISEASE AREA (KMR)": "MALE REPRODUCTIVE CANCER"
                                },
                                {
                                    "DISEASE AREA (KMR)": "MOOD DISORDERS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "NERVE DAMAGE DISORDERS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "OBSTRUCTIVE LUNG DISEASE"
                                },
                                {
                                    "DISEASE AREA (KMR)": "POST-OPERATIVE PAIN"
                                },
                                {
                                    "DISEASE AREA (KMR)": "PREVENTATIVE VACCINE"
                                },
                                {
                                    "DISEASE AREA (KMR)": "PSYCHOTIC DISORDERS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "RENAL DISORDERS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "RESPIRATORY INFECTIONS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "SLEEP DISORDERS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "STROKE"
                                },
                                {
                                    "DISEASE AREA (KMR)": "THROMBOSIS"
                                },
                                {
                                    "DISEASE AREA (KMR)": "URINARY CANCER"
                                },
                                {
                                    "DISEASE AREA (KMR)": "VIRAL"
                                }
                            ],
                            "data_type": "string",
                            "label": "DISEASE AREA (KMR)",
                            "type": "dropdown-multi",
                            "data_key": "DISEASE AREA (KMR)",
                            "searchable": false
                        },
                        {
                            "display_label": "INDICATION (KMR)",
                            "visible": true,
                            "values": [
                                {
                                    "INDICATION (KMR)": "ACUTE MYOCARDIAL INFARCTION"
                                },
                                {
                                    "INDICATION (KMR)": "ADVANCED CANCER"
                                },
                                {
                                    "INDICATION (KMR)": "ALZHEIMERS"
                                },
                                {
                                    "INDICATION (KMR)": "AMYLOIDOSIS"
                                },
                                {
                                    "INDICATION (KMR)": "ATRIAL FIBRILLATION"
                                },
                                {
                                    "INDICATION (KMR)": "AXIAL SPONDYLOARTHRITIS"
                                },
                                {
                                    "INDICATION (KMR)": "BLADDER CANCER"
                                },
                                {
                                    "INDICATION (KMR)": "BUNIONECTOMY PAIN"
                                },
                                {
                                    "INDICATION (KMR)": "CHRONIC OBSTRUCTIVE PULMONARY DISEASE"
                                },
                                {
                                    "INDICATION (KMR)": "CONGESTIVE HEART FAILURE"
                                },
                                {
                                    "INDICATION (KMR)": "CROHNS DISEASE"
                                },
                                {
                                    "INDICATION (KMR)": "DEPRESSION"
                                },
                                {
                                    "INDICATION (KMR)": "DERMATITIS"
                                },
                                {
                                    "INDICATION (KMR)": "DIABETES - TYPE II"
                                },
                                {
                                    "INDICATION (KMR)": "EBOLA VACCINE"
                                },
                                {
                                    "INDICATION (KMR)": "ESSENTIAL HYPERTENSION"
                                },
                                {
                                    "INDICATION (KMR)": "HEPATITIS B"
                                },
                                {
                                    "INDICATION (KMR)": "HEPATITIS C"
                                },
                                {
                                    "INDICATION (KMR)": "HIDRADENITIS SUPPURATIVA"
                                },
                                {
                                    "INDICATION (KMR)": "HIV VACCINE"
                                },
                                {
                                    "INDICATION (KMR)": "HIV/AIDS"
                                },
                                {
                                    "INDICATION (KMR)": "INFLUENZA"
                                },
                                {
                                    "INDICATION (KMR)": "INSOMNIA"
                                },
                                {
                                    "INDICATION (KMR)": "ISCHEMIC STROKE"
                                },
                                {
                                    "INDICATION (KMR)": "JUVENILE IDIOPATHIC ARTHRITIS"
                                },
                                {
                                    "INDICATION (KMR)": "LEUKEMIA"
                                },
                                {
                                    "INDICATION (KMR)": "LUPUS"
                                },
                                {
                                    "INDICATION (KMR)": "MULTIPLE MYELOMA"
                                },
                                {
                                    "INDICATION (KMR)": "MULTIPLE SCLEROSIS"
                                },
                                {
                                    "INDICATION (KMR)": "MYELODYSPLASTIC SYNDROMES"
                                },
                                {
                                    "INDICATION (KMR)": "MYELOPROLIFERATIVE NEOPLASM"
                                },
                                {
                                    "INDICATION (KMR)": "NEPHROSIS"
                                },
                                {
                                    "INDICATION (KMR)": "NON SMALL CELL LUNG CANCER"
                                },
                                {
                                    "INDICATION (KMR)": "NON-ALCOHOLIC STEATOHEPATITIS"
                                },
                                {
                                    "INDICATION (KMR)": "OVARIAN CANCER"
                                },
                                {
                                    "INDICATION (KMR)": "PROSTATE CANCER"
                                },
                                {
                                    "INDICATION (KMR)": "PSORIASIS"
                                },
                                {
                                    "INDICATION (KMR)": "PSORIATIC ARTHRITIS"
                                },
                                {
                                    "INDICATION (KMR)": "PULMONARY HYPERTENSION"
                                },
                                {
                                    "INDICATION (KMR)": "RESPIRATORY SYNCYTIAL VIRUS"
                                },
                                {
                                    "INDICATION (KMR)": "RETINOPATHY"
                                },
                                {
                                    "INDICATION (KMR)": "RHEUMATOID ARTHRITIS"
                                },
                                {
                                    "INDICATION (KMR)": "SCHIZOPHRENIA"
                                },
                                {
                                    "INDICATION (KMR)": "ULCERATIVE COLITIS"
                                }
                            ],
                            "data_type": "string",
                            "label": "INDICATION (KMR)",
                            "type": "dropdown-multi",
                            "data_key": "INDICATION (KMR)",
                            "searchable": false
                        },
                        {
                            "display_label": "THERAPEUTIC AREA",
                            "visible": true,
                            "values": [
                                {
                                    "THERAPEUTIC AREA": "Cardiovascular and Metabolism"
                                },
                                {
                                    "THERAPEUTIC AREA": "Immunology"
                                },
                                {
                                    "THERAPEUTIC AREA": "Infectious Diseases and Vaccines"
                                },
                                {
                                    "THERAPEUTIC AREA": "Neuroscience"
                                },
                                {
                                    "THERAPEUTIC AREA": "Oncology"
                                },
                                {
                                    "THERAPEUTIC AREA": "Other"
                                },
                                {
                                    "THERAPEUTIC AREA": "Pulmonary Hypertension"
                                }
                            ],
                            "data_type": "string",
                            "label": "THERAPEUTIC AREA",
                            "type": "dropdown-multi",
                            "data_key": "THERAPEUTIC AREA",
                            "searchable": false
                        },
                        {
                            "display_label": "PRIMARY INDICATION (JRD)",
                            "visible": true,
                            "values": [],
                            "data_type": "string",
                            "label": "PRIMARY INDICATION (JRD)",
                            "type": "dropdown-multi",
                            "data_key": "PRIMARY INDICATION (JRD)",
                            "searchable": true
                        },
                        {
                            "display_label": "TRIAL PHASE",
                            "visible": true,
                            "values": [
                                {
                                    "TRIAL PHASE": "I/II"
                                },
                                {
                                    "TRIAL PHASE": "II"
                                },
                                {
                                    "TRIAL PHASE": "IIA"
                                },
                                {
                                    "TRIAL PHASE": "IIB"
                                },
                                {
                                    "TRIAL PHASE": "III"
                                },
                                {
                                    "TRIAL PHASE": "IIIB"
                                }
                            ],
                            "data_type": "string",
                            "label": "TRIAL PHASE",
                            "type": "dropdown-multi",
                            "data_key": "TRIAL PHASE",
                            "searchable": false
                        },
                        {
                            "display_label": "NUMBER OF SUBJECTS",
                            "visible": true,
                            "values": {
                                "min": 1,
                                "max": 1000000
                            },
                            "data_type": "number",
                            "label": "NUMBER OF SUBJECTS",
                            "type": "range-number",
                            "data_key": "NUMBER OF SUBJECTS"
                        },
                        {
                            "display_label": "NUMBER OF COUNTRIES",
                            "visible": true,
                            "values": {
                                "min": 1,
                                "max": 48
                            },
                            "data_type": "number",
                            "label": "NUMBER OF COUNTRIES",
                            "type": "range-number",
                            "data_key": "NUMBER OF COUNTRIES"
                        },
                        {
                            "display_label": "NUMBER OF SITES",
                            "visible": true,
                            "values": {
                                "min": 1,
                                "max": 1188
                            },
                            "data_type": "number",
                            "label": "NUMBER OF SITES",
                            "type": "range-number",
                            "data_key": "NUMBER OF SITES"
                        },
                        {
                            "display_label": "FIRST PATIENT IN",
                            "visible": true,
                            "values": {
                                "min": 2002,
                                "max": 2023
                            },
                            "data_type": "number",
                            "label": "FIRST PATIENT IN",
                            "type": "range-number",
                            "data_key": "FIRST PATIENT IN"
                        },
                        {
                            "display_label": "LAST PATIENT OUT",
                            "visible": true,
                            "values": {
                                "min": 2004,
                                "max": 2028
                            },
                            "data_type": "number",
                            "label": "LAST PATIENT OUT",
                            "type": "range-number",
                            "data_key": "LAST PATIENT OUT"
                        },
                        {
                            "display_label": "PRODUCT TYPE",
                            "visible": true,
                            "applied": [],
                            "values": [
                                {
                                    "PRODUCT TYPE": "LARGE MOLECULE"
                                },
                                {
                                    "PRODUCT TYPE": "SMALL MOLECULE"
                                }
                            ],
                            "data_type": "string",
                            "label": "PRODUCT TYPE",
                            "type": "dropdown-multi",
                            "data_key": "PRODUCT TYPE",
                            "searchable": false
                        },
                        {
                            "display_label": "PROJECT NAME",
                            "visible": true,
                            "values": [],
                            "data_type": "string",
                            "label": "PROJECT NAME",
                            "type": "dropdown-multi",
                            "data_key": "PROJECT NAME",
                            "searchable": true
                        },
                        {
                            "display_label": "PRODUCT NAME",
                            "visible": true,
                            "values": [],
                            "data_type": "string",
                            "label": "PRODUCT NAME",
                            "type": "dropdown-multi",
                            "data_key": "PRODUCT NAME",
                            "searchable": true
                        },
                        {
                            "display_label": "PROJECT TYPE",
                            "visible": true,
                            "values": [
                                {
                                    "PROJECT TYPE": "Line Extension"
                                },
                                {
                                    "PROJECT TYPE": "New Molecular Entity"
                                }
                            ],
                            "data_type": "string",
                            "label": "PROJECT TYPE",
                            "type": "dropdown-multi",
                            "data_key": "PROJECT TYPE",
                            "searchable": false
                        },
                        {
                            "display_label": "STRATEGIC PRIORITY",
                            "visible": true,
                            "values": [
                                {
                                    "STRATEGIC PRIORITY": "Accelerate to Value (LD)"
                                },
                                {
                                    "STRATEGIC PRIORITY": "Core (LD)"
                                },
                                {
                                    "STRATEGIC PRIORITY": "Invest to PoC (ED)"
                                },
                                {
                                    "STRATEGIC PRIORITY": "Key Plus Acceleration (LD)"
                                },
                                {
                                    "STRATEGIC PRIORITY": "Not Applicable"
                                },
                                {
                                    "STRATEGIC PRIORITY": "Required (LD)"
                                },
                                {
                                    "STRATEGIC PRIORITY": "Standard (LD)"
                                }
                            ],
                            "data_type": "string",
                            "label": "STRATEGIC PRIORITY",
                            "type": "dropdown-multi",
                            "data_key": "STRATEGIC PRIORITY",
                            "searchable": false
                        },
                        {
                            "display_label": "PROTOCOL ID",
                            "visible": true,
                            "values": [],
                            "data_type": "string",
                            "label": "PROTOCOL ID",
                            "type": "dropdown-multi",
                            "data_key": "PROTOCOL ID",
                            "searchable": true
                        },
                        {
                            "display_label": "STUDY STAGE",
                            "visible": false,
                            "applied": [
                                "Conduct"
                            ],
                            "values": [
                                {
                                    "STUDY STAGE": "Analysis"
                                },
                                {
                                    "STUDY STAGE": "Conduct"
                                },
                                {
                                    "STUDY STAGE": "Data Capture"
                                },
                                {
                                    "STUDY STAGE": "Enrollment"
                                },
                                {
                                    "STUDY STAGE": "Startup"
                                },
                                {
                                    "STUDY STAGE": "Study"
                                },
                                {
                                    "STUDY STAGE": "Treatment"
                                }
                            ],
                            "data_type": "string",
                            "label": "STUDY STAGE",
                            "type": "dropdown-single",
                            "data_key": "STUDY STAGE",
                            "searchable": false
                        },
                        {
                            "display_label": "TRIAL PHASE GROUP",
                            "visible": true,
                            "applied": [
                                "II"
                            ],
                            "values": [
                                {
                                    "TRIAL PHASE GROUP": "II"
                                },
                                {
                                    "TRIAL PHASE GROUP": "III"
                                }
                            ],
                            "data_type": "string",
                            "label": "TRIAL PHASE GROUP",
                            "type": "dropdown-multi",
                            "data_key": "TRIAL PHASE GROUP",
                            "searchable": false
                        }
                    ],
                    "dataset": "JRD"
                }
            ],
            "dataset_boxplot_data": {
                "output": [
                    {
                        "number_of_subjects_min": 44,
                        "number_of_studies": 18,
                        "level": null,
                        "percentile_25th": 7.7,
                        "percentile_10th": 3.9,
                        "percentile_90th": 30.7,
                        "variability_flag": false,
                        "data_source": "JRD",
                        "on_time_75": false,
                        "number_of_subjects_max": 5800,
                        "study_stage": "Study",
                        "median": 13.9,
                        "percentile_75th": 21.3,
                        "sample_size_flag": false,
                        "dataset": "jrd",
                        "day_difference_75": -6.7
                    },
                    {
                        "number_of_subjects_min": null,
                        "number_of_studies": 18,
                        "level": "DA",
                        "percentile_25th": 11.5,
                        "percentile_10th": 4.2,
                        "percentile_90th": 37.2,
                        "variability_flag": false,
                        "data_source": "INDUSTRY BENCHMARK",
                        "on_time_75": true,
                        "number_of_subjects_max": null,
                        "study_stage": "Study",
                        "median": 20.6,
                        "percentile_75th": 28.9,
                        "sample_size_flag": false,
                        "dataset": "kmr",
                        "day_difference_75": 0
                    }
                ],
                "plain_text_story": "The selected JRD studies median is 6.7 months shorter than the Industry Benchmarks median and is 3.1 months shorter than the selected Industry Studies median. JRD historically takes a median of 13.9 months to complete such a study. The median cycle time is 20.6 months for Industry Benchmarks and 17.0 months for selected Industry studies. The selected JRD studies have lower variability and lower sample size than the industry benchmarks and selected industry studies.",
                "chart": {
                    "details": [
                        {
                            "datatype": "string",
                            "label": "Source",
                            "value": "JRD + INDUSTRY BENCHMARKS"
                        },
                        {
                            "datatype": "string",
                            "label": "Chart Type",
                            "value": "Box Plot"
                        },
                        {
                            "datatype": "date",
                            "label": "Latest Refresh Date",
                            "value": "2020-06-09 17:11:53"
                        }
                    ],
                    "title": "",
                    "type": "cost-calculator-box-plot"
                },
                "story": "<div class=\"lym-story-output\"><div class=\"lym-story-heading\"></div><div class=\"lym-story-desc\"><div>The selected JRD studies median is <span class = \"lym-story-v\">6.7</span> months <span class = \"lym-story-v\">shorter</span> than the Industry Benchmarks median and is <span class = \"lym-story-v\">3.1</span> months <span class = \"lym-story-v\">shorter</span> than the selected Industry Studies median.</div><div>JRD historically takes a median of <span class = \"lym-story-v\">13.9</span> months to complete such a study.</div><div>The median cycle time is <span class = \"lym-story-v\">20.6</span> months for Industry Benchmarks and <span class = \"lym-story-v\">17.0</span> months for selected Industry studies.</div><div>The selected JRD studies have<span class = \"lym-story-v\"> lower </span>variability and <span class = \"lym-story-v\"> lower </span>sample size than the industry benchmarks and selected industry studies.</div></div></div>"
            },
            "output": [
                {
                    "number_of_subjects_min": 44,
                    "number_of_studies": 18,
                    "level": null,
                    "percentile_25th": 7.7,
                    "percentile_10th": 3.9,
                    "percentile_90th": 30.7,
                    "variability_flag": false,
                    "data_source": "JRD",
                    "on_time_75": false,
                    "number_of_subjects_max": 5800,
                    "study_stage": "Study",
                    "median": 13.9,
                    "percentile_75th": 21.3,
                    "sample_size_flag": false,
                    "dataset": "jrd",
                    "day_difference_75": -6.7
                },
                {
                    "number_of_subjects_min": null,
                    "number_of_studies": 18,
                    "level": "DA",
                    "percentile_25th": 11.5,
                    "percentile_10th": 4.2,
                    "percentile_90th": 37.2,
                    "variability_flag": false,
                    "data_source": "INDUSTRY BENCHMARK",
                    "on_time_75": true,
                    "number_of_subjects_max": null,
                    "study_stage": "Study",
                    "median": 20.6,
                    "percentile_75th": 28.9,
                    "sample_size_flag": false,
                    "dataset": "kmr",
                    "day_difference_75": 0
                }
            ],
            "plain_text_story": "The selected JRD studies median is 6.7 months shorter than the Industry Benchmarks median and is 3.1 months shorter than the selected Industry Studies median. JRD historically takes a median of 13.9 months to complete such a study. The median cycle time is 20.6 months for Industry Benchmarks and 17.0 months for selected Industry studies. The selected JRD studies have lower variability and lower sample size than the industry benchmarks and selected industry studies.",
            "sub domain": "jnj_research",
            "monte_carlo_data": {
                "output": [],
                "plain_text_story": "",
                "chart": {
                    "label_x_axis": "Study Simulation End Date",
                    "plot_bands": [],
                    "details": [],
                    "label_y_axis": "# of times simulation\nlanded on this date",
                    "title": "",
                    "type": "line"
                },
                "story": ""
            },
            "id": "leni_jnjrd_0172b5cb597349b891d84aa05b83055c_0",
            "metric_type_boxplot_data": {
                "output": [
                    {
                        "metric_type": "Total Cost Per Patient",
                        "median": 5.5,
                        "number_of_studies": 26,
                        "percentile_75th": 7.5,
                        "level": "DA",
                        "percentile_25th": 4.9,
                        "percentile_10th": 2.6,
                        "percentile_90th": 8.7
                    },
                    {
                        "metric_type": "OOP Cost Per Patient",
                        "median": 15.6,
                        "number_of_studies": 17,
                        "percentile_75th": 28.8,
                        "level": "DA",
                        "percentile_25th": 10.8,
                        "percentile_10th": 3.8,
                        "percentile_90th": 36.3
                    },
                    {
                        "metric_type": "FTE Cost Per Patient",
                        "median": 1.2,
                        "number_of_studies": 17,
                        "percentile_75th": 6.1,
                        "level": "DA",
                        "percentile_25th": 0.9,
                        "percentile_10th": 0.5,
                        "percentile_90th": 7.4
                    }
                ],
                "chart": {
                    "details": [
                        {
                            "datatype": "string",
                            "label": "Source",
                            "value": "JRD + INDUSTRY BENCHMARKS"
                        },
                        {
                            "datatype": "string",
                            "label": "Chart Type",
                            "value": "Box Plot"
                        },
                        {
                            "datatype": "date",
                            "label": "Latest Refresh Date",
                            "value": "2020-06-09 17:11:53"
                        }
                    ],
                    "title": "",
                    "type": "cost-calculator-box-plot"
                },
                "comparator_data": {}
            },
            "chart": {
                "title": "",
                "type": "calculator-box-plot"
            },
            "additional_params": {
                "patient_count": {
                    "label": "No. Of patients for simulation",
                    "type": "number",
                    "value": 11
                },
                "proposed_budget": {
                    "label": "Proposed Bugdet(USD Thousands)",
                    "type": "number",
                    "value": 0
                }
            },
            "status": "output generation success",
            "story": "<div class=\"lym-story-output\"><div class=\"lym-story-heading\"></div><div class=\"lym-story-desc\"><div>The selected JRD studies median is <span class = \"lym-story-v\">6.7</span> months <span class = \"lym-story-v\">shorter</span> than the Industry Benchmarks median and is <span class = \"lym-story-v\">3.1</span> months <span class = \"lym-story-v\">shorter</span> than the selected Industry Studies median.</div><div>JRD historically takes a median of <span class = \"lym-story-v\">13.9</span> months to complete such a study.</div><div>The median cycle time is <span class = \"lym-story-v\">20.6</span> months for Industry Benchmarks and <span class = \"lym-story-v\">17.0</span> months for selected Industry studies.</div><div>The selected JRD studies have<span class = \"lym-story-v\"> lower </span>variability and <span class = \"lym-story-v\"> lower </span>sample size than the industry benchmarks and selected industry studies.</div></div></div>"
        }
    ],
    "question": "How much would phase 2 diabetes cost",
    "status_txt": "INSIGHTS GENERATION SUCCESS"
}
```


## Leni-ms: Insights API IO Changes

Insights API has been called from many places

API calls | Analyzer | Calculator | Cost Calculator
--------- | ------- | ----------- | -----------
Intermediate Filters | yes | yes | yes
Refine Query | yes | yes | yes
Update Boxplot |   | yes | yes
Refine Montecarlo |   | yes | yes

> API Request from **Intermediate Filters**

```json
{
	"input": [{
		"inferences": [{
			"ignore": false,
			"id": "leni_jnjrd_378112533dd24ca095744263d9cad191_0",
			"context_tokens": [{
				"variables": [{
					"key": "TRIAL PHASE GROUP",
					"selected": true
				}, {
					"key": "TRIAL PHASE"
				}],
				"ignore": false,
				"token": "phase 2"
			}, {
				"variables": [{
					"selection": false,
					"key": "DISEASE AREA (KMR)",
					"selected": true,
					"filter_options": [{
						"label": "DIABETES MELLITUS",
						"selected": true
					}]
				}],
				"ignore": false,
				"token": "diabetes"
			}],
			"dataset": "JNJ RND",
			"last_modified": "2020-06-09 17:11:53"
		}]
	}],
	"question": "How much would phase 2 diabetes cost",
	"intermediate_filters": {
		"level": "IND",
		"disease_area": "DIABETES MELLITUS",
		"indication": "DIABETES - TYPE I",
		"metric_type": "Total Cost Per Patient"
	}
}
```


> API Request from **Refine Query**

```json
{
	"input": [{
		"inferences": [{
			"ignore": false,
			"id": "leni_jnjrd_378112533dd24ca095744263d9cad191_0",
			"context_tokens": [{
				"variables": [{
					"key": "TRIAL PHASE GROUP",
					"selected": true
				}, {
					"key": "TRIAL PHASE"
				}],
				"ignore": false,
				"token": "phase 2"
			}, {
				"variables": [{
					"selection": false,
					"key": "DISEASE AREA (KMR)",
					"selected": true,
					"filter_options": [{
						"label": "DIABETES MELLITUS",
						"selected": true
					}]
				}],
				"ignore": false,
				"token": "diabetes"
			}],
			"dataset": "JNJ RND",
			"last_modified": "2020-06-09 17:11:53"
		}]
	}],
	"question": "How much would phase 2 diabetes cost"
}
```

> API Request from **Update Boxplot**

```json
{
    "input": [
        {
            "inferences": [
                {
                    "ignore": false,
                    "id": "leni_jnjrd_378112533dd24ca095744263d9cad191_0",
                    "context_tokens": [
                        {
                            "variables": [
                                {
                                    "key": "TRIAL PHASE GROUP",
                                    "selected": true
                                },
                                {
                                    "key": "TRIAL PHASE"
                                }
                            ],
                            "ignore": false,
                            "token": "phase 2"
                        },
                        {
                            "variables": [
                                {
                                    "selection": false,
                                    "key": "DISEASE AREA (KMR)",
                                    "selected": true,
                                    "filter_options": [
                                        {
                                            "label": "DIABETES MELLITUS",
                                            "selected": true
                                        }
                                    ]
                                }
                            ],
                            "ignore": false,
                            "token": "diabetes"
                        }
                    ],
                    "dataset": "JNJ RND",
                    "last_modified": "2020-06-09 17:11:53"
                }
            ]
        }
    ],
    "question": "How much would phase 2 diabetes cost",
    "intermediate_filters": {
        "level": "DA",
        "disease_area": "DIABETES MELLITUS",
        "metric_type": "Total Cost Per Patient"
    },
    "additional_params": {
        "patient_count": 12,
        "proposed_budget": 100,
        "selected_studies": [
            {
                "dataset": "JRD",
                "dataset_name": "jrd",
                "study": [
                    "28431754-DIA-2003 - DB 18 weeks PBO, 50mg; 150mg BID",
                    "28431754-DIA-2001 - Metformin Add-on"
                ],
                "filter": []
            }
        ]
    },
    "cart_filters": true
}
```

> API Request from **Refine Montecarlo**

```json
{
    "input": [
        {
            "inferences": [
                {
                    "ignore": false,
                    "id": "leni_jnjrd_378112533dd24ca095744263d9cad191_0",
                    "context_tokens": [
                        {
                            "variables": [
                                {
                                    "key": "TRIAL PHASE GROUP",
                                    "selected": true
                                },
                                {
                                    "key": "TRIAL PHASE"
                                }
                            ],
                            "ignore": false,
                            "token": "phase 2"
                        },
                        {
                            "variables": [
                                {
                                    "selection": false,
                                    "key": "DISEASE AREA (KMR)",
                                    "selected": true,
                                    "filter_options": [
                                        {
                                            "label": "DIABETES MELLITUS",
                                            "selected": true
                                        }
                                    ]
                                }
                            ],
                            "ignore": false,
                            "token": "diabetes"
                        }
                    ],
                    "dataset": "JNJ RND",
                    "last_modified": "2020-06-09 17:11:53"
                }
            ]
        }
    ],
    "question": "How much would phase 2 diabetes cost",
    "intermediate_filters": {
        "level": "DA",
        "disease_area": "DIABETES MELLITUS",
        "metric_type": "Total Cost Per Patient"
    },
    "additional_params": {
        "patient_count": 12,
        "proposed_budget": 100,
        "selected_studies": [
            {
                "dataset": "JRD",
                "dataset_name": "jrd",
                "study": [
                    "28431754-DIA-2003 - DB 18 weeks PBO, 50mg; 150mg BID",
                    "28431754-DIA-2001 - Metformin Add-on"
                ],
                "filter": []
            }
        ]
    },
    "cart_filters": true
}
```


## Leni-ms: Comparator API IO
## Leni-ms: Studies API IO
## Analytics: IO
## NLG: IO - dataset boxplot
## NLG: IO - metric_type boxplot
## NLG: IO - monte_carlo boxplot

# Save Simulation
# Edit Monte-Carlo

<!--<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>-->

