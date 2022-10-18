# Custom Fields

An organization's custom_fields.

## The custom field object

```json
{
  "id": 123456,
  "name": "Seniority Level",
  "field_type": "job",
  "priority": 1,
  "value_type": "single_select",
  "private": true,
  "required": false,
  "require_approval": true,
  "trigger_new_version": false,
  "name_key": "custom_field_name",
  "description": "Seniority of this role",
  "expose_in_job_board_api": true,
  "api_only": false,
  "offices": [
    {
      "id": 11915,
      "name": "New York",
      "location": {
        "name": "New York, New York, United States"
      },
      "primary_contact_user_id": null,
      "parent_id": null,
      "parent_office_external_id": null,
      "child_ids": [],
      "child_office_external_ids": [],
      "external_id": null
    }
  ],
  "departments": [],
  "template_token_string": "{{SENIORITY}}",
  "custom_field_options": [
    {
      "id": 123,
      "name": "Junior",
      "priority": 1,
      "external_id": "jr"
    },
    {
      "id": 234,
      "name": "Senior",
      "priority": 2,
      "external_id": null
    }
  ]
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| id | The custom field's unique identifier |
| name | The field's name in Greenhouse |
| active | Boolean value which is false if the custom field has been deleted, true otherwise. |
| field_type | One of job, candidate, application, offer, opening, rejection_question, referral_question, or user_attribute. This is also included in the URL as an argument, which will return only custom fields that match the given type.
| priority | Numeric field used for ordering in Greenhouse.
| value_type | One of short_text, long_text, yes_no, single_select, multi_select, currency, currency_range, number, number_range, date, url, or user. For the user_attribute field type, only the following value types are supported currently: single_select, multi_select, yes_no, and user
| private | Boolean value to say if this field is private in Greenhouse.
| required | The object this field exists on can not be saved if this value is not set.
| require_approval | Only applicable to job and opening custom fields, changes to this fields requires an approval flow in Greenhouse to be re-done.
| trigger_new_version | Only applicable to offer custom fields, changes to this field creates a new offer version.
| name_key | Listed as "immutable field key" in Greenhouse, this value is based of the name of the field when it is created and does not change as the field's name is later updated.
| custom_field_options | For single_select and multi_select field_types, this is the list of options for that select.
| custom_field_options.priority | Numeric value used for ordering the custom field options.
| custom_field_options.external_id | String value, the external_id for the custom field option
| description | The custom field's description
| expose_in_job_board_api | Boolean.  Only relevant for Job custom fields. If true, then the field will be shown in the Job Board API.
| api_only | Boolean.  Only relevant for Job custom fields.  If true, this custom field can only be edited from the API.
| offices | Only relevant for Job, Opening, and Offer custom fields. If this custom field only applies to a subset of offices, then this list contains each office.  Otherwise, if the list is empty, it applies to all offices.
| departments | Only relevant for Job, Opening, and Offer custom fields. If this custom field only applies to a subset of departments, then this list contains each department.  Otherwise, if the list is empty, it applies to all departments.
| template_token_string | Token string used in email and offer document templates

## GET: List Custom Fields

```shell
curl 'https://harvest.greenhouse.io/v1/custom_fields/{field_type}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 123456,
    "name": "Custom Field Name",
    "active": true,
    "field_type": "job",
    "priority": 1,
    "value_type": "single_select",
    "private": true,
    "required": false,
    "require_approval": true,
    "trigger_new_version": false,
    "name_key": "custom_field_name",
    "description": "Field description",
    "expose_in_job_board_api": false,
    "api_only": false,
    "offices": [],
    "departments": [],
    "template_token_string": "{{FIELD1}}",
    "custom_field_options": [
      {
        "id": 123,
        "name": "Name One",
        "priority": 1,
        "external_id": "name-one"
      },
      {
        "id": 234,
        "name": "Name Two",
        "priority": 2,
        "external_id": null
      }
    ]
  }
]
```

### HTTP Request

`GET https://harvest.greenhouse.io/v1/custom_fields/{field_type}`

### URL parameters

