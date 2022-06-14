## Emails
Use this endpoint to obtain details, create, update or delete Mautic's emails.

```php
<?php
use Mautic\MauticApi;
use Mautic\Auth\ApiAuth;

// ...
$initAuth = new ApiAuth();
$auth     = $initAuth->newAuth($settings);
$apiUrl   = "https://your-mautic.com";
$api      = new MauticApi();
$emailApi = $api->newApi("emails", $auth, $apiUrl);
```

### Get Email
```php
<?php

//...
$email = $emailApi->get($id);
```
```json
{  
  "email":{  
    "isPublished":true,
    "dateAdded":"2016-10-25T18:51:17+00:00",
    "createdBy":1,
    "createdByUser":"John Doe",
    "dateModified":null,
    "modifiedBy":null,
    "modifiedByUser":null,
    "id":560,
    "name":"test",
    "subject":"API test email",
    "language":"en",
    "category":null,
    "fromAddress":null,
    "fromName":null,
    "replyToAddress":null,
    "bccAddress":null,
    "customHtml":"<h1>Hi there!<\/h1>",
    "plainText":null,
    "template":null,
    "emailType":"list",
    "publishUp":null,
    "publishDown":null,
    "readCount":0,
    "sentCount":0,
    "revision":1,
    "assetAttachments":[],
    "variantStartDate":null,
    "variantSentCount":0,
    "variantReadCount":0,
    "variantParent":null,
    "variantChildren":[],
    "translationParent":null,
    "translationChildren":[],
    "unsubscribeForm":null,
    "dynamicContent":[  
      {  
        "tokenName":null,
        "content":null,
        "filters":[  
          {  
            "content":null,
            "filters":[  
              {  
                "glue":null,
                "field":null,
                "object":null,
                "type":null,
                "operator":null,
                "display":null,
                "filter":null
              }
            ]
          }
        ]
      }
    ],
    "lists":[  
      {  
        "createdByUser":"John Doe",
        "modifiedByUser":null,
        "id":256,
        "name":"test",
        "alias":"test29",
        "description":null
      }
    ]
  }
}
```
Get an individual email by ID.

#### HTTP Request

`GET /emails/ID`

#### Response

`Expected Response Code: 200`

See JSON code example.

**Email Properties**

Name|Type|Description
----|----|-----------
id|int|ID of the email
name|string|Internal name of the email
subject|stringl|Subject of the email
fromAddress|string|The from email address if it's different than the one in the Mautic configuration
fromName|string|The from name if it's different than the one in the Mautic configuration
replyToAddress|string|The reply to email address if it's different than the one in the Mautic configuration
bccAddress|string|The BCC email address if it's different than the one in the Mautic configuration
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the email should be published
publishDown|datetime/null|Date/time the email should be un published
dateAdded|datetime|Date/time email was created
createdBy|int|ID of the user that created the email
createdByUser|string|Name of the user that created the email
dateModified|datetime/null|Date/time email was last modified
modifiedBy|int|ID of the user that last modified the email
modifiedByUser|string|Name of the user that last modified the email
language|string|Language locale of the email
readCount|int|Total email read count
sentCount|int|Total email sent count
revision|int|Email revision
customHtml|string|The HTML content of the email
plainText|string|The plain text content of the email
template|string|The name of the template used as the base for the email
emailType|string|If it is a segment (former list) email or template email. Possible values are 'list' and 'template'
translationChildren|array|Array of Page entities for translations of this landing page
translationParent|object|The parent/main page if this is a translation
variantSentCount|int|Sent count since variantStartDate
variantReadCount|int|Read count since variantStartDate
variantChildren|array|Array of Email entities for variants of this landing email
variantParent|object|The parent/main email if this is a variant (A/B test)
variantSettings|array|The properties of the A/B test
variantStartDate|datetime/null|The date/time the A/B test began
category|object/null|Category information
unsubscribeForm|int|Id of the form displayed in the unsubscribe page
dynamicContent|object|Dynamic content configuration
lists|array|Array of segment IDs which should be added to the segment email
assetAttachments|array|asset IDs Array for email attachment

