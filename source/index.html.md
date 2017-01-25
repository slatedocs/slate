---
title: Quadas API Reference

language_tabs:
  - shell

toc_footers:

includes:
  - errors

search: false
---

# Introduction

Welcome to the Publisher API! You can use our API to access Publisher API endpoints, which can CRUD your owned publishers. The API is organized around REST. Our API has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients.

# Access Token

Please retrieve your own token before accessing other resources.

> Example Request:

```
curl --data "username=USERNAME&password=PASSWORD" \
  --referer http://UI_HOST \
  -X POST http://HOST/api/users/sessions
```

> Example Response:

```json
{ "token": "NO_USE|ACCESS_TOKEN" }
```

### HTTP Request

`POST http://HOST/api/users/sessions`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
username | true | The username of your account
password | true | The password of your account

<aside class="warning">
The response consists of two parts, checksum and access token, which are separated by a <code>|</code>.

You could drop the checksum part directly, for only access token is required in the future requests.
</aside>

# Authentication

> Example Request:

```shell
curl -H X-Requested-With: XMLHttpRequest \
  -H x-access-token: TOKEN \
  "http://HOST/api/publishers"
```

To authorize, just inject the pairs below into your request header:

- `X-Requested-With: XMLHttpRequest`
- `x-access-token: TOKEN`

<aside class="notice">
You must replace <code>TOKEN</code> with your access token.
</aside>

# Publishers

## Get All Publishers

> Example Request:

```shell
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     http://HOST/api/publishers
```

> Example Response:

```json
{
  "data": [
    {
      "publisher_state":0,
      "impressions":0,
      "publisher_revenue":0.0,
      "ssp_platform_ecpm":null,
      "placements_count":0,
      "exchange_rate_markup":0.0,
      "blank_impressions":0,
      "publisher_ecpm":null,
      "kept_impressions":0,
      "resold_impressions":0,
      "ssp_platform_profit":0.0,
      "fill_rate":null,
      "publisher_id":"20",
      "trade_logs":0,
      "amount":0.0,
      "ssp_platform_revenue":0.0,
      "default_impressions":0,
      "interval":"2017-01-25T00:00:00.000+08:00/2017-01-25T11:00:00.000+08:00",
      "start_at":1485273600000,
      "clicks":0,
      "created_at":1485310223117,
      "ctr":null,
      "publisher_name":"test publisher",
      "seller_revenue_share":0.0,
      "requests":0,
      "ssp_platform_ecpc":null,
      "end_at":1485313200000,
      "publisher_ecpc":null
    }
  ],
  "summary": {
    "impressions":0,
    "publisher_revenue": 0.0,
    "ssp_platform_ecpm": null,
    "exchange_rate_markup":0.0, 
    "blank_impressions":0, 
    "publisher_ecpm":null, 
    "kept_impressions":0, 
    "resold_impressions":0, 
    "ssp_platform_profit":0.0, 
    "fill_rate":null, 
    "trade_logs":0, 
    "amount":0.0, 
    "ssp_platform_revenue":0.0, 
    "default_impressions":0, 
    "clicks":0, 
    "ctr":null, 
    "seller_revenue_share":0.0, 
    "requests":0, 
    "ssp_platform_ecpc":null, 
    "publisher_ecpc":null
  },
  "meta": { "total": 1 }
}
```

### HTTP Request

`GET http://HOST/api/publishers`

### Query Parameters

