# Clients

## Add Client <span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "status": "Client Added",
        "client-id": "14580"
    }
}
```

Adds a new client and associates it with your account.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/clients/add`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
company-name | <span class="label label-required">Required</span> 50 characters max.
contact-firstname |	20 characters max
contact-lastname | 20 characters max
contact-email | 50 characters max
contact-tel | 20 characters max
address-1 | 50 characters max
address-2 | 50 characters max
city | 20 characters max
region | 20 characters max
postcode | 20 characters max
country | <span class="label label-required">Required</span> ISO 3 country code.
company-url | <span class="label label-required">Required</span> 150 characters max
company-tel	| 20 characters max
mobile-number | 20 characters max
fax-number | 20 characters max
start-year | 4 digit year
brief-description | 200 characters max
full-description | 500 characters max
services | Newline (\n) separated list of services
business-category-id | <span class="label label-required">Required</span> See here for a full list of valid business codes.
unique-reference | An arbitrary unique reference you can use to identify a client. This may correspond to a unique value used within your system and can be useful when importing or exporting data. 50 characters max.

## Update Client <span class="label label-info">Account Method</span>

Update an existing client. Only supply values you want to update. The rest will be left unchanged.

> Success (200 OK)

```json
{
    "response":  {
        "status": "Client Updated"
    }
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/clients/update`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
client-id | <span class="label label-required">Required</span>	
company-name | 50 characters max
contact-firstname | 20 characters max
contact-lastname | 20 characters max
contact-email | 50 characters max
contact-tel	| 20 characters max
address-1 | 50 characters max
address-2 | 50 characters max
city | 20 characters max
region | 20 characters max
postcode | 20 characters max
country | ISO 3 country code
company-url | 150 characters max
company-tel | 20 characters max
mobile-number | 20 characters max
fax-number | 20 characters max
start-year | 4 digit year
brief-description | 200 characters max
full-description | 500 characters max
services | Newline (\n) separated list of services
business-category-id | See here for a full list of valid business codes
unique-reference | An arbitrary unique reference you can use to identify a client. This may correspond to a unique value used within your system and can be useful when importing or exporting data. 50 characters max.

## Delete Client <span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "status": "Client Deleted"
    }
}
```

Delete an existing client. If there are reports associated with this client then the association is removed but the reports are not deleted. Warning: This action cannot be undone.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/clients/delete`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
client-id | <span class="label label-required">Required</span>

## Get All Clients <span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "results":  [
            {
                "client_id": "13667",
                "company_name": "test 1",
                "country": "GBR",
                "country_name": "United Kingdom",
                "unique_reference": "TEST1",
                "date_added": "2012-11-30 16:33:06"
            },
            {
                "client_id": "13664",
                "company_name": "test 2",
                "country": "GBR",
                "country_name": "United Kingdom",
                "unique_reference": "TEST2",
                "date_added": "2012-11-30 16:17:14"
            },
            {
                "client_id": "13437",
                "company_name": "test 3",
                "country": "USA",
                "country_name": "United States",
                "unique_reference": "TEST3",
                "date_added": "2012-11-20 09:11:34"
            }
        ]
    }
}
```

Get a list of all clients associated with your account.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/clients/get-all`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

## Get Client <span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "result":  {
            "client_id": "13667",
            "customer_id": "35",
            "company_name": "test 1",
            "contact_firstname": "",
            "contact_lastname": "",
            "contact_email": "",
            "contact_tel": "",
            "address_1": "",
            "address_2": "",
            "city": "",
            "region": "",
            "postcode": "",
            "country": "GBR",
            "company_url": "www.test1.com",
            "company_tel": "",
            "mobile_number": "0123456789",
            "fax_number": "0123456789",
            "start_year": "2000",
            "brief_description": "short desc",
            "full_description": "longer desc",
            "services":  [
                "",
                "",
                "",
                "",
                ""
            ],
            "logo_url": "<hidden>",
            "photo1_url": "<hidden>",
            "photo2_url": "",
            "photo3_url": "",
            "number_of_employees": "16",
            "working_hours":  {
                "apply_to_all": "1",
                "mon_start": "6am",
                "mon_end": "9pm"
            },
            "business_category_id": "583",
            "unique_reference": "TEST1",
            "date_added": "2012-11-30 16:33:06"
        }
    }
}
```

Get extended details for a specific client.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/clients/get`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
client-id | <span class="label label-required">Required</span>

## Search Clients <span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "results":  [
            {
                "client_id": "13665",
                "company_name": "BrightLocal",
                "country": "GBR",
                "country_name": "United Kingdom",
                "unique_reference": "BRIGHTLOCAL1",
                "date_added": "2012-11-30 16:20:47"
            },
            {
                "client_id": "9892",
                "company_name": "BrightLocal",
                "country": "GBR",
                "country_name": "United Kingdom",
                "unique_reference": "BRIGHTLOCAL2",
                "date_added": "2012-05-11 15:39:24"
            },
            {
                "client_id": "13899",
                "company_name": "BrightLocal",
                "country": "USA",
                "country_name": "United States",
                "unique_reference": "BRIGHTLOCAL3",
                "date_added": "2013-01-30 23:55:47"
            }
        ]
    }
}
```

Search for clients matching a specified search string. The search uses a number of fields including company name, contact firstname, lastname and email address.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/clients/search`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
q | <span class="label label-required">Required</span>
