# Addresses
## Create
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
  "profile": 217896,
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

Create an address for user profile.
List of required are slightly different for countries.  
For example state field is required for US, CA, BR and AU addresses.
Please use [Addresses.Get Requirements](#addresses-get-requirements) and  [Addresses.Refresh Requirements](#addresses-refresh-requirements) endpoints to figure out which fields you need to create addresses in specific countries.



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



## Get By Id


## List


## Get Requirements


## Refresh Requirements



