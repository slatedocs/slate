# Webhooks

## Example post request send to the webhooks URL

If you want to send `payload` as text, then update your webhooks setting from web application  and enable `send as text`
option. To access webhooks setting from web application, click [here](https://rubberstamp.github.io/slate/#access-webhooks-in-procurementexpress-application)


```json
{
  "event": "new_po",
  "object": "PurchaseOrder",
  "payload": {
    "id": 1,
    "company_id": 1,
    "approval_key": null,
    "department_id": 1,
    "department_name": "South",
    "supplier_id": 1,
    "supplier_name": "Top Rated Supplier",
    "supplier_email": "",
    "supplier_address": "",
    "status": "pending",
    "creator_id": 1,
    "currency_id": 65,
    "currency_iso_code": "INR",
    "currency_symbol": "₹",
    "currency_name": "Indian Rupee",
    "creator_name": "John Doe",
    "creator_email": "ctech.sachin@gmail.com",
    "amount": "1.0",
    "created_at": 1651143873,
    "updated_at": 1651143873,
    "notes": "",
    "total_net_amount": "1.0",
    "total_gross_amount": "1.0",
    "base_gross_amount": 1.0,
    "delivery_status": "not_delivered",
    "delivered_on": null,
    "custom_fields": null,
    "share_key": "PLMLMLVL....20220428070433",
    "archived": false,
    "conversion_rate": "1.0",
    "keywords": "1 Top Rated Supplier John Doe  pending 1.00  Sample Budget Pen 1.0 1.0",
    "self_approved": false,
    "xero_id": null,
    "synced_with_xero": false,
    "custom_field_values": [],
    "url": "https://app.procurementexpress.com/en/purchase_orders/1",
    "purchase_order_items": [
      {
        "id": 1,
        "description": "Pen",
        "purchase_order_id": 1,
        "budget_id": 1,
        "budget_summary": "Sample Budget",
        "gross_amount": "1.0",
        "vat": "0.0",
        "net_amount": "1.0",
        "status": "pending",
        "quantity": "1.0",
        "unit_price": "1.0",
        "item_number": null,
        "base_net_amount": "1.0",
        "base_gross_amount": "1.0",
        "gross_usd_amount": "0.01307",
        "product_id": 1,
        "received_quantity": null,
        "sequence_no": 1,
        "custom_field_values": [],
        "third_party_id_mappings": []
      }
    ],
    "budgets": [
      {
        "id": 1,
        "company_id": 1,
        "name": "Sample Budget",
        "amount": "10000000.0",
        "cost_code": null,
        "cost_type": null,
        "archived": false,
        "currency_id": 65,
        "base_amount": null,
        "base_rate": null,
        "allow_anyone_to_approve_a_po": false,
        "start_date": null,
        "end_date": null,
        "summary": "Sample Budget",
        "third_party_id_mappings": []
      }
    ],
    "purchase_order_comments": [],
    "payments": [],
    "purchase_order_item_payments": [],
    "uploads": [],
    "department": null,
    "supplier": {
      "id": 1,
      "name": "Top Rated Supplier",
      "company_id": 1,
      "notes": "",
      "phone_number": "",
      "address": "",
      "email": "",
      "payment_details": "",
      "archived": false,
      "contact_person": "",
      "tax_number": "",
      "created_at": "2022-04-28T06:03:57.773-05:00",
      "updated_at": "2022-04-28T06:04:33.989-05:00",
      "department_ids": [],
      "third_party_id_mappings": []
    }
  }
}
```
## What are webhooks

Webhooks are notifications about ProcurementExpress entities that are sent to your app. When any event specified on `event_type` query params occurs, a `POST` request is sent to the specified `url`. Webhooks notification configured here are triggered by events in your ProcurementExpress company. 

## When should I use webhooks

If you use API endpoints, then you will get response only when you call it. But there comes a scenario where you might like to know about the changes in realtime, for example, you want to listen to changes as soon as purchase order is created, approved, delivered or paid, then webhooks makes your life easier, because it send a `POST` request to your application, as soon as those event occurs in your ProcurementExpress company.

## Access webhooks in ProcurementExpress application

- Login to your company in https://app.procurementexpress.com as `companyadmin`.
- Click on the users menu on the top right corner of the application
- click on Integrations menu item
- And finally click on `Integrate` button for `Create webhooks based on events` section
- Here you will see list of webhooks you have configured, and also click on `Add Webhooks` button to create new one.

![image](https://user-images.githubusercontent.com/4189129/165744544-6743c4fb-14ac-4521-81c7-8c0922d2e357.png)

## Supported events

Right now we support following webhooks events:

### `new_po`

If `new_po` event is enabled in webhooks configuration, then everytime new purchase order is created in your ProcurementExpress company, a webhooks request is notified.

### `po_approved`

When `po_approved` event is enabled in webhooks configuration, then everytime a purchase order is approved in your ProcurementExpress company, a webhooks request is notified.

### `po_delivered`

When `po_delivered` event is enabled in webhooks configuration, then everytime a purchase order is marked as delivered, a webhooks request is notified.
### `po_paid`

When `po_paid` event is enabled in webhooks configuration, then everytime a purchase order is marked as paid, a webhooks request is notified.

### `po_cancelled`

When `po_cancelled` event is enabled in webhooks configuration, then everytime a purchase order is marked as cancelled, a webhooks request is notified.

## Create a Webhook

```ruby
require 'rest-client'

RestClient.post(
  'https://app.procurementexpress.com/api/v1/webhooks',
  {
    webhook: {
      name: 'My Awesome App',
      url: 'https://myawesomeapp.com/webhook_handler',
      archived: false,
      event_type: [
        "new_po",
        "po_approved",
        "po_delivered",
        "po_paid"
      ],
      json_wrapper: "text",
      send_as_text: false,
      basic_auth_uname: 'myawesomeapp',
      basic_auth_pword: 'securepassw0rd',
      webhook_attributes_attributes: [
        {
          attrib_type: 'root',
          key: 'name',
          value: 'geek'
        },
        {
          attrib_type: 'root',
          key: 'org',
          value: 'My awesome co.'
        },
        {
          attrib_type: 'header',
          key: 'authentication_header',
          value: 'auth-header-goes-here'
        }
      ]
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/webhooks'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "webhook[name]=My Awesome App"
  -d "webhook[url]=https://myawesomeapp.com/webhook_handler"
  -d "webhook[archived]=false"
  -d "webhook[event_type][]=new_po"
  -d "webhook[event_type][]=po_approved"
  -d "webhook[event_type][]=po_delivered"
  -d "webhook[event_type][]=po_paid"
  -d "webhook[json_wrapper]=text"
  -d "webhook[send_as_text]=false"
  -d "webhook[basic_auth_uname]=myawesomeapp"
  -d "webhook[basic_auth_pword]=securepassw0rd"
  -d "webhook[webhook_attributes_attributes][][attrib_type]=root"
  -d "webhook[webhook_attributes_attributes][][key]=name"
  -d "webhook[webhook_attributes_attributes][][value]=geek"
  -d "webhook[webhook_attributes_attributes][][attrib_type]=root"
  -d "webhook[webhook_attributes_attributes][][key]=org"
  -d "webhook[webhook_attributes_attributes][][value]=My awesome co."
  -d "webhook[webhook_attributes_attributes][][attrib_type]=header"
  -d "webhook[webhook_attributes_attributes][][key]=authentication_header"
  -d "webhook[webhook_attributes_attributes][][value]=auth-header-goes-here"
```

> The above command returns JSOn structured like this:

```json
{
  "id": 1,
  "name": "My Awesome App",
  "url": "https://myawesomeapp.com/webhook_handler",
  "archived": false,
  "event_type": [
    "new_po",
    "po_approved",
    "po_delivered",
    "po_paid"
  ],
  "json_wrapper": "text",
  "send_as_text": false,
  "basic_auth_uname": "rubberstamp",
  "basic_auth_pword": "rsrules",
  "webhook_attributes_attributes": [{
    "attrib_type": "root",
    "key": "name",
    "value": "geek"
  },
  {
    "attrib_type": "root",
    "key": "org",
    "value": "My awesome co."
  },
  {
    "attrib_type": "header",
    "key": "authentication_header",
    "value": "auth-header-goes-here"
  }]
}
```

Create a new Webhooks and returns the Webhook object that is created.

### HTTP Request

`POST https://app.procurementexpress.com/api/v1/webhooks`

### Query Parameters

| Params                                               | Type       | Description                                                                                                                                                                          |
| ----------                                           | ---------- | ----------                                                                                                                                                                           |
| authentication_token                                 | header     | Authentication Token                                                                                                                                                                 |
| app_company_id                                       | header     | Company ID                                                                                                                                                                           |
| webhook[name]                                        | string     | Name your webhook                                                                                                                                                                    |
| webhook[url]                                         | string     | Your production URL that will handle webhook request                                                                                                                                 |
| webhook[archived]                                    | boolean    | `true` if you want to archive otherwise `false`                                                                                                                                      |
| webhook[event_type]                                  | array[]    | Event type that you want to trigger when they happen in Rubberstamp. <br/> Supported values are: <br /> - `new_po` <br /> - `po_approved` <br /> - `po_delivered` <br /> - `po_paid` |
| webhook[json_wrapper]                                | string     | Root key that will wrap your json data                                                                                                                                               |
| webhook[send_as_text]                                | boolean    | `true` if you want to send as plain text, otherwise `false`                                                                                                                          |
| webhook[basic_auth_uname]                            | string     | Basic Authorization username                                                                                                                                                         |
| webhook[basic_auth_pword]                            | string     | Basic Authorization password                                                                                                                                                         |
| webhook[webhook_attributes_attribute][][attrib_type] | string     | Webhook Nested attributes type                                                                                                                                                       |
| webhook[webhook_attributes_attribute][][key]         | string     | Webhook Nested attributes key                                                                                                                                                        |
| webhook[webhook_attributes_attribute][][value]       | string     | Webhook Nested attributes value                                                                                                                                                      |





## Get All Webhooks

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/webhooks',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/webhooks'
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
    "name": "My Awesome App",
    "url": "https://myawesomeapp.com/webhook_handler",
    "archived": false,
    "event_type": [
      "new_po",
      "po_approved",
      "po_delivered",
      "po_paid"
    ],
    "tested": true,
    "response_code": null,
    "json_wrapper": "text"
  },
  {
      "id": 2,
      "name": "Slack Events",
      "url": "https://hooks.slack.com/services/...",
      "archived": false,
      "event_type": [
          "new_po",
          "po_approved",
          "po_delivered",
          "po_paid"
      ],
      "tested": false,
      "response_code": null,
      "json_wrapper": "text"
  }
]
```

Returns a list of webhooks that are not `archived`.

### Filter by archived

Default result will only provide webhooks that are not already archived.
If you want to get the list of webhooks that are archived then you can pass
`archived=true` params e.g: `https://app.procurementexpress.com/api/v1/webhooks?archived=true`

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/webhooks`

### Query Parameters

| Params               | Type       | Description          |
| ----------           | ---------- | ----------           |
| authentication_token | header     | Authentication token |
| app_company_id       | header     | Company ID           |




## Get a specific Webhook

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/webhooks/1',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/webhooks/1'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "My Awesome App",
  "url": "https://myawesomeapp.com/webhook_handler",
  "archived": false,
  "event_type": [
    "new_po",
    "po_approved",
    "po_delivered",
    "po_paid"
  ],
  "tested": true,
  "response_code": null,
  "json_wrapper": "text"
}
```

