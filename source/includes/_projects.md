# Projects

## Viewing projects

```shell
curl https://api.handshq.com/v1/projects \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
```

This endpoint allows you to view projects for the company who is registered with the API token you provide.

### Request

`GET https://api.handshq.com/v1/projects`

### Response

Successful requests will return a json payload of that division's projects and a `200` status code.

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
    ]
  }
```

## Viewing projects by project reference

```shell
curl https://api.handshq.com/v1/projects?reference=#{project_reference} \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]"
```

Adding a reference to the query string will return all projects for that company that match that project reference.

### Request

`GET https://api.handshq.com/v1/projects?reference=#{project_reference}`

### Allowed Query Parameters
Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
reference | String | No | The project reference

### Response

Successful requests will return a json payload of that division's projects that match the project reference and a `200` status code.

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
      }
    ]
  }
```

## Creating a project

```shell
curl https://api.handshq.com/v1/projects \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --request POST \
  -d "[json_payload]"
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

This endpoint allows you to create a project for the company who is registered with the API token you provide.

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
  -d "[json_payload]"
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

This endpoint allows you to update a project for the company who is registered with the API token you provide.

### Request

`PATCH https://api.handshq.com/v1/projects/#{project_id}`


### Allowed Project Parameters
All parameters must be nested within `project`

Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
name | String | Yes | Name of your project, used for document titles, names of PDF documents etc.
start_date | Date | No | To denote when your project starts, used in conjunction with `end_date` to denote whether project is still active.
end_date | Date | No | To denote when your project ends, used in conjunction with `start_date` to denote whether project is still active.
reference | String | No | Your internal reference for a project e.g. 'RA01'
fields_attributes | Object | No | More information available [here](#for-project-updates)


### Response

Successful requests will return a json payload of the project that was updated and a `200` status code.

> 201

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
