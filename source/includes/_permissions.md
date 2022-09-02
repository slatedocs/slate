# Permissions

## List Permissions

```javascript
fetch('https://core.eventtia.com/v1/permissions/', {
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
  "data": {
    "id": "1",
    "type": "permissions",
    "attributes": {
      "id": 1,
      "name": "index",
      "scope": "event",
      "controller": "attendee_types"
    }
  }
}
```
list of permissions supported by the system and return it

### HTTP Request

`GET /v1/permissions/`

### Path Parameters


Parameter |  Type   | Description
--------- | ------- | -----------
page | json | A page object as described <a href="#pagination">here</a>
