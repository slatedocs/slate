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

`GET /book_entries?include=items`
