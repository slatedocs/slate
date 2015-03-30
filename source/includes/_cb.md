# Citation Burst

## Create Campaign

<span class="label label-info">Account Method</span>

> Validation Failure

```json
{
  "error": true,
  "errors": {
    "business_name": "Please enter business name",
    "campaign_name": "Please enter campaign name",
    "contact_firstname": "Please enter contact first name",
    "contact_name": "Please enter contact last name",
    "business_category_id": "Please select business category",
    "business_categories": "Please enter at least one business category or tag",
    "campaign_country": "Please select country",
    "campaign_state": "Please select state",
    "campaign_city": "Please select location",
    "address1": "Please enter street address",
    "city": "Please enter name of the city / town",
    "region": "Please enter state / county / region",
    "postcode": "Please enter zip / postal code",
    "website_address": "Please enter the website address for the business",
    "contact_email": "Please enter correct email address",
    "contact_telephone": "Please check your entered telephone number. Only digits 0-9 and ( ) - + characters can be entered.",
    "brief_description": "Please enter short description",
    "full_description": "Please enter full description",
    "employees_number": "Please enter number of employees",
    "start_year": "Please enter starting year",
    "working_hours": "Your must provide Working Hours for at least one day in the week",
    "campaign_status": "Invalid campaign status",
    "client_id": "Client with  ID 0 not found or doesn't belong to this customer"
  }
}
{
  "error": false,
  "campaign-id": 280
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/cb/create`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>	
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
client_id |		
business_name | <span class="label label-required">Required</span>	
campaign_name | <span class="label label-required">Required</span>	
website_address	| <span class="label label-required">Required</span>	
campaign_country | <span class="label label-required">Required</span>	
campaign_city | <span class="label label-required">Required</span>	
business_category_id | <span class="label label-required">Required</span>	
business_categories	| <span class="label label-required">Required</span>	
address1 | <span class="label label-required">Required</span>	
address2 |		
city | <span class="label label-required">Required</span>	
region | <span class="label label-required">Required</span>	
postcode | <span class="label label-required">Required</span>	
contact_name | <span class="label label-required">Required</span>	
contact_firstname | <span class="label label-required">Required</span>	
contact_telephone | <span class="label label-required">Required</span>	
mobile_number |		
fax_number |		
brief_description | <span class="label label-required">Required</span>	
full_description | <span class="label label-required">Required</span>	
employees_number | <span class="label label-required">Required</span>	
start_year | <span class="label label-required">Required</span>	
service_name_1 |		
service_name_2 |		
service_name_3 |		
service_name_4 |		
service_name_5 |		
working_hours_apply_to_all | <span class="label label-required">Required</span> If this field has a value of 1 you only need to specify working hours for Monday and these values are then also used for the other days of the week.
working_hours_mon_start	| <span class="label label-required">Required</span>	
working_hours_mon_end | <span class="label label-required">Required</span>	
working_hours_tue_start	| <span class="label label-required">Required</span>	
working_hours_tue_end | <span class="label label-required">Required</span>	
working_hours_wed_start | <span class="label label-required">Required</span>	
working_hours_thu_end | <span class="label label-required">Required</span>	
working_hours_thu_start | <span class="label label-required">Required</span>	
working_hours_fri_end | <span class="label label-required">Required</span>	
working_hours_fri_start | <span class="label label-required">Required</span>	
working_hours_sat_end | <span class="label label-required">Required</span>	
working_hours_sat_start | <span class="label label-required">Required</span>	
working_hours_sun_end | <span class="label label-required">Required</span>	
working_hours_sun_start	| <span class="label label-required">Required</span>	
special_offer |		
special_offer_description |		
special_offer_expiry_date |		
payment_methods	| <p>String with '|' delimiter. E.g. cash|visa|mastercard|amex|cheque|atm|discover. Possible values - cash|visa|mastercard|amex|cheque|invoice|insurance|atm|travellers|financing|paypal|discover</p>
receive-email-alerts | 		
alert-email-addresses | 		
old_business_name |		
old_lookup_data	| For e.g, old postcode
is_public | Publish reports on a white label URL. Y or N.

