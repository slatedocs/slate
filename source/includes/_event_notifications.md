# Event Notifications

Each Event Subscription will send a `POST` request to the location set out within it's own `external_url` that has been provided once the event occurs.

These will be in a `JSON` format and still in-keeping with the `JSON:API` specification.

The body of an event subscription will vary depending on the type of event being subscribed to.

## Version PDF Created

```json
{
  "data": {
    "id": "2",
    "type": "version_pdf",
    "attributes": {
      "created_at": "2021-11-05T11:30:32.742+00:00",
      "file_size": 32540
    },
    "relationships": {
      "version": {
        "data": {
          "id": "50",
          "type": "version"
        }
      }
    },
    "links": {
      "content": "https://exampleRemoteStorage.com/123.pdf"
    }
  },
  "included": [
    {
      "id": "50",
      "type": "version",
      "attributes": {
        "is_fully_signed": false,
        "pdf_filename": "my-lovely-project.pdf",
        "display_number": 0,
        "created_at": "2021-11-05T11:29:33.222+00:00"
      },
      "relationships": {
        "history": {
          "data": {
            "id": "50",
            "type": "history"
          }
        },
        "version_pdf": {
          "data": {
            "id": "2",
            "type": "version_pdf"
          }
        }
      }
    },
    {
      "id": "50",
      "type": "history",
      "attributes": {
        "reason": "Jane D. created the project",
        "createdAt": "2021-11-05T11:29:32.955+00:00",
        "displayNumber": 0,
        "eventType": "generic"
      },
      "relationships": {
        "project": {
          "data": {
            "id": "19",
            "type": "project"
          }
        }
      }
    },
    {
      "id": "19",
      "type": "project",
      "attributes": {
        "name": "My lovely project",
        "reference": "ref1",
        "start_date": null,
        "end_date": null,
        "archived_at": null,
        "state": "not_submitted"
      },
      "relationships": {
        "fields": {
          "data": [
            {
              "id": "261",
              "type": "field"
            },
            {
              "id": "265",
              "type": "field"
            },
          ]
        },
        "user": {
          "data": {
            "id": "5",
            "type": "user"
          }
        }
      },
      "links": {
        "app_url": "https://localhost:3000/projects/19"
      }
    }
  ]
}
```
### Data:

  - The attributes of PDF record
    - Link to the URL of where the PDF is hosted

### Included Resources:

  - The `Project` that it was derived from.
    - Link to the project within HandsHQ


  - The `History` describing what caused the creation of a new `Version`
    - Included description of the latest change


  - The `Version` of a `Project` which had been generated into a PDF
    - Included numbering of the version


  - The author (`User`) of the project.

<aside class='notice'>
  <strong>Please Note</strong>:
  <li>The URL of the PDF (as described in "links" => "content") is only valid for 48 hours.</li>
  <li>This event may fire on occassion for the same version, in cases where a PDF is being regenerated (e.g. in the case of digital signatures)</li>
</aside>


## Role Created
```json
 {
   "data": {
    "id": "123",
    "type": "role",
    "attributes": {
       "position": "Technician"
      },
    },
    "meta": {
      "event_type": "role_created"
    }
  }
```

### Data:

  - The role that has been created.


## Role Updated
```json
 {
   "data": {
    "id": "123",
    "type": "role",
    "attributes": {
      "position": "Technician",
    },
    "meta": {
      "event_type": "role_updated"
    }
  }
```

### Data:

  - The role that has been updated.

## Role Deleted
```json
  {
   "data": {
    "id": "123",
    "type": "role",
    "attributes": {
      "position": "Technician",
    },
    "meta": {
      "event_type": "role_deleted"
    }
  }
```

### Data:

  - The role that has been deleted.

## Personnel Created
```json
  {
    "data": {
      "id": "123",
      "type": "personnel",
      "attributes": {
        "first_name": "John",
        "last_name": "Smith",
        "email": "john.smith@email.com",
        "archived_at": null,
        "type": "employee"
      },
      "relationships": {
        "line_manager": {
          "data": {
            "id": "4321",
            "type": "lineManager"
          }
        },
        "roles": {
          "data": [
            {
              "id": "123",
              "type": "role"
            },
            {
              "id": "321",
              "type": "role"
            }
          ]
        }
      }
    },
    "meta": {
      "event_type":"personnel_created"
    }
  }
```

