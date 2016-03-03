#<a name="invoices-section"></a> Invoices

Endpoints to manage invoices

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
      "analytic_category_options": {
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
      "analytic_category_options": {
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
curl "https://getquipu.com/invoices" \
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
      "analytic_category_options": {
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
      "retention_percent":"0.0"
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
      "retention_percent":"0.0"
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
      "retention_percent":"0.0"
    }
  }]
}
```

`GET /invoices/30822`

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
            "number": null,
            "issue_date": "12-03-2016",
            "due_date": "12-5-2016",
            "paid_at": null,
            "payment_method": "bank_transfer",
            "tags": "songo, timba"
          },
          "relationships": {
            "contact": {
              "data" {
                id: 6347,
                type: "contacts"
              }
            },
            "accounting_category": {
              "data": {
                id: 123,
                type: "accounting_categories"
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

`POST /invoices`
