## Forms
Use this endpoint to obtain details on Mautic's forms.

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth = new ApiAuth();
$auth     = $initAuth->newAuth($settings);
$apiUrl   = "https://your-mautic.com";
$api      = new MauticApi();
$formApi  = $api->newApi("forms", $auth, $apiUrl);
```

### Get Form
```php
<?php

//...
$form = $formApi->get($id);
```
```json
{
    "form": {
        "id": 3,
        "name": "Newlsetter",
        "alias": "newsletter",
        "description": null,
        "isPublished": true,
        "publishUp": null,
        "publishDown": null,
        "dateAdded": "2015-07-15T15:06:02-05:00",
        "createdBy": 1,
        "createdByUser": "Joe Smith",
        "dateModified": "2015-07-20T13:11:56-05:00",
        "modifiedBy": 1,
        "modifiedByUser": "Joe Smith",
        "category": null,
        "cachedHtml": "\n\n<script...",
        "template": null,
        "fields": {
            "26": {
                "id": 26,
                "label": "Email",
                "showLabel": false,
                "alias": "email",
                "type": "text",
                "defaultValue": null,
                "isRequired": true,
                "validationMessage": "Email is required",
                "helpMessage": null,
                "order": 1,
                "properties": {
                    "placeholder": "Email address"
                },
                "labelAttributes": null,
                "inputAttributes": null,
                "containerAttributes": null
            },
            "27": {
                "id": 27,
                "label": "Submit",
                "showLabel": true,
                "alias": "submit",
                "type": "button",
                "defaultValue": null,
                "isRequired": false,
                "validationMessage": null,
                "helpMessage": null,
                "order": 4,
                "properties": [],
                "labelAttributes": null,
                "inputAttributes": null,
                "containerAttributes": null
            }
        },
        "actions": {
            "4": {
                "id": 4,
                "type": "email.send.lead",
                "name": "Send thank you email",
                "description": null,
                "order": 1,
                "properties": {
                    "email": 21
                }
            }
        }
    }
}
```
Get an individual form by ID.

#### HTTP Request

`GET /forms/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Form Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the form
name|string|Name of the form
description|string/null|Description of the form
alias|string|Used to generate the URL for the form
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the form should be published
publishDown|datetime/null|Date/time the form should be un published
dateAdded|datetime|Date/time form was created
createdBy|int|ID of the user that created the form
createdByUser|string|Name of the user that created the form
dateModified|datetime/null|Date/time form was last modified
modifiedBy|int|ID of the user that last modified the form
modifiedByUser|string|Name of the user that last modified the form
cachedHtml|string|Cached HTML for the form
template|string/null|Name of the template used to generate the HTML
fields|array|Array of Field entities for the form. See below.
actions|array|Array of Action entities for the form. See below.

**Field Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the field
label|string|Label of the field
showLabel|bool|Display the label of the field
alias|string|Alias of the field (used as the database column)
type|string|Field type
defaultValue|string|Default value
isRequired|bool|Field is required
validationMessage|string|Validation message if required field is left empty
helpMessage|string|Help message for the field
order|int|Order of the field
properties|array|Configured properties for the field
labelAttributes|string/null|Custom HTML attributes for the label
inputAttributes|Custom HTML attributes for the input
containerAttributes|Custom HTML attributes for the container

**Action Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the action
type|string|Action type
name|string|Name of the action
description|string/null|Description of the action
order|int|Action order
properties|array|Configured properties for the action

