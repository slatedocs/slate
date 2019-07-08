# Currencies

## Introduction

The currency api method allows you to list the currencies supported by Beyonic, including information like network prefixes for each currency/country

The currency api endpoint is:

    <aside class="notice">https://app.beyonic.com/api/currencies</aside>

## The Currency object

> Sample Currency Object (JSON):

```json
{
  "id": 7,
  "name": "Rwandan Francs",
  "code": "RWF",
  "country": {
    "iso": "RW",
    "iso3": "RWA",
    "iso_numeric": 646,
    "name": "RWANDA",
    "printable_name": "Rwanda",
    "phone_prefix": "250",
    "supported": true
  },
  "usd_rate": 897.5
}
```

Field | Type | Description
----- | -----| ----
id | long integer | Unique object identifier
name | string | The currency name
code | string | The code i.e KES, UGX
country | object | Expanded country object
usd_rate | float | The latest USD exchange rate

## Retrieving a Single Currency

> Sample Request:

```shell
curl https://app.beyonic.com/api/currencies/7 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

currency = Beyonic::Currency.get(7)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$account = Beyonic_Currency::get(7);
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

currency = beyonic.Currency.get(7)
```

```java
package com.beyonic.samples;

import com.beyonic.exceptions.BeyonicException;
import com.beyonic.models.*;

Beyonic.API_KEY = "ab594c14986612f6167a975e1c369e71edab6900";

String response = null;

try{
    response = new Currency().get(123);
    System.out.println(response);
}
catch (Exception e){
    e.printStackTrace();
}
```

> Sample Response (JSON) - if you use one of the development libraries, this is automatically converted into a native object for you:

```json
{
  "id": 7,
  "name": "Rwandan Francs",
  "code": "RWF",
  "country": {
    "iso": "RW",
    "iso3": "RWA",
    "iso_numeric": 646,
    "name": "RWANDA",
    "printable_name": "Rwanda",
    "phone_prefix": "250",
    "supported": true
  },
  "usd_rate": 897.5
}
```

To retrieve a single currency, provide the currency id and a currency object will be returned.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
id | Yes | Integer | 7 | The id of the currency you want to retrieve

## Listing all currencies

> Sample Request:

```shell
curl https://app.beyonic.com/api/currencies -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

currencies = Beyonic::Currency.list
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$accounts = Beyonic_Currency::getAll();
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

currencies = beyonic.Currency.list()

```

```java
package com.beyonic.samples;

import com.beyonic.exceptions.BeyonicException;
import com.beyonic.models.*;

Beyonic.API_KEY = "ab594c14986612f6167a975e1c369e71edab6900";

String response = null;

try{
    response = new Currency().list();
    System.out.println(response);
}
catch (Exception e){
    e.printStackTrace();
}
```

> Sample Response (JSON)  - if you use one of the development libraries, this is automatically converted into a native object for you:

```json
{
  "count": 2,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 7,
      "name": "Rwandan Francs",
      "code": "RWF",
      "country": {
        "iso": "RW",
        "iso3": "RWA",
        "iso_numeric": 646,
        "name": "RWANDA",
        "printable_name": "Rwanda",
        "phone_prefix": "250",
        "supported": true
      },
      "usd_rate": 897.5
    },
    {
      "id": 6,
      "name": "Tanzania Shillings",
      "code": "TZS",
      "country": {
        "iso": "TZ",
        "iso3": "TZA",
        "iso_numeric": 834,
        "name": "TANZANIA, UNITED REPUBLIC OF",
        "printable_name": "Tanzania, United Republic of",
        "phone_prefix": "255",
        "supported": true
      },
      "usd_rate": 2303.0
    }
  ]
}
```

To retrieve a list of all currencies, make a GET request to the currencies end point. This will return a list of currencies.

## Filtering Currencies

The currency api doesn't currently support filtering