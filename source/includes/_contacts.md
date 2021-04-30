# <a name="contacts-section"></a>Contacts

Endpoints to manage contacts

## Listing contacts

> Example request

```shell
curl "https://getquipu.com/contacts" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": [{
    "id": "45923",
    "type": "contacts",
    "attributes": {
      "name": "PEPEMOBILE S.L.",
      "tax_id": "ESB85033470",
      "phone": "999999999",
      "email": "pepe@phone.com",
      "address": "Paseo de la Castellana 8, 7-D",
      "town": "Madrid",
      "zip_code": "28046",
      "country_code": "es",
      "total_paid_incomes": "13284.56",
      "total_unpaid_incomes": "0.0",
      "total_incomes": "13284.56",
      "total_paid_expenses": "0.0",
      "total_unpaid_expenses": 0.0,
      "total_expenses": "0.0",
      "client_number": "6",
      "supplier_number": null,
      "is_client": true,
      "is_supplier": false,
      "is_employee": false,
      "is_supplier_of_direct_goods": false,
      "bank_account_number": "ES92 3821 0601 2314 3339 5656",
      "bank_account_swift_bic": "",
      "deletable": false
    }, {
    "id": "45956",
    "type": "contacts",
    "attributes": {
      "name": "Amazon EU S.a.r.l., España",
      "tax_id": "ESW0184081H",
      "phone": "999999999",
      "email": "",
      "address": "Via De Las Dos Castillas, 33, Atica Ed. 2",
      "town": "Pozuelo de Alarcón",
      "zip_code": "28224",
      "country_code": "es",
      "total_paid_incomes": "0.0",
      "total_unpaid_incomes": "0.0",
      "total_incomes": "0.0",
      "total_paid_expenses": "263.15",
      "total_unpaid_expenses": 0.0,
      "total_expenses": "263.15",
      "client_number": null,
      "supplier_number": 931,
      "is_client": false,
      "is_supplier": true,
      "is_employee": false,
      "is_supplier_of_direct_goods": false,
      "bank_account_number": "ES92 3821 0601 2314 3339 5656",
      "bank_account_swift_bic": "",
      "deletable": false
    }
  }, {

    ...

  }],
  meta: {
    pagination_info: {
      "total_pages": 2
      "current_page": 1
      "total_results": 23
    }
  }
}
```

`GET /contacts`

### Available filters

Filter name | Description | Valid values | Example
------------| ------------| ------------ | -------
q | Search by name | Any | `/contacts?filter[q]=amazon`
kind | Filter contacts by kind | `employee`, `supplier` and `client` | `contacts?filter[kind]=client`
tax_id | Filter contacts by their tax id | | `contacts?filter[tax_id]=43456628J`
country | Filter contacts by one or many countries, separated by commas | any country code, in downcase, under the ISO 3166-1 Alpha-2 | `contacts?filter[country]=es,it`

### Sorting

Criteria name | Description | Example
------------- | ----------- | -------
name | Sorts contacts by name | `/contacts?sort=name`
total_paid_income | Sorts contacts by the amount of money they have paid to us | `/contacts?sort=-total_paid_income`
total_unpaid_income | Sorts contacts by the amount of money they owe us | `/contacts?sort=total_unpaid_income`
total_paid_expenses | Sorts contacts by the amount of money we have paid to them | `/contacts?sort=total_paid_expenses`
total_unpaid_expenses | Sorts contacts by the amount of money we owe them | `/contacts?sort=-total_unpaid_expenses`

### Pagination

20 contacts in every response. Total pages indicated by `total_pages` in response `meta` object.

You can request a specific page with a query param: `GET /contacts?page[number]=7`

## Getting a contact

> Example request

```shell
curl "https://getquipu.com/contacts/45923" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": {
    "id": "45923",
    "type": "contacts",
    "attributes": {
      "name": "PEPEMOBILE S.L.",
      "tax_id": "ESB85033470",
      "phone": "999999999",
      "email": "pepe@phone.com",
      "address": "Paseo de la Castellana 8, 7-D",
      "town": "Madrid",
      "zip_code": "28046",
      "country_code": "es",
      "total_paid_incomes": "13284.56",
      "total_unpaid_incomes": "0.0",
      "total_incomes": "13284.56",
      "total_paid_expenses": "0.0",
      "total_unpaid_expenses": 0.0,
      "total_expenses": "0.0",
      "client_number": "6",
      "supplier_number": null,
      "is_client": true,
      "is_supplier": false,
      "is_employee": false,
      "is_supplier_of_direct_goods": false,
      "bank_account_number": "ES92 3821 0601 2314 3339 5656",
      "bank_account_swift_bic": "",
      "deletable": false
    }
  }
}
```

