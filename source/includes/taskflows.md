# Taskflows

In Kotive, the terms `process` and `taskflow`, and `activity` and `task` are used interchangably.

## Get a list of live taskflows

> Example Request

```curl
curl https://webapp.kotive.com/api/group/<group_id>/taskflowReports  \
	-H 'Authorization: Basic <login details>'
```

> Example Response

```json
{
  "taskflowReports": [{
    "id": 79,
    "label": "My Average Taskflow"
  }, {
    "id": 76,
    "label": "My Awesome Taskflow"
  }]
}
```

* Endpoint: `GET /group/<group_id>/taskflowReports`

Who knows what your group is up to? Probably doing something fun, like taking over the world or eating ice cream. *Without you*. If you're really that desperate, here's how to get a list of live taskflows for your group:

First of all you'll need the `group_id` of the group, so that you can find out what taskflows are in your group. Getting this value should be pretty easy, as it will be nested inside of the `groupsIndex` part of the login response you got earlier!

Once you have your `group_id`, simply submit a `GET` request to `/group/<group_id>/taskflowReports` to get a list of live taskflows!

<aside class="success">
This call can be used to get a list of taskflows in an App or in an Organization/Team. You just need to adjust the group ID accordingly.
</aside>

## Start a new taskflow

### Step 1: Get the taskflow template
> Example Request

```curl
curl https://webapp.kotive.com/api/group/<group_id>/process/<taskflow_id>/blank  \
	-H 'Authorization: Basic <login details>'
```

> Example Response

```json
{
  "activity": {
    "phase": "new",
    "label": "A Taskflow",
    "id_process": 0,
    "publish": false,
    "id_t": 79,
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
    "id_t": 862,
    "order": 0,
    "status": "blank",
    "fields": [{
      "pattern": "str[][]",
      "visible": true,
      "style": "{\"kind\":\"email\"}",
      "label": "Le Random Field",
      "readonly": false,
      "id": "-1_862_1015",
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
    "id_t": 749,
    "order": 0,
    "status": "blank",
    "fields": [{
      "pattern": "str[][]",
      "visible": true,
      "style": "{\"kind\":\"text\"}",
      "label": "Nuclear Missile Launch Codes",
      "readonly": false,
      "id": "-1_749_1020",
      "order": 0,
      "required": true,
      "value": ""
    }],
    "id_owning_process": -1,
    "kind": "form"
  }]
}
```

* Endpoint `GET /group/<group_id>/process/<taskflow_id>/blank`

When you want to start a new taskflow, you will want to know which tasks are available as part of the first step of the taskflow. 

When you request a specific taskflow in Kotive, it will return information about the taskflow. This will include the first task(s) that can be completed, as well as the fields pertaining to them.

