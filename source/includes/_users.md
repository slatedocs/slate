# Users

## GET all users at your account
```shell
curl -H "Content-Type: application/json" \
-u YOUR_EMAIL:YOUR_TOKEN  \
https://api.practitest.com/api/v2/users.json
# IS THE SAME AS:
curl -H "Content-Type: application/json" \
https://api.practitest.com/api/v2/users.json?developer_email=YOUR_EMAIL&api_token=YOUR_TOKEN
```

```csharp
string token = "xxx";
string developerEmail = "my@email.address";

var request = WebRequest.Create("https://api.practitest.com/api/v2/users.json");
//request.PreAuthenticate = true;
string authInfo = Convert.ToBase64String(Encoding.Default.GetBytes(developerEmail + ":" + token));
request.Headers["Authorization"] = "Basic " + authInfo;

var response = request.GetResponse();
Console.WriteLine(response.Headers);
```


> This command: https://api.practitest.com/api/v2/users.json?api_token=YOUR_TOKEN&developer_email=YOUR_EMAIL, returns JSON structured like below:


```json
{
  "data": [
    {
      "id": "53811",
      "type": "users",
      "attributes": {
        "first-name": null,
        "last-name": null,
        "display-name": "chris.z@rd.com",
        "email": "chris.z@rd.com",
        "time-zone": "UTC",
        "created-at": "2016-05-30T16:45:02+03:00"
      }
    },
    {
      "id": "538724",
      "type": "users",
      "attributes": {
        "first-name": null,
        "last-name": null,
        "display-name": "monica@gmail.com",
        "email": "monica@gmail.com",
        "time-zone": "UTC",
        "created-at": "2016-06-20T14:35:19+03:00"
      }
    },
    {
      "id": "539467",
      "type": "users",
      "attributes": {
        "first-name": null,
        "last-name": null,
        "display-name": "pascal@most.com",
        "email": "pascal@most.com",
        "time-zone": "UTC",
        "created-at": "2016-07-07T17:44:15+03:00"
      }
    },
    {
      "id": "539598",
      "type": "users",
      "attributes": {
        "first-name": null,
        "last-name": null,
        "display-name": "phillip.rik@pt.com",
        "email": "phillip.rik@pt.com",
        "time-zone": "UTC",
        "created-at": "2016-07-27T15:08:14+03:00"
      }
    },
    {
      "id": "539976",
      "type": "users",
      "attributes": {
        "first-name": null,
        "last-name": null,
        "display-name": "beck735306@pt.com",
        "email": "beck735306@pt.com",
        "time-zone": "UTC",
        "created-at": "2016-08-08T15:05:13+03:00"
      }
    }
  ],
  "links": {},
  "meta": {
    "current-page": 1,
    "next-page": null,
    "prev-page": null,
    "total-pages": 1,
    "total-count": 5
  }
}
```

This endpoint retrieves all users.

### HTTP Request

`https://api.practitest.com/api/v2/users.json`

### Query Parameters - [pagination](#pagination)

Here's the examples of the JSON requests and response that you may get when submitting a GET request

### PAT Support
Shows list of users only to projects that a user belongs to.

<aside class="notice">
  Remember, you can see examples in the dark area to the right.
</aside>




## Add a user
```shell
# creates a user:
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X POST https://api.practitest.com/api/v2/users.json \
-d '{"data": {"attributes": {"email": "NEW_USER_EMAIL", "first-name": "FIRST_NAME", "last-name": "LAST_NAME", "display-name": "DISPLAY_NAME"}}}'


```

<aside class="notice">
  Available for Ultimate accounts only
</aside>

This endpoint creates a new User.<br>
Will return 422 if user already exists.

### HTTP Request

`POST https://api.practitest.com/api/v2/users.json`

Parameters | Description | required? |
--------- | ------- |------- |
data/attributes/email | email | true |
data/attributes/first-name | First Name | false |
data/attributes/last-name | Last Name | false |
data/attributes/display-name | Display name of the user in the system | false |


> This command returns JSON structured like below:

```json
{
  "data": {
    "id": "22",
    "type": "users",
    "attributes": {
      "first-name": "Stas",
      "last-name": "Krichevsky",
      "display-name": "Stas Krichevsky",
      "email": "stask+test@practitest.com",
      "time-zone": null,
      "created-at": "2019-07-10T20:18:34Z"
    }
  }
}

```


## Show a specific Issue
```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
https://api.practitest.com/api/v2/users/22.json
```

> This command returns JSON structured like below:

```json
{
  "data": {
    "id": "22",
    "type": "users",
    "attributes": {
      "first-name": "Stas",
      "last-name": "Krichevsky",
      "display-name": "Stas Krichevsky",
      "email": "stask+test@practitest.com",
      "time-zone": null,
      "created-at": "2019-07-10T20:18:34Z"
    }
  }
}

```
<aside class="notice">
  Available for Ultimate accounts only
</aside>


This endpoint shows a specific user

### HTTP Request

`GET https://api.practitest.com/api/v2/users/USER_ID.json`




## Update a user

```shell
curl -H "Content-Type:application/json" \
-u YOUR_EMAIL:YOUR_TOKEN \
-X PUT https://api.practitest.com/api/v2/users/USER_ID.json
-d '{"data": {"attributes": {"display-name": "NEW_DISPLAY_NAME"}}}'

```

<aside class="notice">
  Available for Ultimate accounts only
</aside>


This endpoint updates a specific user.

### HTTP Request

`PUT https://api.practitest.com/api/v2/users/USER_ID.json`

### Parameters

Available parameters | Description |
--------- | ------- |
data/attributes/first-name | First Name | false |
data/attributes/last-name | Last Name | false |
data/attributes/display-name | Display name of the user in the system | false |
