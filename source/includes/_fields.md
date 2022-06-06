# Fields

As discussed in the previous section, fields as a data model represent the
"columns" in a spreadsheet. A field can be specific to a given list, or it
can be global. List-specific fields appear as a column whenever that
list is being viewed while global fields are displayed on all lists.

Let us consider two examples:

1.  Assume you have a list called "Top Referrers", and a new list-specific field (column)
    called "Number of Referrals" is added to this list. In this case,
    the "Number of Referrals" column will only be visible on the "Top Referrers" list.

2.  Now assume you have three lists of people, "Top Referrers", "Friends in Media",
    "BD Leads", and a person X exists on all three lists. If you want to track where all the
    people in these 3 lists live, you might have a field called "Location".
    It makes sense to make this field global - in which case it will be shared
    across all three lists. Hence, if person X is a top referrer and lives in San
    Francisco, CA, that information will automatically appear on the "Friends in Media"
    list as well.

By default, Affinity provides all teams with a few default global fields:
For people, the global fields include Location, Job Titles, and Industries.
For organizations, the global fields include Stage, Industry, Location, and
more.

<aside class="notice">
  <h6>Notes</h6>
  <ul>
    <li>Global field IDs for persons are returned from <code><a href="#get-global-person-fields">GET /persons/fields</a></code></li>
    <li>Global field IDs for organizations are returned from <code><a href="#get-global-organizations-fields">GET /organizations/fields</a></code></li>
    <li>List-specific field IDs are also returned from <code><a href="#get-a-specific-list">GET /lists/{list_id}</a></code></li>
  </ul>
</aside>

## The Field Resource

> Example Response

```json

{
  "id": 1234,
  "name": "Deal Status",
  "list_id": 11,
  "enrichment_source": "none",
  "value_type": 7,
  "allows_multiple": false,
  "track_changes": true,
  "dropdown_options": [
    {
      "id": 2863451,
      "text": "New",
      "rank": 0,
      "color": 3
    },
    {
      "id": 2863452,
      "text": "In Progress",
      "rank": 1,
      "color": 3
    },
    {
      "id": 2863453,
      "text": "Won",
      "rank": 2,
      "color": 2
    }
  ]
}

```

Each field object has a unique `id`. It also has a `name`, which determines the name of the field,
and `allows_multiple`, which determines whether multiple values can be added to a single cell for that field.

Affinity is extremely flexible and customizable, and a lot of that power comes from our ability to support many different
value types for fields. Numbers, dates, and locations are all examples of value types, and you can search,
sort, or filter all of them.

| Attribute        | Type     | Description                                                                                                                                                                                                               |
| ---------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------       |
| id               | integer  | The unique identifier of the field object.                                                                                                                                                                                |
| name             | string   | The name of the field.                                                                                                                                                                                                    |
| list_id          | integer  | The unique identifier of the list that the field object belongs to if it is specific to a list. This is `null` if the field is global.                                                                                    |
| allows_multiple  | boolean  | This determines whether multiple values can be added to a single cell for the field.                                                                                                                                      |
| dropdown_options | object[] | Affinity supports pre-entered dropdown options for fields of the "Ranked Dropdown" value_type. The array is empty unless there are valid dropdown options for the field of the "Ranked Dropdown" value type.              |
| value_type       | integer  | This field describes what values can be associated with the field. This can be one of many values, as described in the table below.                                                                                       |
| enrichment_source| string   | The data source for the enriched field. Will appear as none for custom fields and certain list-specific fields (e.g. Status). Fields auto-created for certain integrations will also be called out here (e.g. Mailchimp). |

### Field Value Types

All the Types listed below can be referred through looking at the Affinity web app as well.

| Value | Type                    | Description                                                                                                                                                                                 |
| ----- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 0     | Person                  | This type enables you to add person objects as a value. Eg: External Source, Owner, Friends                                                                                                 |
| 1     | Organization            | This type enables you to add organization objects as a value. Eg: Place of work, Co-Investors                                                                                               |
| 2     | Dropdown | This type allows you to add text values into a single cell. This is best used when you want to store information that is unique to a person or organization. Eg: Interests, Stage, Industry                |
| 3     | Number                  | This type enables you to add number as a value. Eg: Deal Size, Check Size, Revenue                                                                                                          |
| 4     | Date                    | This type enables you to add date as a value. Eg: Date of Event, Birthday                                                                                                                   |
| 5     | Location                | This type enables you to add a smart Google Maps location as a value. Eg: Address                                                                                                           |
| 6     | Text                    | This type enables you to add a long text block as a value. Eg: Summary                                                                                                                      |
| 7     | Ranked Dropdown         | This type allows you to add values in a particular order as well as assign colors to them. This is the equivalent of a pick list. Eg: Status, Priority, Ranking                             |

