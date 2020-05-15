# Addresses

## Address Object

Attribute | Type | Description
--------- | ----------- | ---------
id | string | Bilendo id of the address <br>Example: `00000000-0000-0000-0000-000000000000`
external_id | string | your id of the address
line1 | string | customer’s address line 1 (customer name)
line2 | string | customer’s address line 2 (contact name)
line3 | string | customer’s address line 3 (street and house number)
line4 | string | customer’s address line 4 (additional address)
zip | string | customer’s zip code
city | string | customer’s city
country | string | customer’s country
customer_id | string | the customer id
default_address | boolean | true = default address<br>false = not default address

## Get All Addresses

This endpoint will display all the addresses for a customer.

<b>API Endpoint</b>

`GET https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/addresses`

> Request

```shell
curl -X "PATCH" "https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/addresses" \
  -H "Authorization: Token token=YOUR-API-TOKEN" \
```

## Create new Address

This endpoint allows you to create a new address for a customer.

<b>API Endpoint</b>

`POST https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/addresses`

> Request

```shell
curl -X "POST" "https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/addresses" \
  -H "Authorization: Token token=YOUR-API-TOKEN" \
  -d "line1=New GmbH" \
  -d "line3=Sendlinger Str. 85" \
  -d "zip=81735" \
  -d "city=Munich" \
  -d "country_code=de" \
```

Attribute | Type | Description
--------- | ----------- | ---------
external_id | optional | your id of the address
line1 | mandatory | customer’s address line 1 (customer name)
line2 | optional | customer’s address line 2 (contact name)
line3 | mandatory | customer’s address line 3 (street and house number)
line4 | optional | customer’s address line 4 (additional address)
zip | mandatory | customer’s zip code
city | mandatory | customer’s city
country_code <strong>or</strong><br>country | mandatory | customer’s country isocode or name
default_address | optional | true = default address<br>false = not default address

<aside class="notice">
      <strong>Note:</strong> You can use the <strong>id</strong> or the <strong>external_id</strong> for associated customers.
      In case both are provided, id has more priority over external_id.
</aside>

> Response

```json
{
    "data": {
        "id": "<address-id>",
        "type": "address",
        "attributes": {
            "id": "<address-id>",
            "external_id": "<your-address-id>",
            "zip": "81735",
            "city": "Munich",
            "country": "Deutschland",
            "default_address": true,
            "line1": "New GmbH",
            "line2": null,
            "line3": "Sendlinger Str. 85",
            "line4": null,
            "created_at": "2020-05-15T18:22:10+02:00",
            "updated_at": "2020-05-15T18:22:10+02:00"
        },
        "relationships": {
            "customer": {
                "data": {
                    "id": "<customer-id>",
                    "type": "customer"
                },
                "links": {
                    "self": "https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/addresses/<address-id>",
                    "related": "https://apisandbox.bilendo.de/api/v2/customers/<address-id>"
                }
            }
        }
    }
}
```

## Update existing Address

This endpoint allows you to update the information of an address for a customer.

<b>API Endpoint</b>

`PATCH https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/addresses/<address-id>`

> Request

```shell
curl -X "PATCH" "https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/addresses/<address-id>" \
  -H "Authorization: Token token=YOUR-API-TOKEN" \
  -d "city=Munich" \
```

Attribute | Type | Description
--------- | ----------- | ---------
external_id | optional | your id of the address
line1 | mandatory | customer’s address line 1 (customer name)
line2 | optional | customer’s address line 2 (contact name)
line3 | mandatory | customer’s address line 3 (street and house number)
line4 | optional | customer’s address line 4 (additional address)
zip | mandatory | customer’s zip code
city | mandatory | customer’s city
country_code <strong>or</strong><br>country | mandatory | customer’s country isocode or name
default_address | optional | true = default address<br>false = not default address

## Get a specific Contact

This endpoint will display all the information of a particular address for a customer.

<b>API Endpoint</b>

`GET https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/addresses/<address-id>`

> Request

```shell
curl -X "GET" "https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/addresses/<address-id>" \
  -H "Authorization: Token token=YOUR-API-TOKEN"
```

## Find a specific Contact

Use this endpoint to case-insensitive find a address on bilendo by providing your own id.

<b>API Endpoint</b>

`GET https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/addresses/find/<your-address-id>`

> Request

```shell
curl -X "GET" "https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/addresses/find/<your-address-id>" \
  -H "Authorization: Token token=YOUR-API-TOKEN"
```
