# Audit Format

This section describes the complete audit response format.


## Top Level
```json
{
  "audit_id": "audit_50ba581235704a368d025056a583aa8b",
  "template_id": "template_4183bcc822f146d3be542118d3f15971",
  
  "created_at": "2015-06-04T02:34:25.000Z",
  "modified_at": "2015-06-04T02:39:21.000Z",
  
  "audit_data": {},
  "template_data": {},
  
  "header_items": [{}],
  "items": [{}],
  "assets": [{}]
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`audit_id`                    | String            | The audit's ID
`template_id`                 | String            | Parent template
`created_at`                  | String            | ISO date and time when the audit was first synced to the cloud
`modified_at`                 | String            | ISO date and time when the audit was last synced to the cloud
`audit_data`                  | Object            | General information about the audit (dates, author, scores, etc.)
`template_data`               | Object            | Some information on the template (predefined response sets, author, images, etc.)
`header_items`                | Array             | Audit header items (first page, can be missing)
`items`                       | Array             | Items in all sections after the header
`assets`                      | Array             | The assets within the template


## Audit Data
`.audit_data`

### Root
```json
{
  "name": "title",
  "score": 10,
  "total_score": 21,
  "score_percentage": 25,
  "date_completed": "2015-06-04T02:38:02.000Z",
  "date_modified": "2015-06-04T02:38:11.000Z",
  "duration": 224,
  "authorship": {},
  "date_started": "2015-06-04T02:34:25.000Z"
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`name`                        | String            | String name of the audit
`score`                       | Double            | Current score of the audit
`total_score`                 | Double            | The maximum possible score
`score_percentage`            | Double            | A value 0 to 100 calculated as `score/total_score`
`duration`                    | Double            | Time taken to complete the audit (on a device or web app) in seconds
`date_started`                | String            | A time and date when the audit was started  (on a device or web app)
`date_modified`               | String            | A time and date when the audit was last modified (on a device or web app)
`date_completed`              | String            | A time and date when the audit was completed (on a device or web app)
`authorship`                  | Object            | Information on the authorship of the audit

### Authorship
`.audit_data.authorship`
```json
{
  "authorship": {
    "owner": "Eddard Stark",
    "device_id": "81A34706-7417-4D6F-8C61-50AC2C814755",
    "author": "Jon Snow"
  }
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`author`                      | String            | The person who created the audit. Never changes
`owner`                       | String            | The person owning the audit. Can be changed anytime
`device_id`                   | String            | The device's ID which was used to create the audit. Generated when the app is installed


## Template Data
`.template_data`
### Root
```json
{
  "metadata": {},
  "authorship": {},
  "response_sets": {}
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`metadata`                    | Object            | Some data about the Template (name, description, image, etc.)
`response_sets`               | Object            | The response sets attached to the template. (Yes/No/NA, Safe/AtRisk/NA, etc)
`authorship`                  | Object            | Information on the authorship of the template. Same as audit authorship.

### Meta Data
`.template_data.metadata`
```json
{
  "name": "name",
  "description": "description",
  "image": "123f23fad5f4sdfv4s7df65v46",
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`name`                        | String            | The template name
`description`                 | String            | The template description
`image`                       | Object            | Main [image](#media) of the template

### Response Sets
`.template_data.response_sets`
Keys of the object are the UUID's' of each set. Values of the object are the sets themselves.
```json
{
  "8a0161b0-a97d-11e4-800b-8f525e51b36e": { "id": "8a0161b0-a97d-11e4-800b-8f525e51b36e", "resposes": [] },
  "ec410dd0-a97d-11e4-800b-8f525e51b36e": { "id": "ec410dd0-a97d-11e4-800b-8f525e51b36e", "resposes": [] }
}
```

#### Response Set
`.template_data.response_sets.*`
```js
{
  "id": "8a0161b0-a97d-11e4-800b-8f525e51b36e",
  "responses": []
}
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`id`                          | Object            | ID of the response set
`responses`                   | Array             | Array of response set items

##### Response Sets Response
`.template_data.response_sets.*.responses`
```json
{
  "id": "22a409a8-c02a-44d5-8b61-e66b6996927e",
  "colour": "5,255,84",
  "enable_score": true,
  "image": "",
  "label": "At risk",
  "score": 1,
  "short_label": "R",
  "type": "list"
},
```
Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`id`                          | String            | ID of the response set
`colour`                      | String            | Colour of the response button
`enable_score`                | Boolean           | If Score is enabled
`image`                       | Object            | Image the user selects on screen. Often empty
`label`                       | String            | Label of the response (eg. 'Yes')
`score`                       | Number            | Score of the response
`short_label`                 | String            | Short label of the response (eg. 'Y')
`type`                        | Number            | Score of the response

## Audit Items
`.items`
### Root
```json
{
  "label": "Audit",
  "item_id": "379d3910-d2e2-11e4-9038-695120da729f",
  "action_item_profile_id": [],
  "type": "checkbox",
  "parent_id": "a78337ce-2cf2-419b-85b5-c81cd2d68090",
  "options": {},
  "responses": {},
  "media": {},
  "children": [],
  "scoring": {}
}
```

Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`item_id`                     | String            | The UUID of the item
`parent_id`                   | String            | Parent item ID. Can be null
`label`                       | String            | The text label of the item
`action_item_profile_id`      | Array             | Followup task ID's
`type`                        | String            | One the the following: `information`, `smartfield`, `checkbox`, `media`, `textsingle`, `element`, `primeelement`, `dynamicfield`, `category`, `section`, `text`, `signature`, `switch`, `slider`, `drawing`, `address`, `list`, `question`, `datetime`, `weather`, `asset`, `scanner` 
`options`                     | Object            | A set of different options available to that type. Like: mix/max values, condition, signature, media, various flags, etc.
`responses`                   | Object            | Represents user selections. Like value, or list item, or photo, location, date-time, etc. 
`media`                       | Object            | 
`children`                    | Array             | The list of child item ID's
`scoring`                     | Object            | An object containing all the related scores of this item


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
`date_created`                | String            | A timestamp of the image or photo
`file_ext`                    | String            | A file extension representing image type (like png or jpeg)
`media_id`                    | String            | A unique id of this media file
`label`                       | String            | A label of the image or photo
`href`                        | String            | A ready-to-go direct URI to retrieve the file from 

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