### Data:

  - The personnel that has been created, along with IDs of the personnel's line manager and associated roles.

## Personnel Updated
```json
  {
    "data": {
      "id": "123",
      "type": "personnel",
      "attributes": {
        "first_name": "John",
        "last_name": "Smith",
        "email": "john.smith@email.com",
        "archived_at": null,
        "type": "employee"
      },
      "relationships": {
        "line_manager": {
          "data": {
            "id": "4321",
            "type": "lineManager"
          }
        },
        "roles": {
          "data": [
            {
              "id": "123",
              "type": "role"
            },
            {
              "id": "321",
              "type": "role"
            }
          ]
        }
      }
    },
    "meta": {
      "event_type":"personnel_updated"
    }
  }
```

### Data:

  - The personnel that has been updated, along with IDs of the personnel's line manager and associated roles.

## Personnel Deleted
```json
  {
    "data": {
      "id": "123",
      "type": "personnel",
      "attributes": {
        "first_name": "John",
        "last_name": "Smith",
        "email": "john.smith@email.com",
        "archived_at": null,
        "type": "employee"
      },
      "relationships": {
        "line_manager": {
          "data": {
            "id": "4321",
            "type": "lineManager"
          }
        },
        "roles": {
          "data": [
            {
              "id": "123",
              "type": "role"
            },
            {
              "id": "321",
              "type": "role"
            }
          ]
        }
      }
    },
    "meta": {
      "event_type":"personnel_deleted"
    }
  }
```

### Data:

  - The personnel that has been deleted, along with IDs of the personnel's line manager and associated roles.

## Personnel Archived
```json
  {
    "data": {
      "id": "123",
      "type": "personnel",
      "attributes": {
        "first_name": "John",
        "last_name": "Smith",
        "email": "john.smith@email.com",
        "archived_at": "2022-01-01T12:30:30.479+01:00",
        "type": "employee"
      },
      "relationships": {
        "line_manager": {
          "data": {
            "id": "4321",
            "type": "lineManager"
          }
        },
        "roles": {
          "data": [
            {
              "id": "123",
              "type": "role"
            },
            {
              "id": "321",
              "type": "role"
            }
          ]
        }
      }
    },
    "meta": {
      "event_type":"personnel_archived"
    }
  }
```

### Data:

  - The personnel that has been archived, along with IDs of the personnel's line manager and associated roles.

## Personnel Unarchived
```json
  {
    "data": {
      "id": "123",
      "type": "personnel",
      "attributes": {
        "first_name": "John",
        "last_name": "Smith",
        "email": "john.smith@email.com",
        "archived_at": null,
        "type": "employee"
      },
      "relationships": {
        "line_manager": {
          "data": {
            "id": "4321",
            "type": "lineManager"
          }
        },
        "roles": {
          "data": [
            {
              "id": "123",
              "type": "role"
            },
            {
              "id": "321",
              "type": "role"
            }
          ]
        }
      }
    },
    "meta": {
      "event_type":"personnel_unarchived"
    }
  }
```

### Data:

  - The personnel that has been unarchived, along with IDs of the personnel's line manager and associated roles.

## Training Status Changed
```json
  {
    "data": [
      {
        "id": "23_training-status",
        "type": "trainingStatus",
        "attributes": {
          "status": "valid",
          "description": "training up-to-date"
        },
        "relationships": {
          "personnel": {
            "data": {
              "id": "123",
              "type": "personnel"
            }
          }
        }
      },
      {
        "id": "22_training-status",
        "type": "trainingStatus",
        "attributes": {
          "status": "expired",
          "description": "expired training"
        },
        "relationships": {
          "personnel": {
            "data": {
              "id":"231",
              "type":"personnel"
            }
          }
        }
      }
    ],
    "meta": {
      "eventType":"training_status_changed"
    }
  }
```

### Data:

  - A collection of the training statuses that have changed as the result of an action taken via API or via the App.
  - A list of possible statuses and their status descriptions:
    - `missing` | missing training
    - `date_missing` | training expiry date not set
    - `expired` | expired training
    - `expiring` | training expiring soon
    - `valid` | training up-to-date
    - `default` | no training require
