## Custom Fields

In the Asana application, Tasks can hold user-specified Custom Fields which provide extra information; for example, a priority value or a number representing the time required to complete a Task. This lets a user define the type of information that each Task within a Project can contain in addition to the built-in fields that Asana provides.

**Note:** Custom Fields are a premium feature. Integrations which work with Custom Fields need to handle an assortment of use cases for free and premium users in context of free and premium organizations. For a detailed examination of to what data users will have access in different circumstances, read the section below on [access control](#access-control).

The characteristics of Custom Fields are:

* There is metadata that defines the Custom Field. This metadata is shared across an entire organization or workspace.
* Projects can have Custom Fields associated with them individually. This is conceptually akin to adding columns in a database or a spreadsheet: every Task (row) in the Project (table) can contain information for that field, including "blank" values, i.e. `null` data.
* Tasks have Custom Field _values_ assigned to them.

A brief example: let's imagine that an organization has defined a Custom Field for "Priority". This field is of `enum` type and can have user-defined values of `Low`, `Medium`, or `High`. This is the field metadata, and it is visible within, and shared across, the entire organization.

A Project is then created in the organization, called "Bugs", and the "Priority" Custom Field is associated with that Project. This will allow all Tasks within the "Bugs" Project to have an associated "Priority".

A new Task is created within "Bugs". This Task, then, has a field named "Priority" which can take on the Custom Field value of one of `[null]`, `Low`, `Medium`, and `High`.

These Custom Fields are accessible via the API through a number of endpoints at the top level (e.g. `/custom_fields` and `/custom_field_settings`) and through calls on Workspaces, Projects, and Tasks resources. The API also provides a way to fetch both the metadata and data which define each particular Custom Field, so that a client application may render proper UI to display or edit the values.

Custom Field aware integrations need to be aware of the basic types that Custom Fields can adopt. These types are:

* `text` - an arbitrary, relatively short string of text
* `number` - a number with a defined level of precision
* `enum` - a selection from a defined list of options

Text fields are currently limited to 1024 characters. On Tasks, their Custom Field value will have a `text_value` property to represent this field.

Number fields can have an arbitrary `precision` associated with them; for example, a precision of `2` would round its value to the second (hundredths) place, i.e. 1.2345 would round to 1.23. On Tasks, the Custom Field value will have a `number_value` property to represent this field.

Enum fields represent a selection from a list of options. On the metadata, they will contain all of the options in an array. Each option has 4 properties:

* `id` - the id of this enum option. Note that this is the id of the _option_ - the Custom Field itself has a separate `id`.
* `name` - the name of the option, e.g. "Choice #1"
* `enabled` - whether this field is enabled. Disabled fields are not available to choose from when disabled, and are visually hidden in the Asana application, but they remain in the metadata for Custom Field values which were set to the option before the option was disabled.
* `color` - a color associated with this choice.

On the Task's Custom Field value, the enum will have an `enum_value` property which will be the same as one of the choices from the list defined in the Custom Field metadata.

The [Custom Field API Reference](/developers/api-reference/custom_fields) contains information about the specifics of how to use Custom Fields in conjunction with Asana's API.

### Operations on Custom Fields:

#### Querying an organization for its Custom Fields:

As Custom Fields are shared across the workspace or organization, the Workspace [can be queried](/developers/api-reference/custom_fields#query-metadata) for its list of defined Custom Fields. Like other collection queries, the fields will be returned as a compact record; slightly different from most other compact records is the fact that the compact record for Custom Fields includes `type` as well as `id` and `name`.

    # Request
    curl -H "Authorization: Bearer <personal_access_token>" \
    https://app.asana.com/api/1.0/workspaces/14916/custom_fields

    # Response
    HTTP/1.1 200
    {
      "data": [
        {
          "id": 124578,
          "name": "Priority",
          "type": "enum"
        },
        {
          "id": 134679,
          "name": "Owner",
          "type": "text"
        },
        "~..."
      ]
    }

As in all queries which may return a large number of records, [pagination](/developers/documentation/getting-started/pagination) is strongly encouraged when listing all of the Custom Fields for an organization.

#### Accessing Custom Field definitions:

The [Custom Fields](/developers/api-reference/custom_fields) reference describes how the metadata which defines a Custom Field is accessed. A GET request with an `id` can be issued on the `/custom_fields` endpoint to fetch the full definition of a single Custom Field given its `id` from (for instance) listing all Custom Fields on a Workspace, or getting the `id` from a Custom Field Settings object or a Task.

    # Request
    curl -H "Authorization: Bearer <personal_access_token>" \
    https://app.asana.com/api/1.0/custom_fields/124578

    # Response
    HTTP/1.1 200
    {
      "data": [
        {
          "id": 124578,
          "name": "Priority",
          "type": "enum",
          "enum_options": [
            {
              "id": 789,
              "name": "Low",
              "enabled": true,
              "color": "blue"
            },
            {
              "id": 208,
              "name": "Medium",
              "enabled": false,
              "color": "yellow"
            },
            {
              "id": 439,
              "name": "High",
              "enabled": true,
              "color": "red"
            }
          ]
        }
      ]
    }

This information describes the Custom Field metadata - the field's name, its type, and any additional information about the Custom Field as is appropriate. For more information, visit the [API Reference](/developers/api-reference/custom_fields).

**Note**: Currently Custom Field metadata must be defined in Asana's user interface before they can be accessed through the API. We will be adding methods to manipulate Custom Field metadata soon.

#### Associating Custom Fields with a Project

A mapping between a Custom Field and a Project is handled with a `custom_field_settings` object. This object contains a reference for each of the Custom Field and the Project, as well as additional information about the per-Project status of that particular Custom Field, for instance, `is_important`, which defines whether or not the custom field will appear in the grid (list of tasks) on the Asana application.

All of the `custom_field_settings` for a Project can be queried on the Project itself:

    # Request
    curl -H "Authorization: Bearer <personal_access_token>" \
    https://app.asana.com/api/1.0/projects/1331/custom_field_settings

    # Response
    HTTP/1.1 200
    {
      "data": [
        {
          "id": 258147,
          "custom_field": [
            {
              "id": 124578,
              "name": "Priority",
              "type": "enum"
            }
          ],
          "project": [
            {
              "id": 1331,
              "name": "Things to buy"
            }
          ]
        },
        {
          "id": 369852,
          "custom_field": [
            {
              "id": 235689,
              "name": "Cost",
              "type": "enum"
            }
          ],
          "project": [
            {
              "id": 1331,
              "name": "Things to buy"
            }
          ]
        },
        "~..."
      ]
    }

The Project can also be modified to add a Custom Field Settings with endpoints `/projects/addCustomFieldSettings` and `/projects/removeCustomFieldSettings` that are used to associate and dissociate the Custom Field and Project. See the [Project API Reference](/developers/api-reference/projects#custom-field-settings) page for information about these methods.

#### Accessing Custom Field values on Tasks:

The [Tasks](/developers/api-reference/tasks#custom_fields) reference has detailed information on how to get access to Custom Fields on Tasks. Custom Fields will return as an array on the property `custom_fields`, and each entry will contain, side-by-side, the compact representation of the Custom Field metadata and a `{typename}_value` property that stores the value set for the Custom Field:

    # Request
    curl -H "Authorization: Bearer <personal_access_token>" \
    https://app.asana.com/api/1.0/tasks/1001

    # Response

    {
      "data": {
        "id": 1001,
        "name": "Hello, world!",
        "completed": false,
        "...": "...",
        "custom_fields": [
          {
            "id": 124578,
            "name": "Priority",
            "type": "enum",
            "enum_value": {
              "id": 789,
              "name": "Low",
              "enabled": true,
              "color": "blue"
            }
          },
          "~..."
        ]
      }
    }

Of particular note is that the top-level `id` of each entry in the `custom_fields` array is the `id` of the Custom Field metadata, as it is the compact representation of this metadata. This can be used to refer to the full metadata by making a request to the `/custom_fields/{custom_fields_id}` endpoint as described above.

Custom Fields can be set just as in the Asana-defined fields on a task via POST or PUT requests; for example:

    # Request
    curl --request PUT -H "Authorization: Bearer <personal_access_token>" \
    https://app.asana.com/api/1.0/tasks/1001 \
    -d
    '{
      "data": {
        "custom_fields":{
          "124578":"439"
        }
      }
    }'

    # Response
    {
      "data": {
        "id": 1001,
        "name": "Hello, world!",
        "completed": false,
        "...": "...",
        "custom_fields": [
          {
            "id": 124578,
            "name": "Priority",
            "type": "enum",
            "enum_value": {
              "id": 439,
              "name": "High",
              "enabled": true,
              "color": "red"
            }
          },
          "~..."
        ]
      }
    }


#### Warning: Program defensively with regards to Custom Field definitions:

Asana application users have the ability to change the definitions of Custom Field metadata. This means that as you write scripts or applications to work with them, it's possible for the definitions to change at any time, which may cause an application using them to break or malfunction if it makes assumptions about the metadata for a particular Custom Field. When using Custom Fields, it is a good idea to program *defensively*, meaning you your application should double-check that the Custom Field metadata is what it expects.

Storing the state of the Custom Field metadata for too long if you dynamically create a model for it can cause your model to become unsynchronized with the model stored in Asana. If you encounter (for example) an `enum` value on a Task that does not match any option in your metadata model, your metadata model has become out of date with the Custom Field metadata.

**Note:** We are currently studying proposals for future implementations to more elegantly handle the modification of Custom Field metadata for application integrations.

#### <a name="disabled-values">[Enabled and Disabled Values](#disabled-values)</a>

When information that is contained in a Custom Field value loses a logical association with its metadata definition, the value becomes disabled. This can happen in a couple of simple ways, for example, if you remove the Custom Field metadata from a Project, or move a Task with a Custom Field to a different Project which does not have the Custom Field metadata associated with it. The value remains on the Task, and the Custom Field metadata can still be found and examined, but as the context in which the Custom Field makes sense is gone, the Custom Field cannot change its value; it can only be cleared.

Note: Tasks that are associated with multiple Projects do not become disabled, so long as at least one of the Projects is still associated with the Custom Field metadata. In other words, Tasks with multiple Projects will retain logically associated to the set of Custom Field metadata represented by all of their Projects.

Moving the Task back under a Project with that Custom Field applied to it or applying the Custom Field metadata to the current Project will return the Custom Field value to an enabled state. In this scenario, the Custom Field will be re-enabled and editable again.

In the Asana application, disabled fields are grayed out and not allowed to change, other than to be discarded. In the API, we return a property `enabled: false` to inform the external application that the value has been disabled. For instance,

    # Request
    curl -H "Authorization: Bearer <personal_access_token>" \
    https://app.asana.com/api/1.0/tasks/1001

    # Response

    {
      "data": {
        "id": 1001,
        "name": "Hello, world!",
        "completed": false,
        "...": "...",
        "custom_fields": [
          {
            "id": 134679,
            "name": "Price",
            "type": "number",
            "number_value": "1.56"
            "enabled": "false" //The "price" field is disabled.
          },
          "~..."
        ]
      }
    }

Note that the API enforces the same operations on disabled Custom Field values as hold in the Asana application: they may not have their values changed, since the lack of context for the values of a custom field in general doesn't provide enough information to know what new values should be. Setting the Custom Field value to `null` will clear and remove the Custom Field value from the Task.

#### <a name="access-control">[Access control](#access-control)</a>

Custom Fields are a premium feature of the Asana platform, so their access in the Asana application and in the API vary based on the status of the user and Project. For Projects in free organizations, teams, or workspaces, Custom Fields are not available. For _guests_ of a premium organization, Custom Field value may be read and written, and the metadata and associations between Custom Fields and Projects may be read; however, listing the complete set of Custom Fields for the organization is prohibited. For full members of a premium organization, Custom Field values and associations between Custom Fields and Projects may be read and edited, and Custom Fields can be listed across the entire Workspace. At this time, Custom Field metadata is only editable in the Asana application; note that this may change in the future.

Specifically, the rules for accessing Custom Fields data are as follows:

#### Custom Field metadata

|Organization or team is premium?|User's status in the team/org:|Custom Field metadata can be queried:|Custom Field metadata can be read:|Custom Field metadata can be modified:|
|:------------------------------:|:----------------------------:|:-----------------------------------:|:--------------------------------:|:------------------------------------:|
|           No                   |           None               |                No                   |               No                 |                  No                  |
|           No                   |           Guest              |                No                   |               No                 |                  No                  |
|           No                   |           Full Member        |                No                   |               No                 |                  No                  |
|           Yes                  |           None               |                No                   |               No                 |                  No                  |
|           Yes                  |           Guest              |                No                   |               Yes                |                  No                  |
|           Yes                  |           Full Member        |                Yes                  |               Yes                |                  No                  |

#### Custom Field Settings on a Project


|Project is in a premium organization or team?|User's status in the team/org:|Custom Field Settings can be viewed|Custom Field Settings can be modified|
|:-------------------------------------------:|-----------------------------:|:---------------------------------:|:-----------------------------------:|
|                No                           |       None or Guest          |               No                  |                 No                  |
|                No                           |       Full Member            |               No                  |                 No                  |
|                Yes                          |       None or Guest          |               Yes                 |                 No                  |
|                Yes                          |       Full Member            |               Yes                 |                 Yes                 |

#### Custom Field values on a Task

|Task is in a premium Project?|User's status in the organization:|Custom Field values can be viewed|Custom Field values can be modified|
|:---------------------------:|:--------------------------------:|:-------------------------------:|:---------------------------------:|
|           No                |          None or Guest           |             No                  |                 No                |
|           No                |          Full Member             |             No                  |                 No                |
|           Yes               |          None or Guest           |             Yes                 |                 Yes               |
|           Yes               |          Full Member             |             Yes                 |                 Yes               |

Note that these rules hold for Asana _users_ and not the status of the integration's organization. Therefore, applications which use Asana's API must be aware of these access rules and how they will apply to their users.

When read access is allowed, Custom Fields are returned as described here. When read access is not allowed, no `custom_fields` property will be returned on Tasks, no `custom_field_settings` property will be returned on Projects, and requests to the `/custom_field_settings` and `/custom_fields` will return HTTP code 403 (forbidden). When write access is not allowed, all requests that would modify Custom Fields (for example POST to `/project/addCustomFieldSettings` or writes to the `custom_fields` property on Tasks) will return HTTP code 403 (forbidden).
