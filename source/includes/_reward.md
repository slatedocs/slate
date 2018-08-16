# Rewards

## Get List of Rewards

```shell
curl "http://example.com/api/rewards"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": {
    "total_rewards": 30,
    "rewards": [
      {
        "id": 1,
        "title": "Purchased XON credits twice",
        "credit": 20,
        "date": "@D:2015-12-10T12:34:56",
        "timestamp": 19267343928,
      },
      {
        "id": 2,
        "title": "Purchased 200 Steam credits",
        "credit": 10,
        "date": "@D:2015-12-10T12:34:56",
        "timestamp": 19267343928,
      }
    ]
  }
}
```

This endpoint retrieves the list of all rewards earned by the user.

### HTTP Request

`GET http://example.com/api/rewards`

### URL Parameters

Parameter       | Data Type | Description
----------------|-----------|--------------
user_id         | Integer   | The id of the user logged in
offset          | Integer   | The page in the list to be retrieved
limit           | Integer   | The number of items to be retrieved

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>