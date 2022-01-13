# Groups


## GET all groups in your project
```shell
    curl -H "Content-Type: application/json" \
    -u YOUR_EMAIL:YOUR_TOKEN \
    https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/groups.json
```

> This command: https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/groups.json?developer_email=YOUR_EMAIL&api_token=YOUR_TOKEN, <br>
OR <br>
 this command: curl -H "Content-Type:application/json" \
-H "PTToken: YOUR_TOKEN" \
https://api.practitest.com/api/v2/projects/4566/groups.json , <br>
returns JSON structured like below:


```json
{
  "data": [
    {
      "id": "353",
      "type": "groups",
      "attributes": {
        "name": "Administrators",
        "created-at": "2020-12-09T17:00:24+02:00"
      }
    },
    {
      "id": "355",
      "type": "groups",
      "attributes": {
        "name": "Developers",
        "created-at": "2020-12-09T17:00:24+02:00"
      }
    },
    {
      "id": "354",
      "type": "groups",
      "attributes": {
        "name": "Testers",
        "created-at": "2020-12-09T17:00:24+02:00"
      }
    }
  ],
  "links": {},
  "meta": {
    "current-page": 1,
    "next-page": null,
    "prev-page": null,
    "total-pages": 1,
    "total-count": 3
  }
}
```

This endpoint retrieves all groups for specific project.

### HTTP Request

`https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/groups.json`



### PAT Support
Supported - if the user has the permissions to edit Groups

<aside class="notice">
  Remember, you can see examples in the dark area to the right.
</aside>


## Show Group information
```shell
    curl -H "Content-Type: application/json" \
    -u YOUR_EMAIL:YOUR_TOKEN \
    https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/groups/GROUP_ID.json
```

> This command: https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/groups/322.json?developer_email=YOUR_EMAIL&api_token=YOUR_TOKEN, <br>
OR <br>
 this command: curl -H "Content-Type:application/json" \
-H "PTToken: YOUR_TOKEN" \
https://api.practitest.com/api/v2/projects/4566/groups/322.json , <br>
returns JSON structured like below:


```json
{
  "data": {
    "id": "6",
    "type": "groups",
    "attributes": {
      "name": "Testers",
      "created-at": "2019-04-18T17:03:39+03:00",
      "permissions": [
        {
          "title": "Requirements - View",
          "description": "View Requirements",
          "allowed": true
        },
        {
          "title": "Requirements - Editor",
          "description": "Create, Edit and View Requirements",
          "allowed": true
        },
        {
          "title": "Requirements - Admin",
          "description": "Create, Edit, Delete and View Requirements",
          "allowed": true
        },
        {
          "title": "Tests - View",
          "description": "View Tests, View Runs",
          "allowed": true
        },
        {
          "title": "Runs",
          "description": "View Tests, Run Tests, View and Edit Instances & Runs",
          "allowed": true
        },
        {
          "title": "Runs - Admin",
          "description": "Same as Runs, with the option to Delete Instances and Runs",
          "allowed": true
        },
        {
          "title": "Tests - Editor",
          "description": "Create, Edit and View Tests; Run Tests; View and Edit Instances & Runs",
          "allowed": true
        },
        {
          "title": "Tests - Admin",
          "description": "Create, Edit, Delete and View Tests; Run Tests; View, Edit and Delete Runs, Create TestSets permutations",
          "allowed": true
        },
        {
          "title": "Issues - View",
          "description": "View Issues",
          "allowed": true
        },
        {
          "title": "Issues - Status Modifier",
          "description": "View Issues; Change Issue Status (by workflow transitions; Add comments to Issues",
          "allowed": true
        },
        {
          "title": "Issues - Editor",
          "description": "Create, Edit and View Issues",
          "allowed": true
        },
        {
          "title": "Issues - Admin",
          "description": "Create, Edit, Delete and View Issues. Delete on specific projects.",
          "allowed": false
        },
        {
          "title": "Reports",
          "description": "View, Create, Edit and Delete Reports",
          "allowed": true
        },
        {
          "title": "Dashboard Customization",
          "description": "Customize dashboard items",
          "allowed": false
        },
        {
          "title": "Dashboard - Private",
          "description": "Customize a private dashboard",
          "allowed": false
        },
        {
          "title": "Customization",
          "description": "Customize Custom fields",
          "allowed": false
        },
        {
          "title": "All Custom Views",
          "description": "Edit all custom views",
          "allowed": false
        },
        {
          "title": "Notification List",
          "description": "Enable users to add OTHER users to a notification list of an entity.",
          "allowed": false
        },
        {
          "title": "Workflow",
          "description": "Customize Issue status workflow",
          "allowed": false
        },
        {
          "title": "Project, Users & Permissions, Integrations",
          "description": "Add and Delete Users & Groups, Customize Permissions, Change Project Name and Logo, Set Integrations and Webhooks",
          "allowed": false
        }
      ]
    }
  }
}
```

This endpoint shows a specific group in your project.


### HTTP Request

`https://api.practitest.com/api/v2/projects/YOUR_PROJECT_ID/groups/GROUP_ID.json`



### PAT Support
Supported - if the user has the permissions to edit Groups
