#<a name="invoices-section"></a> Invoices

Endpoints to manage invoices.

## Attributes

Attr. name |  Constraints
---------- |  -----------
kind | REQUIRED <br> Accepted values: `income` or `expenses`
number | For income invoices we recommend leave it blank, and Quipu will assign it.<br>For income invoices must be unique within a fiscal year.<br>For expense invoices must be unique within a fiscal year for the invoice supplier.
issue_date | REQUIRED <br> Format: `YYYY-mm-dd`
due_date | Format: `YYYY-mm-dd`
paid_at  | Format: `YYYY-mm-dd`
payment_method | Accepted valued: `cash`, `bank_transfer`, `bank_card`, `direct_debit`, `paypal`, `check`, `factoring`
payment_status | READ ONLY
total_amount   | READ ONLY
total_amount | READ ONLY
total_amount_without_taxes | READ ONLY
vat_amount | READ ONLY
retention_amount | READ ONLY
issuing_name | READ ONLY, *
issuing_tax_id | READ ONLY, *
issuing_address | READ ONLY, *
issuing_phone | READ ONLY, *
issuing_town | READ ONLY, *
issuing_zip_code | READ ONLY, *
issuing_country_code | READ ONLY, *
recipient_name | READ ONLY, *
recipient_tax_id | READ ONLY, *
recipient_address | READ ONLY, *
recipient_phone | READ ONLY, *
recipient_town | READ ONLY, *
recipient_zip_code | READ ONLY, *
recipient_country_code | READ ONLY, *
last_sent_at | Format: a unix timestamp
tags | Format: a list of strings separated by comma
notes | Format: a string
download_pdf_url | Url to download the pdf document for the invoice. Present only in income invoices. Needs the same authorization header.
ephemeral_open_download_pdf_url | Url to download the pdf document for the invoice. Present only in income invoices. Does not need any authorization header, but can only be used for an hour after getting it.

\* This fields will be populated and updated each time an invoice is saved from the information of the Quipu account owner and the contact associated with the book entry.

## Relationships

Relationship name |  Constraints
----------------- |  -----------
contact | REQUIRED (except for amending invoices)
accounting_category |
accounting_subcategory |
numeration | Applicable only to invoices with `kind = income`
analytic_categories | Can not be a root analytic category
items | Can be sideloaded in GET requests. <br> Must be included in the payload in POST/PATCH/PUT requests
amended_invoice | The invoice amended by the current one.
amending_invoices | Invoices that amend the current one (Read Only)

## Listing invoices

> Example request

