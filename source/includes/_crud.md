# Kittens

## Create a Kitten

```ruby
require 'rest-client'

RestClient.post(
  'https://app.procurementexpress.com/api/v1/kittens',
  {
    field01: 'value'
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: '1'
  }
)
```

```shell
curl https://app.procurementexpress.com/api/v1/kittens
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "field01=value"
```

> The above command returns JSON structured like this:

```json
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  }
```

Create a new kitten and returns the Kitten object that is created.

### HTTP Request

`POST https://app.procurementexpress.com/api/v1/kittens`

### Query Parameters

| Param                | Type   | Description           |
| -----                | ---    | ---------             |
| authentication_token | header | Authentication token  |
| app_company_id       | header | registered company id |
| field01              | string | first field           |




## Get All Kittens

```ruby
require 'rest-client'

response = RestClient.get(
  'https://app.procurementexpress.com/api/v1/kittens',
  headers = {
    authentication_token: 'your token',
    app_company_id: '1'
  }
)

response.body
```

```shell
curl 'https://app.procurementexpress.com/api/v1/kittens'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

Returns a list of your kittens.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/kittens`

### Query Parameters

| Param                | Type   | Description           |
| -----                | ---    | ---------             |
| authentication_token | header | Authentication token  |
| app_company_id       | header | registered company id |




## Get a Specific Kitten

```ruby
require 'rest-client'

response = RestClient.get(
  'https://app.procurementexpress.com/api/v1/kittens/1',
  headers = {
    authentication_token: 'your token',
    app_company_id: '1'
  }
)

response.body
```

```shell
curl 'https://app.procurementexpress.com/api/v1/kittens/1'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

Retrieves the details of an existing kitten. You need to supply the unique
kitten id, that was returned upon kitten creation.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/kittens/:id`

### URL Parameters

| Params               | Type    | Description                      |
| -----                | -----   | ---------                        |
| authentication_token | header  | Authentication token             |
| app_company_id       | header  | registered company id            |
| ID                   | integer | The ID of the kitten to retrieve |





## Update a Kitten

```ruby
require 'rest-client'

RestClient.put(
  'https://app.procurementexpress.com/api/v1/kittens/1',
  {
    field01: 'value'
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: '1'
  }
)
```

```shell
curl https://app.procurementexpress.com/api/v1/kittens/1
  -X PUT
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "field01=value"
```

> The above command returns JSON structured like this:

```json
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  }
```

Update the specified kitten by setting the value of parameters passed. Any
parameters not provided will be left unchanged.

### HTTP Request

`PUT https://app.procurementexpress.com/api/v1/kittens/:id`

### Query Parameters

| Param                | Type   | Description           |
| -----                | ---    | ---------             |
| authentication_token | header | Authentication token  |
| app_company_id       | header | registered company id |
| field01              | string | first field           |







## Delete a Specific Kitten

```ruby
require 'rest-client'

response = RestClient.delete(
  'https://app.procurementexpress.com/api/v1/kittens/1',
  headers = {
    authentication_token: 'your token',
    app_company_id: '1'
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/kittens/1'
  -X DELETE
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

Permanently deletes a kitten. It cannot be undone. It then returns a deleted
parameter on success. If the kitten id doesn't exists, it raises the error.

### HTTP Request

`DELETE https://app.procurementexpress.com/api/v1/kittens/:id`

### URL Parameters

| Params               | Type    | Description                      |
| -----                | -----   | ---------                        |
| authentication_token | header  | Authentication token             |
| app_company_id       | header  | registered company id            |
| ID                   | integer | The ID of the kitten to retrieve |
