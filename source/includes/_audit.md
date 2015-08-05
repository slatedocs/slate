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
`template_id`                 | String            | ID of the parent template
`created_at`                  | String            | ISO date and time when the audit was first synced to the cloud or created on SafetyCulture
`modified_at`                 | String            | ISO date and time when the audit was last synced to the cloud or modified on SafetyCulture
`audit_data`                  | Object            | General information about [the audit](#audit-data) (dates, author, scores, etc.)
`template_data`               | Object            | Some information on [the template](#template-data) (predefined response sets, author, images, etc.)
`header_items`                | Array             | [Audit header items](#audit-header-items) (first page, optional)
`items`                       | Array             | [Items](#audit-items) in all sections after the header (basically the answers to the questions and other line items)
`assets`                      | Array             | The [assets](#audit-assets) within the template. Contains assets such as a regularly audited inventory list


## Audit Data

`.audit_data`

### Audit Data Root

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
`name`                        | String            | Name of the audit
`score`                       | Double            | Score of the audit
`total_score`                 | Double            | The maximum possible score
`score_percentage`            | Double            | A value 0 to 100 calculated as `score/total_score`
`duration`                    | Double            | Time taken to complete the audit (on a device or on SafetyCulture) in seconds
`date_started`                | String            | A time and date when the audit was started  (on a device or on SafetyCulture)
`date_modified`               | String            | A time and date when the audit was last modified (on a device or on SafetyCulture)
`date_completed`              | String            | A time and date when the audit was completed (on a device or on SafetyCulture)
`authorship`                  | Object            | Information on the [authorship](#authorship) of the audit

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
`device_id`                   | String            | The ID of the device which was used to create the audit. Generated when the app is installed


## Template Data

`.template_data`

### Template Data Root

```json
{
  "metadata": {},
  "authorship": {},
  "response_sets": {}
}
```

Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`metadata`                    | Object            | Some [metadata](#template-meta-data) about the template (name, description, image, etc.)
`response_sets`               | Object            | The question [responses](#response-sets) attached to the template. (Yes/No/NA, Safe/At Risk/NA, etc.)
`authorship`                  | Object            | Information on the [authorship](#authorship) of the template. Same as audit [authorship](#authorship).

### Template Metadata

`.template_data.metadata`

```json
{
  "name": "name",
  "description": "description",
  "image": "52ED0287-93F1-4F53-B2C2-29EA3A2423E7"
}
```

Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`name`                        | String            | The template name
`description`                 | String            | The template description
`image`                       | Object            | The logo ([media](#media)) of the template used to create this audit

### Response Sets

`.template_data.response_sets` - The keys used in the object are the IDs of the stored responses. The values of the object are the sets themselves.

```json
{
  "8a0161b0-a97d-11e4-800b-8f525e51b36e": { "id": "8a0161b0-a97d-11e4-800b-8f525e51b36e", "responses": [] },
  "ec410dd0-a97d-11e4-800b-8f525e51b36e": { "id": "ec410dd0-a97d-11e4-800b-8f525e51b36e", "responses": [] }
}
```

#### Response Set

`.template_data.response_sets.*`

```json
{
  "id": "8a0161b0-a97d-11e4-800b-8f525e51b36e",
  "responses": [{}]
}
```

Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`id`                          | Object            | ID of the response set
`responses`                   | Array             | Array of [response set items](#response-sets-response)

##### Response Sets Response

`.template_data.response_sets.*.responses` most of the fields can be absent.

```json
{
  "id": "22a409a8-c02a-44d5-8b61-e66b6996927e",
  "colour": "5,255,84",
  "enable_score": true,
  "image": {},
  "label": "At risk",
  "score": 1,
  "short_label": "R",
  "type": "list"
}
```

Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`id`                          | String            | ID of the response
`colour`                      | String            | RGB colour of the response button when selected. I.e. "0,0,0" is black, "255,255,255" is white.
`enable_score`                | Boolean           | If Score checkbox is checked. Can be attached to any response type
`label`                       | String            | Label of the response (e.g. 'Yes')
`score`                       | Number            | Score of the response
`short_label`                 | String            | Short label of the response (e.g. 'Y')
`type`                        | String            | The response type. Can only be "question" (single selection) or "list" (multi choice)


## Audit Header Items

`.header_items`

Same structure as **Audit Items**. See below.

## Audit Items

`.items` are the responses or selections made by the auditor.

### Item Root

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
  "children": ["C5404AC4-2844-4D5A-A02C-9921B9B384C6"],
  "scoring": {}
}
```

Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`item_id`                     | String            | The UUID of the item
`parent_id`                   | String            | Parent item ID. Can be null
`label`                       | String            | The text label of the item
`action_item_profile_id`      | Array             | The IDs of any follow up tasks added to this item
`type`                        | String            | One the the following: `information`, `smartfield`, `checkbox`, `media`, `textsingle`, `element`, `primeelement`, `dynamicfield`, `category`, `section`, `text`, `signature`, `switch`, `slider`, `drawing`, `address`, `list`, `question`, `datetime`, `weather`, `asset`, `scanner`
`options`                     | Object            | A set of different [options](#item-options) available to that type. Like: min/max values, condition, signature, media, various flags, etc.
`responses`                   | Object            | Represents user [selections](#item-responses). Like value, or list item, or photo, location, date-time, etc.
`media`                       | Object            | Information about an [image or photo](#media) file
`children`                    | Array             | The list of child item IDs
`scoring`                     | Object            | An object containing all the related [scores](#item-scoring) of this item

### Item Options

`.items[].options` most of the fields are absent usually.

```json
{
  "assets": ["e8a12eb4-5492-47bd-82bf-86e6d98bf81a"],
  "condition": "3d346f01-e501-11e1-aff1-0800200c9a66",
  "element": "Truck 1",
  "enable_date": true,
  "enable_signature_timestamp": true,
  "enable_time": true,
  "increment": 1,
  "is_mandatory": false,
  "label": "",
  "link": "",
  "locked": true,
  "max": 4,
  "media": {},
  "media_visible_in_report": true,
  "min": 2,
  "multiple_selection": false,
  "required": true,
  "response_set": "7bb1cb10-7020-11e2-bcfd-0800200c9a66",
  "secure": "",
  "type": "media",
  "url": "",
  "values": ["6565F809-B2F9-40AF-909E-2D76BC7683FF"],
  "visible_in_audit": true,
  "visible_in_report": true,
  "weighting": 8
}
```

Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`assets`                      | Array             | Array of [asset](#audit-assets) IDs
`computed_field`              | String            | *DEPRECATED*, can appear in very old audits
`condition`                   | String            | The smart field condition. UUID of a response set
`element`                     | String            | The title of each element of a dynamic field.
`enable_date`                 | Boolean           | Toggles the date portion of an item containing a date-time
`enable_signature_timestamp`  | Boolean           | Toggles the timestamp set when filling in a signature field
`enable_time`                 | Boolean           | Toggles the time portion of an item containing a date-time
`hide_barcode`                | Boolean           | Means that you can only scan barcode. Not editable.
`increment`                   | String            | Controls the increment jumps in slider items
`is_mandatory`                | Boolean           | Toggles whether the item has to have a response before the audit can be completed
`label`                       | String            | The main visual text of an item
`link`                        | String            | URL field in information items
`locked`                      | Boolean           | Toggles whether an asset item has been locked
`max`                         | String            | Maximum value for a slider item
`media`                       | String            | A [media](#media) attached to the item
`media_visible_in_report`     | Boolean           | *DEPRECATED*, can appear in very old audits
`min`                         | String            | Minimum value for a slider item
`multiple_selection`          | Boolean           | True if this field allows multiple selection
`response_set`                | String            | A UUID of the response set this item relates to
`secure`                      | Boolean           | "Barcode Scanner" - "Visible in Audit" switch value
`type`                        | String            | The type of an information field. Currently `text`, `media` or `link`
`url`                         | String            | *DEPRECATED - use link* URL field in information items
`values`                      | String            | The item's smart field response(s)
`visible_in_audit`            | Boolean           | Represents checkbox telling if an information item should be seen by auditor.
`visible_in_report`           | Boolean           | Represents checkbox telling if an information item should appear in reports.
`weighting`                   | String            | The weight used for generating audit scores

### Item Responses

`.items[].responses` most of the fields will be absent usually.

```json
{
  "assets": ["e8a12eb4-5492-47bd-82bf-86e6d98bf81a"],
  "text": "Flinders St",
  "value": "8",
  "name": "Jon Snow",
  "timestamp": "2015-06-24T02:20:22.000Z",
  "datetime": "2015-06-24T02:01:30.000Z",
  "location_text": "Alligator Creek QLD 4816\nAustralia\n(-19.405835, 146.899124)",
  "location": {},
  "selected": [{}],
  "weather": {},
  "media": [{}],
  "image": {}
}
```

Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`assets`                      | Array             | Array of selected [asset](#audit-assets) ID's
`text`                        | String            | A simple text an auditor types into a text box
`value`                       | String            | The selected value. Used for sliders, checkboxes and on-off switch
`name`                        | String            | Someone's name. Used with signature, location and weather items
`timestamp`                   | String            | Time of an action. Used only with barcode and signature fields
`datetime`                    | String            | Manually entered date and time. Also used with weather item
`location_text`               | String            | Location represented as text (address or coordinates)
`location`                    | Object            | The [location](#location) object
`selected`                    | Array             | The selected responses in questions and multi choice items. Same as [template response items](#response-sets-response)
`weather`                     | Object            | Audit time weather
`media`                       | Array             | An array of attached [photos](#media)
`image`                       | Object            | Signature or drawing. See [media](#media)

### Item Scoring

`.items[].scoring`

```json
{
  "score": 5,
  "max_score": 10,
  "score_percentage": 50,
  "combined_score": 3,
  "combined_max_score": 12,
  "combined_score_percentage": 25
}
```

Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`score`                       | Number            | Score for the answer
`max_score`                   | Number            | Maximum possible score for the answer
`score_percentage`            | Number            | The percentage value calculated as `score/max_score`
`combined_score`              | Number            | Combined score from all responses if there are multiple
`combined_max_score`          | Number            | Combined max score from all responses if there are multiple
`combined_score_percentage`   | Number            | The percentage value calculated as `combined_score/combined_max_score`

## Location

```json
{
  "administrative_area": "QLD",
  "country": "Australia",
  "formatted_address": [
    "Alligator Creek QLD 4816",
    "Australia"
  ],
  "geometry": {
    "coordinates": [
      146.8991244532996,
      -19.40583490239377
    ],
    "type": "Point"
  },
  "iso_country_code": "AU",
  "locality": "Alligator Creek",
  "name": "",
  "postal_code": "4816",
  "sub_administrative_area": "",
  "sub_locality": "Woodstock-Cleveland-Ross",
  "sub_thoroughfare": "",
  "thoroughfare": ""
}
```

Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`administrative_area`         | String            |
`country`                     | String            |
`formatted_address`           | Array             | Address text, line separated
`geometry`                    | Object            | The geometry object from [GeoJSON specification](http://geojson.org/geojson-spec.html#appendix-a-geometry-examples)
`iso_country_code`            | String            |
`locality`                    | String            |
`name`                        | String            |
`postal_code`                 | String            |
`sub_administrative_area`     | String            |
`sub_locality`                | String            |
`sub_thoroughfare`            | String            |
`thoroughfare`                | String            |

## Audit Assets

`.assets[]` is a list of object within a company that an auditor will review often.  

```json
{
  "barcode": "",
  "cost": 9.99,
  "custom_fields": {
    "my custom asset field": "my custom asset value"
  },
  "depreciation": 6,
  "depth": 456,
  "description": "Used to deliver various tool and people to the construction sites",
  "height": 45,
  "id": "e8a12eb4-5492-47bd-82bf-86e6d98bf81a",
  "identifier": "TDV-1",
  "make": "Toyota",
  "media": {},
  "model": "Tundra",
  "rev": "fd82de46-2484-49eb-9f5e-44a2844b6c25",
  "serial_number": "0071450261293",
  "time_stamp": "2015-04-09T01:29:28.632Z",
  "title": "Tools delivery vehicle",
  "weight": 432,
  "width": 67,
  "year_of_manufacture": 1995
}
```

Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`barcode`                     | String            | Asset barcode
`cost`                        | Number            | Asset cost
`custom_fields`               | Object            | The map of additional values one can attach to an asset
`depreciation`                | Number            | Asset depreciation
`depth`                       | Number            | Asset dimension
`description`                 | String            | General description of an asset
`height`                      | Number            | Asset dimension
`id`                          | String            | The UUID which is used to reference this asset from the other parts of the audit JSON
`identifier`                  | String            | A way for the user to identify the asset.
`make`                        | String            | The manufacturer of the asset
`media`                       | Object            | An image or photo of the asset
`model`                       | String            | The specific model of the asset
`serial_number`               | String            | Asset S/N
`time_stamp`                  | String            | Time when the asset was last edited in the corresponding template
`title`                       | String            | Asset title
`weight`                      | Number            | Asset wight
`width`                       | Number            | Asset dimension
`year_of_manufacture`         | Number            | The asset year of manufacture

## Media

This object is used across the entire audit JSON.

```json
{
  "date_created": "2015-03-23T23:57:52.000Z",
  "file_ext": "jpg",
  "media_id": "5f32d80c-3531-457f-b853-5f087927f5b1",
  "label": "can be a file name or any random text",
  "href": "https://api.safetyculture.io/audits/audit_50ba581235704a368d025056a583aa8b/media/5f32d80c-3531-457f-b853-5f087927f5b8"
}
```

Key                           | Type              | Description
------------------------------|-------------------|---------------------------------------------------------------------
`date_created`                | String            | A timestamp of the image or photo
`file_ext`                    | String            | A file extension representing image type (like png or jpeg)
`media_id`                    | String            | A unique id of this media file
`label`                       | String            | A label of the image or photo
`href`                        | String            | A ready-to-go direct URI to retrieve the file from
