#<a name="numbering-series-section"></a> Numbering series

The numbering series are applicable only to income tickets and invoices.

## Attributes

Attr. name |  Constraints
---------- |  -----------
prefix | REQUIRED. Must be unique. The prefix that will be preppended to the invoice, or ticket
applicable_to | REQUIRED. Accepted values: `"tickets"` or `"invoices"`
default | Accepted values: `true` or `false`. Used only in the fronted when creating a new income invoice or ticket.
amending | Accepted values: `true` or `false`. Indicates if the series is applicable to amendig tickets or invoices
deletable | READ ONLY. Indicates if the numeration can be deleted. If there are invoices or tickets using a numeration this numeration can not be deleted

## Listing the numbering series

> Example request

```shell
curl "https://getquipu.com/numbering_series" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": [{
    "id": "6326",
    "type": "numbering_series",
    "attributes": {
      "prefix": "2016",
      "deletable": false,
      "default": true,
      "amending": false,
      "applicable_to": "invoices"
    }, {
    "id": "6332",
    "type": "numbering_series",
    "attributes": {
      "prefix": "AT16",
      "deletable": false,
      "default": false,
      "amending": true,
      "applicable_to": "tickets"
    }
  }]
}
```

`GET /numbering_series`

## Getting a numbering serie

> Example request

```shell
curl "https://getquipu.com/numbering_series/6326" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": {
    "id": "6326",
    "type": "numbering_series",
    "attributes": {
      "prefix": "2016",
      "deletable": false,
      "default": true,
      "amending": false,
      "applicable_to": "invoices"
    }
  }
}
```

`GET /numbering_series/:numbering_series_id`

## Creating a numbering series

> Example request

```shell
curl "https://getquipu.com/numbering_series" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "numbering_series",
          "attributes": {
            prefix: "AIT",
            applicable_to: "invoices",
            amending: false,
            default: false
          }
        }
      }'
```

`POST /numbering_series/:numbering_series_id`

## Updating a numbering series

> Example request

```shell
curl "https://getquipu.com/numbering_series/3412" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "id": "3412",
          "type": "numbering_series",
          "attributes": {
            default: true
          }
        }
      }'
```

`(PUT|PATCH) /numbering_series/:numbering_series_id`

## Deleting a numbering series

The server will respond with `403: Unauthorized` if the numeration can not be deleted

> Example request

```shell
curl "https://getquipu.com/numbering_series/3412" \
  -X DELETE
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

`DELETE /numbering_series/:numbering_series_id`
