#<a name="tickets-section"></a> Tickets

Endpoints to manage tickets (receipts).

The main difference between invoices and tickets is that the latest don't have an associated contact. You provide only the counterpart name: the `issuing_name` for expense tickets or the `recipient_name` for income tickets

## Attributes

Attr. name |  Constraints
---------- |  -----------
kind | REQUIRED <br> Accepted values: `income` or `expenses`
number | For income tickets we recommend leave it blank, and Quipu will assign it.<br>For income invoices must be unique within a fiscal year.
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

## Relationships

Relationship name |  Constraints
----------------- |  -----------
accounting_category |
accounting_subcategory |
numeration |
analytic_category_options |
items | Can be sideloaded in GET requests. <br> Must be included in the payload in POST/PATCH/PUT requests

\* This fields will be populated and updated each time an invoice is saved from the information of the Quipu account owner and the contact associatied with the book entry.