## Upload Image

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
  "error": false,
  "result": "File companyLogo.jpg uploaded"
}
```

Upload an image to be used in CB campaign. <campaignId> is the id of existing campaign, <imageType> is one of: logo, image1, image2, image3. Request must contain standard file upload. There should be exactly one file uploaded with size not exceeding 2 MB. Acceptable formats are: jpg, png.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/cb/upload/[campaignId]/[imageType]`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>	
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

### Example URL

http://tools.brightlocal.com/seo-tools/api/v2/cb/upload/5533/logo

## Get Citations

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "error": false,
    "campaignId": 123,
    "citations": {
        "bing.com": {
            "citation_value": "Very High",
            "domain_authority": "99",
            "type": "General Directory",
            "phone_verification": "N",
            "client_verification": "Y",
            "notes": "Bingplaces will send you verification PIN at your registered postal address.",
            "no_update": "Y",
            "no_photos": "Y",
            "quick_listing": "N"
        }
    }
}
```

Retrieve list of citations associated with campaign.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/cb/citations`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id	| <span class="label label-required">Required</span>

## Confirm &amp; Pay

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
  "error": true,
  "errors": {
    "citations": "No citations supplied",
    "invalid_package_id": "Invalid package id"
  }
}
```

Confirm and pay (using credits) for a CB campaign.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/cb/confirm-and-pay`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>	
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign_id	| <span class="label label-required">Required</span>	
package_id | <span class="label label-required">Required</span> CB package id with number of ordered credits.
autoselect | String. Possible values 'N' or 'Y'. Default 'N'.
citations | <span class="label label-required">Required</span> JSON Array. If autoselect is 'Y' parameter becomes non-required. List of sites you require listings for.

## Get Campaigns

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "results":  [
            {
                "campaign_id": "4",
                "client_id": "7459",
                "campaign_name": "Test 1",
                "date_purchased": "2012-06-11 00:00:00",
                "date_completed": "2012-06-25 00:00:00",
                "email": "test@test1.com",
                "username": "",
                "password": "",
                "citations":  [
                    {
                        "name": "advertiserdirectory.co.uk",
                        "status": "Live",
                        "site_type": "Local Directory",
                        "citation_url": "advertiserdirectory.co.uk",
                        "domain_authority": "21/100",
                        "citation_value": "Low"
                    },
                    {
                        "name": "freeindex.co.uk",
                        "status": "Updated",
                        "site_type": "General Directory",
                        "citation_url": "freeindex.co.uk",
                        "domain_authority": "< 10/100",
                        "citation_value": "High"
                    }
                }
            }
        ]
    }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/cb/get-all`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>	
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
client-id |

## Get Campaign

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "response":  {
        "results":  {
            "campaign_id": "5",
            "purchase_date": "2012-07-12 16:14:27",
            "completion_date": "2012-07-26 16:14:27",
            "username": "",
            "email": "",
            "password": "",
            "stats":  [
                {
                    "start_date": "2012-07-12 16:14:27",
                    "citations_count": 50,
                    "scheduled": 50,
                    "submitted": 0,
                    "live": 0,
                    "updated": 0,
                    "replaced": 0
                }
            ],
            "citations":  [
                {
                "site": "ezlocal.com",
                "type": "General Directory",
                "domain_authority": "< 10/100",
                "status": "To Do",
                "link": "",
                "notes": "Site issues a temporary password for accessing account - check email account post submission."
                },
                {
                "site": "insiderpages.com",
                "type": "General Directory",
                "domain_authority": "< 10/100",
                "status": "To Do",
                "link": "",
                "notes": ""
                }
            ]
        }
    }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/cb/get`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>	
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id	| <span class="label label-required">Required</span>	
