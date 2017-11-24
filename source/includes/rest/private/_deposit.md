# Deposit

## Get Deposit Address

> Response

```json
{
    "asset": "BTC",
    "address": "1PAt5oKQGBRigFDY6fB2WgQTtQJNzFyTDr"
}
```

Get a deposit address.

### HTTP Request

**`GET /deposit/:asset`**

### Parameters

Name | Description
--------- | -------
asset | The asset you want a deposit address for

### Response

A deposit address for the requested asset.