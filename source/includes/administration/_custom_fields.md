## Custom fields

Custom fields allow administrators to define new fields on the organization and user models. This allows for additional metadata to be defined on these models.

### List custom fields

`GET /custom_fields`

```shell
# Retrieve custom fields
curl "https://cloudmc_endpoint/rest/customfields?organization_id=fb0eeef9-eddd-48bc-949c-871481777ff9" \
  -h "Mc-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "field": "username",
      "organization": {
        "id": "fb0eeef9-eddd-48bc-949c-871481777ff9"
      },
      "id": "f9a2b02b-7d67-4910-8353-c4bfcbdeaa7e",
      "type": "ORGANIZATION",
      "nameTranslations": {
        "en": "username",
        "fr": "username fr",
      },
      "descriptionTranslations": {
        "en": "username desc",
        "fr": "username desc fr"
      }
    }
  ]
}
```

Retrieves a list of custom fields for the given organization.

Query Params | &nbsp;
---- | -----------
`organization_id`<br/>*UUID* | Return only the custom fileds for the provided organization id. If not provided, will default to the user's organization.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The custom field's id.
`organization.id`<br/>*UUID* | The organization id that the custom field belongs to.
`field`<br/>*UUID* | The field you're defining, this is *not* the UI-facing name. 
`type`<br/>*string* | The type of model for the field. Possible values: ORGANIZATION, USER.
`nameTranslations`<br/>*map* | Map of language short codes to name translations for the field.
`descriptionTranslations`<br/>*map* | Map of language short codes to description translations for the field.

### Retrieve custom field

`GET /custom_fields/:id`

```shell
curl "http://localhost:8080/rest/customfields/f9a2b02b-7d67-4910-8353-c4bfcbdeaa7e" \
  -h "Mc-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "field": "username",
    "organization": {
      "id": "fb0eeef9-eddd-48bc-949c-871481777ff9"
    },
    "id": "f9a2b02b-7d67-4910-8353-c4bfcbdeaa7e",
    "type": "ORGANIZATION",
    "nameTranslations": {
      "en": "username",
      "fr": "username fr",
      "es": "username es"
    },
    "descriptionTranslations": {
      "en": "username desc",
      "fr": "username desc fr"
    }
  }
}
```

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The custom field's id.
`organization.id`<br/>*UUID* | The organization id that the custom field belongs to.
`field`<br/>*UUID* | The field you're defining, this is *not* the UI-facing name. 
`type`<br/>*string* | The type of model for the field. Possible values: ORGANIZATION, USER.
`nameTranslations`<br/>*map* | Map of language short codes to name translations for the field.
`descriptionTranslations`<br/>*map* | Map of language short codes to description translations for the field.
