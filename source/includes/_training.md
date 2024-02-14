# Training

## Creating a training

```shell
curl https://api.handshq.com/v1/training \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --request POST \
  -d '[json_payload]'
```

> Example Training creation payload.

```json
{
  "training": {
    "personnel_id": 2,
    "course_id": 3,
    "start_date": "2022-12-20",
    "expiry_date": "2024-12-20",
    "notes": "Training session notes"
  }
}
```

This endpoint allows you to add a training to a personnel using the ID of the personnel and the ID of the course.

### Request

`POST https://api.handshq.com/v1/training`

### Allowed Training Parameters

All parameters must be nested within `training`

| Parameter    | Format | Required                              | Description                                            |
| ------------ | ------ | ------------------------------------- | ------------------------------------------------------ |
| personnel_id | String | Yes                                   | The ID of the personnel                                |
| course_id    | String | Yes                                   | The ID of the course                                   |
| start_date   | String | Yes                                   | To denote when the training starts                     |
| expiry_date  | String | Yes (if the specified course expires) | To denote when the training expires if the course does |
| notes        | String | No                                    | Notes related to the training                          |

### Response

Successful requests will return a json payload of the newly created training and a `201` status code

> 201

```json
{
  "data": {
    "id": "1",
    "type": "training",
    "attributes": {
      "start_date": "2022-12-20",
      "expiry_date": "2024-12-20",
      "notes": "Training session notes"
    },
    "relationships": {
      "course": {
        "data": {
          "id": "3",
          "type": "course"
        }
      },
      "personnel": {
        "data": {
          "id": "2",
          "type": "personnel"
        }
      }
    }
  }
}
```