Parameter    | Required | Default | Type |  Description
------------ | -------- | ------- | ---- |  -----------
platform_id | true | 0 | string | ID of platform, also known as 'SSP Id'
publisher_ids | false | None | string | ID of publishers
state | false | 0 | string | states, eg: 0,1,2
keyword | false | None | string | keyword for publisher name
interval | false | summation | string | Interval
start_at | false | 0 | string | Start At, unix timestamp at milliseconds
end_at | false | None | string | End At, unix timestamp at milliseconds
order | false | publisher_ids,desc;start_at,desc | string | Order. eg: requests,desc;ctr,asc. supported ordering fields: "start_at", "requests", "clicks", "impressions", "effective_impressions", "blank_impressions", "default_impressions", "psa_impressions", "kept_impressions", "resold_impressions", "rtb_impressions", "external_impression_impressions", "external_click_impressions", "cpm_bids", "cpc_bids", "cpa_bids", "amount", "exchange_rate_markup", "seller_revenue_share", "publisher_revenue", "ssp_platform_revenue", "ssp_platform_profit", "fill_rate", "ctr", "publisher_ecpm", "publisher_ecpc", "ssp_platform_ecpm", "ssp_platform_ecpc", "publisher_id", "publisher_name", "publisher_state", "placements_count", "publisher_created_at"
offset | false | 0 | long | Offset
limit | false | 25 | long | Limit
currency | false | JPY | string | Currency. Support: USD,CNY,JPY,TWD,HKD
timezone | false | Asia/Shanghai | string | Timezone, eg: Asia/Shanghai


## Get a Specific Publisher

> Example Request:

```shell
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     http://HOST/api/publisher/1
```

> Example Response:

```json
{
  "actives_count": 4,
  "country_id": "China",
  "cpc_deal": false,
  "cpm_deal": true,
  "currency": "TWD",
  "email": "cloud.li@vpon.com",
  "id": 7,
  "name": "test publisher",
  "payment_term": {
    "apply_served": false,
    "cpm_price": 3,
    "id": 7,
    "pricing_type": "cpm",
    "publisher_id": 7,
    "revenue_share_rate": null,
    "revenue_share_rate_percentage": null
  },
  "placements_count": 4,
  "state": "active",
  "username": "testtest"
}
```

### HTTP Request

`GET http://HOST/api/publisher/:id`

### Query Parameters

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
id | true | None |

## Create a Publisher

> Example Request:

```
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     --data "publisher[name]=a&publisher[email]=a@a.com&publisher[state]=0&publisher[cpm_deal]=1&publisher[payment_term_attributes][id]=1&&publisher[payment_term_attributes][pricing_type]=4&cpm_price=2"
     -X POST \
     http://HOST/api/publishers
```

> Example Response:

```json
{}
```

### HTTP Request

`POST http://HOST/api/publishers`

### Query Parameters

Parameter | Required| Type | Description
--------- | ------- | ---- | -----------
publisher | true    | PublisherDAO

