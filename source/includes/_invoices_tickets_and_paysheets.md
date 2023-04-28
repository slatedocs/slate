#<a name="invoices-tickets-and-paysheets-section"></a> Invoices, tickets and paysheets

Only one available action. Get a list with different type of resources

## Listing invoices, tickets and paysheets alltoghether

> Example request

```shell
curl "https://getquipu.com/book_entries" \
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
      "validation_status": "pending",
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
    "id": "2698918",
    "type": "tickets",
    "attributes": {
      "kind": "expenses",
      "number": "8",
      "issue_date": "2015-07-18",
      "due_date": null,
      "paid_at": "2015-10-04",
      "payment_method": "",
      "payment_status": "paid",
      "validation_status": "verified",
      "total_amount": "5.2",
      "issuing_name": "Bar Paco",
      "issuing_tax_id": null,
      "issuing_address": null,
      "issuing_phone": null,
      "issuing_town": null,
      "issuing_zip_code": null,
      "issuing_country_code": null,
      "recipient_name": "Paolo Conte",
      "recipient_tax_id": "43467890F",
      "recipient_address": "C/ Viladomat 39",
      "recipient_phone": "123456789",
      "recipient_town": "San Cucufate",
      "recipient_zip_code": "09876",
      "recipient_country_code": "es",
      "tags": ""
    },
    "relationships": {
      "accounting_category": {
        "data": {
          "type": "accounting_categories",
          "id": "53"
        }
      },
      "accounting_subcategory": {
        "data": null
      },
      "numeration": {
        "data": null
      },
      "analytic_categories": {
        "data": []
      },
      "items": {
        "data": [{
          "type": "book_entry_items",
          "id": "2957853"
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

`GET /book_entries`

###<a name="book-entries-available-filters"></a> Available filters

Filter name | Description | Valid values | Example
------------| ------------| ------------ | -------
type | Filters resources by type | `invoices`, `tickets` or `paysheets` | `/book_entries?filter[type]=invoices`
kind | Filter resources by kind | `expenses` or `income` | `/book_entries?filter[kind]=expenses`
q | Search | Any | `/book_entries?filter[q]=android development`
period | Filter resources issued in the specified period | year-[month number,Q1,Q2,Q3,Q4] | `/book_entries?filter[period]=2015-Q1` =>  First quarter of 2015 <br> `/book_entries?filter[period]=2016-2` => February 2016 <br> `/book_entries?filter[period]=2015` => 2015
payment_status | Filter resources by payment status | `paid`, `unpaid`, `due` or `pending` | `/book_entries?filter[payment_status]=due`
contact_id | Filter by contact | The contact ID | `/book_entries?filter[contact_id]=1234`
field_query | Filter by contact, concept, number, label or user_name | name of the field and the search term | `/book_entries?filter[field_query][field]=label&filter[field_query][term]=tag_name`
###<a name="book-entries-sorting"></a> Sorting

Criteria name | Description | Example
------------- | ----------- | -------
number | Sorts resources by number | `/book_entries?sort=-number`
issue_date | Sort resources by issue date | `/book_entries?sort=-issue_date`
counterpart_name | Sorts resources by the counterpart name (issuing_name or recipient_name depending on the kind) | `/book_entries?sort=counterpart_name`
total_amount | Sort resources by the total amount field | `/book_entries?sort=-total_amount`
total_amount_without_taxes | Sort resources by the total amount before apply any tax | `/book_entries?sort=total_amount_without_taxes`
