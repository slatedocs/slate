#<a name="paysheets-section"></a> Paysheets

Endpoints to manage paysheets

## Attributes

Attr. name |  Constraints
---------- |  -----------
kind | READ ONLY. Always `expenses`
number | We recommend leave it blank, and Quipu will assign it.<br>Must be unique within a fiscal year.
issue_date | REQUIRED <br> Format: `YYYY-mm-dd`
paid_at  | Format: `YYYY-mm-dd`
payment_method | Accepted valued: `cash`, `bank_transfer`, `bank_card`, `direct_debit`, `paypal`, `check`, `factoring`
payment_status | READ ONLY
net_pay |
gross_pay | READ ONLY
employee_ss_amount |
employee_retention |
company_ss_amount|
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
tags | Format: a list of strings separated by comma

\* This fields will be populated and updated each time a paysheet is saved from the information of the Quipu account owner and the contact associatied with the paysheet.

## Relationships

Relationship name |  Constraints
----------------- |  -----------
contact | REQUIRED
accounting_category | READ ONLY
accounting_subcategory |
analytic_categories | Can not be a root analytic category

## Listing paysheets

> Example request

```shell
curl "https://getquipu.com/paysheets" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": [{
    "id": "3007641",
    "type": "paysheets",
    "attributes": {
      "kind": "expenses",
      "number": "N-18",
      "issue_date": "2016-01-30",
      "paid_at": "2016-02-05",
      "payment_method": "bank_transfer",
      "payment_status": "paid",
      "net_pay": "1185.76",
      "gross_pay": "1387.5",
      "employee_ss_amount": "88.8",
      "employee_retention": "112.94",
      "company_ss_amount": "450.25",
      "issuing_name": "QuipuApp S.L.",
      "issuing_tax_id": "B66086042",
      "issuing_address": "C/ Viladomat 39",
      "issuing_phone": "123456789",
      "issuing_town": "San Cucufate",
      "issuing_zip_code": "09876",
      "issuing_country_code": "es",
      "recipient_name": "Kunta Kinte",
      "recipient_tax_id": "43429713D",
      "recipient_address": "C/ Gambia, 72, entlo-4a",
      "recipient_phone": "999999999",
      "recipient_town": "Hospitalet de Llobregat",
      "recipient_zip_code": "08199",
      "recipient_country_code": "es",
      "tags": ""
    },
    "relationships": {
      "accounting_category": {
        "data": {
          "type": "accounting_categories",
          "id": "28"
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
      "contact": {
        "data": {
          "type": "contacts",
          "id": "621291"
        }
      }
    }
  }, {
    "id": "3007642",
    "type": "paysheets",
    "attributes": {
      "kind": "expenses",
      "number": "N-19",
      "issue_date": "2016-01-30",
      "paid_at": "2016-02-05",
      "payment_method": "bank_transfer",
      "payment_status": "paid",
      "net_pay": "1185.76",
      "gross_pay": "1387.5",
      "employee_ss_amount": "88.8",
      "employee_retention": "112.94",
      "company_ss_amount": "450.25",
      "issuing_name": "QuipuApp S.L.",
      "issuing_tax_id": "B66086042",
      "issuing_address": "C/ Viladomat 39",
      "issuing_phone": "123456789",
      "issuing_town": "San Cucufate",
      "issuing_zip_code": "09876",
      "issuing_country_code": "es",
      "recipient_name": "Kunta Kinte",
      "recipient_tax_id": "43429713D",
      "recipient_address": "C/ Gambia, 72, entlo-4a",
      "recipient_phone": "999999999",
      "recipient_town": "Hospitalet de Llobregat",
      "recipient_zip_code": "08199",
      "recipient_country_code": "es",
      "tags": ""
    },
    "relationships": {
      "accounting_category": {
        "data": {
          "type": "accounting_categories",
          "id": "28"
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

`GET /paysheets`

## Getting a paysheet

> Example request

```shell
curl "https://getquipu.com/paysheets/3007642" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": {
    "id": "3007641",
    "type": "paysheets",
    "attributes": {
      "kind": "expenses",
      "number": "N-18",
      "issue_date": "2016-01-30",
      "paid_at": "2016-02-05",
      "payment_method": "bank_transfer",
      "payment_status": "paid",
      "net_pay": "1185.76",
      "gross_pay": "1387.5",
      "employee_ss_amount": "88.8",
      "employee_retention": "112.94",
      "company_ss_amount": "450.25",
      "issuing_name": "QuipuApp S.L.",
      "issuing_tax_id": "B66086042",
      "issuing_address": "C/ Viladomat 39",
      "issuing_phone": "123456789",
      "issuing_town": "San Cucufate",
      "issuing_zip_code": "09876",
      "issuing_country_code": "es",
      "recipient_name": "Kunta Kinte",
      "recipient_tax_id": "43429713D",
      "recipient_address": "C/ Gambia, 72, entlo-4a",
      "recipient_phone": "999999999",
      "recipient_town": "Hospitalet de Llobregat",
      "recipient_zip_code": "08199",
      "recipient_country_code": "es",
      "tags": ""
    },
    "relationships": {
      "accounting_category": {
        "data": {
          "type": "accounting_categories",
          "id": "28"
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
      "contact": {
        "data": {
          "type": "contacts",
          "id": "621291"
        }
      }
    }
  }
}
```

`GET /paysheets/:paysheet_id`

## Creating a paysheet

> Example request

```shell
curl "https://getquipu.com/paysheets" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "paysheets",
          "attributes": {
            "issue_date": "2016-03-12",
            "net_pay": "1185.76",
            "employee_ss_amount": "88.8",
            "employee_retention": "112.94",
            "company_ss_amount": "450.25",
            "tags": "songo, timba"
          },
          "relationships": {
            "contact": {
              "data" {
                "id": 6347,
                "type": "contacts"
              }
            },
            "analytic_categories": {
              ...
            },
            "accounting_subcategories": {
              ...
            },
            "numeration": {
              ...
            }
          }
        }
      }'
```

`POST /paysheets`

## Updating a paysheet

> Example request

```shell
curl "https://getquipu.com/paysheets/462380" \
  -X PATCH
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "id": 462380,
          "type": "paysheets",
          "attributes": {
            "net_pay": "1185.76",
            "employee_ss_amount": "88.8",
            "employee_retention": "112.94",
            "company_ss_amount": "450.25",
            "tags": ""
          },
        }
      }'

```

`(PATCH/PUT) /paysheets/:paysheet_id`

## Deleting a paysheet

> Example request

```shell
curl "https://getquipu.com/paysheets/2988939" \
  -X DELETE
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

`DELETE /paysheets/:paysheet_id`