#### PublihserDAO
Key | Required | Type | Description
--- | ----- | --- | ---
name | true | string |
state | true | ENUM | 0 - ACTIVE, 1 - INACTIVE, 2 - DELETED
currency | true | string |
country_id | true | string | Afghanistan,Albania,Algeria,American Samoa,Andorra,Angola,Anguilla,Antarctica,Antigua and Barbuda,Argentina,Armenia,Aruba,Australia,Austria,Azerbaijan,Bahamas,Bahrain,Bangladesh,Barbados,Belarus,Belgium,Belize,Benin,Bermuda,Bhutan,Bolivia,Bonaire,Bosnia and Herzegovina,Botswana,Bouvet Island,Brazil,British Indian Ocean Territory,Brunei Darussalam,Bulgaria,Burkina Faso,Burundi,Cambodia,Cameroon,Canada,Cape Verde,Cayman Islands,Central African Republic,Chad,Chile,China,Christmas Island,Cocos (Keeling) Islands,Colombia,Comoros,Congo,Democratic Republic of the Congo,Cook Islands,Costa Rica,Croatia,Cuba,CuraÃ§ao,Cyprus,Czech Republic,CÃ´te d'Ivoire,Denmark,Djibouti,Dominica,Dominican Republic,Ecuador,Egypt,El Salvador,Equatorial Guinea,Eritrea,Estonia,Ethiopia,Falkland Islands (Malvinas),Faroe Islands,Fiji,Finland,France,French Guiana,French Polynesia,French Southern Territories,Gabon,Gambia,Georgia,Germany,Ghana,Gibraltar,Greece,Greenland,Grenada,Guadeloupe,Guam,Guatemala,Guernsey,Guinea,Guinea-Bissau,Guyana,Haiti,Heard Island and McDonald Mcdonald Islands,Holy See (Vatican City State),Honduras,Hong Kong,Hungary,Iceland,India,Indonesia,Iran, Islamic Republic of,Iraq,Ireland,Isle of Man,Israel,Italy,Jamaica,Japan,Jersey,Jordan,Kazakhstan,Kenya,Kiribati,Korea, Democratic People's Republic of,Korea, Republic of,Kuwait,Kyrgyzstan,Lao People's Democratic Republic,Latvia,Lebanon,Lesotho,Liberia,Libya,Liechtenstein,Lithuania,Luxembourg,Macao,Macedonia, the Former Yugoslav Republic of,Madagascar,Malawi,Malaysia,Maldives,Mali,Malta,Marshall Islands,Martinique,Mauritania,Mauritius,Mayotte,Mexico,Micronesia, Federated States of,Moldova, Republic of,Monaco,Mongolia,Montenegro,Montserrat,Morocco,Mozambique,Myanmar,Namibia,Nauru,Nepal,Netherlands,New Caledonia,New Zealand,Nicaragua,Niger,Nigeria,Niue,Norfolk Island,Northern Mariana Islands,Norway,Oman,Pakistan,Palau,Palestine, State of,Panama,Papua New Guinea,Paraguay,Peru,Philippines,Pitcairn,Poland,Portugal,Puerto Rico,Qatar,Romania,Russian Federation,Rwanda,Reunion,Saint Barthalemy,Saint Helena,Saint Kitts and Nevis,Saint Lucia,Saint Martin (French part),Saint Pierre and Miquelon,Saint Vincent and the Grenadines,Samoa,San Marino,Sao Tome and Principe,Saudi Arabia,Senegal,Serbia,Seychelles,Sierra Leone,Singapore,Sint Maarten (Dutch part),Slovakia,Slovenia,Solomon Islands,Somalia,South Africa,South Georgia and the South Sandwich Islands,South Sudan,Spain,Sri Lanka,Sudan,Suriname,Svalbard and Jan Mayen,Swaziland,Sweden,Switzerland,Syrian Arab Republic,Taiwan,Tajikistan,United Republic of Tanzania,Thailand,Timor-Leste,Togo,Tokelau,Tonga,Trinidad and Tobago,Tunisia,Turkey,Turkmenistan,Turks and Caicos Islands,Tuvalu,Uganda,Ukraine,United Arab Emirates,United Kingdom,United States,United States Minor Outlying Islands,Uruguay,Uzbekistan,Vanuatu,Venezuela,Viet Nam,British Virgin Islands,US Virgin Islands,Wallis and Futuna,Western Sahara,Yemen,Zambia,Zimbabwe,Aland Islands
payment_term_attributes | true | PaymentTermDAO
email | false | string | valid email address
cpm_deal | false | bool | deal type
force_save | false | bool | set it to true if you want to violate the reserved price

#### PaymentTermDAO
Key | Required | Type | Description
--- | -------- | ---- | ----------
pricing_type | true | ENUM | 4 - CPM, 5 - REVENUE SHARE RATE
cpm_price | false | float | it is required only if pricing type is CPM
revenue_share_rate | false | float | it is required only if pricing type is REVENUE SHARE RATE and revenue_share_rate_percentage is absent
revenue_share_rate_percentage | false | float | 0 ~ 1

## Update a Specific Publisher or Batch Update Publishers

> Example Request:

```
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     --data "publisher[name]=a&publisher[email]=a@a.com&publisher[state]=0&publisher[cpm_deal]=1&publisher[payment_term_attributes][id]=1&&publisher[payment_term_attributes][pricing_type]=4&cpm_price=2"
     -X PUT \
     http://HOST/api/publishers
```

> Example Response:

```json
{}
```

### HTTP Request

`PUT http://HOST/api/publisher/:ids`

### Query Parameters

Parameter | Required| Type | Description
--------- | ------- | ---- | -----------
ids       | true    | string | 1,2,3,4
publisher | true    | PublisherDAO |

