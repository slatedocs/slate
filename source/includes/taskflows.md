# Taskflows

## Get a list of live taskflows

> Example Request

```cURL
curl https://webapp.kotive.com/api/group/<group_id>/taskflowReports  \
	-H 'Authorization: Basic <token>'
```

> Example Response

```cURL
{
  "taskflowReports": [{
    "id": 769,
    "label": "My Average Taskflow"
  }, {
    "id": 796,
    "label": "My Awesome Taskflow"
  }]
}
```

* Endpoint: `GET /group/<group_id>/taskflowReports`

Who knows what your group is up to? Probably doing something fun, like taking over the world or eating ice cream. *Without you*. If you're really that desperate, here's how to get a list of live taskflows for your group:

First of all you'll need the `group_id` of the group, so that you can find out who is in that group. Getting this value should be pretty easy, as it will be nested inside of the `groupsIndex` part of the login response you got earlier!

Once you have your `group_id`, simply submit a `GET` request to `/group/<group_id>/taskflowReports` to get a list of live taskflows!

<aside class="success">
This call can be used to get a list of taskflows in an App or in an Organization/Team. You just need to adjust the group number accordingly
</aside>

## Get a specific taskflow

> Example Request

```cURL
curl https://webapp.kotive.com/api/group/<group id>/process/<task id>/blank  \
	-H 'Authorization: Basic <login details>'
```

> Example Response

```cURL
{
  "activity": {
    "phase": "new",
    "label": "An Actual Taskflow",
    "id_process": 0,
    "publish": false,
    "id_t": 798,
    "order": 0,
    "status": "blank",
    "fields": [],
    "id_owning_process": -1,
    "kind": "form"
  },
  "childActivities": [{
    "phase": "new",
    "label": "Taskero numero twoero",
    "id_process": 0,
    "publish": false,
    "id_t": 802,
    "order": 0,
    "status": "blank",
    "fields": [{
      "pattern": "str[][]",
      "visible": true,
      "style": "{\"kind\":\"email\"}",
      "label": "Le Random Field",
      "readonly": false,
      "id": "-1_802_1125",
      "order": 0,
      "required": true,
      "value": ""
    }],
    "id_owning_process": -1,
    "kind": "form"
  }, {
    "phase": "new",
    "label": "Taskero numero uno",
    "id_process": 0,
    "publish": false,
    "id_t": 799,
    "order": 0,
    "status": "blank",
    "fields": [{
      "pattern": "str[][]",
      "visible": true,
      "style": "{\"kind\":\"text\"}",
      "label": "Nuclear Missile Launch Codes",
      "readonly": false,
      "id": "-1_799_1120",
      "order": 0,
      "required": true,
      "value": ""
    }],
    "id_owning_process": -1,
    "kind": "form"
  }]
}
```

* Endpoint `GET /group/<group id>/process/<task id>/blank`

Have you been given the boring job of sifting through every form looking for one tiny typo? Well, we can't make that much easier for you, but we can show you a specific taskflow!

When you request a specific taskflow in Kotive, it will return all information on the specific task, as well as all of the fields that are in that task and the information pertaining to them. Kotive will only return information on that task. When that task is completed, you can *INSERT NEXT PART* to view information on the next task in that taskflow!

Before you can view information on a specific task, you will need to obtain the `<group id>` of the group to which the taskflow belongs, as well as the `<task id>` of the task in the taskflow that you are busy working with.

In order to get information on a specific task, send a `GET` request to `/group/<group id>/process/<task id>/blank`. The response will contain many parameters, explained below:

Field name | Description
-----------|------------
activity | This field provides information on the current task. A breakdown of this field is available <a href="#activity">here</a>
childActivities | This field contains an array of all of the tasks that are one step below the current task, and will be performed on completion of the current task. A breakdown of this field is available <a href="#activity">here</a>

### <a id="activity">Breakdown of the activity field</a>

Field name | Description
-----------|------------
phase | 
label | The human-friendly label that the task has
id_process | 
publish | Whether or not the task has been published
id_t | 
order | 
status | 
fields | An array of the <a href="#fields">fields contained within this task</a>.
id_owning_process | 
kind | The type of task that this is

### <a id="fields">Breakdown of the fields field</a>

Field name | Description
-----------|------------
pattern | The way the type of data is stored by Kotive. Examples of this are: str&#91;&#93;&#91;&#93; (for dates, dividers, email, headings, numbers, paragraphs, passwords, telephone numbers, text, text areas, times, and web addresses), mse&#91;Option1^Option2&#93;&#91;&#93; (multiple selection, for checkboxes), and sse&#91;Option1^Option2&#93;&#91;&#93; (single selection, for radiobuttons and dropdown lists)
visible | Whether or not the field is a visible field
style | 
label | The human-friendly label of the field
readonly | Whether or not the field is a readonly field
id | 
order | 
required | Whether or not the field is a required field
value | The default value of the field

