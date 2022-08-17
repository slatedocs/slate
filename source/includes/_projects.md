# Projects

## Viewing projects

```shell
curl https://api.handshq.com/v1/projects \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
```

> 200

```json
  {
    "data": [
      {
        "id": "1234",
        "type": "project",
        "attributes": {
          "name": "Test Project",
          "reference": "ABC1",
          "start_date": "2021-12-20",
          "end_date": "2022-12-21",
          "archived_at": null,
          "state": "not_submitted"
        },
        "relationships": {
          "fields": {
            "data": [
              {
                "id": "123",
                "type": "field"
              },
              {
                "id": "234",
                "type": "field"
              }
            ]
          },
          "user": {
            "data": {
              "id": "345",
              "type": "user"
            }
          }
        },
        "links": {
          "app_url": "https://app.handshq.com/projects/1234"
        }
      },
      {
        "id": "5678",
        "type": "project",
        "attributes": {
          "name": "Test Project 2",
          "reference": "ABC2",
          "start_date": "2021-12-20",
          "end_date": "2022-12-21",
          "archived_at": null,
          "state": "not_submitted"
        },
        "relationships": {
          "fields": {
            "data": [
              {
                "id": "123",
                "type": "field"
              },
              {
                "id": "234",
                "type": "field"
              }
            ]
          },
          "user": {
            "data": {
              "id": "345",
              "type": "user"
            }
          }
        },
        "links": {
          "app_url": "https://app.handshq.com/projects/5678"
        }
      }
    ],
    "meta": {
      "pagination": {
          "requested_page": 1,
          "total_pages": 1
      }
    }
  }
```

This endpoint allows you to view projects for the division who is registered with the API token you provide.

### Request

`GET https://api.handshq.com/v1/projects`

