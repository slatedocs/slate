# Banks

## Introduction

This api allows the users to check which banks are supported by the Beyonic API.
The API endpoint is <aside class="notice">https://api.beyonic.com/api/banks</aside>

## The bank object
A sample bank object looks like This

```json
{
            "id": 1,
            "name": "BANK OF AFRICA-UGANDA LTD",
            "country": {
                "iso": "UG",
                "iso3": "",
                "iso_numeric": null,
                "name": "Uganda",
                "printable_name": "Uganda",
                "phone_prefix": "+256",
                "supported": true
            },
            "swift_code": null
        }
```

Field | Type | Description
----- | -----| ----
id | long integer | Unique object identifier
name | string | The bank name
country | object | Expanded country object
swift_code | string | International swift code 