<aside class="notice">
  <h6>Note</h6>
  <p>The API currently does not support updating and modifying fields. This must be done through the web product.</p>
</aside>

## Get Fields

> Example Request

```shell
curl "https://api.affinity.co/fields?with_modified_names=true" -u :$APIKEY
```

> Example Response

```json
[
  {
    "id": 1234,
    "name": "[Deals] Amount",
    "list_id": 11,
    "enrichment_source": "none",
    "value_type": 3,
    "allows_multiple": false,
    "track_changes": true,
    "dropdown_options": []
  },
  {
    "id": 5678,
    "name": "[Events] Amount",
    "list_id": 16,
    "enrichment_source": "none",
    "value_type": 3,
    "allows_multiple": false,
    "track_changes": true,
    "dropdown_options": []
  },
  {
    "id": 4321,
    "name": "[Companies] Description",
    "list_id": 18,
    "enrichment_source": "dealroom",
    "value_type": 6,
    "allows_multiple": false,
    "track_changes": false,
    "dropdown_options": []
  },
  ...
]
```

`GET /fields`

Returns all fields based on the parameters provided.

Pass the `list_id` to only fetch fields that are specific to that list. Otherwise, all global and list-specific fields will be returned.

Pass the `value_type` to fetch fields of specific value types. Otherwise, all fields of any type will be returned.

Pass the `with_modified_names` flag to return the fields such that the names have the list name prepended to them in the format `[List Name] Field Name` (i.e. `[Deals] Status`).

### Query Parameters

| Parameter           | Type    | Required | Description                                                                |
| ------------------- | ------- | -------- | -------------------------------------------------------------------------- |
| list_id             | integer | false    | An unique identifier of the list whose fields are to be retrieved.         |
| value_type          | integer | false    | The value type of the fields that are to be retrieved.                     |
| with_modified_names | boolean | false    | When true, field names will return in the format `[List Name] Field Name`. |

### Returns

An array of all the fields requested.

<aside class="notice">
  <h6>Note</h6>
  <ul>
    <li>Results returned with <code>list_id: null</code> mean they do not belong to a specific list and thus are global fields.</li>
    <li>Field endpoint does not return any Crunchbase fields.</li>
  </ul>
</aside>

## Create Field

> Example Request

```shell
curl -X POST "https://api.affinity.co/fields" \
  -u :$APIKEY \
  -H "Content-Type: application/json" \
  -d '{"name": "[Deals] Amount", "list_id": 11, "entity_type": 1, "value_type": 3, "allows_multiple": false, "is_list_specific": true}'
```

> Example Response

```json
{
  "id": 59,
  "name": "[Deals] Amount",
  "list_id": 11,
  "enrichment_source": "none",
  "value_type": 3,
  "allows_multiple": false,
  "track_changes": false,
  "dropdown_options": []
}
```

`POST /fields`

Creates a new field with the supplied parameters.

### Payload Parameters

| Parameter | Type | Required | Description |
| --------- | --- | --- | --- |
| name | string | true | The name of the field. |
| entity_type | integer | true | This describes what type of list this field will be associated with the field. This can be one of three values, see below for all value types. |
| value_type | integer | true | This describes what values can be associated with the field. This can be one of many values, see the [Field Resource](#the-field-resource) section for all value types. |
| list_id | integer | false | The unique identifier of the list that the field object belongs to if it is specific to a list. This is `null` if the field is global. |
| allows_multiple | boolean | false | This determines whether multiple values can be added to a single cell for the field. |
| is_list_specific | boolean | false | This determines whether the field object belongs to a specific list. If set to `true`, you must pass in the appropriate `list_id`. |
| is_required | boolean | false | This determines whether the field object is required. |

### Field Entity Types

| Parameter | Type | Description |
| --------- | --- | --- | --- |
| person | 0 | Type specifying a list of people. |
| organization | 1 | Type specifying a list of organizations. |
| opportunity | 8 | Type specifying a list of opportunities. |

### Returns

The field resource that was just created through this request.

## Delete a Field

> Example Request

```shell
curl "https://api.affinity.co/fields/1234" \
  -u :$APIKEY \
  -X "DELETE"
```

> Example Response

```json
{ "success": true }
```

`DELETE /fields/{id}`

Deletes an field with the specified `id`.

### Path Parameters

| Parameter | Type    | Required | Description                                          |
| --------- | ------- | -------- | ---------------------------------------------------- |
| id        | integer | true     | The unique ID of the field that needs to be deleted. |

### Returns

`{success: true}`.
