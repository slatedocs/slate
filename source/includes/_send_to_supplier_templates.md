# Send to supplier templates

## Get All Templates

```shell
curl --request GET \
  --url https://app.procurementexpress.com/api/v1/send_to_supplier_templates \
  --header 'app_company_id: 1' \
  --header 'authentication_token: your token' \
  --header 'content-type: application/json'
```

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/send_to_supplier_templates',
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
    "text": "Dear John Snow, \r\n\n this is a sample template",
    "template_name": "Sample Template",
    "is_default": true
  }
]
```

Get list of all templates.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/send_to_supplier_templates`

### Query Parameters

| Params               | Type   | Description          |
| -------------------- | ------ | -------------------- |
| app_company_id       | header | Company ID           |
| authentication_token | header | Authentication Token |

## Forward Template

```shell
curl --request POST \
  --url https://app.procurementexpress.com/api/v1/purchase_orders/2/forward \
  --header 'app_company_id: 1' \
  --header 'authentication_token: your token' \
  --header 'content-type: application/json' \
  --data '{
    "emails": "test@example.com",
    "cc": "test2@example.com",
    "note": "Thank you for subscribing",
    "save_template": true,
    "email_subject": "Thank you for subscribing",
    "template_name": "woo hoo!!",
    "uploads": [1,2],
  }'
```

```ruby
require 'rest-client'

RestClient.post(
  'https://app.procurementexpress.com/api/v1/purchase_orders/2/forward',
  {
    emails: "test@example.com",
    cc: "test2@example.com",
    note: "Thank you for subscribing",
    save_template: true,
    email_subject: "Thank you for subscribing",
    template_name: "woo hoo!!",
    uploads: [1,2]
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: '1'
  }
)
```

> The above command returns JSON structured like this:

```json
{ "save": true }
```

This api endpoint will perform any of these 3 actions:

### Create New Template

To create new template, you must pass `save_template: true` params or form data into the post request.

### Update Existing Template

To update existing template, you must need to pass `update_template: true` params or form data into this post request.

### Send template to supplier

If `save_template` or `update_template` is not there, then it will send given template to the supplier.

### Default Template

To mark template as default, you need to pass `is_default: true` params or form data.

### Emails Fields

In [Purchase Order Details](/slate/#get-purchase-order-details) you will get `supplier.email`, which you can send in `emails` field.

### CC Fields

In [Purchase Order Details](/slate/#get-purchase-order-details) you will get `creator_email`, you can set that value in `cc` field.

### Uploads Fields

`uploads` accept list of ids, and must be Array values. If uploads are send while saving or updating template, they are ignored. `uploads` are only available when you are sending template to the supplier.

### HTTP Request

`POST https://app.procurementexpress.com/api/v1/purchase_orders/:id/forward`

### Query Parameters

| Param                | Type    | Description                                    |
| -------------------- | ------- | ---------------------------------------------- |
| authentication_token | header  | Authentication token                           |
| app_company_id       | header  | registered company id                          |
| emails               | Array   | list of email addresses                        |
| cc                   | string  | CC email address                               |
| notes                | text    | template body                                  |
| email_subject        | string  | Email subject                                  |
| template_name        | string  | Template Name                                 |
| save_template        | boolean | `true` if you want to save template            |
| is_default           | boolean | `true` if you want to mark template as default |
| update_template      | boolean | `true` if you want to update template          |
| uploads              | Array   | list of upload ids                             |

<!-- ## Create a Template

```shell
curl --request POST \
  --url https://app.procurementexpress.com/api/v1/send_to_supplier_templates \
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
  'https://app.procurementexpress.com/api/v1/send_to_supplier_templates',
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

`POST https://app.procurementexpress.com/api/v1/send_to_supplier_templates`

### Query Parameters

| Param                | Type   | Description             |
| -------------------- | ------ | ----------------------- |
| authentication_token | header | Authentication token    |
| app_company_id       | header | registered company id   |
| label                | string | label for your template |
| text                 | text   | body of the template    |



## Get a Specific Template

```sh
curl --request GET \
  --url https://app.procurementexpress.com/api/v1/send_to_supplier_templates/2 \
  --header 'app_company_id: 1' \
  --header 'authentication_token: your token' \
  --header 'content-type: application/json'
```

```ruby
require 'rest-client'

response = RestClient.get(
  'https://app.procurementexpress.com/api/v1/send_to_supplier_templates/2',
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

`GET https://app.procurementexpress.com/api/v1/send_to_supplier_templates/:id`

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
  'https://app.procurementexpress.com/api/v1/send_to_supplier_templates/1',
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
  --url https://app.procurementexpress.com/api/v1/send_to_supplier_templates/2 \
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

`PUT https://app.procurementexpress.com/api/v1/kittens/:id`

### Query Parameters

| Param                | Type   | Description           |
| -------------------- | ------ | --------------------- |
| authentication_token | header | Authentication token  |
| app_company_id       | header | registered company id |
| label                | string | template label        |
| text                 | text   | template body         | -->
