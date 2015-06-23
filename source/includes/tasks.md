# Tasks


## Get all tasks of a project


```http
GET /api/v2/projects/1/tasks/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

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

**HTTP Request:**

`GET /api/v2/projects/{project_id}/tasks/`

---

### Include & Expand Parameters


```http
GET /api/v2/projects/1/tasks/?include=tags,related,problems,how_tos&expand=status,description HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json


{
    "results": [{
        "id": "1-T2",
        "task_id": "T2",
        "url": "http://example.com/bunits/new-business-unit/...",
        "title": "Secure forgotten password",
        "description": {
            "content": "Insecure forgotten password and password reset...",
            "amendments": []
        },
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
        "status": {
            "meaning": "TODO",
            "icon": "clock-o",
            "name": "Incomplete",
            "slug": "TODO"
        },
        "note_count": 0,
        "artifact_proxy": null,
        "tags": ["tag1", "tag2"],
        "related": ["1-T31", "1-T32", "1-T34", "1-T98"],
        "problem": {
            "id": "P526",
            "title": "P526: Weak Password Recovery Mechanism for Forgotten Password",
            "content": "It is common for an application..."
        },
        "how_tos": [
            {
            "id": "I131",
            "title": "I131: Manually with browser",
            "slug": "test-account-lockout-manually-browser",
            "url": "http://a7069ccda519b00c4/....",
            "content": "1. Open your web browser ..."
            }
        ]

    }]
}

```

See the [Include and Expand Parameters](#include-amp-expand-parameters) section for a full discussion on their functionality.

**Include:**

Field   | Description
--------|---------------------
tags    | includes a list of tags associated to the task
related | includes a list of related tasks
problem | includes the problem that the task is related to
how_tos | includes a list of how-tos


**Expand:**

Field       | Description
------------|---------------------
status      | expands the status field associated with the task
description | expands the description field associated with the task
