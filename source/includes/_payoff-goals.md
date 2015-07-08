# Payoff goals

### Payoff Goal States

| State      | Description |
|------------|-------------|
| `active`   | The goal is being updated and is capable of generating alerts. |
| `archived` | The goal is no longer being updated or generating alerts. |

### Payoff Goal Statuses

| Status     | Description |
|------------|-------------|
| `complete` | The goal has been accomplished. |
| `over`     | The goal's target completion date has passed. |
| `risk`     | The goal is not on target for completion on time. (Its current value is less than 80% of its expected current value). |
| `under`    | The goal is on target for completion on time. |

### Payoff Goal Contributions

| Attribute              | Description |
|------------------------|-------------|
| `monthly_contribution` | The average monthly conrtibution (rounded to the nearest ten). |
| `target_contribution`  | The amount that will be contributed to this goal every month. |

## Get Payoff Goal Images

Return a list of pre-defined payoff goal images.

### Request

    GET /api/v2/payoff_goals

### Response

```json
{
  "payoff_goal_images": [
    {
      "id": "credit_card.jpg",
      "name": "Pay off a credit card",
      "url": "http://www.example.com/images/standard_goal_images/credit_card.jpg?1368824034"
    }
  ]
}
```

### Status Codes

| Status | Description |
|--------|-------------|
| `200 OK` | returned when successful |
| `401 Not Authorized` | returned when invalid credentials are provided |

## Get Payoff Goals

Return a list of payoff goals for the given user.

### Request

    GET /api/v2/users/:user_id:/payoff_goals

### Response

```json
{
  "payoff_goals": [
    {
      "id": 583,
      "name": "Payoff a car",
      "image_name": "car.jpg",
      "image_url": "https://example.com/images/car.jpg",
      "state": "active",
      "status": "risk",
      "initial_value": "10.00",
      "current_value": "200.00",
      "target_value": "0.00",
      "monthly_contribution": "50.00",
      "percent_complete": 2,
      "complete": false,
      "target_completion_on": "2014-05-21",
      "target_contribution": "50.00",
      "created_at": "2013-01-01T16:54:15Z",
      "updated_at": "2013-10-01T20:21:01Z",
      "links": {
        "accounts": [2944]
      }
    }
  ]
}
```

### Status Codes

| Status | Description |
|--------|-------------|
| `200 OK` | returned when successful |
| `401 Not Authorized` | returned when invalid credentials are provided |
| `404 Not Found` | returned when an invalid user is specified |


## Get Payoff Goal

Return a payoff goal for the given user.

### Request

    GET /api/v2/users/:user_id:/payoff_goals/:payoff_goals_id:

### Response

```json
{
  "payoff_goals": [
    {
      "id": 583,
      "name": "Payoff a car",
      "image_name": "car.jpg",
      "image_url": "https://example.com/images/car.jpg",
      "state": "active",
      "status": "risk",
      "initial_value": "10.00",
      "current_value": "200.00",
      "target_value": "0.00",
      "monthly_contribution": "50.00",
      "percent_complete": 2,
      "complete": false,
      "target_completion_on": "2014-05-21",
      "target_contribution": "50.00",
      "created_at": "2013-01-01T16:54:15Z",
      "updated_at": "2013-10-01T20:21:01Z",
      "links": {
        "accounts": [2944]
      }
    }
  ]
}
```


## Create Payoff Goal

Create a payoff goal for the given user.

### Request

    POST /api/v2/users/:user_id:/payoff_goals

```json
{
  "payoff_goal": {
    "image_name": "car.jpg",
    "name": "Payoff a car",
    "target_contribution": "50.00",
    "account_ids": [
      2189
    ]
  }
}
```

### Parameters

| Parameter | Description |
|-----------|-------------|
| `image_name` | The image that represents this payoff goal on the Geezeo dashboard. __Required__ |
| `name` | Short name describing this goal. __Required__ |
| `target_contribution` | The amount that will be contributed to this goal every month. __Required unless target_completion_on is included__ |
| `target_completion_on` | The date at which this goal should be obtained. __Required unless target_completion_on is included__ |
| `account_ids` | The IDs of the Geezeo accounts that this payoff goal should be applied to. (The loan being paid-off has also been added to Geezeo) __Required__ |

### Response

```json
{
  "payoff_goals": [
    {
      "id": 583,
      "name": "Payoff a car",
      "image_name": "car.jpg",
      "image_url": "https://example.com/images/car.jpg",
      "state": "active",
      "status": "risk",
      "initial_value": "10.00",
      "current_value": "200.00",
      "target_value": "0.00",
      "monthly_contribution": "50.00",
      "percent_complete": 2,
      "complete": false,
      "target_completion_on": "2014-05-21",
      "created_at": "2013-01-01T16:54:15Z",
      "updated_at": "2013-10-01T20:21:01Z",
      "links": {
        "accounts": [2189]
      }
    }
  ]
}
```

### Status Codes

| Status | Description |
|--------|-------------|
| `201 Created` | returned when successful |
| `401 Not Authorized` | returned when invalid credentials are provided |
| `404 Not Found` | returned when an invalid user is specified |
| `422 Unprocessable Entity` | returned when the parameters given were invalid |


## Update Payoff Goal

Update a payoff goal for the given user.

### Request

    PUT /api/v2/users/:user_id:/payoff_goals/:payoff_goal_id:

```json
{
  "payoff_goal": {
    "image_name": "car.jpg",
    "name": "Payoff a car",
    "target_contribution": "50.00",
    "account_ids": [
      2189
    ]
  }
}
```

### Parameters

[See Create Payoff Goal parameters](#parameters)

### Status Codes

| Status | Description |
|--------|-------------|
| `204 No Content` | returned when successful |
| `401 Not Authorized` | returned when invalid credentials are provided |
| `404 Not Found` | returned when an invalid user is specified |
| `422 Unprocessable Entity` | returned when the parameters given were invalid |


## Delete Payoff Goal

Delete a payoff goal for the given user.

### Request

    DELETE /api/v2/users/:user_id:/payoff_goals/:payoff_goal_id:

### Status Codes

| Status | Description |
|--------|-------------|
| `204 No Content` | returned when successful |
| `401 Not Authorized` | returned when invalid credentials are provided |
| `404 Not Found` | returned when an invalid user is specified |


## Archive Payoff Goal

Archive a payoff goal for the given user.

### Request

    PUT /api/v2/users/:user_id:/payoff_goals/:payoff_goal_id:/archive

### Status Codes

| Status | Description |
|--------|-------------|
| `204 No Content` | returned when successful |
| `401 Not Authorized` | returned when invalid credentials are provided |
| `404 Not Found` | returned when an invalid user is specified |

