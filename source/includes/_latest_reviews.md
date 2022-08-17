# Latest Reviews

A version of a project can be reviewed by the personnel that have been assigned to that project.

A personnel can review multiple versions of a project, and you can use this endpoint to access their review for the latest version of the project.

Reviews will only be found once reviews have been requested for a version.

## Viewing latest reviews for a project

```shell
curl https://api.handshq.com/v1/projects/[project_id]/latest_reviews \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request GET
```

This endpoint allows you to view the latest reviews that exist for a project, within the division that is registered with the API token you provide.

Personnel assignments and signatures will be included in the response, and the personnel the review was generated for can be determined through the personnel assignment relationships.

### Request

`GET https://api.handshq.com/v1/projects/[project_id]/latest_reviews`

### Response

Successful requests will return a json payload of the latest reviews and a `200` status code.

Results in `data` are [paginated](#pagination)

> 200

> Reviews have been requested

```json
  {
    "data": [{
      "id": "123",
      "type": "review",
      "attributes": {
        "state": "accepted",
        "viewed_at": "2022-01-01T00:00:00+00:00",
        "signed_at": "2022-02-01T00:00:00+00:00"
      },
      "relationships": {
        "personnel_assignment": {
          "data": {
            "id": "123",
            "type": "personnel_assignment"
          }
        },
        "signature": {
          "data": {
            "id": "456",
            "type": "signature"
          }
        }
      },
      "links": {
        "review_url": "https://reviews/123abc"
        }
      }
    ],
    "included": [{
      "id": "789",
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
    },
    {
      "id": "321",
      "type": "signature",
      "links": {
        "signature_url": "https://example-signature.png"
      }
    }],
    "meta": {
      "pagination": {
        "requested_page": 1,
        "total_pages": 1
      }
    }
  }
```

> No personnel have been added to project or reviews have not been requested

```json
{
  "data": [],
  "included": [],
  "meta": {
    "pagination": {
      "requested_page": 1,
      "total_pages": 0
    }
  }
}
```
## Viewing latest review for a personnel on a project

```shell
curl https://api.handshq.com/v1/personnel_assignments/[id]/latest_review \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request GET
```

```shell
curl https://api.handshq.com/v1/projects/[project_id]/personnel/[personnel_id]/latest_review \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request GET
```

This endpoint allows you to view the latest review that exists for a personnel on a project, within the division that is registered with the API token you provide.

Personnel assignments and signatures will be included in the response, and the personnel the review was generated for can be determined through the personnel assignment relationships.

You can access the latest review by providing the personnel assignment id, or the id of the project and personnel you wish to view the review for.

### Request

`GET https://api.handshq.com/v1/personnel_assignments/[id]/latest_review`

OR

`GET https://api.handshq.com/v1/projects/[project_id]/personnel/[personnel_id]/latest_review`

### Response

Successful requests will return a json payload of the latest review and a `200` status code.

A 404 will be returned if reviews have not been requested or a review cannot be found.

> 200

```json
  {
    "data": {
      "id": "123",
      "type": "review",
      "attributes": {
        "state": "accepted",
        "viewed_at": "2022-01-01T00:00:00+00:00",
        "signed_at": "2022-02-01T00:00:00+00:00"
      },
      "relationships": {
        "personnel_assignment": {
          "data": {
            "id": "123",
            "type": "personnel_assignment"
          }
        },
        "signature": {
          "data": {
            "id": "456",
            "type": "signature"
          }
        }
      },
      "links": {
        "review_url": "https://reviews/123abc"
      }
    },
    "included": [{
      "id": "789",
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
    },
    {
      "id": "321",
      "type": "signature",
      "links": {
        "signature_url": "https://example-signature.png"
      }
    }]
  }
```
