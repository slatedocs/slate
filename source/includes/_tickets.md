#<a name="tickets-section"></a> Tickets

Endpoints to manage tickets (receipts).

The main difference between invoices and tickets is that the latest don't have an associated contact. You provide only the counterpart name: the `issuing_name` for expense tickets or the `recipient_name` for income tickets

## Attributes

Attr. name |  Constraints
---------- |  -----------
kind | REQUIRED <br> Accepted values: `income` or `expenses`
number | For income tickets we recommend leave it blank, and Quipu will assign it.<br>For income tickets must be unique within a fiscal year.
issue_date | REQUIRED <br> Format: `YYYY-mm-dd`
paid_at  | Format: `YYYY-mm-dd`
payment_method | Accepted valued: `cash`, `bank_transfer`, `bank_card`, `direct_debit`, `paypal`, `check`, `factoring`
payment_status | READ ONLY
total_amount   | READ ONLY
total_amount | READ ONLY
total_amount_without_taxes | READ ONLY
vat_amount | READ ONLY
retention_amount | READ ONLY
issuing_name | REQUIRED for expense tickets.<br>READ ONLY for income tickets. *
issuing_tax_id | READ ONLY, *
issuing_address | READ ONLY, *
issuing_phone | READ ONLY, *
issuing_town | READ ONLY, *
issuing_zip_code | READ ONLY, *
issuing_country_code | READ ONLY, *
recipient_name | REQUIRED for income tickets.<br>READ ONLY for expense tickets. *
recipient_tax_id | READ ONLY, *
recipient_address | READ ONLY, *
recipient_phone | READ ONLY, *
recipient_town | READ ONLY, *
recipient_zip_code | READ ONLY, *
recipient_country_code | READ ONLY, *
tags | Format: a list of strings separated by comma
notes | Format: a string
download_pdf_url | Url to download the pdf document for the ticket. Present only in income tickets. Needs the same authorization header.
download_pdf_url | Url to download the pdf document for the invoice. Present only in income tickets. Needs the same authorization header.

\* This fields will be populated and updated each time an invoice is saved from the information of the Quipu account owner and the contact associatied with the book entry.

## Relationships

Relationship name |  Constraints
----------------- |  -----------
accounting_category |
accounting_subcategory |
numeration | Applicable only to tickets with `kind = income`
analytic_categories | Can not be a root analytic category
items | Can be sideloaded in GET requests. <br> Must be included in the payload in POST/PATCH/PUT requests
amended_ticket | The ticket amended by the current one.
amending_tickets | Ticket that amends the current one (Read Only)

## Listing tickets

> Example request

```shell
curl "https://getquipu.com/tickets" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": [{
    "id": "2988939",
    "type": "tickets",
    "attributes": {
      "kind": "income",
      "number": "t16-53",
      "issue_date": "2016-02-29",
      "paid_at": "2016-03-02",
      "payment_method": "cash",
      "payment_status": "paid",
      "total_amount": "5.40",
      "total_amount_without_taxes": "4.46",
      "vat_amount": "0.94",
      "retention_amount": "0.0"
      "issuing_name": "QuipuApp S.L.",
      "issuing_tax_id": "43467890F",
      "issuing_address": "C/ Viladomat 39",
      "issuing_phone": "123456789",
      "issuing_town": "San Cucufate",
      "issuing_zip_code": "09876",
      "issuing_country_code": "es",
      "recipient_name": "Manolo",
      "recipient_tax_id": "",
      "recipient_address": "",
      "recipient_phone": "",
      "recipient_town": "",
      "recipient_zip_code": "",
      "recipient_country_code": "",
      "tags": ""
    },
    "relationships": {
      "accounting_category": {
        "data": {
          "type": "accounting_categories",
          "id": "133"
        }
      },
      "accounting_subcategory": {
        "data": null
      },
      "numeration": {
        "data": {
          "type": "numbering_series",
          "id": "6332"
        }
      },
      "analytic_categories": {
        "data":[]
      },
      "items": {
        "data": [{
          "type": "book_entry_items",
          "id": "3399147"
        }]
      }
    }
  }, {
    "id": "2937714",
    "type": "tickets",
    "attributes": {
      "kind": "income",
      "number": "t16-53",
      "issue_date": "2016-01-31",
      "paid_at": "2016-02-03",
      "payment_method": "cash",
      "payment_status": "paid",
      "total_amount": "5.40",
      "total_amount_without_taxes": "4.46",
      "vat_amount": "0.94",
      "retention_amount": "0.0"
      "issuing_name": "QuipuApp S.L.",
      "issuing_tax_id": "43467890F",
      "issuing_address": "C/ Viladomat 39",
      "issuing_phone": "123456789",
      "issuing_town": "San Cucufate",
      "issuing_zip_code": "09876",
      "issuing_country_code": "es",
      "recipient_name": "Manolo",
      "recipient_tax_id": "",
      "recipient_address": "",
      "recipient_phone": "",
      "recipient_town": "",
      "recipient_zip_code": "",
      "recipient_country_code": "",
      "tags": ""
    },
    "relationships": {
      "accounting_category": {
        "data": {
          "type": "accounting_categories",
          "id": "133"
        }
      },
      "accounting_subcategory": {
        "data": null
      },
      "numeration": {
        "data": {
          "type": "numbering_series",
          "id": "6326"
        }
      },
      "analytic_categories": {
        "data": []
      },
      "items": {
        "data": [{
          "type": "book_entry_items",
          "id": "3319559"
        }]
      }
    }
  }, {

  ...

  },
  "meta": {
    pagination_info: {
      "total_pages": 2
      "current_page": 1
      "total_results": 23
    }
  }
}
```

