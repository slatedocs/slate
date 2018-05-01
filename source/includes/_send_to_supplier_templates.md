# Send to supplier templates

## Create a Template

```shell
curl --request POST \
  --url https://app.rubberstamp.io/api/v1/send_to_supplier_templates \
  --header 'app_company_id: 1' \
  --header 'authentication_token: your token' \
  --header 'content-type: application/json' \
  --data '{
      "send_to_supplier_template": {
          "label": "Sample Template",
          "text": "Dear John Snow, \r\n\n this is a sample template"
        }
    }'
```

```ruby
require 'rest-client'
RestClient.post(
  'https://app.rubberstamp.io/api/v1/send_to_supplier_templates',
  {
    send_to_supplier_template: {
        label: 'Sample Template',
        text: "Dear John Snow, \r\n\n this is a sample template"
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: '1'
  }
)
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "company_id": 1,
  "label": "Sample Template",
  "text": "Dear John Snow, \r\n\n this is a sample template"
}
```

Create new Send to supplier template with `label` and `text`.

### HTTP Request

`POST https://app.rubberstamp.io/api/v1/send_to_supplier_templates`

### Query Parameters

| Param                | Type   | Description             |
| -------------------- | ------ | ----------------------- |
| authentication_token | header | Authentication token    |
| app_company_id       | header | registered company id   |
| label                | string | label for your template |
| text                 | text   | body of the template    |

## Get All Templates

```shell
curl --request GET \
  --url https://app.rubberstamp.io/api/v1/send_to_supplier_templates \
  --header 'app_company_id: 1' \
  --header 'authentication_token: your token' \
  --header 'content-type: application/json'
```

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/send_to_supplier_templates',
  headers = {
      authentication_token: 'your token',
      app_company_id: '1'
  }
)
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "company_id": 1,
    "label": "Default Template",
    "text":
      "Dear MyTaxi, \r\n\r\nPlease find attached to this email a Purchase Order number. We request that you attach this document when sending your invoice to our accounts department. \r\n\r\nSincerely, \r\nUNICEF Ireland"
  },
  {
    "id": 2,
    "company_id": 1,
    "label": "Sample Template",
    "text": "Dear John Snow, \r\n\n this is a sample template"
  }
]
```

Get list of all templates.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/send_to_supplier_templates`

### Query Parameters

| Params               | Type   | Description          |
| -------------------- | ------ | -------------------- |
| app_company_id       | header | Company ID           |
| authentication_token | header | Authentication Token |

## Get a Specific Template

```sh
curl --request GET \
  --url https://app.rubberstamp.io/api/v1/send_to_supplier_templates/2 \
  --header 'app_company_id: 1' \
  --header 'authentication_token: your token' \
  --header 'content-type: application/json'
```

```ruby
require 'rest-client'

response = RestClient.get(
  'https://app.rubberstamp.io/api/v1/send_to_supplier_templates/2',
  headers = {
    authentication_token: 'your token',
    app_company_id: '1'
  }
)
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "company_id": 1,
  "label": "Sample Template",
  "text": "Dear John Snow, \r\n\n this is a sample template"
}
```

Get detail for send to supplier template by given id

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/send_to_supplier_templates/:id`

### URL Parameters

| Params               | Type    | Description                      |
| -------------------- | ------- | -------------------------------- |
| authentication_token | header  | Authentication token             |
| app_company_id       | header  | registered company id            |
| ID                   | integer | The ID of the kitten to retrieve |

## Update a Template

```ruby
require 'rest-client'

RestClient.put(
  'https://app.rubberstamp.io/api/v1/send_to_supplier_templates/1',
  {
    label: 'Thank you template'
    text: 'Dear John Snow, \t\n\n Thank you for subscribing to our newsletter.'
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: '1'
  }
)
```

```shell
curl --request PUT \
  --url https://app.rubberstamp.io/api/v1/send_to_supplier_templates/2 \
  --header 'app_company_id: 1' \
  --header 'authentication_token: your token' \
  --header 'content-type: application/json' \
  --data '{
      "send_to_supplier_template": {
          "label": "Thank you template",
          "text": "Dear John Snow, \t\n\n Thank you for subscribing to our newsletter."
        }
    }'
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "company_id": 1,
  "label": "Thank you template",
  "text": "Dear John Snow, \t\n\n Thank you for subscribing to our newsletter."
}
```

Update the specified template by setting the value of parameters passed. Any
parameters not provided will be left unchanged.

### HTTP Request

`PUT https://app.rubberstamp.io/api/v1/kittens/:id`

### Query Parameters

| Param                | Type   | Description           |
| -------------------- | ------ | --------------------- |
| authentication_token | header | Authentication token  |
| app_company_id       | header | registered company id |
| label                | string | template label        |
| text                 | text   | template body         |
