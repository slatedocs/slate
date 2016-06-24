# Reporting API

## Query string

The route for the reporting is `GET /report`

### List of parameters

Parameter name | Format	| Options Available | Required
-------------- | ------ | ----------------- | --------
range |	string | GET /report/options/range | Yes
from | date | YYYY-MM-DD | No
to | date | YYYY-MM-DD | No
interval | string | GET /report/options/interval | Yes
metrics	| array | GET /report/options/metrics	| Yes
dimensions | array | GET /report/options/dimensions | Yes
filters | array | GET /report/options/filters | No
options | array	| GET /report/options/options | No
limit | int	| (default: 10)	| No
offset | int | (default: 0) | No

### Range

`GET report/options/range`

> Range - Example Response

```json
{
    "status": "success",
    "data": {
        "today": "Today",
        "yesterday": "Yesterday",
        "last_7_days": "Last 7 Days",
        "last_48_hours": "Last 48 Hours",
        "month_to_date": "Month to Date",
        "last_month": "Last Month",
        "custom": "Custom"
    }
}
```

### From

Format YYYY-MM-DD. Only required for range: "custom"

To

Format YYYY-MM-DD. Only required for range: "custom"

### Interval

`GET /report/options/interval`

> Interval - Example Response

```json
{
    "status": "success",
    "data": {
        "cumulative": "Cumulative",
        "day": "Day",
        "month": "Month"
    }
}
```

### Metrics

`GET /report/options/metrics`

> Metrics - Example Response

```json
{
    "status": "success",
    "data": {
        "impressions": "Impressions",
        "clicks": "Clicks",
        "ctr": "CTR",
        "gross": "Gross",
        "totalspend": "Total Spend",
        "mediaspend": "Media Spend",
        "buyerplatformfee": "Buyer Platform Fee",
        "sellerrevenue": "Seller Revenue",
        "sellerplatformfee": "Seller Platform Fee",
        "net": "Net",
        "ecpc": "eCPC",
        "ecpm": "eCPM"
    }
}
```

### Dimensions

`GET /report/options/dimensions`

> Dimensions - Example Response

```json
{
    "status": "success",
    "data": {
        "seller_account_id": "Seller",
        "buyer_account_id": "Buyer",
        "country": "Country",
        "source": "Source",
        "cid": "Campaign",
        "device_type": "Device Type"
    }
}
```

### Filters

`GET /report/options/filters`

> Filter - Example Response

```json
{
    "status": "success",
    "data": {
        "seller_account_id": "Seller",
        "buyer_account_id": "Buyer",
        "country": "Country",
        "source": "Source",
        "cid": "Campaign",
        "device_type": "Device"
    }
}
```

To list the option for each filter you can use the following API:

`GET /report/options/filters/{filter}/values`

This API return paginated content. In order to use the pagination you can use two optional parameters: "limit" and "offset".

i.e. country

```json
{
    "status": "success",
    "data": {
        "items": {
            "GBR": "United Kingdom",
            "USA": "United States",
            "DEU": "Germany",
            "FRA": "France",
            "AFG": "Afghanistan",
            "ALB": "Albania",
            "DZA": "Algeria",
            "ASM": "American Samoa",
            "AND": "Andorra",
            "AGO": "Angola"
        },
        "limit": 10,
        "offset": 0,
        "totalItems": 227,
        "pages": 23
    }
}
```

### Options

`GET /report/options/options`

> Options - Example Response

```json
{
    "status": "success",
    "data": [
        "showall",
        "sql",
        "total"
    ]
}
```

### Accounts

This parameter is valid just if you are an admin. Accounts allows an array of values in this format:

### Query string structure

Parameter name | Syntax
-------------- | ------
range | range=today
from | [ range=custom& ] from=2015-06-12 [ &to=2015-06-30 ]
to| [ range=custom&from=2015-06-12& ] to=2015-06-30
interval | interval=cumulative
metrics |	metrics=impressions,clicks [ ,{metrics},... ]
dimensions | dimensions=inventory_id,campaign_id [ ,{dimensions},... ]
filters | filters=country:GBR,USA,ITA;device_id:1,2,3 [ ;{keyword}:{value},{value};... ]
accounts| accounts=e661785d-4a04-450b-a050-23426a58d3e5,95f8e7ec-9aa7-11e5-8994-feff819cdc9f [ ,{uuid},... ]


> Request

```shell
curl \
    -H "ApiKey: xM6frL3y7ImCoZiDHKXRVMMkPB2v7PWvRJaPX7RY7n77IMpDwchlLUHSeYpkmqwNPFAbQLX6Cs33ug51rjJ7wrvScBkZUz9FbbbHETqaxW4=" \
    "http://reporting.api.powerlinks.com/report?range=yesterday&interval=cumulative&metrics=impressions,clicks&dimensions=inventory_id"
```

> Response

```json
{
    "status": "success",
    "data": {
        "headers": {
            "impressions": "Impressions",
            "clicks": "Clicks",
            "inventory_id": "Inventory"
        },
        "recordset": [
            {
                "impressions": 132336,
                "clicks": 386,
                "inventory_id": ""
            }
        ],
        "limit": 10,
        "offset": 0,
        "totalItems": 1,
        "pages": 1
    }
}
```

## API Key

### Introduction

The ApiKey is used to authenticate an external application.

### Acquiring API keys

There will be an API in the dashboard which will be used to retrieve the API key.

> Request

```shell
curl -X POST -d "username=USERNAME&password=PASSWORD" https://dashboard.powerlinks.com/apikey/login
```

> Response

```shell
xM6frL3y7ImCoZiDHKXRVMMkPB2v7PWvRJaPX7RY7n77IMpDwchlLUHSeYpkmqwNPFAbQLX6Cs33ug51rjJ7wrvScBkZUz9FbbbHETqaxW4=
NB This is not definitive yet
```

### Using API keys

The API Key will be added as a custom header "ApiKey" inside the HTTP request for each request to reporting API routes.