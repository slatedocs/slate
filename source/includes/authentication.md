# Authentication

```http
GET /api/v2/users/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

To authenticate against SDE Elements,
you need to pass an API access token via an `Authorization` header.

A token can be generated as follows:

* Go to the menu option in the top right of SD Elements: <your name>/API Settings
* Select the APIv2 tab and click on the Generate Token Button.
* The token will be displayed **only once**.
