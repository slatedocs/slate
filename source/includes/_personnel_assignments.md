# Personnel Assignments

When personnel are added to projects, the relationship between the personnel and project is referred to as a personnel assignment.

You can interact with this relationship through the personnel assignment id, or the id of the project along with the id of the personnel that was added to the project.

## Viewing personnel assignments for a project

```shell
curl https://api.handshq.com/v1/projects/[project_id]/personnel_assignments \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request GET
```

This endpoint allows you to view the personnel assignments that exist for a project, within the division that is registered with the API token you provide.

### Request

`GET https://api.handshq.com/v1/projects/[project_id]/personnel_assignments`

### Response

Successful requests will return a json payload of the personnel assignments and a `200` status code.

Results in `data` are [paginated](#pagination)

> 200

```json
{
  "data": [{
    "id": "123",
    "type": "personnel_assignment",
    "relationships": {
      "personnel": {
        "data": {
          "id": "1",
          "type": "personnel"
        }
      },
      "project": {
        "data": {
          "id": "2",
          "type": "project"
        }
      },
      "role": {
        "data": {
          "id": "3",
          "type": "role"
        }
      }
    }
  }],
  "meta": {
    "pagination": {
      "requested_page":1,
      "total_pages":1
    }
  }
}
```

## Viewing a personnel assignment

```shell
curl https://api.handshq.com/v1/personnel_assignments/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request GET
```

```shell
curl https://api.handshq.com/v1/projects/[project_id]/personnel/[personnel_id]/assignment \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request GET
```

This endpoint allows you to view a personnel assignment for the division that is registered with the API token you provide. You can either view the assignment by providing the personnel assignment id, or the project id and personnel id.

### Request

`GET https://api.handshq.com/v1/personnel_assignments/[id]`

OR

`GET https://api.handshq.com/v1/projects/[project_id]/personnel/[personnel_id]/assignment`

### Response

Successful requests will return a json payload of the personnel assignment and a `200` status code.

> 200

```json
{
  "data": {
    "id": "123",
    "type": "personnel_assignment",
    "relationships": {
      "personnel": {
        "data": {
          "id": "1",
          "type": "personnel"
        }
      },
      "project": {
        "data": {
          "id": "2",
          "type": "project"
        }
      },
      "role": {
        "data": {
          "id": "3",
          "type": "role"
        }
      }
    }
  }
}
```

## Creating a personnel assignment

```shell
curl https://api.handshq.com/v1/projects/[project_id]/personnel/[personnel_id]/assignment \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --request POST \
  -d '[json_payload]'
```

> Example Personnel Assignment update payload.

```json
  {
    "user_email": "maddox@daystrom.com",
    "personnel_assignment": {
      "role_id": "123"
    }
  }
```

This endpoint allows you to add a personnel to a project within the division that is registered with the API token you provide. You have the option to determine the role of the personnel on the project, by providing the id of the role. This role must have already been assigned to the personnel.

Once a personnel is added to a project, if reviews have been requested for that project, a review will automatically be generated for that personnel. A user email must be provided along with this request, and this email will be used to identify the requester of the review.

### Request

`POST https://api.handshq.com/v1/projects/[project_id]/personnel/[personnel_id]/assignment`

### Required Parameters
Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
user_email | String | Yes | The email of the HandsHQ user who will be marked as the requester of the generated review. The user in question must have access to the division that is registered with the API token you provide.


### Allowed Parameters
Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
role_id | String | No | The id of the role the personnel should have on project. The personnel must already have this role.

### Response

Successful requests will return a json payload of the personnel assignment and a `201` status code.

> 200

```json
{
  "data": {
    "id": "123",
    "type": "personnel_assignment",
    "relationships": {
      "personnel": {
        "data": {
          "id": "1",
          "type": "personnel"
        }
      },
      "project": {
        "data": {
          "id": "2",
          "type": "project"
        }
      },
      "role": {
        "data": {
          "id": "123",
          "type": "role"
        }
      }
    }
  }
}
```

## Updating a personnel assignment

```shell
curl https://api.handshq.com/v1/personnel_assignments/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --request PATCH \
  -d '[json_payload]'
```

```shell
curl https://api.handshq.com/v1/projects/[project_id]/personnel/[personnel_id]/assignment \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --request PATCH \
  -d '[json_payload]'
```

> Example Personnel Assignment update payload.

```json
  {
    "personnel_assignment": {
      "role_id": "123"
    }
  }
```

This endpoint allows you to update a personnel on a project for the division that is registered with the API token you provide. You can either update the assignment by providing the personnel assignment id, or the project id and personnel id.

### Request

`PATCH https://api.handshq.com/v1/personnel_assignments/[id]`

OR

`PATCH https://api.handshq.com/v1/projects/[project_id]/personnel/[personnel_id]/assignment`

### Allowed Personnel Assignment Parameters

All parameters must be nested within `personnel_assignment`

Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
role_id | String | No | ID of the role the personnel should have on the project. The personnel must already have this role.

### Response

Successful requests will return a json payload of the personnel assignment and a `200` status code.

> 200

```json
{
  "data": {
    "id": "123",
    "type": "personnel_assignment",
    "relationships": {
      "personnel": {
        "data": {
          "id": "1",
          "type": "personnel"
        }
      },
      "project": {
        "data": {
          "id": "2",
          "type": "project"
        }
      },
      "role": {
        "data": {
          "id": "123",
          "type": "role"
        }
      }
    }
  }
}
```

## Deleting a personnel assignment

```shell
curl https://api.handshq.com/v1/personnel_assignments/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request DELETE
```

```shell
curl https://api.handshq.com/v1/projects/[project_id]/personnel/[personnel_id]/assignment \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request DELETE
```

This endpoint allows you to remove a personnel from a project belonging to the division that is registered with the API token you provide. You can either remove the assignment by providing the personnel assignment id, or the project id and personnel id.

### Request

`DELETE https://api.handshq.com/v1/personnel_assignments/[id]`

OR

`DELETE https://api.handshq.com/v1/projects/[project_id]/personnel/[personnel_id]/assignment`

### Response

Successful requests will return no content and a `204` status code.

> 204
