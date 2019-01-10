# Fields

## Retrieving current fields

HandsHQ projects are created with a number of fields which can change depending on which template you are currently using. In order to find out information on which fields you are using you can use this endpoint.

```shell
curl https://api.handshq.com/v1/fields \
  -H "Content-Type: application/json"  \
  -H "Authorization: bearer [api_token]"
```

### HTTP Request

`GET https://api.handshq.com/v1/fields`

### Response

You retrieve an ordered list of fields which you are currently using for your project document information and formatting.

### Fields information
- `label` - Label on project forms and end documents, e.g. 'Address 1'
- `requred` - Whether or not the field is required for project creation.
- `value` - The default value that will be immediately be applied to fields.
- `data_type` - How the value of the field will be stored and the type of field provided to the user for editing. Will one of the following:
  - `string`
  - `text`
  - `date`

<aside class="notice">
Fieldset information will be provided as well as fields, these describe the group that the field belongs to, for example <code>Address 1</code> and <code>Address 2</code> might be within the <code>Location</code> fieldset.
</aside>

```json
{
    "data": [
        {
            "id": "12",
            "type": "field",
            "attributes": {
                "label": "Site supervisor",
                "required": false,
                "value": null,
                "data_type": "string"
            },
            "relationships": {
                "fieldset": {
                    "data": {
                        "id": "3",
                        "type": "fieldset"
                    }
                }
            }
        },
        {
            "id": "13",
            "type": "field",
            "attributes": {
                "label": "Contact number",
                "required": null,
                "value": null,
                "data_type": "string"
            },
            "relationships": {
                "fieldset": {
                    "data": {
                        "id": "3",
                        "type": "fieldset"
                    }
                }
            }
        },
        {
            "id": "5",
            "type": "field",
            "attributes": {
                "label": "Location of works",
                "required": null,
                "value": null,
                "data_type": "string"
            },
            "relationships": {
                "fieldset": {
                    "data": {
                        "id": "2",
                        "type": "fieldset"
                    }
                }
            }
        },
        {
            "id": "6",
            "type": "field",
            "attributes": {
                "label": "Address line 1",
                "required": null,
                "value": null,
                "data_type": "string"
            },
            "relationships": {
                "fieldset": {
                    "data": {
                        "id": "2",
                        "type": "fieldset"
                    }
                }
            }
        },
        {
            "id": "7",
            "type": "field",
            "attributes": {
                "label": "Address line 2",
                "required": null,
                "value": null,
                "data_type": "string"
            },
            "relationships": {
                "fieldset": {
                    "data": {
                        "id": "2",
                        "type": "fieldset"
                    }
                }
            }
        },
        {
            "id": "8",
            "type": "field",
            "attributes": {
                "label": "Address line 3",
                "required": null,
                "value": null,
                "data_type": "string"
            },
            "relationships": {
                "fieldset": {
                    "data": {
                        "id": "2",
                        "type": "fieldset"
                    }
                }
            }
        },
        {
            "id": "9",
            "type": "field",
            "attributes": {
                "label": "Town",
                "required": null,
                "value": null,
                "data_type": "string"
            },
            "relationships": {
                "fieldset": {
                    "data": {
                        "id": "2",
                        "type": "fieldset"
                    }
                }
            }
        },
        {
            "id": "10",
            "type": "field",
            "attributes": {
                "label": "County",
                "required": null,
                "value": null,
                "data_type": "string"
            },
            "relationships": {
                "fieldset": {
                    "data": {
                        "id": "2",
                        "type": "fieldset"
                    }
                }
            }
        },
        {
            "id": "11",
            "type": "field",
            "attributes": {
                "label": "Postcode",
                "required": null,
                "value": null,
                "data_type": "string"
            },
            "relationships": {
                "fieldset": {
                    "data": {
                        "id": "2",
                        "type": "fieldset"
                    }
                }
            }
        },
        {
            "id": "1",
            "type": "field",
            "attributes": {
                "label": "Client reference",
                "required": null,
                "value": null,
                "data_type": "string"
            },
            "relationships": {
                "fieldset": {
                    "data": {
                        "id": "1",
                        "type": "fieldset"
                    }
                }
            }
        },
        {
            "id": "2",
            "type": "field",
            "attributes": {
                "label": "Client",
                "required": null,
                "value": null,
                "data_type": "string"
            },
            "relationships": {
                "fieldset": {
                    "data": {
                        "id": "1",
                        "type": "fieldset"
                    }
                }
            }
        },
        {
            "id": "3",
            "type": "field",
            "attributes": {
                "label": "Principal designer",
                "required": false,
                "value": null,
                "data_type": "string"
            },
            "relationships": {
                "fieldset": {
                    "data": {
                        "id": "1",
                        "type": "fieldset"
                    }
                }
            }
        },
        {
            "id": "4",
            "type": "field",
            "attributes": {
                "label": "Principal contractor",
                "required": null,
                "value": null,
                "data_type": "string"
            },
            "relationships": {
                "fieldset": {
                    "data": {
                        "id": "1",
                        "type": "fieldset"
                    }
                }
            }
        }
    ],
    "included": [
        {
            "id": "3",
            "type": "fieldset",
            "attributes": {
                "name": "Site supervisor"
            }
        },
        {
            "id": "2",
            "type": "fieldset",
            "attributes": {
                "name": "Location"
            }
        },
        {
            "id": "1",
            "type": "fieldset",
            "attributes": {
                "name": "Details"
            }
        }
    ]
}
```