#### PublihserDAO
Key | Required | Type | Description
--- | ----- | --- | ---
name | false | string |
state | false | ENUM | 0 - ACTIVE, 1 - INACTIVE, 2 - DELETED
currency | false | string | USD,CNY,JPY,TWD,HKD
country_id | false | string | Afghanistan,Albania,Algeria,American Samoa,Andorra,Angola,Anguilla,Antarctica,Antigua and Barbuda,Argentina,Armenia,Aruba,Australia,Austria,Azerbaijan,Bahamas,Bahrain,Bangladesh,Barbados,Belarus,Belgium,Belize,Benin,Bermuda,Bhutan,Bolivia,Bonaire,Bosnia and Herzegovina,Botswana,Bouvet Island,Brazil,British Indian Ocean Territory,Brunei Darussalam,Bulgaria,Burkina Faso,Burundi,Cambodia,Cameroon,Canada,Cape Verde,Cayman Islands,Central African Republic,Chad,Chile,China,Christmas Island,Cocos (Keeling) Islands,Colombia,Comoros,Congo,Democratic Republic of the Congo,Cook Islands,Costa Rica,Croatia,Cuba,CuraÃ§ao,Cyprus,Czech Republic,CÃ´te d'Ivoire,Denmark,Djibouti,Dominica,Dominican Republic,Ecuador,Egypt,El Salvador,Equatorial Guinea,Eritrea,Estonia,Ethiopia,Falkland Islands (Malvinas),Faroe Islands,Fiji,Finland,France,French Guiana,French Polynesia,French Southern Territories,Gabon,Gambia,Georgia,Germany,Ghana,Gibraltar,Greece,Greenland,Grenada,Guadeloupe,Guam,Guatemala,Guernsey,Guinea,Guinea-Bissau,Guyana,Haiti,Heard Island and McDonald Mcdonald Islands,Holy See (Vatican City State),Honduras,Hong Kong,Hungary,Iceland,India,Indonesia,Iran, Islamic Republic of,Iraq,Ireland,Isle of Man,Israel,Italy,Jamaica,Japan,Jersey,Jordan,Kazakhstan,Kenya,Kiribati,Korea, Democratic People's Republic of,Korea, Republic of,Kuwait,Kyrgyzstan,Lao People's Democratic Republic,Latvia,Lebanon,Lesotho,Liberia,Libya,Liechtenstein,Lithuania,Luxembourg,Macao,Macedonia, the Former Yugoslav Republic of,Madagascar,Malawi,Malaysia,Maldives,Mali,Malta,Marshall Islands,Martinique,Mauritania,Mauritius,Mayotte,Mexico,Micronesia, Federated States of,Moldova, Republic of,Monaco,Mongolia,Montenegro,Montserrat,Morocco,Mozambique,Myanmar,Namibia,Nauru,Nepal,Netherlands,New Caledonia,New Zealand,Nicaragua,Niger,Nigeria,Niue,Norfolk Island,Northern Mariana Islands,Norway,Oman,Pakistan,Palau,Palestine, State of,Panama,Papua New Guinea,Paraguay,Peru,Philippines,Pitcairn,Poland,Portugal,Puerto Rico,Qatar,Romania,Russian Federation,Rwanda,Reunion,Saint Barthalemy,Saint Helena,Saint Kitts and Nevis,Saint Lucia,Saint Martin (French part),Saint Pierre and Miquelon,Saint Vincent and the Grenadines,Samoa,San Marino,Sao Tome and Principe,Saudi Arabia,Senegal,Serbia,Seychelles,Sierra Leone,Singapore,Sint Maarten (Dutch part),Slovakia,Slovenia,Solomon Islands,Somalia,South Africa,South Georgia and the South Sandwich Islands,South Sudan,Spain,Sri Lanka,Sudan,Suriname,Svalbard and Jan Mayen,Swaziland,Sweden,Switzerland,Syrian Arab Republic,Taiwan,Tajikistan,United Republic of Tanzania,Thailand,Timor-Leste,Togo,Tokelau,Tonga,Trinidad and Tobago,Tunisia,Turkey,Turkmenistan,Turks and Caicos Islands,Tuvalu,Uganda,Ukraine,United Arab Emirates,United Kingdom,United States,United States Minor Outlying Islands,Uruguay,Uzbekistan,Vanuatu,Venezuela,Viet Nam,British Virgin Islands,US Virgin Islands,Wallis and Futuna,Western Sahara,Yemen,Zambia,Zimbabwe,Aland Islands
payment_term_attributes | true | PaymentTermDAO
email | false | string | valid email address
cpm_deal | false | bool | deal type
force_save | false | bool | set it to true if you want to violate the reserved price

