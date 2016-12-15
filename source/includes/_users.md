# Users

## GET all users at your account

This endpoint retrieves all users.

### HTTP Request

`https://prod.practitest.com/api/v2/users.json`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page[number] | 1 | the page number starting from 1
page[size] | 100 | number of entities displayed per page

Note: The example query parameters above use unencoded [ and ] characters simply for readability. In practice, these characters must be percent-encoded as page%5Bnumber%5D and page%5Bsize%5D

Here's the examples of the JSON requests and response that you may get when submitting a GET request

Remember, you can see examples in the dark area to the right.

```shell
    curl -H "Content-Type: application/json" \
     -u YOUR_EMAIL:YOUR_TOKEN  \
    https://prod.practitest.com/api/v2/users.json
# IS THE SAME AS:
    curl -H "Content-Type: application/json" \
    https://prod.practitest.com/api/v2/users.json?developer_email=YOUR_EMAIL&api_token=YOUR_TOKEN
```

> This command: https://prod.practitest.com/api/v2/users.json?api_token=YOUR_TOKEN&developer_email=YOUR_EMAIL, returns JSON structured like below:


```json
{
  "data": [
    {
      "id": "53811",
      "type": "users",
      "attributes": {
        "first-name": null,
        "last-name": null,
        "display-name": "christine.z@rd.com",
        "email": "christine.z@rd.com",
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
        "display-name": "monica.king@gm.com",
        "email": "monica.king@gm.com",
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
        "display-name": "pascalm778@gm.com",
        "email": "pascalm778@gm.com",
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
        "display-name": "phlip.r@pt.com",
        "email": "phlip.r@pt.com",
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
        "display-name": "beck75306@pt.com",
        "email": "beck75306@pt.com",
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