### Allowed Query Parameters
Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
reference | String | No | Only projects with a matching reference will be returned
with_fields | Boolean | No | If set to true will include the fields of projects in the `included` section of the response, see the [fields index](#fields-index) endpoint for an example of the attributes on fields.

### Response

Successful requests will return a json payload of that division's projects and a `200` status code.
Results in `data` are [paginated](#pagination)

## Creating a project

```shell
curl https://api.handshq.com/v1/projects \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --request POST \
  -d '[json_payload]'
```

> Example Project creation payload.

```json
  {
    "user_email": "maddox@daystrom.com",
    "project": {
      "name": "My project with extra details",
      "start_date": "2021-12-20",
      "end_date": "2022-12-20",
      "reference": "abc123",
      "fields_attributes": {
        "1": "My field value"
      }
    }
  }

```

This endpoint allows you to create a project for the division who is registered with the API token you provide.

### Request

`POST https://api.handshq.com/v1/projects`

### Required Parameters
Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
user_email | String | Yes | The email of the HandsHQ user who will be marked as the author of the project

### Allowed Project Parameters
All parameters must be nested within `project`

Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
name | String | Yes | Name of your project, used for document titles, names of PDF documents etc.
start_date | Date | No | To denote when your project starts, used in conjunction with `end_date` to denote whether project is still active.
end_date | Date | No | To denote when your project ends, used in conjunction with `start_date` to denote whether project is still active.
reference | String | No | Your internal reference for a project e.g. 'RA01'
fields_attributes | Object | No | More information available [here](#for-project-creation)

### Response

Successful requests will return a json payload of the project that was created and a `201` status code.

> 201

```json
{
  "data": {
    "id": "1",
    "type": "project",
    "attributes": {
      "name": "My Project",
      "start_date": "2021-12-20",
      "end_date": "2022-12-20",
      "reference": "abc123",
      "archived_at": null,
      "state": null
    },
    "relationships": {
      "user": {
        "data": {
            "id": "345",
            "type": "user"
          }
      },
      "fields":{
        "data":[
          {
            "id":"248",
            "type":"field"
          }
        ]
      }
    },
    "links": {
      "app_url": "https://app.handshq.com/projects/1"
    }
    },
    "included":[
    {
      "id":"248",
      "type":"field",
      "attributes":{
        "label":"Client reference",
        "required":null,
        "value":"My field value",
        "data_type":"string"
      },
      "relationships":{
        "fieldset":{
          "data":{
            "id":"58",
            "type":"fieldset"
          }
        }
      }
    }
  ]
}
```


## Updating a project

```shell
curl https://api.handshq.com/v1/projects/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --request PATCH \
  -d '[json_payload]'
```

> Example Project update payload.

```json
  {
    "project": {
      "name": "My Updated Project",
      "start_date": "2021-12-20" ,
      "end_date": "2022-12-20",
      "reference": "abc123",
      "fields_attributes": {
        "248": "DEF345"
      }
    }
  }

```

This endpoint allows you to update a project for the division who is registered with the API token you provide.

### Request

`PATCH https://api.handshq.com/v1/projects/[project_id]`


### Allowed Project Parameters
All parameters must be nested within `project`

Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
name | String | No | Name of your project, used for document titles, names of PDF documents etc.
start_date | Date | No | To denote when your project starts, used in conjunction with `end_date` to denote whether project is still active.
end_date | Date | No | To denote when your project ends, used in conjunction with `start_date` to denote whether project is still active.
reference | String | No | Your internal reference for a project e.g. 'RA01'
fields_attributes | Object | No | More information available [here](#for-project-updates)


### Response

Successful requests will return a json payload of the project that was updated and a `200` status code.

> 200

```json
{
  "data": {
    "id": "1",
    "type": "project",
    "attributes": {
      "name": "My Updated Project",
      "start_date": "2021-12-20" ,
      "end_date": "2022-12-20",
      "reference": "abc123",
      "archived_at": null,
      "state": "not_submitted"
    },
    "relationships": {
      "user": {
        "data": {
          "id":"8",
          "type":"user"
        }
      },
      "fields":{
        "data":[
          {
            "id":"248",
            "type":"field"
          }
        ]
      }
    },
    "links": {
      "app_url": "https://app.handshq.com/projects/1"
    }
  },
  "included":[
    {
      "id":"248",
      "type":"field",
      "attributes":{
        "label":"Client reference",
        "required":null,
        "value":"DEF345",
        "data_type":"string"
      },
      "relationships":{
        "fieldset":{
          "data":{
            "id":"58",
            "type":"fieldset"
          }
        }
      }
    }
  ]
}
```

## Archiving projects

```shell
curl https://api.handshq.com/v1/projects/[project_id]/archive \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request PATCH
```

> 200

```json
 {
  "data": {
  "id": "123",
  "type": "project",
  "attributes": {
    "name": "Example Project",
    "reference": "123",
    "start_date": "2022-01-01",
    "end_date": "2023-01-01",
    "archived_at": "2022-01-01T00:00:00+00:00",
    "state": "approved"
  },
  "relationships": {
    "fields": {
      "data": [{
        "id": "456",
        "type": "field"
      }]
    },
    "user": {
      "data": {
        "id": "789",
        "type": "user"
      }
    }
  },
  "links": {
    "app_url": "https://handshq.com/projects/123"
    }
  }
}
```

This endpoint allows you to archive a project within the division that is registered with the API token you provide.

### Request

`GET https://api.handshq.com/v1/projects/[project_id]/archive`

### Response

Successful requests will return a json payload of the archived project and a `200` status code.

A 404 will be returned if you try to archive a project that has already been archived.

## Unarchiving projects

```shell
curl https://api.handshq.com/v1/projects/[project_id]/unarchive \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request PATCH
```

> 200

```json
 {
  "data": {
  "id": "123",
  "type": "project",
  "attributes": {
    "name": "Example Project",
    "reference": "123",
    "start_date": "2022-01-01",
    "end_date": "2023-01-01",
    "archived_at": null,
    "state": "approved"
  },
  "relationships": {
    "fields": {
      "data": [{
        "id": "456",
        "type": "field"
      }]
    },
    "user": {
      "data": {
        "id": "789",
        "type": "user"
      }
    }
  },
  "links": {
    "app_url": "https://handshq.com/projects/123"
    }
  }
}
```

This endpoint allows you to unarchive a project within the division that is registered with the API token you provide.

### Request

`GET https://api.handshq.com/v1/projects/[project_id]/unarchive`

### Response

Successful requests will return a json payload of the archived project and a `200` status code.

A 404 will be returned if you try to unarchive a project that has not already been archived.

## Duplicating a project

```shell
curl https://api.handshq.com/v1/projects/[id]/duplications \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --request POST \
  -d '[json_payload]'
```

> Example Project duplicated payload.

```json
  {
    "user_email": "maddox@daystrom.com",
    "project": {
      "name": "My duplicated project",
      "start_date": "2022-12-20",
      "end_date": "2023-12-20",
      "reference": "abcd1234",
      "fields_attributes": {
        "1": "My field value"
      }
    }
  }

```

This endpoint allows you to duplicate a project that exists within the division that is registered with the API token you provide.

The project is duplicated asynchronously, so will not be available at this point. Successful requests will return a json payload detailing the duplication process and a `201` status code.  The duplication process information provides the id of the duplication process, the time that the duplication was requested and the current status of the duplication process - queued, in progress, complete or failed.

If you wish to access the status of the duplication process, and check if the duplicated project and version pdf has been generated, you can use the duplication process id to poll for the current status of the duplication process - further information [here](#viewing-project-duplication-process)

You can also be notified when a version pdf has been generated through our version_pdf_created webhook. The context for why the version pdf was generated will identify whether it was a result of a project duplication.

### Request

`POST https://api.handshq.com/v1/projects/[id]/duplications`

### Required Parameters
Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
user_email | String | Yes | The email of the HandsHQ user who will be marked as the author of the project

### Allowed Project Parameters
All parameters must be nested within `project`

Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
name | String | No | Name of your duplicated project, used for document titles, names of PDF documents etc. If not provided, this will default to the name of the original project suffixed with Copy.
start_date | Date | No | To denote when your project starts, used in conjunction with `end_date` to denote whether project is still active.
end_date | Date | No | To denote when your project ends, used in conjunction with `start_date` to denote whether project is still active.
reference | String | No | Your internal reference for a project e.g. 'RA01'
fields_attributes | Object | No | More information available [here](#for-project-creation)

### Response

Successful requests will return a json payload of the project duplication process and a 201 status code.

> 201

```json
{
  "data": {
    "id": "f38aadd81a124b2ab14695e88629f4b8",
    "type": "project_duplication",
    "attributes": {
      "status": "queued",
      "requested_at": "2022-01-01T00:00:00+00:00"
    },
    "relationships": {
      "project": {
        "data": null
      },
      "original_project": {
        "data": {
          "id": "224436",
          "type": "original_project"
        }
      },
      "version_pdf": {
        "data": null
      }
    }
  }
}
```

## Viewing project duplication process

```shell
curl https://api.handshq.com/v1/project_duplications/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --request GET
```

This endpoint allows you to view the duplication process of a project, by polling us with the id returned from duplicating the project. You can view the duplication process of projects within the division that is registered with the API token you provide.

The duplication process can have the following statuses: "queued", "in_progress", "complete" and "failed". We recommend you poll this endpoint no more than twice a minute.

If the status is complete, it means the duplicated project has been generated as well as the corresponding version pdf for that duplicated project.

If the duplication status has failed, this could mean either the duplication of the project has failed, or the project duplication was a success and the version pdf generation failed. You can determine the cause of the failure within the relationships of the response. If an id exists for the project and not the version pdf, the duplication was successful and the pdf generation failed. If neither project nor version pdf id exist, the project duplication failed.

If the version pdf takes longer than 10 minutes to generate, the duplication process is considered a failure - although the project will have been duplicated.

### Request

`GET https://api.handshq.com/v1/project_duplications/[id]`

### Response

Successful requests will return a json payload of the project duplication process and a `200` status code.

> 200

> Queued:

```json
{
  "data": {
    "id": "f38aadd81a124b2ab14695e88629f4b8",
    "type": "project_duplication",
    "attributes": {
      "status": "queued",
      "requested_at": "2022-01-01T00:00:00+00:00"
    },
    "relationships": {
      "project": {
        "data": null
      },
      "original_project": {
        "data": {
          "id": "123",
          "type": "original_project"
        }
      },
      "version_pdf": {
        "data": null
      }
    }
  }
}
```

> In Progress:

```json
{
  "data": {
    "id": "f38aadd81a124b2ab14695e88629f4b8",
    "type": "project_duplication",
    "attributes": {
      "status": "in_progress",
      "requested_at": "2022-01-01T00:00:00+00:00"
    },
    "relationships": {
      "project": {
        "data": null
      },
      "original_project": {
        "data": {
          "id": "123",
          "type": "original_project"
        }
      },
      "version_pdf": {
        "data": null
      }
    }
  }
}
```

> Complete:

```json
{
  "data": {
    "id": "f38aadd81a124b2ab14695e88629f4b8",
    "type": "project_duplication",
    "attributes": {
      "status": "complete",
      "requested_at": "2022-01-01T00:00:00+00:00"
    },
    "relationships": {
      "project": {
        "data": {
          "id": "456",
          "type": "project"
        }
      },
      "original_project": {
        "data": {
          "id": "123",
          "type": "original_project"
        }
      },
      "version_pdf": {
        "data": {
          "id": "789",
          "type": "version_pdf"
        }
      }
    }
  }
}
```

> Failed:

```json
{
  "data": {
    "id": "f38aadd81a124b2ab14695e88629f4b8",
    "type": "project_duplication",
    "attributes": {
      "status": "failed",
      "requested_at": "2022-01-01T00:00:00+00:00"
    },
    "relationships": {
      "project": {
        "data": null
      },
      "original_project": {
        "data": {
          "id": "123",
          "type": "original_project"
        }
      },
      "version_pdf": {
        "data": null
      }
    }
  }
}
```