Before you can view information on a specific taskflow, you will need to [obtain the `<group_id>` of the group](#log-in) to which the taskflow belongs, as well as [the `<taskflow_id>` of the taskflow](#get-a-list-of-live-taskflows).

Send a `GET` request to `/group/<group_id>/process/<taskflow_id>/blank`. The response will contain the following attributes:

Attribute | Description
-----------|------------
activity | This attribute provides information on the current taskflow. A breakdown of this attribute is available <a href="#activity">here</a>.
childActivities | This attribute contains a list of all of the tasks that are available to be executed. A breakdown of this attribute is available <a href="#activity">here</a>.

### <a id="activity">Activity model</a>

Attribute | Description
-----------|------------
id | The ID of the instance of the task (only available for existing task instances)
label | The task's human-friendly label
kind | The type of task that this is (e.g. form, email, sms, github, slack, ...)
order | The order that this activity is in, starting at 0
status | The status of the task. This will default to 'blank'
phase | The current phase that this task is in. This will default to 'new'
publish | Whether or not the task has been published
id_process | The ID of instance of the taskflow which is currently associated with this task
id_t | The ID of the task template (from the Designer)
id_owning_process | This attribute allows you to attach processes to processes. For now this will always default to `-1`
fields | A list of the <a href="#fields">fields contained within this task</a>.

### <a id="fields">Field model</a>

Attribute | Description
-----------|------------
id | The unique ID that we use to identify your task. This is a compound ID, combined using underscores: <ul><li>`<id_field_instance>`</li><li>`<activity.id_t>`</li><li>`<id_field_template>`</li></ul>
label | The human-friendly label of the field
order | The position of the field in the task, starting at 0
pattern | The way the type of data is stored by Kotive. Examples of this are: `str[][]` (for dates, dividers, email, headings, numbers, paragraphs, passwords, telephone numbers, text, text areas, times, and web addresses), `mse[Option1^Option2][]` (multiple selection, for checkboxes), `and sse[Option1^Option2][]` (single selection, for radiobuttons and dropdown lists)
style | The HTML style that our webapp uses to display the field
required | Whether or not the field is required
visible | Whether or not the field is visible
readonly | Whether or not the field is readonly
value | The current value of the field

### Step 2: Start a taskflow instance

> Example Request

```curl
curl 'https://webapp.kotive.com/api/group/<group_id>/process'  \
	-X POST                                                    \
	-H 'Authorization: Basic <login details>'                  \ 
	-H 'Content-Type: application/json'                        \
	-d '{"id_process":<id_process>,"id_t":<id_t>,"id_owning_process":<id_owning_process>,"fields":[]}'
```

> Example Response

```json
[{
  "phase": "new",
  "label": "Taskero numero twoero",
  "id_process": 375,
  "publish": false,
  "id_t": 809,
  "order": 0,
  "status": "blank",
  "fields": [{
    "pattern": "str[][]",
    "visible": true,
    "style": "{\"kind\":\"email\"}",
    "label": "Le Random Field",
    "readonly": false,
    "id": "-1_809_1135",
    "order": 0,
    "required": true,
    "value": ""
  }],
  "id_owning_process": -1,
  "kind": "form"
}, {
  "phase": "new",
  "label": "Taskero numero uno",
  "id_process": 375,
  "publish": false,
  "id_t": 889,
  "order": 0,
  "status": "blank",
  "fields": [{
    "pattern": "str[][]",
    "visible": true,
    "style": "{\"kind\":\"number\"}",
    "label": "Nuclear Missile Launch Codes",
    "readonly": false,
    "id": "-1_889_1230",
    "order": 0,
    "required": true,
    "value": ""
  }, {
    "pattern": "str[][]",
    "visible": true,
    "style": "{\"kind\":\"divider\"}",
    "label": "",
    "readonly": false,
    "id": "-1_889_1231",
    "order": 1,
    "required": false,
    "value": ""
  }, {
    "pattern": "str[][]",
    "visible": true,
    "style": "{\"kind\":\"textarea\"}",
    "label": "Presidential Banking Details",
    "readonly": false,
    "id": "-1_889_1232",
    "order": 2,
    "required": false,
    "value": ""
  }],
  "id_owning_process": -1,
  "kind": "form"
}]
```

* Endpoint: `POST https://webapp.kotive.com/api/group/<group_id>/process`

Great! Now that you've got the taskflow template, you need to start a taskflow instance in order to get the `id_process`.  You will then use the `id_process` to link all of your task instances. Getting this is pretty simple!

First of all, you build a JSON payload with the following attributes:

Attribute | Description
----------|------------
id_process | The ID of instance of the taskflow which is currently associated with this task. Leave this `0` for now.
id_t | The ID of the task template (from the Designer).
id_owning_process | This attribute allows you to attach processes to processes. For now this will always default to `-1`.
fields | A list of fields to send along with this request. Leave this blank when starting a new taskflow.

Now that you've build your JSON string, use it to submit a `POST` request to `/group/<group_id>/process`. This will return the tasks which are available in the first step of the taskflow, and includes the `id_process`.

<aside class="notice">
The <code>id_process</code> is needed for submitting tasks.
</aside>

<aside class="success">
These instructions only have to be followed once for every new taskflow instance. From there you <a href="#submit-a-task">submit a task</a>.
</aside>

## Submit a task

> Example Request

```curl
curl 'https://webapp.kotive.com/api/group/<group_id>/process/<process_id>/activity'  \
	-X POST                                                                          \
	-H 'Authorization: Basic <login details>'                                        \
	-H 'Content-Type: application/json'                                              \
	-d'{"id_process":<id_process>,"id_t":<id_t>,"id_owning_process":<id_owning_process>,"fields":[{"id":<id>,"value":<value>},{"id":<id>,"value":<value>}]}'
```

> Example Response

```json
[{
  "phase": "new",
  "label": "A Form",
  "id_process": 386,
  "publish": false,
  "id_t": 798,
  "order": 2,
  "status": "blank",
  "fields": [{
    "pattern": "str[value][]",
    "visible": true,
    "style": "{\"kind\":\"text\"}",
    "label": "Field",
    "readonly": false,
    "id": "-1_798_8701",
    "order": 0,
    "required": false,
    "value": "value"
  }],
  "id_owning_process": -1,
  "kind": "form"
}]
```

* Endpoint: `POST /group/<group_id>/process/<process_id>/activity`

Have your deadlines gotten to the point where you're giving up on that intern and just doing everything yourself? That's probably for the best, I've heard he uses *Internet Explorer*. If you really want to replace him entirely with one simple command, here's how to do it! Disclaimer: this command will not bring you coffee.

In order to submit a task, you will yet again need the `<group_id>` and the `<process_id>`. Once you have these values, all you have to do is submit a `POST` request to `/group/<group_id>/process/<process_id>/activity`.

The payload of the `POST` request must contain certain information, outlined below:

Attribute | Description
-----------|------------
id | The ID of the instance of the task (only available for existing task instances)
id_process | The ID of the instance of the taskflow which is currently associated with this task
id_t | The ID of the task template (from the Designer)
id_owning_process | This attribute allows you to attach processes to processes. For now this will always default to `-1`
fields | This is a list of the fields you want to update. For each entry in the list, you provide the `id` of the field you want to update, and the new `value` to put into that field.

The response obtained from this request may be:

* the same task, if not all of the required fields were completed,
* a list of the next task(s) in the taskflow,
* an empty list, if no tasks are available.

## Get the next task in a taskflow

> Example Request

```curl
curl https://webapp.kotive.com/api/group/<group_id>/process/<process_id>/next  \
	-H 'Authorization: Basic <login details>'
```

> Example Response

```json
[{
  "phase": "new",
  "label": "A Form",
  "id_process": 386,
  "publish": false,
  "id_t": 798,
  "order": 2,
  "status": "blank",
  "fields": [{
    "pattern": "str[value][]",
    "visible": true,
    "style": "{\"kind\":\"text\"}",
    "label": "Field",
    "readonly": false,
    "id": "-1_798_8701",
    "order": 0,
    "required": false,
    "value": "value"
  }],
  "id_owning_process": -1,
  "kind": "form"
}]
```

* Endpoint: `GET /group/<group_id>/process/<process_id>/next`

##### CONTINUE WITH TASKFLOW

As in the previous request, you'll need to obtain the `<group_id>` of the group to which the taskflow belongs, as well as the `<process_id>` of the taskflow instance.

Once you have those values, simply point a `GET` request to `/group/<group_id>/process/<process_id>/next` to get the next task(s) in the taskflow. Pretty straightforward, huh?

The attributes contained in [the response are in the activity model](#activity).
