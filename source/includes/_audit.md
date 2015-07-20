# Audit Format

This section describes the complete audit response format.

##Top Level Audit Data
```json
{
  "audit_id": "audit_50BA581235704A368D025056A583AA8B",
  "template_id": "template_4183BCC822F146D3BE542118D3F15971",
  "audit_data": {},
  "template_data": {},
  "assets": [{}],
  "header_items": [{}],
  "items": [{}]
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`audit_id`                    | String            | A String containing the audit's ID
`template_id`                 | String            | String ID of the parent template
`audit_data`                  | Object            | JSON Object containing general information about the audit
`template_data`               | Object            | JSON Object containing some information on the template
`assets`                      | Array             | JSON Array containing the assets within the template
`header_items`                | Array             | JSON Array of JSON Objects containing Header Items
`items`                       | Array             | JSON Array of JSON Objects containing items in all sections after the header

##Audit Data

###Root
```json
{
  "audit_data": {
    "score": 10,
    "date_completed": "2015-06-04T02:38:02.000Z",
    "name": "title",
    "date_modified": "2015-06-04T02:38:11.000Z",
    "duration": 224,
    "authorship": {},
    "date_started": "2015-06-04T02:34:25.000Z",
    "total_score": 21
  }
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`name`                        | String            | String name of the audit
`score`                       | Double            | A double of the current score of the audit
`total_score`                 | Double            | A double of the total score for the audit
`date_started`                | String            | A long of the date that the audit was started
`date_modified`               | String            | A long of the date that the audit was last modified
`date_completed`              | String            | A long of the date the audit was completed
`authorship`                  | Object            | A JSON Object containing information on the authorship of the audit


###Authorship
```json
{
  "authorship": {
    "owner": {},
    "device_id": "81A34706-7417-4D6F-8C61-50AC2C814755",
    "author": {}
  }
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`author`                      | Object            | A JSON Object containing some information about the author of the document
`owner`                       | Object            | A JSON Object containing some information about the owner of the document
`device_id`                   | String            | A string containing the device's ID

###Person
```json
{
  "author": {
    "id": "",
    "name": "Brett Porter",
    "context": ""
  }
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`id`                          | String            | A string containing the ID of the templates author
`name`                        | String            | A string containing the name of the templates author
`context`                     | String            | A string containing the context of a templates author

##Template Data
###Root
```json
{
  "media": {},
  "metadata": {},
  "authorship": {},
  "response_sets": {}
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`media`                       | Object            | JSON Object containing all media items stored within the template
`metadata`                    | Object            | JSON Object containing some data about the Template
`authorship`                  | Object            | JSON Object containing information about the author of the template
`response_sets`               | Object            | JSON Object containing the response sets attached to the template

###Response Sets
```json
{
  "id": "",
  "responses": []
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`id`                          | Object            | ID of the response set
`responses`                   | Array             | Array of response set items

###Response Sets Response
```json
{
  "id": "",
  "colour": "",
  "enable_score": "",
  "image": "",
  "label": "",
  "short_label": "",
  "score": ""
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`id`                          | String            | ID of the response set
`colour`                      | String            | Color of the response button
`enable_score`                | Boolean           | If Score is enabled
`image`                       | Array             | Array of string IDs
`label`                       | String            | Label of the response (eg. 'Yes')
`short_label`                 | String            | Short label of the response (eg. 'Y')
`score`                       | Number            | Score of the response

###Meta Data
```json
{
  "name": "name",
  "description": "description",
  "industry": 1,
  "subindustry": 2,
  "image": "123f23fad5f4sdfv4s7df65v46",
  "doc_no": "12",
  "doc_no_prefix": "a",
  "doc_no_suffix": "b"
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`name`                        | String            | A string containing the templates name
`description`                 | String            | A string containing the templates description
`industry`                    | Integer           | An Integer used to identify the selected industry
`subindustry`                 | Integer           | An Integer used to identify the selected sub industry
`image`                       | String            | A string containing the image ID
`doc_no`                      | String            | A string containing the document number
`doc_no_prefix`               | String            | A string containing the prefix of the document number
`doc_no_suffix`               | String            | A string containing the suffix of the document number

##Audit Items
### Root
```json
{
  "label": "",
  "item_id": "",
  "action_item_profile_id": "",
  "type": "",
  "parent_id": "",
  "options": {},
  "responses": {},
  "media": {},
  "children": {},
  "scoring": {}
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`label`                       | String            |
`item_id`                     | String            |
`action_item_profile_id`      | String            |
`type`                        | String            |
`parent_id`                   | String            |
`options`                     | Object            |
`responses`                   | Object            |
`media`                       | Object            |
`children`                    | Object            |
`scoring`                     | Object            |


### Options
```json
{
  "options": {
    "assets": [],
    "computed_field": "",
    "condition": "",
    "element": "",
    "enable_date": true,
    "enable_signature_timestamp": true,
    "enable_time": true,
    "hide_barcode": true,
    "increment": 1,
    "is_mandatory": true,
    "label": "",
    "link": "",
    "locked": true,
    "max": 4,
    "media": {},
    "media_visible_in_report": true,
    "min": 2,
    "multi_selection": true,
    "multiple_selection": true,
    "required": true,
    "response_set": "",
    "secure": "",
    "type": "",
    "url": "",
    "values": [],
    "visible_in_audit": true,
    "visible_in_report": true,
    "weighting": 1
  }
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`assets`                      | String            |
`computed_field`              | String            |
`condition`                   | String            |
`element`                     | String            |
`enable_date`                 | String            | Toggles the date portion of an item containing a datetime
`enable_signature_timestamp`  | String            | Toggles the timestamp set when filling in a signature field
`enable_time`                 | String            | Toggles the time portion of an item containing a datetime
`hide_barcode`                | String            |
`increment`                   | String            | Controls the increment jumps in slider items
`is_mandatory`                | String            | Toggles whether the item has to have a response before the audit can be completed
`label`                       | String            |
`link`                        | String            | URL field in information items
`locked`                      | String            | Toggles whether an asset item has been locked
`max`                         | String            | Maximum value for a slider item
`media`                       | String            |
`media_visible_in_report`     | String            |
`min`                         | String            | Minimum value for a slider item
`multi_selection`             | String            |
`multiple_selection`          | String            |
`required`                    | String            |
`response_set`                | String            |
`secure`                      | String            |
`type`                        | String            | The type of an information field. Currently text, media or link
`url`                         | String            | *DEPRECATED - use link* URL field in information items
`values`                      | String            | The item's response
`visible_in_audit`            | String            |
`visible_in_report`           | String            |
`weighting`                   | String            | The weight used for generating audit scores

### Responses
```json
{
  "text": "",
  "value": "",
  "name": "",
  "timestamp": "",
  "datetime": "",
  "location_text": "",
  "location": {},
  "selected": [],
  "weather": {}
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`text`                        | String            |
`value`                       | String            |
`name`                        | String            |
`timestamp`                   | String            |
`datetime`                    | String            |
`location_text`               | String            |
`location`                    | Object            |
`selected`                    | Array             |
`weather`                     | Object            |

### Scoring
```json
{
  "scoring": {
    "score": 5,
    "max_score": 10,
    "combined_score": 6,
    "combined_max_score": 12
  }
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`score`                       | Number            |
`max_score`                   | Number            |
`combined_score`              | Number            |
`combined_max_score`          | Number            |

## Location
```json
{
  "location": {
    "iso_country_code": "",
    "administrative_area": "",
    "name": "",
    "thoroughfare": "",
    "locality": "",
    "country": "",
    "sub_administrative_area": "",
    "postal_code": "",
    "formatted_address": [""],
    "sub_locality": "",
    "sub_thoroughfare": "",
    "geometry": {}
  }
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`iso_country_code`            | String            |
`administrative_area`         | String            |
`name`                        | String            |
`thoroughfare`                | String            |
`locality`                    | String            |
`country`                     | String            |
`sub_administrative_area`     | String            |
`postal_code`                 | String            |
`formatted_address`           | Array             |
`sub_locality`                | String            |
`sub_thoroughfare`            | String            |
`geometry`                    | Object            |

## Media
```json
{
  "date_created": "",
  "file_ext": "",
  "media_id": "",
  "label": "",
  "href": ""
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`date_created`                | String            |
`file_ext`                    | String            |
`media_id`                    | String            |
`label`                       | String            |
`href`                        | String            |

## Asset
```json
{
  "id": "",
  "barcode": "",
  "cost": 400,
  "depreciation": 200,
  "height": 200,
  "width": 200,
  "depth": 200,
  "weight": 30,
  "description": "",
  "identifier": "",
  "make": "",
  "media_id": "",
  "model": "",
  "rev": "",
  "serial_number": "",
  "time_stamp": "",
  "title": "",
  "year_of_manufacture": "",
  "custom_fields": "",
}
```

Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`id`                          | String            |
`barcode`                     | String            |
`cost`                        | Number            |
`depreciation`                | Number            |
`height`                      | Number            |
`width`                       | Number            |
`depth`                       | Number            |
`weight`                      | Number            |
`description`                 | String            |
`identifier`                  | String            |
`make`                        | String            |
`media_id`                    | String            |
`model`                       | String            |
`rev`                         | String            |
`serial_number`               | String            |
`time_stamp`                  | String            |
`title`                       | String            |
`year_of_manufacture`         | String            |
`custom_fields`               | Object            |
