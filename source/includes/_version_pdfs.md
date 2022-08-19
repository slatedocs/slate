# Version PDFs

A version pdf is a pdf representation of the current version of the project. As a project changes over time, different versions are generated, and these versions can have pdf representations generated.

## Viewing a specific version pdf

```shell
curl https://api.handshq.com/v1/version_pdfs/[version_pdf_id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request GET
```

This endpoint allows you to view the version pdf that has been generated for a specific version of the project, within the division that is registered with the API token you provide.

If, for example, you duplicate a project through the api, and the duplication process is complete, you can use the version pdf id provided in the response to retrieve the generated version pdf using this endpoint.

### Request

`GET https://api.handshq.com/v1/version_pdfs/[version_pdf_id]`

### Response

Successful requests will return a json payload of the version pdf and a `200` status code.

> 200

```json
{
  "data": {
    "id": "123",
    "type": "version_pdf",
    "attributes": {
        "created_at": "2022-01-01T00:00:00+00:00",
        "file_size": 5000
    },
    "relationships": {
        "version": {
          "data": {
              "id": "456",
              "type": "version"
          }
        },
        "project": {
          "data": {
              "id": "789",
              "type": "project"
          }
        }
    },
    "links":{
      "version_pdf_url":"https://example.pdf"
    }
  }
}
```

## Viewing latest version pdf for a project

```shell
curl https://api.handshq.com/v1/projects/[project_id]/latest_version_pdf \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request GET
```

This endpoint allows you to view the latest version pdf that has been generated for a project, within the division that is registered with the API token you provide.

The project, history, version and latest reviewed version will be included in the response.

### Request

`GET https://api.handshq.com/v1/projects/[project_id]/latest_version_pdf`

### Response

Successful requests will return a json payload of the latest version pdf and a `200` status code.

> 200

```json
{
  "data": {
    "id": "321",
    "type": "version_pdf",
    "attributes": {
        "created_at": "2022-01-01T00:00:00+00:00",
        "file_size": 5000
    },
    "relationships": {
      "version": {
        "data": {
            "id": "456",
            "type": "version"
        }
      },
      "project": {
        "data": {
            "id": "123",
            "type": "project"
        }
      }
    },
    "links": {
      "version_pdf_url": "https://example.pdf"
    }
  },
  "included": [{
    "id": "456",
    "type": "version",
    "attributes": {
      "is_fully_signed": true,
      "pdf_filename": "example-project.pdf",
      "display_number": 2,
      "created_at": "2022-01-01T00:00:00+00:00"
    },
    "relationships": {
      "history": {
          "data": {
            "id": "789",
            "type": "history"
          }
      },
      "version_pdf": {
          "data": {
            "id": "321",
            "type": "version_pdf"
          }
        }
      }
    },
    {
      "id": "789",
      "type": "history",
      "attributes": {
        "reason": "Katie M. edited the project",
        "createdAt": "2022-01-01T00:00:00+00:00",
        "displayNumber": 2,
        "nadminUserShortName": "Katie M.",
        "context": "project_edited",
        "eventType": "generic"
      },
      "relationships": {
        "project": {
            "data": {
              "id": "123",
              "type": "project"
            }
        },
        "message": {
            "data": null
        }
      }
    },
    {
      "id": "123",
      "type": "project",
      "attributes": {
        "name": "Example Project",
        "reference": "123",
        "start_date": "2022-08-10",
        "end_date": "2023-08-10",
        "archived_at": null,
        "state": "approved"
      },
      "relationships": {
        "fields": {
          "data": [
            {
                "id": "1",
                "type": "field"
            }
          ]
        },
      "user": {
        "data": {
          "id": "2",
            "type": "user"
          }
        }
      },
      "links": {
        "app_url": "https://handshq.com/projects/123"
      }
    }
```