# Users

## GET a list of all users associated with your account - GET/users.json

Here's the examples of the JSON requests and response that you may get when submitting a GET request to: https://prod.practitest.com/api/v2/users.json

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
"display-name": "christine.zhuravleva@gmail.com",
"email": "christine.zhuravleva@gmail.com",
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
"display-name": "monica.kingsman@gmail.com",
"email": "monica.kingsman@gmail.com",
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
"display-name": "pascalm778@gmail.com",
"email": "pascalm778@gmail.com",
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
"display-name": "phlip.ritter@gmail.com",
"email": "phlip.ritter@gmail.com",
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
"display-name": "beck75306@gmail.com",
"email": "beck75306@gmail.com",
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
