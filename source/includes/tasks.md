# Tasks


## Get all tasks of a project



```shell
curl "http://example.com/api/v2/projects/1/tasks/"
  -H "Authorization: Token xxxxxxxxxxxxxxxxxxxxx"
```
> The above command returns JSON structured like this:

```json
{
    "results": [{
        "id": "1-T2",
        "task_id": "T2",
        "url": "http://example.com/bunits/new-business-unit/.../tasks/phase/requirements/1-T2",
        "title": "Secure forgotten password",
        "description": "Insecure forgotten password and password reset...",
        "priority": 8,
        "phase": "Requirements",
        "ad_hoc": false,
        "relevant": true,
        "accepted": true,
        "assigned_to": [],
        "updated": "2015-06-16T19:37:44.710100Z",
        "library_task_created": "2015-06-16T19:36:57.863684Z",
        "library_task_updated": "2015-06-16T19:36:57.836874Z",
        "verification_status": null,
        "status": "TODO",
        "note_count": 0,
        "artifact_proxy": null
    }]
}

```


Will return a list of tasks associated with the project having id "project_id".

### HTTP Request

`GET /api/v2/projects/{project_id}/tasks/`


## - Include & Expand Options

```shell
curl "http://example.com/api/v2/projects/1/tasks/?include=problem"
  -H "Authorization: Token xxxxxxxxxxxxxxxxxxxxx"
```

> The above command returns JSON structured like this:


```json
{
    "results": [{
        "id": "1-T2",
        "task_id": "T2",
        "url": "http://example.com/bunits/new-business-unit/.../tasks/phase/requirements/1-T2",
        "title": "Secure forgotten password",
        "description": "Insecure forgotten password and password reset mechanisms...",
        "priority": 8,
        "phase": "Requirements",
        "ad_hoc": false,
        "relevant": true,
        "accepted": true,
        "status": "TODO",
        "problem": {
            "id": "P526",
            "title": "P526: Weak Password Recovery Mechanism for Forgotten Password",
            "content": "It is common for an application..."
        }
    }]
}
```

> Notice how the "problem" field, previously not included in the response object, is now included.

The following parameters may be [included](#include-&-expand-options) in the tasks request:

* tags
* related
* problem
* how_tos


```shell
curl "http://example.com/api/v2/projects/1/tasks/?include=problem&expand=status"
  -H "Authorization: Token xxxxxxxxxxxxxxxxxxxxx"
```

> The above command returns JSON structured like this:


```json
{
    "results": [{
        "id": "1-T2",
        "task_id": "T2",
        "url": "http://example.com/bunits/new-business-unit/.../tasks/phase/requirements/1-T2",
        "title": "Secure forgotten password",
        "description": "Insecure forgotten password and password reset mechanisms ...",
        "priority": 8,
        "phase": "Requirements",
        "ad_hoc": false,
        "relevant": true,
        "accepted": true,
        "status": {
            "meaning": "TODO",
            "icon": "clock-o",
            "name": "Incomplete",
            "slug": "TODO"
        },
        "problem": {
            "id": "P526",
            "title": "P526: Weak Password Recovery Mechanism for Forgotten Password",
            "content": "It is common for an application..."
        }
    }]
}

```

The following parameters may be [expanded](#include-&-expand-options) in the tasks request:

* status
* description
