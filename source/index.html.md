---
title: BBOXX Smart Solar API Reference

language_tabs:
  - python
  - js

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - parameter_types
  - alerts
  - alert_types
  - alert_type_anomaly_type_linker
  - alert_type_product_type_linker
  - anomalies
  - anomaly_types
  - anomaly_type_product_type_linker
  - connections
  - customers
  - customer_entity_linker
  - customer_product_histories
  - enable_histories
  - entities
  - hubs
  - latest_softwares
  - parameter_types
  - parts
  - part_product_linker
  - part_types
  - part_type_product_type_linker
  - part_type_replacement_linker
  - products
  - product_entity_linker
  - product_notes
  - product_software_linker
  - product_types
  - product_type_software_version_type_linker
  - repairs
  - repair_symptom_type_linker
  - sms_histories
  - shops
  - software_version_types
  - states
  - state_types
  - symptom_types
  - symptom_type_product_type_linker
  - tamper_enable_histories
  - users
  - test_table
  - meta_data
  - errors
  - query_format

search: true
---

# Introduction

Welcome to the BBOXX SMART Solar API.

We have language bindings in Python and JavaScript. You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs at the top.


# Products

## Get All Products

```python
import bboxx

api = bboxx.authorize('meowmeowmeow')
api.products.get()
```


```js
api = BBOXX.authorize('meowmeowmeow')
api.products.get()
```

> The above command returns JSON structured like this:

```json
{
  "num_results": 2,
  "objects": [
    {
      "analysis_timestamp": "2015-09-01T16:33:26.156868",
      "capacity_limit": "17",
      "created_at": "2015-09-01T16:33:26.156868",
      "created_by": "k.mcinnes@bboxx.co.uk",
      "current_enable_flag": true,
      "current_tamper_flag": false,
      "desired_enable_flag": true,
      "desired_tamper_flag": false,
      "device_key": "0123456789abcdef01234567",
      "hub_id": null,
      "imsi": "000000000000002",
      "latest_connection_id": 1843601,
      "latest_connection_location_id": null,
      "latest_state_id": 36599,
      "modified_at": "2015-11-09T10:15:28.184766",
      "product_imei": "000000000000000",
      "product_type_id": 2,
      "serial_number": "GatewayTestUnit",
      "shop_id": null,
      "software_lock": null
    },
    {
      "analysis_timestamp": "2015-12-03T16:29:28.946628",
      "capacity_limit": "17",
      "created_at": "2015-12-03T16:29:28.946795",
      "created_by": "c.proxy2@bboxx.co.uk",
      "current_enable_flag": true,
      "current_tamper_flag": false,
      "desired_enable_flag": true,
      "desired_tamper_flag": false,
      "device_key": "aaaaaabbbbbbccccccdddddd",
      "hub_id": null,
      "imsi": "000000000000000",
      "latest_connection_id": null,
      "latest_connection_location_id": null,
      "latest_state_id": 72778,
      "modified_at": null,
      "product_imei": "000000000000018",
      "product_type_id": 3,
      "serial_number": "abc",
      "shop_id": null,
      "software_lock": null
    }
  ]
}
```

This endpoint retrieves all products.

### HTTP Request

`GET http://smartapi.bboxx.co.uk/v1/products`


## Get a Specific Product

```python
import bboxx

api = bboxx.authorize('meowmeowmeow')
api.products.get('000000000000018')
```

```js
api = BBOXX.authorize('meowmeowmeow')
api.products.get('000000000000018')
```

> The above command returns JSON structured like this:

```json
{
  "analysis_timestamp": "2015-12-03T16:29:28.946628",
  "capacity_limit": "17",
  "created_at": "2015-12-03T16:29:28.946795",
  "created_by": "c.proxy2@bboxx.co.uk",
  "current_enable_flag": true,
  "current_tamper_flag": false,
  "desired_enable_flag": true,
  "desired_tamper_flag": false,
  "device_key": "aaaaaabbbbbbccccccdddddd",
  "hub_id": null,
  "imsi": "000000000000000",
  "latest_connection_id": null,
  "latest_connection_location_id": null,
  "latest_state_id": 72778,
  "modified_at": null,
  "product_imei": "000000000000018",
  "product_type_id": 3,
  "serial_number": "abc",
  "shop_id": null,
  "software_lock": null
}
```

This endpoint retrieves a specific product, identified by its IMEI.

### HTTP Request

`GET http://smartapi.bboxx.co.uk/v1/products/<imei>`

### URL Parameters

Parameter | Description
--------- | -----------
imei | The IMEI of the product to retrieve