#### PaymentTermDAO
Key | Required | Type | Description
--- | -------- | ---- | ----------
pricing_type | true | ENUM | 4 - CPM, 5 - REVENUE SHARE RATE
cpm_price | false | float | it is required only if pricing type is CPM
revenue_share_rate | false | float | it is required only if pricing type is REVENUE SHARE RATE and revenue_share_rate_percentage is absent
revenue_share_rate_percentage | false | float | 0 ~ 1

# Placements

## Get All Placements

> Example Request:

```shell
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     http://HOST/api/publishers/:publisher_id/placements
```

> Example Response:

```json
{
  "data": [
    {
      "publisher_state":0,
      "impressions":0,
      "publisher_revenue":0.0,
      "ssp_platform_ecpm":null,
      "placements_count":4,
      "exchange_rate_markup":0.0,
      "blank_impressions":0,
      "publisher_ecpm":null,
      "kept_impressions":0,
      "resold_impressions":0,
      "ssp_platform_profit":0.0,
      "fill_rate":null,
      "publisher_id":"7",
      "placement_group_id":"13",
      "trade_logs":0,
      "amount":0.0,
      "ssp_platform_revenue":0.0,
      "default_impressions":0,
      "interval":"2017-01-24T16:00:00.000Z/2017-01-25T03:00:00.000Z",
      "start_at":1485273600000,
      "clicks":0,
      "created_at":1477029059253,
      "ctr":null,
      "placement_state":0,
      "publisher_name":"test 2",
      "seller_revenue_share":0.0,
      "requests":0,
      "ssp_platform_ecpc":null,
      "end_at":1485313200000,
      "publisher_ecpc":null,
      "placement_id":"63",
      "placement_name":"test_placement"
    }
  ],
  "summary": {
    "impressions":0,
    "publisher_revenue":0.0,
    "ssp_platform_ecpm":null,
    "exchange_rate_markup":0.0,
    "blank_impressions":0,
    "publisher_ecpm":null,
    "kept_impressions":0,
    "resold_impressions":0,
    "ssp_platform_profit":0.0,
    "fill_rate":null,
    "trade_logs":0,
    "amount":0.0,
    "ssp_platform_revenue":0.0,
    "default_impressions":0,
    "clicks":0,
    "ctr":null,
    "seller_revenue_share":0.0,
    "requests":0,
    "ssp_platform_ecpc":null,
    "publisher_ecpc":null
  },
  "meta": { "total": 1 }
}
```

### HTTP Request

`GET http://HOST/api/publishers/:publisher_id/placements`

### Query Parameters

Key | Required | Default | Type | Description
----| -------- | ------- | ---  | -------------
publisher_id | true | None | string | ID of Publisher
platform_id | true | 0 | string | ID of platform, also known as 'SSP Id'
placement_ids | false | None | string | ID of Placements
placement_group_ids | false | None | string | ID of Placement Groups
state | false | 0 | string | states, eg: 0,1,2
keyword | false | None | string | keyword for Placement name
start_at | false | 0 | string | Start At, unix timestamp at milliseconds
end_at | false | None | string | End At, unix timestamp at milliseconds
order | false | placement_ids,desc;start_at,desc | string | Order. eg: requests,desc;ctr,asc. supported ordering fields: "start_at", "requests", "clicks", "impressions", "effective_impressions", "blank_impressions", "default_impressions", "psa_impressions", "kept_impressions", "resold_impressions", "rtb_impressions", "external_impression_impressions", "external_click_impressions", "cpm_bids", "cpc_bids", "cpa_bids", "amount", "exchange_rate_markup", "seller_revenue_share", "Placement_revenue", "ssp_platform_revenue", "ssp_platform_profit", "fill_rate", "ctr", "Placement_ecpm", "Placement_ecpc", "ssp_platform_ecpm", "ssp_platform_ecpc", "placement_id", "placement_group_id", "placement_name", "placement_state", "placements_count", "placement_created_at"
interval | false | summation | string | Interval
include_empty_row | false | 0 | long | 0 for false, 1 for true
offset | false | 0 | long | Offset
limit | false | 25 | long | Limit
currency | false | JPY | string | Currency. Support: USD,CNY,JPY,TWD,HKD
timezone | false | Asia/Shanghai | string | Timezone, eg: Asia/Shanghai