Retrieves the details of an existing webhooks. You need to supply the unique
Webhook id that was returned upon budget creation.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/webhooks/:id`

### URL Parameters

| Params               | Type       | Description          |
| ----------           | ---------- | ---------------      |
| authentication_token | header     | Authentication Token |
| app_company_id       | header     | Company ID           |
| ID                   | integer    | Webhook ID           |




## Update a Webhook

```ruby
require 'rest-client'

RestClient.put(
  'https://app.procurementexpress.com/api/v1/webhooks/1',
  {
    webhook: {
      name: 'My Awesome App name updated',
      event_type: [
        "new_po",
        "po_approved"
      ],
    }
  },
  headers = {
    authenticaiton_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/webhooks/1'
  -X PUT
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "webhook[name]=My Awesome App name updated"
  -d "webhook[event_type][]=new_po"
  -d "webhook[event_type][]=po_approved"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "My Awesome App name updated",
  "url": "https://myawesomeapp.com/webhook_handler",
  "archived": false,
  "event_type": [
    "new_po",
    "po_approved"
  ],
  "json_wrapper": "text",
  "send_as_text": false,
  "basic_auth_uname": "rubberstamp",
  "basic_auth_pword": "rsrules",
  "webhook_attributes_attributes": [{
    "attrib_type": "root",
    "key": "name",
    "value": "geek"
  },
  {
    "attrib_type": "root",
    "key": "org",
    "value": "My awesome co."
  },
  {
    "attrib_type": "header",
    "key": "authentication_header",
    "value": "auth-header-goes-here"
  }]
}
```

Update the specified `Webhook` by setting the value of parameters passed. Any
parameters not provided will be left unchanged.

### HTTP Request

`PUT https://app.procurementexpress.com/api/v1/webhooks/:id`

### Query Parameters

| Params                                               | Type       | Description                                                                                                                                                                          |
| ----------                                           | ---------- | ---------------                                                                                                                                                                      |
| authentication_token                                 | header     | Authentication token                                                                                                                                                                 |
| app_company_id                                       | header     | Company ID                                                                                                                                                                           |
| ID                                                   | integer    | Webhook ID                                                                                                                                                                           |
| webhook[name]                                        | string     | Name your webhook                                                                                                                                                                    |
| webhook[url]                                         | string     | Your production URL that will handle webhook request                                                                                                                                 |
| webhook[archived]                                    | boolean    | `true` if you want to archive otherwise `false`                                                                                                                                      |
| webhook[event_type]                                  | array[]    | Event type that you want to trigger when they happen in Rubberstamp. <br/> Supported values are: <br /> - `new_po` <br /> - `po_approved` <br /> - `po_delivered` <br /> - `po_paid` |
| webhook[json_wrapper]                                | string     | Root key that will wrap your json data                                                                                                                                               |
| webhook[send_as_text]                                | boolean    | `true` if you want to send as plain text, otherwise `false`                                                                                                                          |
| webhook[basic_auth_uname]                            | string     | Basic Authorization username                                                                                                                                                         |
| webhook[basic_auth_pword]                            | string     | Basic Authorization password                                                                                                                                                         |
| webhook[webhook_attributes_attribute][][attrib_type] | string     | Webhook Nested attributes type                                                                                                                                                       |
| webhook[webhook_attributes_attribute][][key]         | string     | Webhook Nested attributes key                                                                                                                                                        |
| webhook[webhook_attributes_attribute][][value]       | string     | Webhook Nested attributes value                                                                                                                                                      |

