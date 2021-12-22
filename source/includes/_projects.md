# Projects

## Creating a project

```shell
curl https://api.handshq.com/v1/projects \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  -H "Content-Type: application/json" \
  --request POST \
  -d "[json_payload]"
```

> Example Project creation payload.

```json
  {
    "user_email": "maddox@daystrom.com",
    "project": {
      "name": "My project with extra details",
      "fields_attributes": {
        "1": "My field value"
      }
    }
  }

```

This endpoint allows you to create a project for the company who is registered with the api key you provide.

### HTTP Request

`POST https://api.handshq.com/v1/projects?user_email=#{user_email}`

### Required Query Parameters
Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
user_email | String | Yes | The email of the HandsHQ user who will be marked as the author of the project

### Allowed Project Parameters
All parameters must be nested within `project`

Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
name | String | Yes | Name of your project, used for document titles, names of PDF documents etc.
start_date | DateTime | No | To denote when your project starts, used in conjunction with `end_time` to denote whether project is still active.
end_date | DateTime | No | To denote when your project ends, used in conjunction with `start_time` to denote whether project is still active.
reference | String | No | Your internal reference for a project e.g. 'RA01'

In order to set further details we need a reference to which fields you would like to set a value for, these can differ for each company if you are using custom templates. You can find these references with our `fields` endpoint.

<aside class="notice">
Remember — ensure that values for that field correspond to their <code>data_type</code>
</aside>

### Response

Successful requests will return a json payload of the project that was created and a `201` status code.

> 201

```json
{
  "data": {
      "id": "1",
      "type": "project",
      "attributes": {
          "name": "My Project"
      },
      "relationships": {
          "user": {
              "data": null
          }
      },
      "links": {
          "app_url": "https://app.handshq.com/projects/1"
      }
  }
}
```
