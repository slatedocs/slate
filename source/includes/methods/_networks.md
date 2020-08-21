# Networks

## Introduction

The network api method allows you to list the networks supported by Beyonic, including information like network prefixes for each network/country

The network api endpoint is:

    <aside class="notice">https://api.beyonic.com/api/networks</aside>

## The Network object

> Sample Network Object (JSON):

```json
{
  "id": 15,
  "name": "HALOTEL",
  "country": {
    "iso": "TZ",
    "iso3": "TZA",
    "iso_numeric": 834,
    "name": "TANZANIA, UNITED REPUBLIC OF",
    "printable_name": "Tanzania, United Republic of",
    "phone_prefix": "255",
    "supported": true
  },
  "phone_regex": "^[[.plus-sign.]]25562[0-9]{7}"
}
```

Field | Type | Description
----- | -----| ----
id | long integer | Unique object identifier
name | string | The network name
country | object | Expanded country object
phone_regex | string | The regular expression for phone numbers belonging to the network, in posix format

## Retrieving a Single Network

> Sample Request:

```shell
curl https://api.beyonic.com/api/networks/15 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

network = Beyonic::Network.get(15)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$account = Beyonic_Currency::get(15);
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

network = beyonic.Network.get(15)
```

```java
package com.beyonic.samples;

import com.beyonic.exceptions.BeyonicException;
import com.beyonic.models.*;

Beyonic.API_KEY = "ab594c14986612f6167a975e1c369e71edab6900";

String response = null;

try{
    response = new Network().get(123);
    System.out.println(response);
}
catch (Exception e){
    e.printStackTrace();
}
```

> Sample Response (JSON) - if you use one of the development libraries, this is automatically converted into a native object for you:

```json
{
  "id": 15,
  "name": "HALOTEL",
  "country": {
    "iso": "TZ",
    "iso3": "TZA",
    "iso_numeric": 834,
    "name": "TANZANIA, UNITED REPUBLIC OF",
    "printable_name": "Tanzania, United Republic of",
    "phone_prefix": "255",
    "supported": true
  },
  "phone_regex": "^[[.plus-sign.]]25562[0-9]{7}"
}
```

To retrieve a single network, provide the network id and a network object will be returned.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
id | Yes | Integer | 15 | The id of the network you want to retrieve

## Listing all networks

> Sample Request:

```shell
curl https://api.beyonic.com/api/networks -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

networks = Beyonic::Network.list
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

networks = beyonic.Network.list()

```

```java
package com.beyonic.samples;

import com.beyonic.exceptions.BeyonicException;
import com.beyonic.models.*;

Beyonic.API_KEY = "ab594c14986612f6167a975e1c369e71edab6900";

String response = null;

try{
    response = new Network().list(null, null);
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
      "id": 15,
      "name": "HALOTEL",
      "country": {
        "iso": "TZ",
        "iso3": "TZA",
        "iso_numeric": 834,
        "name": "TANZANIA, UNITED REPUBLIC OF",
        "printable_name": "Tanzania, United Republic of",
        "phone_prefix": "255",
        "supported": true
      },
      "phone_regex": "^[[.plus-sign.]]25562[0-9]{7}"
    },
    {
      "id": 14,
      "name": "AIRTEL-TIGO",
      "country": {
        "iso": "RW",
        "iso3": "RWA",
        "iso_numeric": 646,
        "name": "RWANDA",
        "printable_name": "Rwanda",
        "phone_prefix": "250",
        "supported": true
      },
      "phone_regex": "^[[.plus-sign.]]250(72|73)[0-9]{7}"
    }
  ]
}
```

To retrieve a list of all networks, make a GET request to the networks end point. This will return a list of networks.

## Filtering Networks

The network api doesn't currently support filtering