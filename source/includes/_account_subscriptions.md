# Account Subscriptions

## List Account Subscriptions

```javascript
fetch('https://core.eventtia.com/v1/account_subscriptions/', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate.

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": [
    {
      "id": "43",
      "type": "account_subscriptions",
      "attributes": {
        "subscription_date": null,
        "stripe_identifier": "stripe_identifier_1",
        "settings": null,
        "status": "processing",
        "stripe_url": null,
        "cancel_at": null,
        "updated_by_id": 1,
        "archived": false
      },
      "relationships": {
        "commercial_plan": {
          "data": {
            "id": "45",
            "type": "commercial_plans"
          }
        }
      }
    }
  ],
  "links": {
    "first": "https://dev-api.eventtia.com/es/v1/account_subscriptions?page=1",
    "last": "https://dev-api.eventtia.com/es/v1/account_subscriptions?page=1",
    "prev": null,
    "next": null
  }
}
```

> Example of Unprocessable Entity (422) response:

```http
HTTP/1.1 422 Unprocessable Entity
{
  "plan_id": [
    "must be a string"
  ]
}
```

This endpoint return a list of account subscriptions

### HTTP Request

`GET /v1/account_subscriptions/`

## Get Account Subscription

```javascript
fetch('https://core.eventtia.com/v1/account_subscriptions/<id>', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate.

> Make sure you replace &lt;id&gt; with the id for the account_subscription to get.

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "43",
    "type": "account_subscriptions",
    "attributes": {
      "subscription_date": null,
      "stripe_identifier": "stripe_identifier_1",
      "settings": null,
      "status": "processing",
      "stripe_url": null,
      "cancel_at": null,
      "updated_by_id": 1,
      "archived": false
    },
    "relationships": {
      "commercial_plan": {
        "data": {
          "id": "45",
          "type": "commercial_plans"
        }
      }
    }
  }
}
```

> Example of Account Subscription Not Found (404) response:

```http
HTTP/1.1 404 Not Found
{
  "message": "Couldn't find AccountSubscription"
}
```

This endpoint return an account subscription

### HTTP Request

`GET /v1/account_subscriptions/:id`

### Path Parameters

| Parameter | Type    | Description                                 |
| --------- | ------- | ------------------------------------------- |
| id        | integer | The id for the desired account subscription |

## Create Account Subscription

```javascript
fetch('https://core.eventtia.com/v1/account_subscriptions/', {
  method: 'POST',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
    data: {
      type: "account_subscriptions",
      attributes: {
        plan_id: "<commercial_plan_id>",
        price_id: "<price_id>"
      }
    }
  }
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate.

> Make sure you replace &lt;commercial_plan_id&gt; with the id of the desired commercial plan.

> Make sure you replace &lt;price_id&gt; with the id of the desired price.

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "34234",
    "type": "account_subscriptions",
    "attributes": {
      "price_id": "price_1KEwkLHCxGs6xkptcLXtbBlV"
    },
    "relationships": {
      "commercial_plans": {
        "data": [
          {
            "id": ,
            "type": "commercial_plans"
          }
        ]
      }
    }
  }
}
```

> Example of Unprocessable Entity (422) response:

```http
HTTP/1.1 422 Unprocessable Entity
{
  "plan_id": [
    "must be a string"
  ]
}
```

This endpoint create an account subscription and return it

### HTTP Request

`POST /v1/account_subscriptions/`

### Available settings

| Parameter | Type   | Description                                       |
| --------- | ------ | ------------------------------------------------- |
| plan_id   | string | commercial plan id for this account subscription. |
| price_id  | string | payment platform price id.                        |

## Update Account Subscription

```javascript
fetch('https://core.eventtia.com/v1/account_subscriptions/<id>', {
  method: 'PUT',
  headers: {
    'Authorization': <your token>',
  },
  body: {
    data: {
      type: "account_subscriptions",
      attributes: {
        plan_id: "<commercial_plan_id>",
        price_id: "<price_id>"
      }
    }
  }
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate.

> Make sure you replace &lt;commercial_plan_id&gt; with the id of the desired commercial plan.

> Make sure you replace &lt;price_id&gt; with the id of the desired price.

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "34234",
    "type": "account_subscriptions",
    "attributes": {
      "price_id": "price_1KEwkLHCxGs6xkptcLXtbBlV"
    },
    "relationships": {
      "commercial_plans": {
        "data": [
          {
            "id": ,
            "type": "commercial_plans"
          }
        ]
      }
    }
  }
}
```

> Example of Unprocessable Entity (422) response:

```http
HTTP/1.1 422 Unprocessable Entity
{
  "plan_id": [
    "must be a string"
  ]
}
```

This endpoint update an account subscription and return it

### HTTP Request

`PUT /v1/account_subscriptions/:id`

### Path Parameters

| Parameter | Type    | Description                                 |
| --------- | ------- | ------------------------------------------- |
| id        | integer | The id for the desired account subscription |

### Available settings

| Parameter | Type   | Description                                       |
| --------- | ------ | ------------------------------------------------- |
| plan_id   | string | commercial plan id for this account subscription. |
| price_id  | string | payment platform price id.                        |

## Destroy Account Subscriptions

```javascript
fetch('https://core.eventtia.com/v1/account_subscriptions/<id>', {
  method: 'DELETE',
  headers: {
    'Authorization': '<your token>',
  }
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate.

> Make sure you replace &lt;id&gt; with the id for the account subscription to destroy.

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "34234",
    "type": "account_subscriptions",
    "attributes": {
      "price_id": "price_1KEwkLHCxGs6xkptcLXtbBlV"
    },
    "relationships": {
      "commercial_plans": {
        "data": [
          {
            "id": ,
            "type": "commercial_plans"
          }
        ]
      }
    }
  }
}
```

This endpoint destroy a account subscription and return it

### HTTP Request

`DELETE /v1/account_subscriptions/:id`

### Path Parameters

| Parameter | Type    | Description                                 |
| --------- | ------- | ------------------------------------------- |
| id        | integer | The id for the desired account subscription |
