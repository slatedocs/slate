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
Please use [Addresses.Get Requirements](#addresses-get-requirements) and  [Addresses.Refresh Requirements](#addresses-refresh-requirements) endpoints to figure out which fields are required to create addresses in specific country.

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
> Example Request:

```shell

curl -X GET https://api.sandbox.transferwise.tech/v1/addresses/{addressId} \
     -H "Authorization: Bearer <your api token>" 
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

Get address info by id.
### Request
**`GET https://api.sandbox.transferwise.tech/v1/addresses/{addressId}`**



## List
> Example Request:

```shell

curl -X GET https://api.sandbox.transferwise.tech/v1/addresses?profile={profileId} \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
[
    {
        "id": 7099091,
        "profile": <your profile id>,
        "details": {
            "country": "EE",
            "firstLine": "Veerenni 29",
            "postCode": "12991",
            "city": "Tallinn",
            "state": null,
            "occupation": null
        }
    }
]

```
List of addresses belonging to user profile.

### Request
**`GET https://api.sandbox.transferwise.tech/v1/addresses?profile={profileId}`**



## Get Requirements - TODO
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

Tells you which fields are needed to create an address for specific country.
Please read  guide for more details.


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








## Refresh Requirements - TODO