`GET /tickets`

### Available filters

See [Invoices, tickets and paysheets => Available filters](#book-entries-available-filters)

### Sorting

See [Invoices, tickets and paysheets => Sorting](#book-entries-sorting)

### Side loading items

If you want to retrieve the complete information about the items associated with the tickets, you can pass `?include=items` in the url

Example:

`GET /tickets?include=items`

## Getting a ticket

> Example request

```shell
curl "https://getquipu.com/tickets/2989809" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": {
    "id": "2989809",
    "type": "tickets",
    "attributes": {
      "kind": "income",
      "number": "t16-53",
      "issue_date": "2016-02-29",
      "paid_at": "2016-03-02",
      "payment_method": "cash",
      "payment_status": "paid",
      "total_amount": "5.40",
      "total_amount_without_taxes": "4.46",
      "vat_amount": "0.94",
      "retention_amount": "0.0"
      "issuing_name": "QuipuApp S.L.",
      "issuing_tax_id": "43467890F",
      "issuing_address": "C/ Viladomat 39",
      "issuing_phone": "123456789",
      "issuing_town": "San Cucufate",
      "issuing_zip_code": "09876",
      "issuing_country_code": "es",
      "recipient_name": "Manolo",
      "recipient_tax_id": "",
      "recipient_address": "",
      "recipient_phone": "",
      "recipient_town": "",
      "recipient_zip_code": "",
      "recipient_country_code": "",
      "tags": ""
    },
    "relationships": {
      "accounting_category": {
        "data": {
          "type": "accounting_categories",
          "id": "133"
        }
      },
      "accounting_subcategory": {
        "data": null
      },
      "numeration": {
        "data": {
          "type": "numbering_series",
          "id": "6332"
        }
      },
      "analytic_categories": {
        "data":[]
      },
      "items": {
        "data": [{
          "type": "book_entry_items",
          "id": "3399147"
        }]
      }
    }
  }
}
```

`GET /tickets/:ticket_id` |
`GET /tickets/:ticket_id?include=items`

## Creating a ticket

> Example request

```shell
curl "https://getquipu.com/tickets" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "tickets",
          "attributes": {
            "kind": "income",
            "number": null,
            "recipient_name": "unknown",
            "issue_date": "2016-03-08",
            "paid_at": "2016-03-08",
            "payment_method": "cash",
            "tags": "songo, timba"
          },
          "relationships": {
            "accounting_category": {
              "data": {
                "id": 123,
                "type": "accounting_categories"
              }
            },

            ...

            "items": {
              "data": [{
                "type": "book_entry_items",
                "attributes": {
                  "concept": "Tornillos"
                  "unitary_amount": "0.50",
                  "quantity": 30,
                  "vat_percent": 21,
                  "retention_percent": 0
                }
              }, {
                "type": "book_entry_items",
                "attributes": {
                  "concept": "Tuercas"
                  "unitary_amount": "0.35",
                  "quantity": 30,
                  "vat_percent": 21,
                  "retention_percent": 0
                }
              }]
            }
          }
        }
      }'
```

`POST /tickets`

## Updating a ticket

> Example request


```shell
# This request will update the attributes of the item with id 23424141,
# create a new item with concept "Tuercas",
# and destroy other items associated to the ticket if any.

curl "https://getquipu.com/tickets/2682381" \
  -X PATCH \
  -H "Authorization: Bearer 818abe1ea4a1813999a47105892d50f3781320c588fb8cd2927885963e621228" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "invoices",
          "id": 2682381,
          "attributes": {
            "paid_at": "21-2-2016"
          },
          "relationships": {
            "items": {
              "data": [{
                "id": 23424141,
                "type": "book_entry_items",
                "attributes": {
                  "concept": "Tornillos",
                  "unitary_amount": "0.50",
                  "quantity": 30,
                  "vat_percent": 21,
                  "retention_percent": 0
                }
              }, {
                "type": "book_entry_items",
                "attributes": {
                  "concept": "Tuercas",
                  "unitary_amount": "0.35",
                  "quantity": 30,
                  "vat_percent": 21,
                  "retention_percent": 0
                }
              }]
            }
          }
        }
      }'
```

`(PUT|PATCH) /tickets/:ticket_id`

## Deleting a ticket

> Example request

```shell
curl "https://getquipu.com/tickets/2988939" \
  -X DELETE
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

`DELETE /tickets/:ticket_id`

## Refunds and amending tickets

A ticket can be totally or partially amended. The minimal amount of data needed to create an amending ticket is the relationship `amended_ticket`. With this data a complete refund of the original ticket will be created.

You can also partially amend a ticket setting the items of the amending ticket manually.

> Example request for a complete refund

```shell
curl "https://getquipu.com/tickets" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "tickets",
          "relationships": {
            "amended_ticket": {
              "data": {
                "id": 879495,
                "type": "tickets"
              }
            }
          }
        }
      }'
```

> Example of a partial refund

```shell
curl "https://getquipu.com/tickets" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "tickets",
          "relationships": {
            "amended_ticket": {
              "data": {
                "id": 879495,
                "type": "tickets"
              }
            },
            "items": {
              "data": [{
                "type": "book_entry_items",
                "attributes": {
                  "concept": "Partial refund for service delay",
                  "quantity": 1,
                  "unitary_amount": "-5.00",
                  "vat_percent": 21
                }
              }]
            }
          }
        }
      }'
```
