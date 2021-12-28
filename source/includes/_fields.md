# Input fields


## Create field

> To create a new field, use this code:

```shell
# Get your token for further authorization
curl "https://core.eventtia.com/v1/fields" \
  -H 'Content-Type: application/json' \
  -X POST -d '{
  "data": {
    "type": "field",
    "attributes": {
      "name": {"es": "Nombre", "en": "Name"},
      "entity_type": "AttendeeType",
      "entity_id": 1,
      "required": true,
      "order": 0,
      "available_public_listings": true,
      "display": true,
      "filterable": true,
      "submitted_type": "Attendee",
      "type": "Fields::SingleSelectionField"
    }
  }
}'
```

```javascript
// Get your token for further authorization
fetch("https://core.eventtia.com/v1/fields", {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': '<your token>'
  },
  body: {
    data: {
    type: "field",
    attributes: {
      name: {es: "Nombre", en: "Name"},
      entity_type: "AttendeeType",
      entity_id: 1,
      required: true,
      order: 0,
      available_public_listings: true,
      display: true,
      filterable: true,
      submitted_type: "Attendee",
      type: "Fields::TextField"
    }
  }
  }
  
})
```

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": [
    {
      "id": "331",
      "type": "fields",
      "attributes": {
        "name": {
          "en": "326 name, locale: en",
          "es": "326 name, locale: es",
          "fr": "326 name, locale: fr"
        },
        "values": null,
        "settings": {
          "available_public_listings": true
        },
        "type": "Fields::TextField",
        "validations": {
          "letters": true
        },
        "order": 1,
        "entity_id": 62374,
        "maximum_characters": "10",
        "validation_type": "numbers",
        "repeat_value": "10",
        "allowed_values": ["one","one"],
        "terms_file": null
      }
    }
  ]
}
```

> Example of a 422 response:

```http
HTTP/1.1 422 Unprocessable Entity
{
    "message": {
        "name": [
            "Language en required"
        ]
    }
}
```

This endpoint allows you create a new input field. 
You may provide field names and options in multiple languages. Currently, English, Spanish and French are supported. 

### HTTP Request

`POST /v1/fields`

### Query Parameters for Text Field

Parameter | Type | Description
--------- | ---- | -----------
name | Hash | Field name e.g  {en: 'name', 'es': 'nombre'}.
entity_type | string | Field entity type 'AttendeeType'
entity_id | integer | Id of AttendeeType.
required | boolean | Specify if the field is required.
order | integer | Field order in the form.
available_public_listings | boolean | Field info visible on public sections.
display | boolean | Show field on public form´s.
filterable | boolean | Allow users search records by this field
submitted_type | string | 'Attendee' entity that will be answering this field.
type | string | Fields::TextField
validation_type | string | allowed options empty, numbers, letters, telephone
maximum_characters | integer | Maximum of allowed characters for this field
allowed_values | Array | You may provide allowed values for this field if you want.

### Query Parameters for Text Area Field

Parameter | Type | Description
--------- | ---- | -----------
name | Hash | Field name e.g  {en: 'name', 'es': 'nombre'}.
entity_type | string | Field entity type 'AttendeeType'
entity_id | integer | Id of AttendeeType.
order | integer | Field order in the form.
display | boolean | Show field on public form´s.
submitted_type | string | 'Attendee' entity that will be answering this field.
type | string | Fields::TextAreaField
maximum_characters | integer | Maximum of allowed characters for this field

### Query Parameters for Label Field

Parameter | Type | Description
--------- | ---- | -----------
name | Hash | Field name e.g  {en: 'name', 'es': 'nombre'}.
entity_type | string | Field entity type 'AttendeeType'
entity_id | integer | Id of AttendeeType.
order | integer | Field order in the form.
display | boolean | Show field on public form´s.
submitted_type | string | 'Attendee' entity that will be answering this field.
type | string | Fields::LabelField

### Query Parameters for Single Selection Field

Parameter | Type | Description
--------- | ---- | -----------
name | Hash | Field name e.g  {en: 'Favorite sport', 'es': 'Deporte favorito'}.
values | Array of Obejcts | options for this field eg [{en: 'Automotive', es: 'Automotores', uuid: 'uuide'}, {en: 'Computers', es: 'Computadores', uuid: 'uuidop'}]. You must provide an unique uuid for each option.
entity_type | string | Field entity type 'AttendeeType'
entity_id | integer | Id of AttendeeType.
order | integer | Field order in the form.
display | boolean | Show field on public form´s.
submitted_type | string | 'Attendee' entity that will be answering this field.
type | string | Fields::SingleSelectionField
control_type | string | radio or dropdown_list

### Query Parameters for Multiple Selection Field

Parameter | Type | Description
--------- | ---- | -----------
name | Hash | Field name e.g  {en: 'Products and services', 'es': 'Productos y servicios'}.
values | Array of Obejcts | options for this field eg [{en: '', es: 'Futbol', uuid: 'uuide'}, {en: 'Golf', es: 'Golf', uuid: 'uuidop'}]. You must provide an unique uuid for each option.
entity_type | string | Field entity type 'AttendeeType'
entity_id | integer | Id of AttendeeType.
order | integer | Field order in the form.
display | boolean | Show field on public form´s.
submitted_type | string | 'Attendee' entity that will be answering this field.
type | string | Fields::MultipleSelectionField
control_type | string | check_boxes or dropdown_list

### Query Parameters for Date Time Field

Parameter | Type | Description
--------- | ---- | -----------
name | Hash | Field name e.g  {en: 'date', 'es': 'fecha'}.
entity_type | string | Field entity type 'AttendeeType'
entity_id | integer | Id of AttendeeType.
order | integer | Field order in the form.
display | boolean | Show field on public form´s.
submitted_type | string | 'Attendee' entity that will be answering this field.
type | string | Fields::DateTimeField
include_time | boolean | Include time picker element

### Query Parameters for City Field

Parameter | Type | Description
--------- | ---- | -----------
name | Hash | Field name e.g  {en: 'city', 'es': 'ciudad'}.
entity_type | string | Field entity type 'AttendeeType'
entity_id | integer | Id of AttendeeType.
order | integer | Field order in the form.
display | boolean | Show field on public form´s.
submitted_type | string | 'Attendee' entity that will be answering this field.
type | string | Fields::CityField

### Query Parameters for Image Field

Parameter | Type | Description
--------- | ---- | -----------
name | Hash | Field name e.g  {en: 'Image', 'es': 'imagen'}.
entity_type | string | Field entity type 'AttendeeType'
entity_id | integer | Id of AttendeeType.
order | integer | Field order in the form.
display | boolean | Show field on public form´s.
submitted_type | string | 'Attendee' entity that will be answering this field.
type | string | Fields::ImageField

### Query Parameters for File Field

Parameter | Type | Description
--------- | ---- | -----------
name | Hash | Field name e.g  {en: 'File', 'es': 'Archivo'}.
entity_type | string | Field entity type 'AttendeeType'
entity_id | integer | Id of AttendeeType.
order | integer | Field order in the form.
display | boolean | Show field on public form´s.
submitted_type | string | 'Attendee' entity that will be answering this field.
type | string | Fields::FileField

### Query Parameters for Terms Field

Parameter | Type | Description
--------- | ---- | -----------
name | Hash | Field name e.g  {en: 'Terms and conditions', 'es': 'Terminos y condiciones'}.
entity_type | string | Field entity type 'AttendeeType'
entity_id | integer | Id of AttendeeType.
order | integer | Field order in the form.
display | boolean | Show field on public form´s.
submitted_type | string | 'Attendee' entity that will be answering this field.
type | string | Fields::TermsField
terms_mode | string | url or file
terms_url | string | you must provide an url if terms_mode is url
terms_file | file | you must attach a file terms_mode is file

## Update field

> To update field info, use this code:

```shell
# Get your token for further authorization
curl "https://core.eventtia.com/v1/fields/<id>" \
  -H 'Content-Type: application/json' \
  -X PUT -d '{
  "data": {
    "type": "field",
    "attributes": {
      "name": {"es": "Nombre", "en": "Name"},
      "entity_type": "AttendeeType",
      "entity_id": 1,
      "required": true,
      "order": 0,
      "available_public_listings": true,
      "display": true,
      "filterable": true,
      "submitted_type": "Attendee",
      "type": "Fields::SingleSelectionField"
    }
  }
}'
```

```javascript
// Get your token for further authorization
fetch("https://core.eventtia.com/v1/fields/<id>", {
  method: 'PUT',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': '<your token>'
  },
  body: {
    data: {
    type: "field",
    attributes: {
      name: {es: "Nuevo nombre", en: "New name"}
    }
  }
  }
  
})
```

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
     "data": {
        "id": "1",
        "type": "fields",
        "attributes": {
            "name": {
                "es": "Nuevo nombre",
                "en": "New name"
            },
            "type": "Fields::TextField",
            "required": true,
            "display": true,
            "filterable": true,
            "available_public_listings": true,
        }
    }
}
```

> Example of a 422 response:

```http
HTTP/1.1 422 Unprocessable Entity
{
    "message": {
        "name": [
            "Language en required"
        ]
    }
}
```

This endpoint allows you update a field info.

### HTTP Request

`PUT /v1/fields/id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | The id for the desired field

## Destroy Field

> To update destroy, use this code:


```javascript
fetch("https://core.eventtia.com/v1/fields/<id>", {
  method: 'DELETE',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': '<your token>'
  },
})
```

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
     "data": {
        "id": "1",
        "type": "fields",
        "attributes": {
            "name": {
                "es": "Nuevo nombre",
                "en": "New name"
            },
            "type": "Fields::TextField",
            "required": true,
            "display": true,
            "filterable": true,
            "available_public_listings": true,
        }
    }
}
```

This endpoint allows you destroy a field info.

### HTTP Request

`DELETE /v1/fields/id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | The id for the desired field