### List Emails
```php
<?php
// ...

$emails = $emailApi->getList($searchFilter, $start, $limit, $orderBy, $orderByDir, $publishedOnly, $minimal);
```
```json
{
    "total": 1,
    "emails": [
        {  
            "isPublished":true,
            "dateAdded":"2016-10-25T18:51:17+00:00",
            "createdBy":1,
            "createdByUser":"John Doe",
            "dateModified":null,
            "modifiedBy":null,
            "modifiedByUser":null,
            "id":560,
            "name":"test",
            "subject":"API test email",
            "language":"en",
            "category":null,
            "fromAddress":null,
            "fromName":null,
            "replyToAddress":null,
            "bccAddress":null,
            "customHtml":"<h1>Hi there!<\/h1>",
            "plainText":null,
            "template":null,
            "emailType":"list",
            "publishUp":null,
            "publishDown":null,
            "readCount":0,
            "sentCount":0,
            "revision":1,
            "assetAttachments":[],
            "variantStartDate":null,
            "variantSentCount":0,
            "variantReadCount":0,
            "variantParent":null,
            "variantChildren":[],
            "translationParent":null,
            "translationChildren":[],
            "unsubscribeForm":null,
            "dynamicContent":[  
              {  
                "tokenName":null,
                "content":null,
                "filters":[  
                  {  
                    "content":null,
                    "filters":[  
                      {  
                        "glue":null,
                        "field":null,
                        "object":null,
                        "type":null,
                        "operator":null,
                        "display":null,
                        "filter":null
                      }
                    ]
                  }
                ]
              }
            ],
            "lists":[  
              {  
                "createdByUser":"John Doe",
                "modifiedByUser":null,
                "id":256,
                "name":"test",
                "alias":"test29",
                "description":null
              }
            ]
          }
    ]
}
```
#### HTTP Request

`GET /emails`

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

