## Pages
Use this endpoint to obtain details on Mautic's landing pages.

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth = new ApiAuth();
$auth     = $initAuth->newAuth($settings);
$apiUrl   = "https://your-mautic.com";
$api      = new MauticApi();
$pageApi  = $api->newApi("pages", $auth, $apiUrl);
```

### Get Page
```php
<?php

//...
$page = $pageApi->get($id);
```
```json
{
    "page": {
        "id": 3,
        "title": "Webinar Landing Page",
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
        "category": "Events",
        "language": "en",
        "template": "blank",
        "customHtml": "<!DOCTYPE ...",
        "hits": 0,
        "uniqueHits": 0,
        "variantHits": 0,
        "revision": 1,
        "metaDescription": null,
        "redirectType": null,
        "redirectUrl": null,
        "translationChildren": [],
        "translationParent": null,
        "variantChildren": [],
        "variantParent": null,
        "variantSettings": [],
        "variantStartDate": null
    }
}
```
Get an individual page by ID.

#### HTTP Request

`GET /pages/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Page Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the page
title|string|Title of the page
description|string/null|Description of the page
alias|string|Used to generate the URL for the page
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the page should be published
publishDown|datetime/null|Date/time the page should be un published
dateAdded|datetime|Date/time page was created
createdBy|int|ID of the user that created the page
createdByUser|string|Name of the user that created the page
dateModified|datetime/null|Date/time page was last modified
modifiedBy|int|ID of the user that last modified the page
modifiedByUser|string|Name of the user that last modified the page
language|string|Language locale of the page
template|string|Template of the page
customHtml|string|Static HTML of the page
hits|int|Total page hit count
uniqueHits|int|Unique page hit count
revision|int|Page revision
metaDescription|Meta description for the page's <head>
redirectType|int|If unpublished, redirect with 301 or 302
redirectUrl|string|If unpublished, the URL to redirect to if redirectType is set
translationChildren|array|Array of Page entities for translations of this landing page
translationParent|object|The parent/main page if this is a translation
variantHits|Hit count since variantStartDate
variantChildren|array|Array of Page entities for variants of this landing page
variantParent|object|The parent/main page if this is a variant (A/B test)
variantSettings|array|The properties of the A/B test
variantStartDate|datetime/null|The date/time the A/B test began

### List Pages
```php
<?php
// ...

$pages = $pageApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{
    "total": 1,
    "pages": [
        {
            "id": 3,
            "title": "Webinar Landing Page",
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
            "category": "Events",
            "language": "en",
            "template": "blank",
            "hits": 0,
            "uniqueHits": 0,
            "variantHits": 0,
            "revision": 1,
            "metaDescription": null,
            "redirectType": null,
            "redirectUrl": null,
            "translationChildren": [],
            "translationParent": null,
            "variantChildren": [],
            "variantParent": null,
            "variantSettings": [],
            "variantStartDate": null
        }
    ]
}
```
#### HTTP Request

`GET /pages`

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

Same as [Get Page](#get-page).

### Create Page
```php
<?php

$data = array(
    'title'        => 'Page A',
    'description' => 'This is my first page created via API.',
    'isPublished' => 1
);

$page = $pageApi->create($data);
```
Create a new page.

#### HTTP Request

`POST /pages/new`

**Post Parameters**

Name|Description
----|-----------
title|Page title is the only required field
alias|string|Used to generate the URL for the page
description|A description of the page.
isPublished|A value of 0 or 1
language|string|Language locale of the page
metaDescription|Meta description for the page's <head>
redirectType|int|If unpublished, redirect with 301 or 302
redirectUrl|string|If unpublished, the URL to redirect to if redirectType is set

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Page](#get-page).

### Edit Page
```php
<?php

$id   = 1;
$data = array(
    'title'        => 'New page title',
    'isPublished' => 0
);

// Create new a page of ID 1 is not found?
$createIfNotFound = true;

$page = $pageApi->edit($id, $data, $createIfNotFound);
```
Edit a new page. Note that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a page if the given ID does not exist and clears all the page information, adds the information from the request.
**PATCH** fails if the page with the given ID does not exist and updates the page field values with the values form the request.

#### HTTP Request

To edit a page and return a 404 if the page is not found:

`PATCH /pages/ID/edit`

To edit a page and create a new one if the page is not found:

`PUT /pages/ID/edit`

**Post Parameters**

Name|Description
----|-----------
title|Page title is the only required field
alias|Name alias generated automatically if not set
description|A description of the page.
isPublished|A value of 0 or 1
language|string|Language locale of the page
metaDescription|Meta description for the page's <head>
redirectType|int|If unpublished, redirect with 301 or 302
redirectUrl|string|If unpublished, the URL to redirect to if redirectType is set

#### Response

If `PUT`, the expected response code is `200` if the page was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Page](#get-page).

### Delete Page
```php
<?php

$page = $pageApi->delete($id);
```
Delete a page.

#### HTTP Request

`DELETE /pages/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Page](#get-page).