```shell
curl "https://getquipu.com/invoices" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": [{
    "id": "2988939",
    "type": "invoices",
    "attributes": {
      "kind": "income",
      "number": "2016-2",
      "issue_date": "2016-02-29",
      "due_date": null,
      "paid_at": "2016-03-02",
      "payment_method": "bank_transfer",
      "payment_status": "paid",
      "total_amount": "2472.98",
      "total_amount_without_taxes": "2333.0",
      "vat_amount": "489.93",
      "retention_amount": "349.95"
      "issuing_name": "Paolo Conte",
      "issuing_tax_id": "43467890F",
      "issuing_address": "C/ Viladomat 39",
      "issuing_phone": "123456789",
      "issuing_town": "San Cucufate",
      "issuing_zip_code": "09876",
      "issuing_country_code": "es",
      "recipient_name": "QuipuApp S.L.",
      "recipient_tax_id": "B66086042",
      "recipient_address": "",
      "recipient_phone": "",
      "recipient_town": "",
      "recipient_zip_code": "",
      "recipient_country_code": "es",
      "tags": "",
      "last_sent_at": 1457364458
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
        "data":[]
      },
      "contact": {
        "data": {
          "type": "contacts",
          "id": "621291"
        }
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
    "type": "invoices",
    "attributes": {
      "kind": "income",
      "number": "2016-1",
      "issue_date": "2016-01-31",
      "due_date": null,
      "paid_at": "2016-02-03",
      "payment_method": "bank_transfer",
      "payment_status": "paid",
      "total_amount": "2472.98",
      "total_amount_without_taxes": "2333.0",
      "vat_amount": "489.93",
      "retention_amount": "349.95"
      "issuing_name": "Paolo Conte",
      "issuing_tax_id": "43467890F",
      "issuing_address": "C/ Viladomat 39",
      "issuing_phone": "123456789",
      "issuing_town": "San Cucufate",
      "issuing_zip_code": "09876",
      "issuing_country_code": "es",
      "recipient_name": "QuipuApp S.L.",
      "recipient_tax_id": "B66086042",
      "recipient_address": "",
      "recipient_phone": "",
      "recipient_town": "",
      "recipient_zip_code": "",
      "recipient_country_code": "es",
      "tags": "vip client, important",
      "last_sent_at": 1457364458
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
      "contact": {
        "data": {
          "type": "contacts",
          "id": "621291"
        }
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

`GET /invoices`

Paginated. 20 results per page

### Available filters

See [Invoices, tickets and paysheets => Available filters](#book-entries-available-filters)

### Sorting

See [Invoices, tickets and paysheets => Sorting](#book-entries-sorting)

### Side loading items

If you want to retrieve the complete information about the items associated with the invoices, you can pass `?include=items` in the url

Example:

`GET /invoices?include=items`

## Getting an invoice

> Example request

```shell
curl "https://getquipu.com/invoices/2988939" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": {
    "id": "2988939",
    "type": "invoices",
    "attributes": {
      "kind": "income",
      "number": "2016-2",
      "issue_date": "2016-02-29",
      "due_date": null,
      "paid_at": "2016-03-02",
      "payment_method": "bank_transfer",
      "payment_status": "paid",
      "total_amount": "2472.98",
      "total_amount_without_taxes": "2333.0",
      "vat_amount": "489.93",
      "retention_amount": "349.95"
      "issuing_name": "Paolo Conte",
      "issuing_tax_id": "43467890F",
      "issuing_address": "C/ Viladomat 39",
      "issuing_phone": "123456789",
      "issuing_town": "San Cucufate",
      "issuing_zip_code": "09876",
      "issuing_country_code": "es",
      "recipient_name": "QuipuApp S.L.",
      "recipient_tax_id": "B66086042",
      "recipient_address": "",
      "recipient_phone": "",
      "recipient_town": "",
      "recipient_zip_code": "",
      "recipient_country_code": "es",
      "tags": "",
      "last_sent_at": 1457364458
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
        "data":[]
      },
      "contact": {
        "data": {
          "type": "contacts",
          "id": "621291"
        }
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

> Example response with items included

```shell
{
  "data": {
    "id": "2988939",
    "type": "invoices",
    "attributes": {
      "kind": "income",
      "number": "2016-2",

      ... (some attrs omitted)

      "tags": ""
    },
    "relationships": {

      .... (some relationships omitted)

      "items": {
        "data": [{
          "id": "3298861",
          "type": "book_entry_items"
        }, {
          "id": "3298862",
          "type": "book_entry_items"
        }, {
          "id": "3298863",
          "type": "book_entry_items"
        }]
      }
    }
  },
  "included": [{
    "id": "3298861",
    "type": "book_entry_items",
    "attributes": {
      "concept": "T10 1 zona"
      "unitary_amount":"9.038"
      "quantity":"5.0"
      "vat_amount":"4.519"
      "retention_amount":"0.0"
      "total_amount":"49.709"
      "vat_percent":"10.0"
      "retention_percent":"0.0",
      "description": "item description"
    }
  }, {
    "id":"3298862"
    "type":"book_entry_items"
    "attributes": {
      "concept":"T10 2 zones"
      "unitary_amount":"17.82"
      "quantity":"19.0"
      "vat_amount":"33.858"
      "retention_amount":"0.0"
      "total_amount":"372.438"
      "vat_percent":"10.0"
      "retention_percent":"0.0",
      "description": "item description"
    }
  }, {
    "id":"3298863"
    "type":"book_entry_items"
    "attributes": {
      "concept":"T50/30 1 zona"
      "unitary_amount":"38.64"
      "quantity":"1.0"
      "vat_amount":"3.864"
      "retention_amount":"0.0"
      "total_amount":"42.504"
      "vat_percent":"10.0"
      "retention_percent":"0.0",
      "description": "item description"
    }
  }]
}
```

`GET /invoices/:invoice_id`

## Creating an invoice

> Example request

```shell
curl "https://getquipu.com/invoices" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "invoices",
          "attributes": {
            "kind": "income",
            "number": null,
            "issue_date": "2016-03-12",
            "due_date": "2016-05-12",
            "paid_at": null,
            "payment_method": "bank_transfer",
            "tags": "songo, timba"
          },
          "relationships": {
            "contact": {
              "data": {
                "id": 6347,
                "type": "contacts"
              }
            },
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

`POST /invoices`

### About items

The way we send info about the items associated to a book entry is not compliant
with the JSON API format. We do it this way because this resource (book entry items)
are an essential part of a book entry, and to save some api calls. In brief,
when sending data about the items we add the info in `relationships => items => data => attributes`,
but in the responses we will find the details about items in the `includes` object.

## Updating an invoice

> Example request

```shell
curl "https://getquipu.com/invoices/2988939" \
  -X PATCH \
  -H "Authorization: Bearer 818abe1ea4a1813999a47105892d50f3781320c588fb8cd2927885963e621228" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "invoices",
          "id": 2988939,
          "attributes": {
            "issue_date": "2016-02-21"
          }
        }
      }'
```

`(PUT|PATCH) /invoices/:invoice_id`

## Deleting an invoice

> Example request

```shell
curl "https://getquipu.com/invoices/2988939" \
  -X DELETE
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

`DELETE /invoices/:invoice_id`

## Refunds and amending invoices

An invoice can be totally or partially amended. The minimal amount of data needed to create an amending invoice is the relationship `amended_invoice`. With this data a complete refund of the original invoice will be created.

You can also partially amend an invoice setting the items of the amending invoice manually.

> Example request for a complete refund

```shell
curl "https://getquipu.com/invoices" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "invoices",
          "relationships": {
            "amended_invoice": {
              "data": {
                "id": 879495,
                "type": "invoices"
              }
            }
          }
        }
      }'
```

> Example of a partial refund

```shell
curl "https://getquipu.com/invoices" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "invoices",
          "relationships": {
            "amended_invoice": {
              "data": {
                "id": 879495,
                "type": "invoices"
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