### List Forms
```php
<?php
// ...

$forms = $formApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{
    "total": 1,
    "forms": [
        {
            "id": 3,
            "name": "Newlsetter",
            "alias": "newsletter",
            "description": null,
            "isPublished": true,
            "publishUp": null,
            "publishDown": null,
            "dateAdded": "2015-07-15T15:06:02-05:00",
            "createdBy": 1,
            "createdByUser": "Joe Smith",
            "dateModified": "2015-07-20T13:11:56-05:00",
            "modifiedBy": 1,
            "modifiedByUser": "Joe Smith",
            "category": null,
            "cachedHtml": "\n\n<script...",
            "template": null,
            "fields": {
                "26": {
                    "id": 26,
                    "label": "Email",
                    "showLabel": false,
                    "alias": "email",
                    "type": "text",
                    "defaultValue": null,
                    "isRequired": true,
                    "validationMessage": "Email is required",
                    "helpMessage": null,
                    "order": 1,
                    "properties": {
                        "placeholder": "Email address"
                    },
                    "labelAttributes": null,
                    "inputAttributes": null,
                    "containerAttributes": null
                },
                "27": {
                    "id": 27,
                    "label": "Submit",
                    "showLabel": true,
                    "alias": "submit",
                    "type": "button",
                    "defaultValue": null,
                    "isRequired": false,
                    "validationMessage": null,
                    "helpMessage": null,
                    "order": 4,
                    "properties": [],
                    "labelAttributes": null,
                    "inputAttributes": null,
                    "containerAttributes": null
                }
            },
            "actions": {
                "4": {
                    "id": 4,
                    "type": "email.send.lead",
                    "name": "Send thank you email",
                    "description": null,
                    "order": 1,
                    "properties": {
                        "email": 21
                    }
                }
            }
        }
    ]
}
```
#### HTTP Request

`GET /forms`

**Query Parameters**

Name|Description
----|-----------
search|String or search command to filter entities by.
start|Starting row for the entities returned. Defaults to 0.
limit|Limit number of entities to return. Defaults to the system configuration for pagination (30).
orderBy|Column to sort by. Can use any column listed in the response.
orderByDir|Sort direction: asc or desc.
publishedOnly|Only return currently published entities.
minimal|Return only array of entities without additional lists in it.

#### Response

`Expected Response Code: 200`

See JSON code example.

**Properties**

