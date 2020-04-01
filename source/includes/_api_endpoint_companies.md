## Companies
Use this endpoint to obtain details on Mautic's companies or to manipulate contact-company memberships.

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth   = new ApiAuth();
$auth       = $initAuth->newAuth($settings);
$apiUrl     = "https://your-mautic.com";
$api        = new MauticApi();
$companyApi = $api->newApi("companies", $auth, $apiUrl);
```

### Get Company
```php
<?php

//...
$company = $companyApi->get($id);
```
```json
{  
    "company":{  
        "isPublished":true,
        "dateAdded":"2016-10-25T09:46:36+00:00",
        "createdBy":1,
        "createdByUser":"John Doe",
        "dateModified":null,
        "modifiedBy":null,
        "modifiedByUser":null,
        "id":176,
        "fields":{  
            "core":{  
                "companywebsite":{  
                    "id":"91",
                    "label":"Website",
                    "alias":"companywebsite",
                    "type":"url",
                    "group":"core",
                    "field_order":"8",
                    "object":"company",
                    "value":null
                },
                [...]
            },
            "professional":{  
                "companyannual_revenue":{  
                    "id":"90",
                    "label":"Annual Revenue",
                    "alias":"companyannual_revenue",
                    "type":"number",
                    "group":"professional",
                    "field_order":"10",
                    "object":"company",
                    "value":null
                },
                [...]
            },
            "other":[],
            "all":{  
                "companywebsite":null,
                "companycountry":null,
                "companyzipcode":null,
                "companystate":null,
                "companycity":"Raleigh",
                "companyphone":null,
                "companyemail":"test@company.com",
                "companyaddress2":null,
                "companyaddress1":null,
                "companyname":"test",
                "companyannual_revenue":null,
                "companyfax":null,
                "companynumber_of_employees":null,
                "companydescription":null
            }
        }
    }
}
```
Get an individual company by ID.

#### HTTP Request

`GET /companies/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Company Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the company
isPublished|boolean|Whether the company is published
dateAdded|datetime|Date/time company was created
createdBy|int|ID of the user that created the company
createdByUser|string|Name of the user that created the company
dateModified|datetime/null|Date/time company was last modified
modifiedBy|int|ID of the user that last modified the company
modifiedByUser|string|Name of the user that last modified the company
fields|array|Custom fields for the company

### List Contact Companies

```php
<?php

//...
$companies = $companyApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{
  "total": 13,
  "companies": {
    "176": {  
      "isPublished":true,
      "dateAdded":"2016-10-25T09:46:36+00:00",
      "createdBy":1,
      "createdByUser":"John Doe",
      "dateModified":null,
      "modifiedBy":null,
      "modifiedByUser":null,
      "id":176,
      "fields":{  
        "core":{  
            "companywebsite":{  
                "id":"91",
                "label":"Website",
                "alias":"companywebsite",
                "type":"url",
                "group":"core",
                "field_order":"8",
                "object":"company",
                "value":null
            },
            [...]
        },
        "professional":{  
            "companyannual_revenue":{  
                "id":"90",
                "label":"Annual Revenue",
                "alias":"companyannual_revenue",
                "type":"number",
                "group":"professional",
                "field_order":"10",
                "object":"company",
                "value":null
            },
            [...]
        },
        "other":[],
        "all":{  
            "companywebsite":null,
            "companycountry":null,
            "companyzipcode":null,
            "companystate":null,
            "companycity":"Raleigh",
            "companyphone":null,
            "companyemail":"test@company.com",
            "companyaddress2":null,
            "companyaddress1":null,
            "companyname":"test",
            "companyannual_revenue":null,
            "companyfax":null,
            "companynumber_of_employees":null,
            "companydescription":null
        }
    }
  },
  [...]
  }
}
```
Returns a list of contact companies available to the user. This list is not filterable.

#### HTTP Request

`GET /companies`

** Query Parameters **

Name|Description
----|-----------
search|String or search command to filter entities by.
start|Starting row for the entities returned. Defaults to 0.
limit|Limit number of entities to return. Defaults to the system configuration for pagination (30).
orderBy|Column to sort by. Can use any column listed in the response.
orderByDir|Sort direction: asc or desc.

#### Response

`Expected Response Code: 200`

See JSON code example.

**Company Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the company
isPublished|boolean|Whether the company is published
dateAdded|datetime|Date/time company was created
createdBy|int|ID of the user that created the company
createdByUser|string|Name of the user that created the company
dateModified|datetime/null|Date/time company was last modified
modifiedBy|int|ID of the user that last modified the company
modifiedByUser|string|Name of the user that last modified the company
fields|array|Custom fields for the company

### Create Company
```php
<?php

$data = array(
    'companyname' => 'test',
    'companyemail' => 'test@company.com',
    'companycity' => 'Raleigh',
    'overwriteWithBlank' => true
);

$company = $companyApi->create($data);
```
Create a new company.

#### HTTP Request

`POST /companies/new`

**Post Parameters**

Name|Description
----|-----------
companyname|Company name is the only required field. Other company fields can be sent with a value
isPublished|A value of 0 or 1
overwriteWithBlank|If true, then empty values are set to fields. Otherwise empty values are skipped

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Company](#get-company).

### Edit Company
```php
<?php

$id   = 1;
$data = array(
    'companyname' => 'test',
    'companyemail' => 'test@company.com',
    'companycity' => 'Raleigh',
);

// Create new a company of ID 1 is not found?
$createIfNotFound = true;

$company = $companyApi->edit($id, $data, $createIfNotFound);
```
Edit a new company. Note that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a company if the given ID does not exist and clears all the company information, adds the information from the request.
**PATCH** fails if the company with the given ID does not exist and updates the company field values with the values form the request.

#### HTTP Request

To edit a company and return a 404 if the company is not found:

`PATCH /companies/ID/edit`

To edit a company and create a new one if the company is not found:

`PUT /companies/ID/edit`

**Post Parameters**

Name|Description
----|-----------
companyname|Company name is the only required field. Other company fields can be sent with a value
isPublished|A value of 0 or 1
overwriteWithBlank|If true, then empty values are set to fields. Otherwise empty values are skipped

#### Response

If `PUT`, the expected response code is `200` if the company was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Company](#get-company).

### Delete Company
```php
<?php

$company = $companyApi->delete($id);
```
Delete a company.

#### HTTP Request

`DELETE /companies/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Company](#get-company).


### Add Contact to a Company

```php
<?php

//...
$response = $companyApi->addContact($companyId, $contactId);
if (!isset($response['success'])) {
    // handle error
}
```
```json
{
    "success": true
}
```

Manually add a contact to a specific company.

#### HTTP Request

`POST /companies/COMPANY_ID/contact/CONTACT_ID/add`

#### Response

`Expected Response Code: 200`

See JSON code example.


### Remove Contact from a Company

```php
<?php

//...
$response = $companyApi->removeContact($contactId, $companyId);
if (empty($response['success'])) {
    // handle error
}
```
```json
{
    "success": true
}
```

Manually remove a contact to a specific company.

#### HTTP Request

`POST /companies/COMPANY_ID/contact/CONTACT_ID/remove`

#### Response

`Expected Response Code: 200`

See JSON code example.
