# Borderless Accounts

## Get Account Balances
> Example Request:

```shell

curl -X POST https://api.sandbox.transferwise.tech/v1/addresses \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "details": {
            "country": "EE",
            "firstLine": "Narva mnt 5-1",
            "postCode": "10113",
            "city": "Tallinn"
          }
        }'

```

> Example Response:

```json
{
  "id": 236532,
  "profile": <your profile id>,
  "details": {
    "country": "EE",
    "firstLine": "Narva mnt 5-1",
    "postCode": "10113",
    "city": "Tallinn",
    "state": "",
    "occupation": null
  }
}

```

Adds address info to user profile.
List of required fields are slightly different for different countries.  
For example state field is required for US, CA, BR and AU addresses but not for other countries.
Please look at [Addresses.Requirements](#addresses-requirements) to figure out which fields are required to create addresses in specific country.

### Request

**`POST https://api.sandbox.transferwise.tech/v1/addresses`**

Field                 | Description                                        | Format
---------             | -------                                            | -----------
profile               | User profile id.                                   | Integer
details.country       | 2 digit ISO country code.                          | Text
details.firstLine     | Address line: street, house, apartment.            | Text
details.postCode      | Zip code                                           | Text
details.city          | City name                                          | Text
details.state         | State code. Required if country is US, CA, AU, BR  | Text
details.occupation    | User occupation. Required for US, CA, JP           | Text


### Response
Field                 | Description                                        | Format
---------             | -------                                            | -----------
id                    | Address id                                         | Integer
profile               | User profile id.                                   | Integer
details.country       | 2 digit ISO country code.                          | Text
details.firstLine     | Address line: street, house, apartment.            | Text
details.postCode      | Zip code                                           | Text
details.city          | City name                                          | Text
details.state         | State code. Required if country is US, CA, AU, BR  | Text
details.occupation    | User occupation. Required for US, CA, JP           | Text



## Get Account Statement

## Convert Currencies

## Get Available Currencies