Same as [Get Email](#get-email).

### Create Email
```php
<?php 

$data = array(
    'title'        => 'Email A',
    'description' => 'This is my first email created via API.',
    'isPublished' => 1
);

$email = $emailApi->create($data);
```
Create a new email.

#### HTTP Request

`POST /emails/new`

**Post Parameters**

Name|Type|Description
----|----|-----------
id|int|ID of the email
name|string|Internal name of the email
subject|stringl|Subject of the email
fromAddress|string|The from email address if it's different than the one in the Mautic configuration
fromName|string|The from name if it's different than the one in the Mautic configuration
replyToAddress|string|The reply to email address if it's different than the one in the Mautic configuration
bccAddress|string|The BCC email address if it's different than the one in the Mautic configuration
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the email should be published
publishDown|datetime/null|Date/time the email should be un published
language|string|Language locale of the email
readCount|int|Total email read count
sentCount|int|Total email sent count
revision|int|Email revision
customHtml|string|The HTML content of the email
plainText|string|The plain text content of the email
template|string|The name of the template used as the base for the email
emailType|string|If it is a segment (former list) email or template email. Possible values are 'list' and 'template'
translationChildren|array|Array of Page entities for translations of this landing page
translationParent|object|The parent/main page if this is a translation
variantSentCount|int|Sent count since variantStartDate
variantReadCount|int|Read count since variantStartDate
variantChildren|array|Array of Email entities for variants of this landing email
variantParent|object|The parent/main email if this is a variant (A/B test)
variantSettings|array|The properties of the A/B test
variantStartDate|datetime/null|The date/time the A/B test began
category|object/null|Category information
unsubscribeForm|int|Id of the form displayed in the unsubscribe page
dynamicContent|object|Dynamic content configuration
lists|array|Array of segment IDs which should be added to the segment email

#### Response

`Expected Response Code: 201`

**Properties**

Same as [Get Email](#get-email).

### Edit Email
```php
<?php

$id   = 1;
$data = array(
    'title'        => 'New email title',
    'isPublished' => 0
);

// Create new a email of ID 1 is not found?
$createIfNotFound = true;

$email = $emailApi->edit($id, $data, $createIfNotFound);
```
Edit a new email. Note that this supports PUT or PATCH depending on the desired behavior.

**PUT** creates a email if the given ID does not exist and clears all the email information, adds the information from the request.
**PATCH** fails if the email with the given ID does not exist and updates the email field values with the values form the request.

#### HTTP Request

To edit a email and return a 404 if the email is not found:

`PATCH /emails/ID/edit`

To edit a email and create a new one if the email is not found:

`PUT /emails/ID/edit`

**Post Parameters**

Name|Type|Description
----|----|-----------
id|int|ID of the email
name|string|Internal name of the email
subject|stringl|Subject of the email
fromAddress|string|The from email address if it's different than the one in the Mautic configuration
fromName|string|The from name if it's different than the one in the Mautic configuration
replyToAddress|string|The reply to email address if it's different than the one in the Mautic configuration
bccAddress|string|The BCC email address if it's different than the one in the Mautic configuration
isPublished|bool|Published state
publishUp|datetime/null|Date/time when the email should be published
publishDown|datetime/null|Date/time the email should be un published
language|string|Language locale of the email
readCount|int|Total email read count
sentCount|int|Total email sent count
revision|int|Email revision
customHtml|string|The HTML content of the email
plainText|string|The plain text content of the email
template|string|The name of the template used as the base for the email
emailType|string|If it is a segment (former list) email or template email. Possible values are 'list' and 'template'
translationChildren|array|Array of Page entities for translations of this landing page
translationParent|object|The parent/main page if this is a translation
variantSentCount|int|Sent count since variantStartDate
variantReadCount|int|Read count since variantStartDate
variantChildren|array|Array of Email entities for variants of this landing email
variantParent|object|The parent/main email if this is a variant (A/B test)
variantSettings|array|The properties of the A/B test
variantStartDate|datetime/null|The date/time the A/B test began
category|object/null|Category information
unsubscribeForm|int|Id of the form displayed in the unsubscribe page
dynamicContent|object|Dynamic content configuration
lists|array|Array of segment IDs which should be added to the segment email

#### Response

If `PUT`, the expected response code is `200` if the email was edited or `201` if created.

If `PATCH`, the expected response code is `200`.

**Properties**

Same as [Get Email](#get-email).

### Delete Email
```php
<?php

$email = $emailApi->delete($id);
```
Delete a email.

#### HTTP Request

`DELETE /emails/ID/delete`

#### Response

`Expected Response Code: 200`

**Properties**

Same as [Get Email](#get-email).

### Send Email to Contact
```php
<?php

$email = $emailApi->sendToContact($emailId, $contactId);
```
Send a predefined email to existing contact.

Assets can be referenced for attaching documents (either ids of existing assets or ids returned by the [Create Asset](https://github.com/mautic/developer-documentation/blob/master/source/includes/_api_endpoint_assets.md#create-asset)).

#### HTTP Request

`POST /emails/ID/contact/CONTACT_ID/send`

**Post Parameters**

Name|Type|Description
----|----|-----------
tokens|array|Array of tokens in email
assetAttachments|array|Array of asset ids

#### Response

`Expected Response Code: 200`

**Properties**
```json
{
    "success": 1
}
```

### Send Email to Segment
```php
<?php

$email = $emailApi->send($id);
```
Send a segment email to linked segment(s).

#### HTTP Request

`POST /emails/ID/send`

#### Response

`Expected Response Code: 200`

**Properties**
```json
{
    "success": 1,
    "sentCount": 1,
    "failedCount": 0
}
```

### Create a reply to a send email send row

This endpoint can create a record that a specific email stat row received a reply. It will also mark an email send stat as read.

#### HTTP Request

`POST /emails/reply/TRACKING_HASH`

Tracking hash is created as unique hash for each email send stat record.

#### Response

`Expected Response Code: 200`

**Properties**
```json
{
    "success": 1,
}
```
