---
title: GoRaise RESTful API Reference

language_tabs:
  - shell

toc_footers:
  - <a href='https://www.goraise.co.uk/contact'>Sign Up for a Developer API Key</a>
  - <a href='https://github.com/garygarside/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the GoRaise API! You can use our API to get information on various retailers, rates and users in our database.

We have language bindings in Shell, with PHP &amp; Javascript coming soon! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](https://github.com/garygarside/slate). Feel free to edit it and use it as a base for your own API's documentation.

# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "ApiKey: your_api_key"
```

> Make sure to replace `your_api_key` with your API key.

GoRaise uses API keys to allow access to the API. You can request a new GoRaise API key by contacting [our API team](https://www.goraise.co.uk/contact).

GoRaise expects for the API key to be included in all API requests to the server in a header that looks like the following:

`ApiKey: your_api_key`

<aside class="notice">
You must replace <code>your_api_key</code> with your personal API key.
</aside>

# Retailers

## Get All Retailers

```shell
curl "https://rest.goraise.co.uk/retailers"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "total": 2703,
  "per_page": 100,
  "current_page": 1,
  "last_page": 28,
  "next_page_url": "https://rest.goraise.co.uk/retailers?page=2",
  "prev_page_url": null,
  "from": 1,
  "to": 100,
  "data": [
    {
      "id": 84,
      "name": "Guernsey Travel",
      "description": null,
      "logo": null,
      "terms": null,
      "website_url": "www.guernseytravel.com",
      "donation": null,
      "shopping_url": "https://www.goraise.co.uk/go/guernseytravel?user_id="
    },
    {
      "id": 85,
      "name": "Tickettree.com",
      "description": null,
      "logo": null,
      "terms": null,
      "website_url": "www.tickettree.com",
      "donation": null,
      "shopping_url": "https://www.goraise.co.uk/go/tickettreecom?user_id="
    }
  ]
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <total>2703</total>
    <per_page>100</per_page>
    <current_page>1</current_page>
    <last_page>28</last_page>
    <next_page_url>https://rest.goraise.co.uk/retailers?format=xml&amp;page=2</next_page_url>
    <prev_page_url/>
    <from>1</from>
    <to>100</to>
    <data>
        <datum>
            <id>102</id>
            <name>Yellow Moon</name>
            <description>The Yellow Moon website offers hundreds of great toys, educational games, craft and seasonal products for your family to create, learn and have fun. There's FREE UK mainland delivery on all orders over £50.</description>
            <logo>/images/retailers/logos/yellowmoon.png</logo>
            <terms>Donations may only apply to the sale price and not include VAT, delivery and other such costs. Please do not use voucher codes from other websites as this may affect your donation.</terms>
            <website_url>www.yellowmoon.org.uk</website_url>
            <donation>1%</donation>
            <shopping_url>https://www.goraise.co.uk/go/yellowmoon?user_id=</shopping_url>
        </datum>
        <datum>
            <id>109</id>
            <name>Zavvi</name>
            <description>Enjoy a huge selection of entertainment including market leading prices on the latest release Games, accessories and console bundles. Not to mention a huge selection of music, film and more.</description>
            <logo>/images/retailers/logos/zavvi.png</logo>
            <terms>Donations may only apply to the sale price and not include VAT, delivery and other such costs. Please do not use voucher codes from other websites as this may affect your donation.</terms>
            <website_url>www.zavvi.com</website_url>
            <donation>3%</donation>
            <shopping_url>https://www.goraise.co.uk/go/zavvi?user_id=</shopping_url>
        </datum>
       </datum>
    </data>
</xml>
```

This endpoint retrieves all retailers.

### HTTP Request

`GET https://rest.goraise.co.uk/retailers`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
per_page | 100 | How many results to pull back in one go. Can range from 10-250
page | 1 | The paginated page of results you wish to view, as limited by the per_page variable
order_by | id | How the results should be ordered

## Get a Specific Retailer

```shell
curl "https://rest.goraise.co.uk/retailers/102"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "id": 102,
  "name": "Yellow Moon",
  "description": "The Yellow Moon website offers hundreds of great toys, educational games, craft and seasonal products for your family to create, learn and have fun. There's FREE UK mainland delivery on all orders over £50.",
  "logo": "/images/retailers/logos/yellowmoon.png",
  "terms": "Donations may only apply to the sale price and not include VAT, delivery and other such costs. Please do not use voucher codes from other websites as this may affect your donation.",
  "website_url": "www.yellowmoon.org.uk",
  "donation": "1%",
  "shopping_url": "https://www.goraise.co.uk/go/yellowmoon?user_id="
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <id>102</id>
    <name>Yellow Moon</name>
    <description>The Yellow Moon website offers hundreds of great toys, educational games, craft and seasonal products for your family to create, learn and have fun. There's FREE UK mainland delivery on all orders over £50.</description>
    <logo>/images/retailers/logos/yellowmoon.png</logo>
    <terms>Donations may only apply to the sale price and not include VAT, delivery and other such costs. Please do not use voucher codes from other websites as this may affect your donation.</terms>
    <website_url>www.yellowmoon.org.uk</website_url>
    <donation>1%</donation>
    <shopping_url>https://www.goraise.co.uk/go/yellowmoon?user_id=</shopping_url>
</xml>
```

This endpoint retrieves a specific retailer.

<aside class="warning">Make sure your retailer ID reference is an integer!</aside>

### HTTP Request

`GET https://rest.goraise.co.uk/retailers/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the retailer to retrieve


# Users

## Get All Users

```shell
curl "https://rest.goraise.co.uk/users"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "total": 1889,
  "per_page": 100,
  "current_page": 1,
  "last_page": 19,
  "next_page_url": "https://rest.goraise.co.uk/users?page=2",
  "prev_page_url": null,
  "from": 1,
  "to": 100,
  "data": [
    {
      "id": 1,
      "first_name": "Gary",
      "last_name": "Garside",
      "email": "gary@goraise.co.uk",
      "address1": null,
      "postcode": null
    }
  ]
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <total>1889</total>
    <per_page>100</per_page>
    <current_page>1</current_page>
    <last_page>19</last_page>
    <next_page_url>https://rest.goraise.co.uk/users?format=xml&amp;page=2</next_page_url>
    <prev_page_url/>
    <from>1</from>
    <to>100</to>
    <data>
        <datum>
            <id>8</id>
            <first_name>Gary</first_name>
            <last_name>Garside</last_name>
            <email>gary@goraise.co.uk</email>
            <address1/>
            <postcode/>
        </datum>
      </datum>
    </data>
</xml>
```

This endpoint retrieves all users.

### HTTP Request

`GET https://rest.goraise.co.uk/users`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
per_page | 100 | How many results to pull back in one go. Can range from 10-250
page | 1 | The paginated page of results you wish to view, as limited by the per_page variable
order_by | id | How the results should be ordered

## Get a Specific User

```shell
curl "https://rest.goraise.co.uk/users/8"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "id": 8,
  "first_name": "Gary",
  "last_name": "Garside",
  "email": "gary@goraise.co.uk",
  "address1": null,
  "postcode": null
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <id>8</id>
    <first_name>Gary</first_name>
    <last_name>Garside</last_name>
    <email>gary@goraise.co.uk</email>
    <address1/>
    <postcode/>
</xml>
```

This endpoint retrieves a specific user.

### HTTP Request

`GET https://rest.goraise.co.uk/users/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The unique ID of the user

## Create a New User

```shell
curl "https://rest.goraise.co.uk/users"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X POST
  -d "email=gary@goraise.co.uk&password=abcxyz&first_name=Gary&last_name=Garside"
```

> The above command returns JSON structured like this:

```json
{
  "email": "gary@goraise.co.uk",
  "id": 99
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <email>gary@goraise.co.uk</email>
    <id>99</id>
</xml>
```

This endpoint creates and returns a new user.

<aside class="warning">The only required fields for creating a new user are their email address and password.</aside>

### HTTP Request

`POST https://rest.goraise.co.uk/users`

### Required Parameters

Parameter | Description
--------- | -----------
EMAIL | The unique email address of the new user
PASSWORD | The password of the user. Must be 6 characters or more

### Additional Optional Parameters

Parameter | Description
--------- | -----------
FIRST_NAME | The user's first name
LAST_NAME | The user's surname
ADDRESS1 | The first line of the user's address
POSTCODE | The user's postal code

## Update a User

```shell
curl "https://rest.goraise.co.uk/users/99"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X PUT
  -d "first_name=Gary&last_name=Garside"
```

> The above command returns JSON structured like this:

```json
{
  "id": 99,
  "first_name": "Gary",
  "last_name": "Garside",
  "email": "gary@goraise.co.uk",
  "address1": null,
  "postcode": null
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <id>99</id>
    <first_name>Gary</first_name>
    <last_name>Garside</last_name>
    <email>gary@goraise.co.uk</email>
    <address1/>
    <postcode/>
</xml>
```

This endpoint creates and returns a new user.

### HTTP Request

`PUT https://rest.goraise.co.uk/users/<ID>`

### Required Parameters

Parameter | Description
--------- | -----------
ID | The unique ID of the user

### Updatable Attributes

Parameter | Description
--------- | -----------
EMAIL | The user's email address. Must be a valid email
PASSWORD | Must be 6 characters long
FIRST_NAME | The user's first name
LAST_NAME | The user's surname
ADDRESS1 | The first line of the user's address
POSTCODE | The user's postal code


# Causes

## Get All Causes

```shell
curl "https://rest.goraise.co.uk/causes"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "total": 427,
  "per_page": 100,
  "current_page": 1,
  "last_page": 5,
  "next_page_url": "https://rest.goraise.co.uk/causes?page=2",
  "prev_page_url": null,
  "from": 1,
  "to": 100,
  "data": [
    {
      "id": 51,
      "name": "Gary's Soccer Club",
      "description": "<p><b>Help us raise funds for the Gary's Soccer club, a Sunday league side trying to make enough funds to build the new club house</b></p>",
      "address1": "",
      "postcode": "",
      "admins": [
        {
          "id": 38,
          "first_name": "Gary",
          "last_name": "Garside",
          "email": "gary.garside@goraise.co.uk",
          "address1": null,
          "postcode": null
        }
      ],
      "supporters": [
        {
          "id": 37,
          "first_name": "Gary",
          "last_name": "Garside",
          "email": "gary@goraise.co.uk",
          "address1": null,
          "postcode": null
        }
      ]
    }
  ]
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <total>427</total>
    <per_page>100</per_page>
    <current_page>1</current_page>
    <last_page>5</last_page>
    <next_page_url>https://rest.goraise.co.uk/causes?format=xml&amp;page=2</next_page_url>
    <prev_page_url/>
    <from>1</from>
    <to>100</to>
    <data>
        <datum>
            <id>51</id>
            <name>Gary's Soccer Club</name>
            <description>&lt;p&gt;&lt;b&gt;Help us raise funds for the Gary's Soccer club, a Sunday league side trying to make enough funds to build the new club house&lt;/b&gt;&lt;/p&gt;</description>
            <address1/>
            <postcode/>
            <admins/>
            <supporters>
                <supporter>
                    <id>37</id>
                    <first_name>Gary</first_name>
                    <last_name>Garside</last_name>
                    <email>gary@goraise.co.uk</email>
                    <address1/>
                    <postcode/>
                </supporter>
                <supporter>
                    <id>38</id>
                    <first_name>Gary</first_name>
                    <last_name>Garside</last_name>
                    <email>gary.garside@goraise.co.uk</email>
                    <address1/>
                    <postcode/>
                </supporter>
            </supporters>
        </datum>
    </data>
</xml>
```

This endpoint retrieves all causes.

### HTTP Request

`GET https://rest.goraise.co.uk/causes`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
per_page | 100 | How many results to pull back in one go. Can range from 10-250
page | 1 | The paginated page of results you wish to view, as limited by the per_page variable
order_by | id | How the results should be ordered

## Get a Specific Cause

```shell
curl "https://rest.goraise.co.uk/causes/51"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "id": 51,
  "name": "Gary's Soccer Club",
  "description": "<p><b>Help us raise funds for the Gary's Soccer club, a Sunday league side trying to make enough funds to build the new club house</b></p>",
  "address1": "",
  "postcode": "",
  "admins": [
    {
      "id": 38,
      "first_name": "Gary",
      "last_name": "Garside",
      "email": "gary.garside@goraise.co.uk",
      "address1": null,
      "postcode": null
    }
  ],
  "supporters": [
    {
      "id": 37,
      "first_name": "Gary",
      "last_name": "Garside",
      "email": "gary@goraise.co.uk",
      "address1": null,
      "postcode": null
    }
  ]
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <id>51</id>
    <name>Gary's Soccer Club</name>
    <description>&lt;p&gt;&lt;b&gt;Help us raise funds for the Gary's Soccer club, a Sunday league side trying to make enough funds to build the new club house&lt;/b&gt;&lt;/p&gt;</description>
    <address1/>
    <postcode/>
    <admins/>
    <supporters>
        <supporter>
            <id>37</id>
            <first_name>Gary</first_name>
            <last_name>Garside</last_name>
            <email>gary@goraise.co.uk</email>
            <address1/>
            <postcode/>
        </supporter>
        <supporter>
            <id>38</id>
            <first_name>Gary</first_name>
            <last_name>Garside</last_name>
            <email>gary.garside@goraise.co.uk</email>
            <address1/>
            <postcode/>
        </supporter>
    </supporters>
</xml>
```

This endpoint retrieves a specific cause.

### HTTP Request

`GET https://rest.goraise.co.uk/causes/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The unique ID of the cause

## Create a New Cause

```shell
curl "https://rest.goraise.co.uk/causes"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X POST
  -d "name=NSPCC&description=Some information about the NSPCC&charity_number=123457680"
```

> The above command returns JSON structured like this:

```json
{
  "name": "NSPCC",
  "description": "Some information about the NSPCC",
  "charity_number": "123457680",
  "id": 75919
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <name>NSPCC</name>
    <description>Some information about the NSPCC</description>
    <charity_number>123457680</charity_number>
    <id>75919</id>
</xml>
```

This endpoint creates and returns a new cause.

<aside class="warning">The only required fields for creating a new cause are their name.</aside>

### HTTP Request

`POST https://rest.goraise.co.uk/causes`

### Required Parameters

Parameter | Description
--------- | -----------
NAME | The name of the good cause

### Additional Attributes

Parameter | Description
--------- | -----------
DESCRIPTION | Detailed description about the cause
ADDRESS1 | The first line of the cause's address
POSTCODE | The cause's postal code
CHARITY_NUMBER | The registered charity number of the cause, if applicable

## Update a Cause

```shell
curl "https://rest.goraise.co.uk/causes/75919"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X PUT
  -d "name=NSPCB&description=Updating the NSPCB description"
```

> The above command returns JSON structured like this:

```json
{
  "id": 75919,
  "name": "NSPCB",
  "description": "Updating the NSPCB description",
  "charity_number": "123457680",
  "address1": null,
  "postcode": null
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <id>75919</id>
    <name>NSPCB</name>
    <description>Updating the NSPCB description</description>
    <charity_number>123457680</charity_number>
    <address1/>
    <postcode/>
</xml>
```

This endpoint updates and returns a cause with a specific ID.

### HTTP Request

`PUT https://rest.goraise.co.uk/causes/<ID>`

### Required Parameters

Parameter | Description
--------- | -----------
ID | The unique ID of the cause

### Updatable Attributes

Parameter | Description
--------- | -----------
NAME | The name of the cause
DESCRIPTION | Detailed description about the cause
ADDRESS1 | The first line of the cause's address
POSTCODE | The cause's postal code
CHARITY_NUMBER | The registered charity number of the cause, if applicable


# Companies

## Get All Companies

```shell
curl "https://rest.goraise.co.uk/companies"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "total": 427,
  "per_page": 100,
  "current_page": 1,
  "last_page": 5,
  "next_page_url": "https://rest.goraise.co.uk/companies?page=2",
  "prev_page_url": null,
  "from": 1,
  "to": 100,
  "data": [
    {
      "id": 1,
      "name": "GoRaise",
      "description": "Raise money for a good cause every time you shop online",
      "address1": "",
      "postcode": "",
      "admins": [
        {
          "id": 38,
          "first_name": "Gary",
          "last_name": "Garside",
          "email": "gary.garside@goraise.co.uk",
          "address1": null,
          "postcode": null
        }
      ],
      "supporters": [
        {
          "id": 37,
          "first_name": "Gary",
          "last_name": "Garside",
          "email": "gary@goraise.co.uk",
          "address1": null,
          "postcode": null
        }
      ]
    }
  ]
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <total>427</total>
    <per_page>100</per_page>
    <current_page>1</current_page>
    <last_page>5</last_page>
    <next_page_url>https://rest.goraise.co.uk/companies?format=xml&amp;page=2</next_page_url>
    <prev_page_url/>
    <from>1</from>
    <to>100</to>
    <data>
        <datum>
            <id>1</id>
            <name>GoRaise</name>
            <description>Raise money for a good cause every time you shop online</description>
            <address1/>
            <postcode/>
            <admins/>
            <supporters>
                <supporter>
                    <id>37</id>
                    <first_name>Gary</first_name>
                    <last_name>Garside</last_name>
                    <email>gary@goraise.co.uk</email>
                    <address1/>
                    <postcode/>
                </supporter>
                <supporter>
                    <id>38</id>
                    <first_name>Gary</first_name>
                    <last_name>Garside</last_name>
                    <email>gary.garside@goraise.co.uk</email>
                    <address1/>
                    <postcode/>
                </supporter>
            </supporters>
        </datum>
    </data>
</xml>
```

This endpoint retrieves all companies.

### HTTP Request

`GET https://rest.goraise.co.uk/companies`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
per_page | 100 | How many results to pull back in one go. Can range from 10-250
page | 1 | The paginated page of results you wish to view, as limited by the per_page variable
order_by | id | How the results should be ordered

## Get a Specific Company

```shell
curl "https://rest.goraise.co.uk/companies/1"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "GoRaise",
  "description": "Raise money for a good cause every time you shop online",
  "address1": "",
  "postcode": "",
  "admins": [
    {
      "id": 38,
      "first_name": "Gary",
      "last_name": "Garside",
      "email": "gary.garside@goraise.co.uk",
      "address1": null,
      "postcode": null
    }
  ],
  "supporters": [
    {
      "id": 37,
      "first_name": "Gary",
      "last_name": "Garside",
      "email": "gary@goraise.co.uk",
      "address1": null,
      "postcode": null
    }
  ]
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <id>1</id>
    <name>GoRaise</name>
    <description>Raise money for a good cause every time you shop online</description>
    <address1/>
    <postcode/>
    <admins/>
    <supporters>
        <supporter>
            <id>37</id>
            <first_name>Gary</first_name>
            <last_name>Garside</last_name>
            <email>gary@goraise.co.uk</email>
            <address1/>
            <postcode/>
        </supporter>
        <supporter>
            <id>38</id>
            <first_name>Gary</first_name>
            <last_name>Garside</last_name>
            <email>gary.garside@goraise.co.uk</email>
            <address1/>
            <postcode/>
        </supporter>
    </supporters>
</xml>
```

This endpoint retrieves a specific company.

### HTTP Request

`GET https://rest.goraise.co.uk/companies/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The unique ID of the company

## Create a New Company

```shell
curl "https://rest.goraise.co.uk/companies"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X POST
  -d "name=NSPCC&description=Some information about the NSPCC&charity_number=123457680"
```

> The above command returns JSON structured like this:

```json
{
  "name": "NSPCC",
  "description": "Some information about the NSPCC",
  "charity_number": "123457680",
  "id": 75919
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <name>NSPCC</name>
    <description>Some information about the NSPCC</description>
    <charity_number>123457680</charity_number>
    <id>75919</id>
</xml>
```

This endpoint creates and returns a new company.

<aside class="warning">The only required fields for creating a new company are their name.</aside>

### HTTP Request

`POST https://rest.goraise.co.uk/companies`

### Required Parameters

Parameter | Description
--------- | -----------
NAME | The name of the good company

### Additional Attributes

Parameter | Description
--------- | -----------
DESCRIPTION | Detailed description about the company
ADDRESS1 | The first line of the company's address
POSTCODE | The company's postal code
CHARITY_NUMBER | The registered charity number of the company, if applicable

## Update a Company

```shell
curl "https://rest.goraise.co.uk/companies/1"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X PUT
  -d "name=GoRaise&description=Updating the GoRaise description"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "GoRaise",
  "description": "Updating the GoRaise description",
  "charity_number": "123457680",
  "address1": null,
  "postcode": null
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <id>1</id>
    <name>GoRaise</name>
    <description>Updating the GoRaise description</description>
    <charity_number>123457680</charity_number>
    <address1/>
    <postcode/>
</xml>
```

This endpoint updates and returns a company with a specific ID.

### HTTP Request

`PUT https://rest.goraise.co.uk/companies/<ID>`

### Required Parameters

Parameter | Description
--------- | -----------
ID | The unique ID of the company

### Updatable Attributes

Parameter | Description
--------- | -----------
NAME | The name of the company
DESCRIPTION | Detailed description about the company
ADDRESS1 | The first line of the company's address
POSTCODE | The company's postal code
CHARITY_NUMBER | The registered charity number of the company, if applicable


# Challengers

## Get All Challengers

```shell
curl "https://rest.goraise.co.uk/challengers"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "total": 427,
  "per_page": 100,
  "current_page": 1,
  "last_page": 5,
  "next_page_url": "https://rest.goraise.co.uk/challengers?page=2",
  "prev_page_url": null,
  "from": 1,
  "to": 100,
  "data": [
    {
      "id": 1,
      "name": "Gary's Everest Climb",
      "description": "Raising money for NSPCC by climbing Mt. Everest!",
      "address1": "",
      "postcode": "",
      "admins": [
        {
          "id": 38,
          "first_name": "Gary",
          "last_name": "Garside",
          "email": "gary.garside@goraise.co.uk",
          "address1": null,
          "postcode": null
        }
      ],
      "supporters": [
        {
          "id": 37,
          "first_name": "Gary",
          "last_name": "Garside",
          "email": "gary@goraise.co.uk",
          "address1": null,
          "postcode": null
        }
      ]
    }
  ]
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <total>427</total>
    <per_page>100</per_page>
    <current_page>1</current_page>
    <last_page>5</last_page>
    <next_page_url>https://rest.goraise.co.uk/challengers?format=xml&amp;page=2</next_page_url>
    <prev_page_url/>
    <from>1</from>
    <to>100</to>
    <data>
        <datum>
            <id>1</id>
            <name>Gary's Everest Climb</name>
            <description>Raising money for NSPCC by climbing Mt. Everest!</description>
            <address1/>
            <postcode/>
            <admins/>
            <supporters>
                <supporter>
                    <id>37</id>
                    <first_name>Gary</first_name>
                    <last_name>Garside</last_name>
                    <email>gary@goraise.co.uk</email>
                    <address1/>
                    <postcode/>
                </supporter>
                <supporter>
                    <id>38</id>
                    <first_name>Gary</first_name>
                    <last_name>Garside</last_name>
                    <email>gary.garside@goraise.co.uk</email>
                    <address1/>
                    <postcode/>
                </supporter>
            </supporters>
        </datum>
    </data>
</xml>
```

This endpoint retrieves all challengers.

### HTTP Request

`GET https://rest.goraise.co.uk/challengers`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
per_page | 100 | How many results to pull back in one go. Can range from 10-250
page | 1 | The paginated page of results you wish to view, as limited by the per_page variable
order_by | id | How the results should be ordered

## Get a Specific Challenger

```shell
curl "https://rest.goraise.co.uk/challengers/1"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "Gary's Everest Climb",
  "description": "Raising money for NSPCC by climbing Mt. Everest!",
  "address1": "",
  "postcode": "",
  "admins": [
    {
      "id": 38,
      "first_name": "Gary",
      "last_name": "Garside",
      "email": "gary.garside@goraise.co.uk",
      "address1": null,
      "postcode": null
    }
  ],
  "supporters": [
    {
      "id": 37,
      "first_name": "Gary",
      "last_name": "Garside",
      "email": "gary@goraise.co.uk",
      "address1": null,
      "postcode": null
    }
  ]
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <id>1</id>
    <name>Gary's Everest Climb</name>
    <description>Raising money for NSPCC by climbing Mt. Everest!</description>
    <address1/>
    <postcode/>
    <admins/>
    <supporters>
        <supporter>
            <id>37</id>
            <first_name>Gary</first_name>
            <last_name>Garside</last_name>
            <email>gary@goraise.co.uk</email>
            <address1/>
            <postcode/>
        </supporter>
        <supporter>
            <id>38</id>
            <first_name>Gary</first_name>
            <last_name>Garside</last_name>
            <email>gary.garside@goraise.co.uk</email>
            <address1/>
            <postcode/>
        </supporter>
    </supporters>
</xml>
```

This endpoint retrieves a specific challenger.

### HTTP Request

`GET https://rest.goraise.co.uk/challengers/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The unique ID of the challenger

## Create a New Challenger

```shell
curl "https://rest.goraise.co.uk/challengers"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X POST
  -d "name=Everest Climb&description=Some information about the climb"
```

> The above command returns JSON structured like this:

```json
{
  "name": "Everest Climb",
  "description": "Some information about the climb",
  "id": 75919
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <name>Everest Climb</name>
    <description>Some information about the climb</description>
    <id>75919</id>
</xml>
```

This endpoint creates and returns a new challenger.

<aside class="warning">The only required fields for creating a new challenger are their name.</aside>

### HTTP Request

`POST https://rest.goraise.co.uk/challengers`

### Required Parameters

Parameter | Description
--------- | -----------
NAME | The name of the good challenger

### Additional Attributes

Parameter | Description
--------- | -----------
DESCRIPTION | Detailed description about the challenger
ADDRESS1 | The first line of the challenger's address
POSTCODE | The challenger's postal code
CHARITY_NUMBER | The registered charity number of the challenger, if applicable

## Update a Challenger

```shell
curl "https://rest.goraise.co.uk/challengers/75919"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X PUT
  -d "name=Climb&description=Updating the climb description"
```

> The above command returns JSON structured like this:

```json
{
  "id": 75919,
  "name": "Climb",
  "description": "Updating the climb description",
  "address1": null,
  "postcode": null
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <id>75919</id>
    <name>Climb</name>
    <description>Updating the climb description</description>
    <address1/>
    <postcode/>
</xml>
```

This endpoint updates and returns a challenger with a specific ID.

### HTTP Request

`PUT https://rest.goraise.co.uk/challengers/<ID>`

### Required Parameters

Parameter | Description
--------- | -----------
ID | The unique ID of the challenger

### Updatable Attributes

Parameter | Description
--------- | -----------
NAME | The name of the challenger
DESCRIPTION | Detailed description about the challenger
ADDRESS1 | The first line of the challenger's address
POSTCODE | The challenger's postal code
CHARITY_NUMBER | The registered charity number of the challenger, if applicable


# Clicks

## Get All Clicks

```shell
curl "https://rest.goraise.co.uk/clicks"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "total": 6372,
  "per_page": 100,
  "current_page": 1,
  "last_page": 64,
  "next_page_url": "https://rest.goraise.co.uk/clicks?page=2",
  "prev_page_url": null,
  "from": 1,
  "to": 100,
  "data": [
    {
      "id": 1,
      "timestamp": "2015-04-01 09:58:24",
      "retailer": {
        "id": 331,
        "name": "O2 Mobile Broadband",
        "description": null,
        "logo": null,
        "terms": null,
        "website_url": "shop.o2.co.uk",
        "donation": null
      },
      "user": {
        "id": 1,
        "first_name": "Gary",
        "last_name": "Garside",
        "email": "gary@goraise.co.uk",
        "address1": "",
        "postcode": ""
      }
    }
  ]
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <total>6372</total>
    <per_page>100</per_page>
    <current_page>1</current_page>
    <last_page>64</last_page>
    <next_page_url>https://rest.goraise.co.uk/clicks?format=xml&amp;page=2</next_page_url>
    <prev_page_url/>
    <from>1</from>
    <to>100</to>
    <data>
      <datum>
          <id>1</id>
          <timestamp>2015-04-01 09:58:24</timestamp>
          <retailer>
              <id>331</id>
              <name>O2 Mobile Broadband</name>
              <description/>
              <logo/>
              <terms/>
              <website_url>shop.o2.co.uk</website_url>
              <donation/>
          </retailer>
          <user>
              <id>1</id>
              <first_name>Gary</first_name>
              <last_name>Garside</last_name>
              <email>gary@goraise.co.uk</email>
              <address1/>
              <postcode/>
          </user>
      </datum>
    </data>
</xml>
```

This endpoint retrieves all clicks.

### HTTP Request

`GET https://rest.goraise.co.uk/clicks`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
per_page | 100 | How many results to pull back in one go. Can range from 10-250
page | 1 | The paginated page of results you wish to view, as limited by the per_page variable
order_by | id | How the results should be ordered

## Get a Specific Click

```shell
curl "https://rest.goraise.co.uk/clicks/1"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "timestamp": "2015-04-01 09:58:24",
  "retailer": {
    "id": 331,
    "name": "O2 Mobile Broadband",
    "description": null,
    "logo": null,
    "terms": null,
    "website_url": "shop.o2.co.uk",
    "donation": null
  },
  "user": {
    "id": 1,
    "first_name": "Gary",
    "last_name": "Garside",
    "email": "gary@goraise.co.uk",
    "address1": "",
    "postcode": ""
  }
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
  <id>1</id>
  <timestamp>2015-04-01 09:58:24</timestamp>
  <retailer>
      <id>331</id>
      <name>O2 Mobile Broadband</name>
      <description/>
      <logo/>
      <terms/>
      <website_url>shop.o2.co.uk</website_url>
      <donation/>
  </retailer>
  <user>
      <id>1</id>
      <first_name>Gary</first_name>
      <last_name>Garside</last_name>
      <email>gary@goraise.co.uk</email>
      <address1/>
      <postcode/>
  </user>
</xml>
```

This endpoint retrieves a specific click.

### HTTP Request

`GET https://rest.goraise.co.uk/clicks/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The unique ID of the click


# Transactions

## Get All Transactions

```shell
curl "https://rest.goraise.co.uk/transactions"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "total": 1087,
  "per_page": 100,
  "current_page": 1,
  "last_page": 11,
  "next_page_url": "https://rest.goraise.co.uk/transactions?page=2",
  "prev_page_url": null,
  "from": 1,
  "to": 100,
  "data": [
    {
      "id": 2996,
      "revenue": "9.99",
      "donation": "0.30",
      "retailer": {
        "id": 109,
        "name": "Zavvi",
        "description": "Enjoy a huge selection of entertainment including market leading prices on the latest release Games, accessories and console bundles. Not to mention a huge selection of music, film and more.",
        "logo": "/images/retailers/logos/zavvi.png",
        "terms": "Donations may only apply to the sale price and not include VAT, delivery and other such costs. Please do not use voucher codes from other websites as this may affect your donation.",
        "website_url": "www.zavvi.com",
        "donation": "3%"
      },
      "click": {
        "id": 17,
        "timestamp": "2015-04-01 12:22:21",
        "user": {
          "id": 7,
          "first_name": "Gary",
          "last_name": "Garside",
          "email": "gary@goraise.co.uk",
          "address1": "",
          "postcode": ""
        }
      }
    }
  ]
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
  <total>1087</total>
  <per_page>100</per_page>
  <current_page>1</current_page>
  <last_page>11</last_page>
  <next_page_url>https://rest.goraise.co.uk/transactions?format=xml&amp;page=2</next_page_url>
  <prev_page_url/>
  <from>1</from>
  <to>100</to>
  <data>
    <datum>
        <id>2996</id>
        <revenue>9.99</revenue>
        <donation>0.30</donation>
        <retailer>
            <id>109</id>
            <name>Zavvi</name>
            <description>Enjoy a huge selection of entertainment including market leading prices on the latest release Games, accessories and console bundles. Not to mention a huge selection of music, film and more.</description>
            <logo>/images/retailers/logos/zavvi.png</logo>
            <terms>Donations may only apply to the sale price and not include VAT, delivery and other such costs. Please do not use voucher codes from other websites as this may affect your donation.</terms>
            <website_url>www.zavvi.com</website_url>
            <donation>3%</donation>
        </retailer>
        <click>
            <id>17</id>
            <timestamp>2015-04-01 12:22:21</timestamp>
            <user>
                <id>7</id>
                <first_name>Gary</first_name>
                <last_name>Garside</last_name>
                <email>gary@goraise.co.uk</email>
                <address1/>
                <postcode/>
            </user>
        </click>
    </datum>
  </data>
</xml>
```

This endpoint retrieves all transactions.

### HTTP Request

`GET https://rest.goraise.co.uk/transactions`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
per_page | 100 | How many results to pull back in one go. Can range from 10-250
page | 1 | The paginated page of results you wish to view, as limited by the per_page variable
order_by | id | How the results should be ordered

## Get a Specific Transaction

```shell
curl "https://rest.goraise.co.uk/transactions/1"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2996,
  "revenue": "9.99",
  "donation": "0.30",
  "retailer": {
    "id": 109,
    "name": "Zavvi",
    "description": "Enjoy a huge selection of entertainment including market leading prices on the latest release Games, accessories and console bundles. Not to mention a huge selection of music, film and more.",
    "logo": "/images/retailers/logos/zavvi.png",
    "terms": "Donations may only apply to the sale price and not include VAT, delivery and other such costs. Please do not use voucher codes from other websites as this may affect your donation.",
    "website_url": "www.zavvi.com",
    "donation": "3%"
  },
  "click": {
    "id": 17,
    "timestamp": "2015-04-01 12:22:21",
    "user": {
      "id": 7,
      "first_name": "Gary",
      "last_name": "Garside",
      "email": "gary@goraise.co.uk",
      "address1": "",
      "postcode": ""
    }
  }
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
  <id>2996</id>
  <revenue>9.99</revenue>
  <donation>0.30</donation>
  <retailer>
      <id>109</id>
      <name>Zavvi</name>
      <description>Enjoy a huge selection of entertainment including market leading prices on the latest release Games, accessories and console bundles. Not to mention a huge selection of music, film and more.</description>
      <logo>/images/retailers/logos/zavvi.png</logo>
      <terms>Donations may only apply to the sale price and not include VAT, delivery and other such costs. Please do not use voucher codes from other websites as this may affect your donation.</terms>
      <website_url>www.zavvi.com</website_url>
      <donation>3%</donation>
  </retailer>
  <click>
      <id>17</id>
      <timestamp>2015-04-01 12:22:21</timestamp>
      <user>
          <id>7</id>
          <first_name>Gary</first_name>
          <last_name>Garside</last_name>
          <email>gary@goraise.co.uk</email>
          <address1/>
          <postcode/>
      </user>
  </click>
</xml>
```

This endpoint retrieves a specific transaction.

### HTTP Request

`GET https://rest.goraise.co.uk/transactions/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The unique ID of the transaction

# Payments

## Get All Payments

```shell
curl "https://rest.goraise.co.uk/payments"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
    {
      "id": 37,
      "groups_payment_details_id": 474,
      "amount": 47.19,
      "notes": "Created payment for Leicester Speedway Supporters Club",
      "created_at": "2016-04-11 12:27:26",
      "updated_at": "2016-04-11 12:27:26",
      "paid_at": null,
      "status": "pending",
      "transaction_groups": [
        {
          "id": 5171,
          "percentage": 100,
          "value": 0.51,
          "historical": 0,
          "transaction": {
            "id": 3758,
            "revenue": "102.00",
            "donation": "0.51"
          }
        },
      ]
    }
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <total>26</total>
    <per_page>100</per_page>
    <current_page>1</current_page>
    <last_page>1</last_page>
    <next_page_url/>
    <prev_page_url/>
    <from>1</from>
    <to>26</to>
    <data>
        <datum>
            <id>21</id>
            <groups_payment_details_id>112</groups_payment_details_id>
            <amount>366.64</amount>
            <notes>Created payment for Friends of Salusbury School</notes>
            <created_at>2016-01-22 10:34:07</created_at>
            <updated_at>2016-01-22 11:48:06</updated_at>
            <paid_at>2016-01-22 11:48:06</paid_at>
            <status>paid</status>
            <transaction_groups>
                <transaction_group>
                    <id>23</id>
                    <percentage>100</percentage>
                    <value>4.62</value>
                    <historical>0</historical>
                    <transaction>
                        <id>3012</id>
                        <revenue>369.00</revenue>
                        <donation>4.62</donation>
                    </transaction>
                </transaction_group>
            </transaction_groups>
        </datum>
    </data>
</xml>
```

This endpoint retrieves all payments.

### HTTP Request

`GET https://rest.goraise.co.uk/payments`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
per_page | 100 | How many results to pull back in one go. Can range from 10-250
page | 1 | The paginated page of results you wish to view, as limited by the per_page variable
order_by | id | How the results should be ordered

## Get a Specific Payment

```shell
curl "https://rest.goraise.co.uk/payments/1"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "id": 37,
  "groups_payment_details_id": 474,
  "amount": 47.19,
  "notes": "Created payment for Leicester Speedway Supporters Club",
  "created_at": "2016-04-11 12:27:26",
  "updated_at": "2016-04-11 12:27:26",
  "paid_at": null,
  "status": "pending",
  "transaction_groups": [
    {
      "id": 5171,
      "percentage": 100,
      "value": 0.51,
      "historical": 0,
      "transaction": {
        "id": 3758,
        "revenue": "102.00",
        "donation": "0.51"
      }
    },
  ]
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <id>21</id>
    <groups_payment_details_id>112</groups_payment_details_id>
    <amount>366.64</amount>
    <notes>Created payment for Friends of Salusbury School</notes>
    <created_at>2016-01-22 10:34:07</created_at>
    <updated_at>2016-01-22 11:48:06</updated_at>
    <paid_at>2016-01-22 11:48:06</paid_at>
    <status>paid</status>
    <transaction_groups>
        <transaction_group>
            <id>23</id>
            <percentage>100</percentage>
            <value>4.62</value>
            <historical>0</historical>
            <transaction>
                <id>3012</id>
                <revenue>369.00</revenue>
                <donation>4.62</donation>
            </transaction>
        </transaction_group>
    </transaction_groups>
</xml>
```

This endpoint retrieves a specific payment.

### HTTP Request

`GET https://rest.goraise.co.uk/payments/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The unique ID of the payment


# Cause Payment Details

## Get All Cause Payment Details

```shell
curl "https://rest.goraise.co.uk/causes/75911/payment-details"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
 {
    "id": 131801,
    "type": "cheque",
    "active": 0,
    "groups_id": 75911,
    "minimum_payment": 22,
    "paypal_email": "",
    "bank_acc_name": "",
    "bank_acc_number": null,
    "bank_acc_sort": "",
    "use_company_address": 1,
    "provider": "test",
    "payment_url": null,
    "payment_url_protocol": null
  }
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <item>
        <id>131801</id>
        <type>cheque</type>
        <active>0</active>
        <groups_id>75911</groups_id>
        <minimum_payment>22</minimum_payment>
        <paypal_email/>
        <bank_acc_name/>
        <bank_acc_number/>
        <bank_acc_sort/>
        <use_company_address>1</use_company_address>
        <provider>test</provider>
        <payment_url/>
        <payment_url_protocol/>
    </item>
</xml>
```

This endpoint retrieves a list all payment details for a cause.

### HTTP Request

`GET https://rest.goraise.co.uk/causes/<CAUSE_ID>/payment-details`

### URL Parameters

Parameter | Description
--------- | -----------
CAUSE_ID | The id of the cause.

## Get a Specific Payment Detail

```shell
curl "https://rest.goraise.co.uk/causes/75911/payment-details/131801"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "id": 131805,
  "type": "thirdparty",
  "active": 1,
  "groups_id": 75423,
  "minimum_payment": 15.5,
  "paypal_email": "",
  "bank_acc_name": "",
  "bank_acc_number": null,
  "bank_acc_sort": "",
  "use_company_address": 1,
  "provider": null,
  "payment_url": null,
  "payment_url_protocol": null
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <id>131805</id>
    <type>thirdparty</type>
    <active>1</active>
    <groups_id>75423</groups_id>
    <minimum_payment>15.5</minimum_payment>
    <paypal_email/>
    <bank_acc_name/>
    <bank_acc_number/>
    <bank_acc_sort/>
    <use_company_address>1</use_company_address>
    <provider/>
    <payment_url/>
    <payment_url_protocol/>
</xml>
```

This endpoint retrieves a specific set of payment details

### HTTP Request

`GET https://rest.goraise.co.uk/causes/<CAUSE_ID>/payment-details/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
CAUSE_ID | The id of the cause.
ID | The unique ID of the payment details item.

## Create a New Cause Payment Details Entry

```shell
curl "https://rest.goraise.co.uk/causes/75423/payment-details"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X POST
  -d "type=cheque&minimium_payment=16.00"
```

> The above command returns JSON structured like this:

```json
{
  "type": "cheque",
  "minimum_payment": "16.00",
  "groups_id": 75423,
  "id": 131806
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <type>cheque</type>
    <minimum_payment>16.00</minimum_payment>
    <groups_id>75423</groups_id>
    <id>131807</id>
</xml>
```

This endpoint creates and returns a payment detail item for a specified cause.

### HTTP Request

`POST https://rest.goraise.co.uk/causes/<CAUSE_ID>/payment-details`

### URL Structure

Parameter | Description
--------- | -----------
CAUSE_ID | The id of the cause.

### Required Parameters

Parameter | Description
--------- | -----------
TYPE | Type of payment, [cheque,bank_account,thirdparty]
MINIMUM_PAYMENT | The minimum payout threshold.

### Additional Attributes

Parameter | Description
--------- | -----------
PAYPAL_EMAIL | The email of the associated paypal account (if applicable).
BANK_ACC_NAME | The bank account name (if applicable).
BANK_ACC_NUMBER | The bank account number (if applicable).
BANK_ACC_SORT | The bank account sort code (if applicable).
USE_COMPANY_ADDRESS | Whether or not to use the company address for the payment detail.
PROVIDER | The provider name (if applicable).
PAYMENT_URL | The URL the payment method, minus the protocol. *e.g. www.justgiving.com/cancerresearchuk*
PAYMENT_URL_PROTOCOL | The protocol of the URL, *e.g. https:// or http://*

## Update a Cause Payment Detail

```shell
curl "PUT https://rest.goraise.co.uk/causes/75911/payment-details/131801"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X PUT
  -d "type=cheque&minimium_payment=16.00"
```

> The above command returns JSON structured like this:

```json
{
    "id": 131801,
    "type": "cheque",
    "active": 0,
    "groups_id": 75911,
    "minimum_payment": 22,
    "paypal_email": "",
    "bank_acc_name": "",
    "bank_acc_number": null,
    "bank_acc_sort": "",
    "use_company_address": 1,
    "provider": "test",
    "payment_url": null,
    "payment_url_protocol": null
  }
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <item>
        <id>131801</id>
        <type>cheque</type>
        <active>0</active>
        <groups_id>75911</groups_id>
        <minimum_payment>22</minimum_payment>
        <paypal_email/>
        <bank_acc_name/>
        <bank_acc_number/>
        <bank_acc_sort/>
        <use_company_address>1</use_company_address>
        <provider>test</provider>
        <payment_url/>
        <payment_url_protocol/>
    </item>
</xml>
```

This endpoint updates and returns a cause payment detail with a specific ID.

### HTTP Request

`PUT https://rest.goraise.co.uk/causes/<ID>`

### URL Structure

Parameter | Description
--------- | -----------
CAUSE_ID | The id of the cause.

### Required Parameters

Parameter | Description
--------- | -----------
TYPE | Type of payment, [cheque,bank_account,thirdparty]
MINIMUM_PAYMENT | The minimum payout threshold.

### Additional Attributes

Parameter | Description
--------- | -----------
PAYPAL_EMAIL | The email of the associated paypal account (if applicable).
BANK_ACC_NAME | The bank account name (if applicable).
BANK_ACC_NUMBER | The bank account number (if applicable).
BANK_ACC_SORT | The bank account sort code (if applicable).
USE_COMPANY_ADDRESS | Whether or not to use the company address for the payment detail.
PROVIDER | The provider name (if applicable).
PAYMENT_URL | The URL the payment method, minus the protocol. *e.g. www.justgiving.com/cancerresearchuk*
PAYMENT_URL_PROTOCOL | The protocol of the URL, *e.g. https:// or http://*

# Company Payment Details

## Get All Company Payment Details

```shell
curl "https://rest.goraise.co.uk/companies/75911/payment-details"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
 {
    "id": 131801,
    "type": "cheque",
    "active": 0,
    "groups_id": 75911,
    "minimum_payment": 22,
    "paypal_email": "",
    "bank_acc_name": "",
    "bank_acc_number": null,
    "bank_acc_sort": "",
    "use_company_address": 1,
    "provider": "test",
    "payment_url": null,
    "payment_url_protocol": null
  }
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <item>
        <id>131801</id>
        <type>cheque</type>
        <active>0</active>
        <groups_id>75911</groups_id>
        <minimum_payment>22</minimum_payment>
        <paypal_email/>
        <bank_acc_name/>
        <bank_acc_number/>
        <bank_acc_sort/>
        <use_company_address>1</use_company_address>
        <provider>test</provider>
        <payment_url/>
        <payment_url_protocol/>
    </item>
</xml>
```

This endpoint retrieves a list all payment details for a company

### HTTP Request

`GET https://rest.goraise.co.uk/companies/<COMPANY_ID>/payment-details`

### URL Parameters

Parameter | Description
--------- | -----------
COMPANY_ID | The id of the company

## Get a Specific Payment Detail

```shell
curl "https://rest.goraise.co.uk/companies/75911/payment-details/131801"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "id": 131805,
  "type": "thirdparty",
  "active": 1,
  "groups_id": 75423,
  "minimum_payment": 15.5,
  "paypal_email": "",
  "bank_acc_name": "",
  "bank_acc_number": null,
  "bank_acc_sort": "",
  "use_company_address": 1,
  "provider": null,
  "payment_url": null,
  "payment_url_protocol": null
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <id>131805</id>
    <type>thirdparty</type>
    <active>1</active>
    <groups_id>75423</groups_id>
    <minimum_payment>15.5</minimum_payment>
    <paypal_email/>
    <bank_acc_name/>
    <bank_acc_number/>
    <bank_acc_sort/>
    <use_company_address>1</use_company_address>
    <provider/>
    <payment_url/>
    <payment_url_protocol/>
</xml>
```

This endpoint retrieves a specific set of payment details

### HTTP Request

`GET https://rest.goraise.co.uk/companies/<COMPANY_ID>/payment-details/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
COMPANY_ID | The id of the company
ID | The unique ID of the payment details item

## Create a New Company Payment Details Entry

```shell
curl "https://rest.goraise.co.uk/companies/75423/payment-details"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X POST
  -d "type=cheque&minimium_payment=16.00"
```

> The above command returns JSON structured like this:

```json
{
  "type": "cheque",
  "minimum_payment": "16.00",
  "groups_id": 75423,
  "id": 131806
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <type>cheque</type>
    <minimum_payment>16.00</minimum_payment>
    <groups_id>75423</groups_id>
    <id>131807</id>
</xml>
```

This endpoint creates and returns a payment detail item for a specified company

### HTTP Request

`POST https://rest.goraise.co.uk/companies/<COMPANY_ID>/payment-details`

### URL Structure

Parameter | Description
--------- | -----------
COMPANY_ID | The id of the company

### Required Parameters

Parameter | Description
--------- | -----------
TYPE | Type of payment, [cheque,bank_account,thirdparty]
MINIMUM_PAYMENT | The minimum payout threshold.

### Additional Attributes

Parameter | Description
--------- | -----------
PAYPAL_EMAIL | The email of the associated paypal account (if applicable).
BANK_ACC_NAME | The bank account name (if applicable).
BANK_ACC_NUMBER | The bank account number (if applicable).
BANK_ACC_SORT | The bank account sort code (if applicable).
USE_COMPANY_ADDRESS | Whether or not to use the company address for the payment detail.
PROVIDER | The provider name (if applicable).
PAYMENT_URL | The URL the payment method, minus the protocol. *e.g. www.justgiving.com/cancerresearchuk*
PAYMENT_URL_PROTOCOL | The protocol of the URL, *e.g. https:// or http://*

## Update a Company Payment Detail

```shell
curl "PUT https://rest.goraise.co.uk/companies/75911/payment-details/131801"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X PUT
  -d "type=cheque&minimium_payment=16.00"
```

> The above command returns JSON structured like this:

```json
{
    "id": 131801,
    "type": "cheque",
    "active": 0,
    "groups_id": 75911,
    "minimum_payment": 22,
    "paypal_email": "",
    "bank_acc_name": "",
    "bank_acc_number": null,
    "bank_acc_sort": "",
    "use_company_address": 1,
    "provider": "test",
    "payment_url": null,
    "payment_url_protocol": null
  }
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <item>
        <id>131801</id>
        <type>cheque</type>
        <active>0</active>
        <groups_id>75911</groups_id>
        <minimum_payment>22</minimum_payment>
        <paypal_email/>
        <bank_acc_name/>
        <bank_acc_number/>
        <bank_acc_sort/>
        <use_company_address>1</use_company_address>
        <provider>test</provider>
        <payment_url/>
        <payment_url_protocol/>
    </item>
</xml>
```

This endpoint updates and returns a cause payment detail with a specific ID.

### HTTP Request

`PUT https://rest.goraise.co.uk/companies/<ID>`

### URL Structure

Parameter | Description
--------- | -----------
COMPANY_ID | The id of the company

### Required Parameters

Parameter | Description
--------- | -----------
TYPE | Type of payment, [cheque,bank_account,thirdparty]
MINIMUM_PAYMENT | The minimum payout threshold.

### Additional Attributes

Parameter | Description
--------- | -----------
PAYPAL_EMAIL | The email of the associated paypal account (if applicable).
BANK_ACC_NAME | The bank account name (if applicable).
BANK_ACC_NUMBER | The bank account number (if applicable).
BANK_ACC_SORT | The bank account sort code (if applicable).
USE_COMPANY_ADDRESS | Whether or not to use the company address for the payment detail.
PROVIDER | The provider name (if applicable).
PAYMENT_URL | The URL the payment method, minus the protocol. *e.g. www.justgiving.com/cancerresearchuk*
PAYMENT_URL_PROTOCOL | The protocol of the URL, *e.g. https:// or http://*


# Challenger Payment Details

## Get All Challenger Payment Details

```shell
curl "https://rest.goraise.co.uk/challengers/75911/payment-details"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
 {
    "id": 131801,
    "type": "cheque",
    "active": 0,
    "groups_id": 75911,
    "minimum_payment": 22,
    "paypal_email": "",
    "bank_acc_name": "",
    "bank_acc_number": null,
    "bank_acc_sort": "",
    "use_company_address": 1,
    "provider": "test",
    "payment_url": null,
    "payment_url_protocol": null
  }
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <item>
        <id>131801</id>
        <type>cheque</type>
        <active>0</active>
        <groups_id>75911</groups_id>
        <minimum_payment>22</minimum_payment>
        <paypal_email/>
        <bank_acc_name/>
        <bank_acc_number/>
        <bank_acc_sort/>
        <use_company_address>1</use_company_address>
        <provider>test</provider>
        <payment_url/>
        <payment_url_protocol/>
    </item>
</xml>
```

This endpoint retrieves a list all payment details for a challenger

### HTTP Request

`GET https://rest.goraise.co.uk/challengers/<CHALLENGER_ID>/payment-details`

### URL Parameters

Parameter | Description
--------- | -----------
CHALLENGER_ID | The id of the challenger

## Get a Specific Payment Detail

```shell
curl "https://rest.goraise.co.uk/challengers/75911/payment-details/131801"
  -H "ApiKey: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "id": 131805,
  "type": "thirdparty",
  "active": 1,
  "groups_id": 75423,
  "minimum_payment": 15.5,
  "paypal_email": "",
  "bank_acc_name": "",
  "bank_acc_number": null,
  "bank_acc_sort": "",
  "use_company_address": 1,
  "provider": null,
  "payment_url": null,
  "payment_url_protocol": null
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <id>131805</id>
    <type>thirdparty</type>
    <active>1</active>
    <groups_id>75423</groups_id>
    <minimum_payment>15.5</minimum_payment>
    <paypal_email/>
    <bank_acc_name/>
    <bank_acc_number/>
    <bank_acc_sort/>
    <use_company_address>1</use_company_address>
    <provider/>
    <payment_url/>
    <payment_url_protocol/>
</xml>
```

This endpoint retrieves a specific set of payment details

### HTTP Request

`GET https://rest.goraise.co.uk/challengers/<CHALLENGER_ID>/payment-details/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
CHALLENGER_ID | The id of the challenger
ID | The unique ID of the payment details item

## Create a New Challenger Payment Details Entry

```shell
curl "https://rest.goraise.co.uk/challengers/75423/payment-details"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X POST
  -d "type=cheque&minimium_payment=16.00"
```

> The above command returns JSON structured like this:

```json
{
  "type": "cheque",
  "minimum_payment": "16.00",
  "groups_id": 75423,
  "id": 131806
}
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <type>cheque</type>
    <minimum_payment>16.00</minimum_payment>
    <groups_id>75423</groups_id>
    <id>131807</id>
</xml>
```

This endpoint creates and returns a payment detail item for a specified challenger

### HTTP Request

`POST https://rest.goraise.co.uk/challengers/<CHALLENGER_ID>/payment-details`

### URL Structure

Parameter | Description
--------- | -----------
CHALLENGER_ID | The id of the challenger

### Required Parameters

Parameter | Description
--------- | -----------
TYPE | Type of payment, [cheque,bank_account,thirdparty]
MINIMUM_PAYMENT | The minimum payout threshold.

### Additional Attributes

Parameter | Description
--------- | -----------
PAYPAL_EMAIL | The email of the associated paypal account (if applicable).
BANK_ACC_NAME | The bank account name (if applicable).
BANK_ACC_NUMBER | The bank account number (if applicable).
BANK_ACC_SORT | The bank account sort code (if applicable).
USE_COMPANY_ADDRESS | Whether or not to use the company address for the payment detail.
PROVIDER | The provider name (if applicable).
PAYMENT_URL | The URL the payment method, minus the protocol. *e.g. www.justgiving.com/cancerresearchuk*
PAYMENT_URL_PROTOCOL | The protocol of the URL, *e.g. https:// or http://*

## Update a Challenger Payment Detail

```shell
curl "PUT https://rest.goraise.co.uk/challengers/75911/payment-details/131801"
  -H "ApiKey: your_api_key"
  -H "Content-Type: application/x-www-form-urlencoded"
  -X PUT
  -d "type=cheque&minimium_payment=16.00"
```

> The above command returns JSON structured like this:

```json
{
    "id": 131801,
    "type": "cheque",
    "active": 0,
    "groups_id": 75911,
    "minimum_payment": 22,
    "paypal_email": "",
    "bank_acc_name": "",
    "bank_acc_number": null,
    "bank_acc_sort": "",
    "use_company_address": 1,
    "provider": "test",
    "payment_url": null,
    "payment_url_protocol": null
  }
```

> The above command returns XML structured like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xml>
    <item>
        <id>131801</id>
        <type>cheque</type>
        <active>0</active>
        <groups_id>75911</groups_id>
        <minimum_payment>22</minimum_payment>
        <paypal_email/>
        <bank_acc_name/>
        <bank_acc_number/>
        <bank_acc_sort/>
        <use_company_address>1</use_company_address>
        <provider>test</provider>
        <payment_url/>
        <payment_url_protocol/>
    </item>
</xml>
```

This endpoint updates and returns a cause payment detail with a specific ID.

### HTTP Request

`PUT https://rest.goraise.co.uk/causes/<ID>`

### URL Structure

Parameter | Description
--------- | -----------
CHALLENGER_ID | The id of the challenger

### Required Parameters

Parameter | Description
--------- | -----------
TYPE | Type of payment, [cheque,bank_account,thirdparty]
MINIMUM_PAYMENT | The minimum payout threshold

### Additional Attributes

Parameter | Description
--------- | -----------
PAYPAL_EMAIL | The email of the associated paypal account (if applicable).
BANK_ACC_NAME | The bank account name (if applicable).
BANK_ACC_NUMBER | The bank account number (if applicable).
BANK_ACC_SORT | The bank account sort code (if applicable).
USE_COMPANY_ADDRESS | Whether or not to use the company address for the payment detail.
PROVIDER | The provider name (if applicable).
PAYMENT_URL | The URL the payment method, minus the protocol. *e.g. www.justgiving.com/cancerresearchuk*
PAYMENT_URL_PROTOCOL | The protocol of the URL, *e.g. https:// or http://*