| Parameter | Description |
|-----------|-------------|
| *field_type | Returns only custom fields of this type. For example, if “offer” is included in the URL as the field_type, the endpoint will only return custom fields with the “offer” field type.  One of: `offer`, `candidate`, `application`, `job`, `rejection_question`, `referral_question`, `user_attribute`.

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| include_inactive | When `true`, include inactive custom fields. Otherwise excludes inactive custom fields.  Defaults to `false`.

<br>
[See noteworthy response attributes.](#the-custom-field-object)

This endpoint supports pagination. See the [Pagination](#pagination) section for more detail.

## GET: Retrieve Custom Field

```shell
curl 'https://harvest.greenhouse.io/v1/custom_field/{id}'
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
{
  "id": 123456,
  "name": "Custom Field Name",
  "active": true,
  "field_type": "job",
  "priority": 1,
  "value_type": "single_select",
  "private": true,
  "required": false,
  "require_approval": true,
  "trigger_new_version": false,
  "name_key": "custom_field_name",
  "description": "Field description",
  "expose_in_job_board_api": false,
  "api_only": false,
  "offices": [],
  "departments": [],
  "template_token_string": "{{FIELD1}}",
  "custom_field_options": [
    {
      "id": 123,
      "name": "Name One",
      "priority": 1,
      "external_id": "name-one"
    },
    {
      "id": 234,
      "name": "Name Two",
      "priority": 2,
      "external_id": null
    }
  ]
}
```
### HTTP Request

`GET https://harvest.greenhouse.io/v1/custom_field/{id}`


### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the custom field to retrieve

<br>
[See noteworthy response attributes.](#the-custom-field-object)

## The custom field options object

Refers to the options available for single-select and multi-select custom fields.

```json
{
  "id": 123456,
  "name": "Option A",
  "priority": 0,
  "external_id": "option-a"
}
```

### Noteworthy attributes

| Attribute | Description |
|-----------|-------------|
| priority | Numeric field used for ordering in Greenhouse.
| external_id | String field, the external_id for the custom field option.


## POST: Create Custom Field

NOTE: this endpoint currently only supports creating custom fields for applications.

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/custom_fields/'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "name": "Custom Field Name",
  "field_type": "application",
  "value_type": "single_select",
  "private": false,
  "generate_email_token": true,
  "required": false,
  "require_approval": false,
  "expose_in_job_board_api": true,
  "api_only": false,
  "trigger_new_version": false,
  "office_ids": [123, 456],
  "department_ids": [567, 890],
  "custom_field_options": [
    {
      "name": "Name One",
      "priority": 1,
      "external_id": "name-one"
    },
    {
      "name": "Name Two",
      "priority": 2,
      "external_id": null
    }
  ]
}
```

> If successful, the above command returns a 201 response code along with a JSON representation of the newly created custom field. The JSON structure looks like this:

```json
[
  {
    "id": 123456,
    "name": "Custom Field Name",
    "active": true,
    "field_type": "job",
    "priority": 1,
    "value_type": "single_select",
    "private": true,
    "required": false,
    "require_approval": true,
    "trigger_new_version": false,
    "name_key": "custom_field_name",
    "description": "Field description",
    "expose_in_job_board_api": false,
    "api_only": false,
    "offices": [],
    "departments": [],
    "template_token_string": "{{FIELD1}}",
    "custom_field_options": [
      {
        "id": 123,
        "name": "Name One",
        "priority": 1,
        "external_id": "name-one"
      },
      {
        "id": 234,
        "name": "Name Two",
        "priority": 2,
        "external_id": null
      }
    ]
  }
]
```

### HTTP Request

`POST https://harvest.greenhouse.io/v1/custom_fields`

### JSON Body Parameters

| Attribute | Type | Required | Description |
|-----------|-------------|-------------|-------------|
| name | string | yes | The field's name in Greenhouse |
| description | string | no | The field's description in Greenhouse |
| field_type | string | yes | One of job, candidate, application, offer, opening, rejection_question, referral_question, user_attribute.
| value_type | string | yes | One of short_text, long_text, yes_no, single_select, multi_select, currency, currency_range, number, number_range, date, url, or user. For the user_attribute field type, only the following value types are supported currently: single_select, multi_select, yes_no, and user
| private | boolean | no | Boolean value to say if this field is private in Greenhouse. Defaults to false if not provided for non-offer custom fields. For offer custom fields, private is always true.
| required | boolean | no | Boolean value to determine if this field must be filled out in order to save the custom field. Only used for job, offer, and opening type custom fields. Defaults to false.
| require_approval | boolean | no | Boolean value to determine if changes to this custom field triggers re-approvals. Only used for job and opening custom fields. Defaults to false.
| trigger_new_version | boolean | no | Boolean value to determine if changes to this field triggers the automatic creation of a new offer version. Only used in offer custom fields. Defaults to false.
| expose_in_job_board_api | boolean | no | Boolean value to determine if this custom field and its value will be provied in the Job Board API response for this job. These fields are included in the metadata section of the Job Board API response. Only used in job custom fields. Defaults to false.
| api_only | boolean | no | Boolean value to determine if updates to this custom field may only be made via Harvest. Only used in job custom fields. Defaults to false. If this feature is not available for your organization, attempting to create a field with this set to true will return an API Error.
office_ids | Array of integers | no | If included, this custom field is only displayed on objects associated with these offices. This is only used for job, opening, and offer custom fields. If not included, custom field will be shown for all offices.
department_ids | Array of integers | no | If included, this custom field is only displayed on objects associated with these departments. This is only used for job, opening, and offer custom fields. If not included, custom field will be shown for all departments.
| custom_field_options | array of Custom Field Options | yes for some field_type | For single_select and multi_select field_types, this is the list of options for that select.
| custom_field_options.name | string | yes | The name of the new custom field option.
| custom_field_options.priority | integer | yes | Numeric value used for ordering the custom field options.
| custom_field_options.external_id | string | no | The external_id for the custom field. Used for integrating with external HRIS.
| generate_email_token | boolean | no | If this is sent as true, a default `template_token_string` will be generated for the new Custom Field.


## PATCH: Update Custom Field

This endpoint updates an existing custom field.

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v1/custom_fields/{id}'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkeODyN2VhZmEMWRjMzc1YZjMqmUwNjsdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "name": "New Name",
  "description": "New description",
  "private": false,
  "template_token_string": "token123"
}
```

> If the update is successful, the above command returns JSON structured like this:

```json
[
  {
    "id": 123456,
    "name": "New Name",
    "active": true,
    "field_type": "job",
    "priority": 1,
    "value_type": "single_select",
    "private": false,
    "required": false,
    "require_approval": true,
    "trigger_new_version": false,
    "name_key": "custom_field_name",
    "description": "New description",
    "expose_in_job_board_api": false,
    "api_only": false,
    "offices": [],
    "departments": [],
    "template_token_string": "{{token123}}",
    "custom_field_options": [
      {
        "id": 123,
        "name": "Name One",
        "priority": 1,
        "external_id": "name-one"
      },
      {
        "id": 234,
        "name": "Name Two",
        "priority": 2,
        "external_id": null
      }
    ]
  }
]
```

### HTTP Request

`PATCH https://harvest.greenhouse.io/v1/custom_fields/{id}`


### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the custom field to update

### JSON Body Parameters

This endpoint accepts the same JSON body parameters as the [Create Custom Field endpoint](#post-create-custom-field).  There is one exception - instead of the `generate_email_token` field which is used during creation, the `template_token_string` field can be used to set or change the template token on an existing custom field.

| Attribute | Type | Required | Description |
|-----------|-------------|-------------|-------------|
| template_token_string | string | no | Sets the template token which is used in email and offer document templates.

## DELETE: Delete Custom Field

This endpoint deletes a custom field.  Note that custom fields are soft-deleted in order to maintain historical data. Soft-deleted custom fields will be hidden to users but will continue to be returned in the API with their `active` flag set to `false`.

```shell
curl -X DELETE 'https://harvest.greenhouse.io/v1/custom_fields/{id}'
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkeODyN2VhZmEMWRjMzc1YZjMqmUwNjsdlMjQ6"
```

> If the deletion is successful, the above command returns JSON structured like this:

```json
{
  "success": "Custom Field ID 12345 has been deleted."
}
```

### HTTP Request

`DELETE https://harvest.greenhouse.io/v1/custom_fields/{id}`


### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the custom field to delete

## GET: List Custom Field Options

```shell
curl 'https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options'
-H "On-Behalf-Of: {greenhouse user ID}" -H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 123456,
    "name": "Option A",
    "priority": 0,
    "external_id": "option-a"
  },
  {
    "id": 123457,
    "name": "Option B",
    "priority": 1,
    "external_id": "option-b"
  },
  {
    "id": 123458,
    "name": "Option C",
    "priority": 2,
    "external_id": null
  }
]
```
Given a single select or multi select custom field, return all its options.

### HTTP Request

`GET https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options`

### Querystring parameters

| Parameter | Description |
|-----------|-------------|
| type | One of all, active, or inactive.  Inactive returns only custom field options that have been deleted.  Active is the default and returns all custom field options currently active.  All returns both active and inactive.  If this isn't included, active fields will be returned.

<br>

This endpoint supports pagination. See the [Pagination](#pagination) section for more detail.


## POST: Create Custom Field Options

```shell
curl -X POST 'https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "options": [
    {"name": "Option A", "priority": 5, "external_id": "3z84k11"},
    {"name": "Option B", "priority": 6, "external_id": "bmlpk1"},
    {"name": "Option C", "priority": 7, "external_id": "32290"}
  ]
}
```

> The above returns a success message on success with a 201 response.

```
{
    "success": true
}
```

Add additional options to a single select or multi select custom field.

### HTTP Request

`POST https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
| options | Yes | array | An array of one or many new custom field options.
| name | Yes | string | The name of the new custom field option.  If a new field is added with the same name as an existing custom field option in this custom field, it will be ignored.  No error will be raised in this case.
| priority | Yes | integer | This is used to order the custom fields in Greenhouse.
| external_id | No | string | The external_id for the custom field. Used for integrating with external HRIS.
<br>

**This returns a 201 on success.  It does not return the objects created.


## PATCH: Update Custom Field Options

```shell
curl -X PATCH 'https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options'
-H "Content-Type: application/json"
-H "On-Behalf-Of: {greenhouse user ID}"
-H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "options": [
    {
      "id": 123,
      "name": "Option A",
      "priority": 5,
      "external_id": "3z84k11"
    },
    {
      "id": 234,
      "name": "Option B",
      "priority": 6,
      "external_id": null
    },
    {
      "id": 345,
      "name": "Option C",
      "priority": 7,
      "external_id": "32290"
    }
  ]
}
```

> The above request returns a JSON success message.

```
{
    "success": true
}
```

Update the names or priorities of existing options in a single select or multi select custom field.

### HTTP Request

`PATCH https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
| options | Yes | array | An array of one or many new custom field options.
| id | Yes | integer | The ID of the custom field option that will be updated.
| name | No | string | If included, the custom field option with this ID will be updated to this name.  This can not duplicate the name of any other option in this field or any option in this request.
| priority | No | integer | If included, The custom field option with this ID will be updated with this value.
| external_id | No | string | If included, the custom field option will update its external_id with this value. Passing `null` will clear the external_id.
<br>

## DELETE: Remove Custom Field Options

```shell
curl -X DELETE 'https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options'
  -H "On-Behalf-Of: {greenhouse user ID}"
  -H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6"
```

> The above command takes a JSON request, structured like this:

```json
{
  "option_ids": [
    85709, 85710
  ]
}
```

> The above request is idempotent.  It will return a message with a 200 response and a message stating how many of the IDs were deleted and how many were not found.

```
{
  "message": "3 option(s) deleted. 1 option(s) not found."
}
```

Destroy custom field options

### HTTP Request

`DELETE https://harvest.greenhouse.io/v1/custom_field/{id}/custom_field_options`

### Headers

Header | Description
--------- | -----------
On-Behalf-Of | ID of the user issuing this request. Required for auditing purposes.

### JSON Body Parameters

Parameter | Required | Type | Description
--------- | ----------- | ----------- | -----------
option_ids | Yes | array | An array of the custom field option ids to be removed.

<br>

\* Note this does not return a list of option_ids that were not found. It only returns a number of options that were not processed.  If you were to run the same exact command twice in a row, the only difference would be that on the second run, the message would inform you that an ID was not found.