Same as [Get Form](#get-form).

### Create Form
```php
<?php

$data = array(
    'name' => 'test',
    'formType' => 'standalone',
    'description' => 'API test',
    'fields' => array(
        array(
            'label' => 'field name',
            'type' => 'text'
        )
    ),
    'actions' => array(
        array(
            'name' => 'action name',
            'description' => 'action desc',
            'type' => 'lead.pointschange',
            'properties' => array(
                'operator' => 'plus',
                'points' => 2
            )
        )
    )
);

$form = $formApi->create($data);
```
Create a new form.

#### HTTP Request

`POST /forms/new`

**Post Parameters**

Same as [Get Form](#get-form). Form fields and actions can be created/edited via the forms/actions arrays in the form array.

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Form](#get-form).

### Edit Form
```php
<?php

$id   = 1;
$data = array(
    'name' => 'test',
    'formType' => 'standalone',
    'description' => 'API test',
    'fields' => array(
        array(
            'label' => 'A field that will be added',
            'type' => 'text'
        ),
        array(
            'id' => 1,
            'label' => 'A field that will be edited',
            'type' => 'text'
        )
    ),
    'actions' => array(
        array(
            'name' => 'action name',
            'description' => 'action desc',
            'type' => 'lead.pointschange',
            'properties' => array(
                'operator' => 'plus',
                'points' => 2
            )
        )
    )
);

// Create new a form of ID 1 is not found?
$createIfNotFound = true;

$form = $formApi->edit($id, $data, $createIfNotFound);
```
Edit a new form. Note that this supports PUT or PATCH depending on the desired behavior.

Make sure that whenever you want to edit a form field that you include the form field id in the request. Fields without an id are assumed to be new fields.

**PUT** creates a form if the given ID does not exist and clears all the form information, adds the information from the request. Form fields and actions will be also deleted if not present in the request.
**PATCH** fails if the form with the given ID does not exist and updates the form field values with the values form the request.

#### HTTP Request

To edit a form and return a 404 if the form is not found:

`PATCH /forms/ID/edit`

To edit a form and create a new one if the form is not found:

`PUT /forms/ID/edit`

**Post Parameters**

Same as [Get Form](#get-form). Form fields and actions can be created/edited via the forms/actions arrays in the form array.

#### Response

If `PUT`, the expected response code is `200` if the form was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Form](#get-form).

### Delete Form
```php
<?php

$form = $formApi->delete($id);
```
Delete a form.

#### HTTP Request

`DELETE /forms/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Form](#get-form).

### Delete Form Fields

The following examples will show how to delete fields with ID 56 and 59.

```php
<?php

$form = $formApi->deleteFields($formId, array(56, 59));
```
Delete a form fields.

#### HTTP Request

`DELETE /forms/ID/fields/delete?fields[]=56&fields[]=59`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Form](#get-form).

### Delete Form Actions

The following examples will show how to delete actions with ID 56 and 59.

```php
<?php

$form = $formApi->deleteActions($formId, array(56, 59));
```
Delete a form actions.

#### HTTP Request

`DELETE /forms/ID/actions/delete?actions[]=56&actions[]=59`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Form](#get-form).

### List Form Submissions
```php
<?php

$submissions = $formApi->getSubmissions($formId, $searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{
  "total": "1",
  "submissions": [
    {
      "id": 1,
      "ipAddress": {
        "ip": "127.0.0.1"
      },
      "form": {
        "id": 25,
        "name": "test",
        "alias": "test",
        "category": null
      },
      "lead": {
        "id": 2183,
        "points": 0,
        "color": null,
        "title": null,
        "firstname": null,
        "lastname": null,
        "company": null,
        "position": null,
        "email": "test@test.test",
        "phone": null,
        "mobile": null,
        "address1": null,
        "address2": null,
        "city": null,
        "state": null,
        "zipcode": null,
        "timezone": null,
        "country": null
      },
      "trackingId": null,
      "dateSubmitted": "2017-07-17T09:52:29+00:00",
      "referer": "http:\/\/mautic.dev\/s\/forms\/preview\/25",
      "page": null,
      "results": {
        "email": "test@test.test"
      }
    }
  ]
}
```
#### HTTP Request

`GET /forms/FORM_ID/submissions`

**Query Parameters**

Name|Description
----|-----------
formId|ID of the form you want to get submissions for
search|String or search command to filter entities by.
start|Starting row for the entities returned. Defaults to 0.
limit|Limit number of entities to return. Defaults to the system configuration for pagination (30).
orderBy|Column to sort by. Can use any column listed in the response, also can use column of joined table with prefix. Sort by submitted date is `s.date_submitted`
orderByDir|Sort direction: asc or desc.
publishedOnly|Only return currently published entities.
minimal|Return only array of entities without additional lists in it.

#### Response

`Expected Response Code: 200`

See JSON code example.

**Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the submission
ipAddress|array|Associative array containing IP address of the client who made the submission
form|array|Simplified associative array of the form containing id, name, alias and category
lead|array|Associative array of the lead containing the core values as well as custom fields
dateSubmitted|string|Date time string holding the UTC date and time when the submission was made
referer|string|HTTP referer info
results|array|Associative array of the form fields as the keys and submission values

### List Form Submissions for a contact
```php
<?php

$submissions = $formApi->getSubmissionsForContact($formId, $contactId, $searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```

#### HTTP Request

`GET /forms/FORM_ID/submissions/contact/CONTACT_ID`

Response and properties same as [Get Form Submissions](#get-form-submissions). Parameters too except the ContactId was added.

### Get Form Submission
```php
<?php

//...
$form = $formApi->getSubmission($formId, $submissionId);
```
```json
{
  "submission": {
    "id": 1,
    "ipAddress": {
      "ip": "127.0.0.1"
    },
    "form": {
      "id": 25,
      "name": "test",
      "alias": "test",
      "category": null
    },
    "lead": {
      "id": 2183,
      "points": 0,
      "color": null,
      "title": null,
      "firstname": null,
      "lastname": null,
      "company": null,
      "position": null,
      "email": "test@test.test",
      "phone": null,
      "mobile": null,
      "address1": null,
      "address2": null,
      "city": null,
      "state": null,
      "zipcode": null,
      "timezone": null,
      "country": null
    },
    "trackingId": null,
    "dateSubmitted": "2017-07-17T09:52:29+00:00",
    "referer": "http:\/\/mautic.dev\/s\/forms\/preview\/25",
    "page": null,
    "results": {
      "form_id": "25",
      "email": "test@test.test"
    }
  }
}
```
Get an individual form submission by ID.

#### HTTP Request

`GET /forms/FORM_ID/submissions/SUBMISSION_ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Form Properties**

Same as [Get Form Submissions](#get-form-submissions).

