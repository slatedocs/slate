---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

<!-- includes:
  - errors -->

search: true
---

# App Companies

## Create App Company

```shell
curl -X POST http://localhost:300/app_companies -H "Content-Type:application/json" -H "Authentication:jsonwebtoken"
```

> Request body

```json
{
  "business_name" : "VTCS",
  "industry_type" : "Pools",
  "website_address" : "https://VTCS.com",
  "address1" : "Headquarters 1120 N Street Sacramento",
  "address2" : "P.O. Box 942873 Sacramento",
  "city" : "Sacramento",
  "state" : "CA",
  "zip" : "94273-0001",
  "res_annual_sales" : "$1M - $3M",
  "res_finance_volume" : "$3M - $5M",
  "res_avg_project_size" : "$15,000 - $25,000",
  "com_annual_sales" : "$5M - $10M",
  "com_finance_volume" : "$25M - $50M",
  "com_avg_project_size" : "$100,000 - $300,000",
  "who_using_for_financing" : "Wells Fargo",
  "company_number_of_employees" : "201-500 employees",
  "where_did_you_hear_about_us" : "Twitter",
  "app_company_users_attributes" :  [
    {
      "first_name" : "vikas",
      "primary_phone" : "(123) 456 - 7890",
      "email" : "vikas@gmail.com"
    }
  ]
}
```
```sh
  HTTP Response code ** 201 Created **
```
Creates a new app company.

### HTTP Request

`POST http://localhost:3000/app_companies`

### Validations

Parameter | Validation | Description
--------- | ---------- | -----------
app_company | Required | must be JSON object
business_name | Required | must be string
industry_type | Required | must be string
website_address | Required | must be string
address1 | Required | must be string
address2 | Required | must be string
city | Required | must be string
state | Required | must be string
zip | Required | must be string
res_annual_sales | Required | must be string
res_finance_volume | Required | must be string
res_avg_project_size | Required | must be string
com_annual_sales | Required | must be string
com_finance_volume | Required | must be string
com_avg_project_size | Required | must be string
who_using_for_financing | Required | must be string
company_number_of_employees | Required | must be string
where_did_you_hear_about_us | Required | must be string
first_name | Required | must be string
primary_phone | Required | must be string
email | Required | must be String

# App Company User

## Create App Company User

```shell
curl -X POST http://localhost:300/app_company_users -H "Content-Type:application/json" -H "Authentication:jsonwebtoken"
```

> Request body

```json
{
  "enrollment_date" : "7/1/18",
  "dealer_id" : "808438889test",
  "kind" : "Rep1",
  "active" : true,
  "hubspot_contact_vid" : 21851,
  "first_name" : "Jeremy",
  "last_name" : "Sanchez",
  "primary_phone" : "650-787-9595",
  "email" : "giri@headwaysales.com",
  "manager_first_name" : "Rick",
  "manager_last_name" : "Musto",
  "manager_email" : "rick@rfmcinc.com",
  "manager_send_emails" : true,
  "apply_url" : "https://www.acornfinance.com/apply?d=giri",
  "original_url" : "https://apply.headwaysales.com/borrower-info?dealerid=giri",
  "hubspot_contact_exists" : true,
  "email_sent" : true,
  "headway_dealer_id" : 14,
  "prs_assigned" : true,
  "source" : "Dealer Master List",
  "app_company_id" : 1858
}
```
```sh
  HTTP Response code ** 201 Created **
```
Creates a new app company user.

### HTTP Request

`POST http://localhost:3000/app_company_users`