## Get a Specific Placement

> Example Request:

```shell
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     http://HOST/api/publishers/PUBLISHER_ID/placement_groups/PLACMENT_GROUP_ID/placements/PLACEMENT_ID
```

> Example Response:

```json
{
  "id": 1,
  "name": "name",
  "state": "archive",
  "size": "300x200",
  "media_type": "banner",
  "universal_categories": {},
  "categories_data": [],
  "placement_grouop_id": 1,
  "group_categories_data": [],
  "has_creative": false,
  "creative": null,
  "has_reserve_price": false,
  "cpm_deal": 1,
  "cpc_deal": 1,
  "currency": "USD"
}
```

### HTTP Request
`GET http://HOST/api/publishers/:publisher_id/placement_groups/:placement_group_id/placements/:id`

### Query Parameters

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
id        | true | None |
publisher_id | true | None |
placement_group_id | true | None |

## Duplicate Placements

> Example Request:

```shell
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     --data "placements[][placement_id]=1&placements[][name]=name"
     -X POST \
     http://HOST/api/publishers/PUBLISHER_ID/placements
```

> Example Response:

```json
// 201
```

### HTTP Request
`POST http://HOST/api/publishers/:publisher_id/placements/duplicate`

### Query Parameters

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
placements | true | None |

#### PlacementDuplicateDAO

Key | Required | Default | Description
--------- | -------- | ------- | -----------
placemng_id | true | None |
name | true | None |

## Update a Specific Placements or Batch Update Placements

> Example Request:

```shell
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     -X PUT \
     --data "name=another_name"
     http://HOST/api/publishers/:publisher_id/placement_groups/:placement_group_id/placements/:ids
```

> Example Response:

```json
// 204
```

### HTTP Request
`PUT http://HOST/api/publishers/:publisher_id/placement_groups/:placement_group_id/placements/:ids`

### Query Parameters

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
ids | true | None | 1,2,3,4
publisher_id | true | None |
placement_group_id | true | None |
placement | true | None | PlacementDAO

#### PlacementDAO

Key | Required | Type | Description
--------- | -------- | ------- | -----------
name | false | string |
state | false | ENUM | 0 - ACTIVE, 1 - INACTIVE, 2 - DELETED
has_reserve_price | false | integer | 1 or 0
cpm_price | false | float |
width | false |integer |
height | false | integer |
size | false | string | 200x100 . it is required for placements whose media type is banner
media_type | false | string | banner / interstitial / native

## Export Tag of a Specific Placement

> Example Request:

```shell
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     http://HOST/api/publishers/:publisher_id/placements/:id/export_tag
```

> Example Response:

```json
{
  "placement_id": "1_2",
  "tag": "<div id=\"1_2\"></div><script>code here</script>"
}
```

### HTTP Request
`GET http://HOST/api/publishers/:publisher_id/placements/:id/export_tag`

### Query Parameters

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
publisher_id | true | None |
id | true | None |

## Get All Placements Under a Specific Placement Group

> Example Request:

```shell
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     http://HOST/api/publishers/:publisher_id/placement_groups
```

> Example Response:

```json
{
  "placement_id": "1_2",
  "tag": "<div id=\"1_2\"></div><script>code here</script>"
}
```

### HTTP Request
`GET http://HOST/api/publishers/:publisher_id/placements/:id/export_tag`

