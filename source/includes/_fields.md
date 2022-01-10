# Fields

## Introduction To Fields

While all `projects` within HandsHQ have the attributes of `name`, `reference`, `start_date`, `end_date`, projects may also have a number of associated `fields` that are used to describe more specific pieces of information relating to that `project`.

In order to create `projects`, every `division` is assigned the use of a `template` to determine how such `projects` should be constructed.

By default all `divisions` will use the standard HandsHQ `template` which contains `fields` such as "Location of Works", "Address Line 1" etc.
When a division is using the custom `templates` feature however, a `division` will have a far more specific set of fields more appropriate for the types of projects they are undertaking.

<aside class="notice" >
Please contact our customer success team for more information on the custom templates feature.
</aside>

Within each `template` (and later each `project`), `fields` are organised into a group called a `fieldset` which might look something like this within the app when editing a `project`.

- Location (`fieldset`)
  - Location of Works (`field`)
  - Address line 1 (`field`)
  - Address line 2 (`field`)

Whenever a new `project` is created, this structure is used to generate a set of new `fields` specific to that `project` which will have the same names, data types, order and behaviour.

## Fields Index

```shell
curl https://api.handshq.com/v1/fields \
  -H "Accept: application/json"  \
  -H "Authorization: bearer [api_token]"
```
### Description

Collection of `fields` from your `division`'s applied `template`, the details of these `fields` are copied to the new fields which are generated for every new `project` using that template.

### URL

`GET https://api.handshq.com/v1/fields`

### Params

None.

> Sample Response

```json
{
    "data": [
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
        }
    ],
    "included": [
        {
            "id": "2",
            "type": "fieldset",
            "attributes": {
                "name": "Location"
            }
        }
    ]
}
```

### Attribute descriptions
- `label` - Label on project forms and end documents, e.g. 'Address 1'
- `required` - Whether or not the field is required when saving a project.
- `value` - The default value that will be immediately be applied to fields which are being derived from it. e.g. '1600 Pennsylvania Avenue`
- `data_type` - How the value of the field will be stored and the type of field provided to the user for editing. Will be one of the following:
  - `string`
  - `text`
  - `date`

<aside class="success">
Fieldset information will be provided as well as fields, these describe the group that the field belongs to, for example <code>Address 1</code> and <code>Address 2</code> might be within the <code>Location</code> fieldset.
</aside>

## Assigning field values to Projects

```json
{
  "project": {
    // ... other project attributes
    "fields_attributes": {
      "field_id_1": "My value 1",
      "field_id_2": "My value 2",
      "field_id_3": "My value 3",
    }
  }
}
```
In both creating and update, the values of these fields can be set when provided within `project` portion of the body under the key of `fields_attributes`.

In all cases, rather than having to provide details of which `fieldset` the `field` is a part of, a mapping of `field_id` to `field_value` is used, the value of the `id` is behaviourally different for creation and updating (see below).


## For Project creation

The `fields` for a `project` are generated during the `project` creation process, therefore in order to immediately provide a non-default value for these `fields` you must instead provide a mapping between the `template` `field` and the value that you wish to assign.

An example workflow for creating a `project` immediate values within it's `fields` might look like the following:

1) Retrieve details of your current `template`'s `fields` (`IDs`, default values, whether or not they are required etc) `GET https://api.handshq.com/v1/fields`

2) Map the `template` `field` `IDs` with the values you wish to assign to the `fields` for that `project`

> Arranged field attributes example where the IDS of "5", "6", "7" were found from /fields and a value was provided for each.

```json
 "fields_attributes": {
    "5": "My value for Location of works",
    "6": "My value for Address line 1",
    "7": "My value for Address line 2",
  }
```

3) Include these attributes as part of the body when sending to `POST https://api.handshq.com/v1/projects`

> Project creation example with custom fields being included, the response will include any fields that were created for this project - including those that were sent as part of this request. See FAQ for further details.

```json
{
  "user_email": "maddox@daystrom.com",
  "project": {
    "name": "My project with custom field values",
    "start_date": "2021-12-20",
    "end_date": "2022-12-20",
    "reference": "CustomFields1",
    "fields_attributes": {
      "5": "My value for Location of works",
      "6": "My value for Address line 1",
      "7": "My value for Address line 2",
    }
  }
}
```
> Note that the ids of the fields for the project returned in the payload will not be "5", "6", "7" (the ids of the template fields), instead a new field is created and will be assigned an appropriate id.

## For Project updates
```json
 "fields_attributes": {
    "123": "My value for Location of works",
    "456": "My value for Address line 1",
    "789": "My value for Address line 2",
  }
```
The same shape of `field_id: field_value` is used within `fields_attributes`.

The difference for `Project#update` being that the `field_id` would be the ID that already exists on the project rather than the ID of the `template` `field`.

The IDs of these fields are returned when a project is created and from certain other endpoints such as those returned back from `GET /projects`.


## FAQ

<aside>Do I need to provide field attributes when creating projects for them to be created?</aside>

No, you do not not need to provide the `field_attributes` in order for them to be generated, they are created by default for each new project, by providing them in `field_attributes` you are however able to immediately provide a value. For every template field that is omitted, a new field is still generated for the project, with its default value being assigned to that new field.

<aside>Do I need to provide the IDs in a specific order?</aside>

Where "Location" is the fieldset that contains multiple fields within it, it is worth noting that you do *not* have to provide details on the fieldsets when creating or updating projects, you only have to provided the `id` => `value` of all fields in a flat collection. The fieldset to which they are assigned and the order of fields as they appear in the document are still determined by the template that you are using, please contact our support team for more information on how this can be customised.

<aside>Are there any considerations for what values to provide?</aside>

Yes, some fields might be marked as `required` for your current template, if this is the case - if you do not provide a value or one that is deemened valid it will not allow the project to be created/updated.
Also, field values must correspond to their specific data type (e.g. dates).

Both of these pieces of information can be found as part of the `/fields` payload.