`GET /contact/:contact_id`

## Creating a contact

> Example request

```shell
curl "https://getquipu.com/contacts" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "contacts",
          "attributes": {
            "name": "PEPEMOBILE S.L.",
            "tax_id": "ESB85033470",
            "phone": "999999999",
            "email": "pepe@phone.com",
            "address": "Paseo de la Castellana 8, 7-D",
            "town": "Madrid",
            "zip_code": "28046",
            "country_code": "es",
            "client_number": 6,
            "supplier_number": null,
            "is_supplier_of_direct_goods": false,
            "bank_account_number": "ES92 3821 0601 2314 3339 5656",
            "bank_account_swift_bic": ""
          }
        }
      }'
```

> Example response (status: 204)

```shell
{
  "data": {
    "id": "45923",
    "type": "contacts",
    "attributes": {
      "name": "PEPEMOBILE S.L.",
      "tax_id": "ESB85033470",
      "phone": "999999999",
      "email": "pepe@phone.com",
      "address": "Paseo de la Castellana 8, 7-D",
      "town": "Madrid",
      "zip_code": "28046",
      "country_code": "es",
      "total_paid_incomes": "13284.56",
      "total_unpaid_incomes": "0.0",
      "total_incomes": "13284.56",
      "total_paid_expenses": "0.0",
      "total_unpaid_expenses": 0.0,
      "total_expenses": "0.0",
      "client_number": "6",
      "supplier_number": null,
      "is_client": true,
      "is_supplier": false,
      "is_employee": false,
      "is_supplier_of_direct_goods": false,
      "bank_account_number": "ES92 3821 0601 2314 3339 5656",
      "bank_account_swift_bic": "",
      "deletable": false
    }
  }
}
```

> Example response (status 422)

```shell
{
  "errors": [
    {
      "detail": "Can not be blank.",
      "source": {
        "pointer": "/data/attributes/name"
      }
    }, {
      "detail": "This Iban is not valid, please contact your bank and provide a new one.",
      "source": {
        "pointer": "/data/attributes/bank_account_number"
      }
    }
  ]
}
```

`POST /contacts`

## Updating a contact

```shell
curl "https://getquipu.com/contacts/746868" \
  -X PATCH
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "contacts",
          "attributes": {
            "name": "Another name",
            "email": "another@name.com",
            "bank_account_number": "ES92 3821 0601 2314 3339 5656",
          }
        }
      }'
```

> Example response (status: 200)

```shell
{
  "data": {
    "id": "45923",
    "type": "contacts",
    "attributes": {
      "name": "Another name",
      "tax_id": "ESB85033470",
      "phone": "999999999",
      "email": "another@name.com",
      "address": "Paseo de la Castellana 8, 7-D",
      "town": "Madrid",
      "zip_code": "28046",
      "country_code": "es",
      "total_paid_incomes": "13284.56",
      "total_unpaid_incomes": "0.0",
      "total_incomes": "13284.56",
      "total_paid_expenses": "0.0",
      "total_unpaid_expenses": 0.0,
      "total_expenses": "0.0",
      "client_number": "6",
      "supplier_number": null,
      "is_client": true,
      "is_supplier": false,
      "is_employee": false,
      "is_supplier_of_direct_goods": false,
      "bank_account_number": "ES92 3821 0601 2314 3339 5656",
      "bank_account_swift_bic": "",
      "deletable": false
    }
  }
}
```

`(PATCH|PUT) /contacts/:contact_id`

## Deleting a contact

```shell
curl "https://getquipu.com/contacs/45923" \
  -X DELETE
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

`DELETE /contacts/:contact_id`

The response status will be `204 - No Content` if the operation was
successfull or `403 - Forbidden` if the contact could not be deleted (or authorization fails). A
contact can not be deleted if there are invoices or paysheets associated
with it.