### Query Parameters

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
id | true | None |
publisher_id | true | None |

## Create a Placement

> Example Request:

```shell
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     -X POST
     --data "placement[name]=name"
     http://HOST/api/publishers/:publisher_id/placement_groups/:placment_group_id/placements
```

> Example Response:

```json
// 201
```

### HTTP Request
`POST http://HOST/api/publishers/:publisher_id/placements`

### Query Parameters

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
publisher_id | true | None |
placement_group_id | true | None |
placement | true | None | PlacementDAO

#### PlacementDAO

Key | Required | Type | Description
--------- | -------- | ------- | -----------
name | true | string |
state | true | ENUM | 0 - ACTIVE, 1 - INACTIVE, 2 - DELETED
has_reserve_price | false | integer | 1 or 0
cpm_price | false | float |
width | false |integer |
height | false | integer |
size | false | string | 200x100 . it is required for placements whose media type is banner
media_type | false | string | banner / interstitial / native

# Placement Groups
## Get All Placement Groups

> Example Request:

```shell
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     http://HOST/api/publishers/:publisher_id/placement_groups
```

> Example Response:

```json
{
  "data": [
    {
      "id": 1,
      "name": "name",
      "publisher_id": 1,
      "url": "url",
      "description": "description",
      "universal_categories": {},
      "categories_data": [],
      "placements_count": 0
    }
  ],
  "meta": {
    "total": 1
  }
}
```

### HTTP Request
`GET http://HOST/api/publishers/:publisher_id/placement_groups`

### Query Parameters

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
publisher_id | true | None |
order | false | id,desc | `<column>,<asc or desc>`, columns could be: id, publisher_id, name, url, description, state, updated_at, placements_count

## Get a Specific Placement Group

> Example Request:

```shell
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     http://HOST/api/publishers/:publisher_id/placement_groups/:placment_group_id
```

> Example Response:

```json
{
  "id": 1,
  "name": "name",
  "publisher_id": 1,
  "url": "url",
  "description": "description",
  "universal_categories": {},
  "categories_data": [],
  "placements_count": 0
}
```

### HTTP Request
`GET http://HOST/api/publishers/:publisher_id/placement_groups/:placment_group_id`

### Query Parameters

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
publisher_id | true | None |
placement_group_id | true | None |

## Create a Placement Group

> Example Request:

```shell
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     --data "name=name"
     -X POST
     http://HOST/api/publishers/:publisher_id/placement_groups
```

> Example Response:

```json
{
  "id": 1,
  "name": "name",
  "publisher_id": 1,
  "url": "url",
  "description": "description",
  "universal_categories": {},
  "categories_data": [],
  "placements_count": 0
}
```

### HTTP Request
`POST http://HOST/api/publishers/:publisher_id/placement_groups`

### Query Parameters

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
publisher_id | true | None |
placement_group_id | true | None |
PlacementGroupDAO | true | None |

#### PlacementGroupDAO

Key | Required | Type | Description
--------- | -------- | ------- | -----------
name | true | string |
state | true | ENUM | 0 - ACTIVE, 2 - DELETED
url | false | string |
description | false | string |
universal_categories | false | string | json hash

## Update a Specific Placement Group or Batch Update Placement Groups

> Example Request:

```shell
curl -H "X-Requested-With: XMLHttpRequest" \
     -H "x-access-token: TOKEN" \
     --data "name=name"
     -X PUT
     http://HOST/api/publishers/:publisher_id/placement_groups/:placment_group_id
```

> Example Response:

```json
// 204
```

### HTTP Request
`PUT http://HOST/api/publishers/:publisher_id/placement_groups/:placment_group_id`

### Query Parameters

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
publisher_id | true | None |
placement_group_id | true | None |
PlacementGroupDAO | true | None |

#### PlacementGroupDAO

Key | Required | Type | Description
--------- | -------- | ------- | -----------
name | false | string |
state | false | ENUM | 0 - ACTIVE, 2 - DELETED
url | false | string |
description | false | string |
universal_categories | false | string | json hash
