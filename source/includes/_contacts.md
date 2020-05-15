# Contacts

## Contact Object

Attribute | Type | Description
--------- | ----------- | ---------
id | string | Bilendo id of the contact <br>Example: `00000000-0000-0000-0000-000000000000`
external_id | string | your id of the contact
name | string | name of the contact
phone | string | phone number of the contact
gender | integer | 0 = unknown<br>1 = male<br>2 = female
salutation | integer | 0 = formal<br>1 = informal
email | string | email
customer_id | string | the customer id
main_contact | boolean | true = main contact<br>false = not main contact

## Get All Contacts

This endpoint will display all the contacts for a customer.

<b>API Endpoint</b>

`GET https://api.bilendo.de/api/v2/customers/<customer-id>/contacts`

> Request

```shell
curl -X "PATCH" "https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/contacts" \
  -H "Authorization: Token token=YOUR-API-TOKEN" \
```

## Create new Contact

This endpoint allows you to create contact for a customer.

<b>API Endpoint</b>

`POST https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/contacts`

> Request

```shell
curl -X "POST" "https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/contacts" \
  -H "Authorization: Token token=YOUR-API-TOKEN" \
  -d "name=John" \
  -d "phone=0123456789" \
  -d "external_id=<your-contact-id>" \
  -d "gender=1" \
  -d "salutation=1" \
  -d "email=john@bilendo.de" \
```

Parameter | type | Description
--------- | ----------- | ---------
name | mandatory | name of the contact
phone | optional | phone number of the contact
gender | mandatory | 0 = unknown<br>1 = male<br>2 = female
external_id | optional | your contact id
salutation | mandatory | 0 = formal<br>1 = informal
email | optional | email
main_contact | optional | true = make this contact a main contact,<br> false = make this contact not a main contact

<aside class="notice">
      <strong>Note:</strong> You can use the <strong>id</strong> or the <strong>external_id</strong> for associated customers.
      In case both are provided, id has more priority over external_id.
</aside>

> Response

```json
{
    "data": {
        "id": "<contact-id>",
        "type": "contact",
        "attributes": {
            "id": "<contact-id>",
            "name": "John",
            "gender": 1,
            "salutation": 1,
            "email": "john@bilendo.de",
            "external_id": "<your-contact-id>",
            "phone": "0123456789",
            "main_contact": true,
            "created_at": "2020-05-15T17:35:00+02:00",
            "updated_at": "2020-05-15T17:35:00+02:00"
        },
        "relationships": {
            "customer": {
                "data": {
                    "id": "<customer-id>",
                    "type": "customer"
                },
                "links": {
                    "self": "https://api.bilendo.de/api/v2/customers/<customer-id>/contacts/<contact-id>",
                    "related": "https://api.bilendo.de/api/v2/customers/<customer-id>"
                }
            }
        }
    }
}
```

## Update existing Contact

This endpoint allows you to update the information of a contact for a customer.

<b>API Endpoint</b>

`PATCH https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/contacts/<contact-id>`

> Request

```shell
curl -X "PATCH" "https://apisandbox.bilendo.de/api/v2/customer/<customer-id>/contacts/<contact-id>" \
  -H "Authorization: Token token=YOUR-API-TOKEN" \
  -d "name=New name" \
```

Parameter | type | Description
--------- | ----------- | ---------
name | mandatory | name of the contact
phone | optional | phone number of the contact
gender | mandatory | 0 = unknown<br>1 = male<br>2 = female
external_id | optional | your contact id
salutation | mandatory | 0 = formal<br>1 = informal
email | optional | email
main_contact | optional | true = make this contact a main contact, false = make this contact not a main contact

## Get a specific Contact

This endpoint will display all the information of a particular contact for a customer.

<b>API Endpoint</b>

`GET https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/contacts/<contact-id>`

> Request

```shell
curl -X "GET" "https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/contacts/<contact-id>" \
  -H "Authorization: Token token=YOUR-API-TOKEN"
```

## Find a specific Contact

Use this endpoint to case-insensitive find a contact on bilendo by providing your own id.

<b>API Endpoint</b>

`GET https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/contacts/find/<your-contact-id>`

> Request

```shell
curl -X "GET" "https://apisandbox.bilendo.de/api/v2/customers/<customer-id>/contacts/find/<your-contact-id>" \
  -H "Authorization: Token token=YOUR-API-TOKEN"
```
