# User Profiles

## Create (Personal)
> Example Request:

```shell
curl -X POST https://api.sandbox.transferwise.tech/v1/profiles \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "type": "personal",
          "details": {
            "firstName": "Oliver",
            "lastName": "Wilson",
            "dateOfBirth": "1977-07-01",
            "phoneNumber": "+3725064992"
           }
        }'
```

> Example Response (Personal):

```json
{
  "id": <your personal profile id>,
  "type": "personal",
  "details": {
    "firstName": "Oliver",
    "lastName": "Wilson",
    "dateOfBirth": "1977-07-01",
    "phoneNumber": "+3725064992",
    "avatar": "",
    "occupation": "",
    "primaryAddress": null
  }
}
```

Create personal user profile.
Same person cannot have multiple active duplicate user profiles.
Thus creating multiple profiles with the same details will fail. Use the `access token` you received to act on behalf of the user in the `Authorization` header.

### Request

**`POST https://api.sandbox.transferwise.tech/v1/profiles`**

Field                   | Description                   | Format
---------               | -------                       | -----------
type                    | "personal"                    | Text
details.firstName       | First name                    | Text
details.lastName        | Last name                     | Text
details.dateOfBirth     | Date of birth                 | YYYY-MM-DD
details.phoneNumber <br/> (optional)     | Phone number                  | Text


### Response
Field                   | Description                   | Format
---------               | -------                       | -----------
id                      | profileId                     | Integer
type                    | "personal"                    | Text
details.firstName       | First name                    | Text
details.lastName        | Last name                     | Text
details.dateOfBirth     | Date of birth                 | YYYY-MM-DD
details.phoneNumber     | Phone number                  | Text
details.avatar          | Link to person avatar image   | Text
details.occupation      | Person occupation             | Text
details.primaryAddress  | Address object id             | Integer




## Create (Business)
> Example Request:

```shell
curl -X POST https://api.sandbox.transferwise.tech/v1/profiles \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "type": "business",
          "details": {
            "name": "ABC Logistics Ltd",
            "registrationNumber": "12144939",
            "acn": null,
            "abn": null,
            "arbn": null,
            "companyType": "LIMITED",
            "companyRole": "OWNER",
            "descriptionOfBusiness": "Information and communication",
            "webpage": "https://abc-logistics.com"
           }
        }'
```

> Example Response (Business):

```json
{
  "id": <your business profile id>,
  "type": "business",
  "details": {
     "name": "ABC Logistics Ltd",
     "registrationNumber": "12144939",
     "acn": null,
     "abn": null,
     "arbn": null,
     "companyType": "LIMITED",
     "companyRole": "OWNER",
     "descriptionOfBusiness": "Information and communication",
     "webpage": "https://abc-logistics.com",
     "primaryAddress": null
   }
}
```

Create business user profile.
You would need to create personal profile first always. Business profile cannot be created without personal profile.

### Request (Business)

**`POST https://api.sandbox.transferwise.tech/v1/profiles`**

Field                        | Description                                                   | Format
---------                    | -------                                                       | -----------
type                         | "business"                                                    | Text
details.name                 | Business name                                                 | Text
details.registrationNumber   | Business registration number                                  | Text
details.acn                  | Australian Company Number  (only for AUS businesses)          | Text
details.abn                  | Australian Business Nnumber (only for AUS businesses)         | Text
details.arbn                 | Australian Registered Body Number  (only for AUS businesses)  | Text
details.companyType          | Company legal form. Allowed values:   <ul><li>LIMITED</li><li>PARTNERSHIP</li><li>SOLE_TRADER</li><li>LIMITED_BY_GUARANTEE</li><li>LIMITED_LIABILITY_COMPANY</li><li>FOR_PROFIT_CORPORATION</li><li>NON_PROFIT_CORPORATION</li><li>LIMITED_PARTNERSHIP</li><li>LIMITED_LIABILITY_PARTNERSHIP</li><li>GENERAL_PARTNERSHIP</li><li>SOLE_PROPRIETORSHIP</li><li>PRIVATE_LIMITED_COMPANY</li><li>PUBLIC_LIMITED_COMPANY</li><li>TRUST</li><li>OTHER</ul>  | Text
details.companyRole          | Role of person. Allowed Values: <ul><li>OWNER</li><li>DIRECTOR</li><li>OTHER</ul>                 | Text
details.descriptionOfBusiness| Sector / filed of activity           | Text
details.webpage              | Business webpage                 | Text


### Response (Business)
Field                   | Description                   | Format
---------               | -------                       | -----------
id                      | profileId                     | Integer
type                         | "business"                                                    | Text
details.name                 | Business name                                                 | Text
details.registrationNumber   | Business registration number                                  | Text
details.acn                  | Australian Company Number  (only for AUS businesses)          | Text
details.abn                  | Australian Business Nnumber (only for AUS businesses)         | Text
details.arbn                 | Australian Registered Body Number  (only for AUS businesses)  | Text
details.companyType          | Company legal form | Text
details.companyRole          | Role of person                | Text
details.descriptionOfBusiness| Sector / filed of activity           | Text
details.webpage              | Business webpage                 | Text
details.primaryAddress  | Address object id             | Integer



## Update
> Example Request:

```shell
curl -X PUT https://api.sandbox.transferwise.tech/v1/profiles \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "type": "personal",
          "details": {
            "firstName": "Oliver",
            "lastName": "Wilson",
            "dateOfBirth": "1977-07-01",
            "phoneNumber": "+3725064992"
           }
        }'
```

> Example Response:

```json
{
  "id": <your personal profile id>,
  "type": "personal",
  "details": {
    "firstName": "Oliver",
    "lastName": "Wilson",
    "dateOfBirth": "1977-07-01",
    "phoneNumber": "+3725064992",
    "avatar": "",
    "occupation": "",
    "primaryAddress": null
  }
}
```

Update user profile information. 
If user profile has been verified by TransferWise then there are restrictions on what information is allowed to change. 

### Request

**`PUT https://api.sandbox.transferwise.tech/v1/profiles`**

Request and response is same as described in [Create (Personal)](#user-profiles-create-personal) and [Create (Business)](#user-profiles-create-business)



## Get By Id
> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/profiles/{profileId} \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
{
  "id": <your personal profile id>,
  "type": "personal",
  "details": {
    "firstName": "Oliver",
    "lastName": "Wilson",
    "dateOfBirth": "1977-07-01",
    "phoneNumber": "+3725064992",
    "avatar": "",
    "occupation": "",
    "primaryAddress": null
  }
}
```

Get profile info by id.
### Request
**`GET https://api.sandbox.transferwise.tech/v1/profiles/{profileId}`**



## List
> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/profiles \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
[
    {
      "id": <your personal profile id>,
      "type": "personal",
      "details": {
        "firstName": "Oliver",
        "lastName": "Wilson",
        "dateOfBirth": "1977-07-01",
        "phoneNumber": "+3725064992",
        "avatar": "",
        "occupation": "",
        "primaryAddress": null
      }
    },
    {
      "id": <your business profile id>,
      "type": "business",
      "details": {
         "name": "ABC Logistics Ltd",
         "registrationNumber": "12144939",
         "acn": null,
         "abn": null,
         "arbn": null,
         "companyType": "LIMITED",
         "companyRole": "OWNER",
         "descriptionOfBusiness": "Information and communication",
         "webpage": "https://abc-logistics.com",
         "primaryAddress": null
       }
    }
    
]
```
List of all profiles belonging to user.

### Request
**`GET https://api.sandbox.transferwise.tech/v1/profiles`**




## Create Identification Document
> Example Request:

```shell
curl -X POST https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/verification-documents \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
            "firstName": "Oliver",
            "lastName": "Wilson",
            "type": "IDENTITY_CARD",
            "uniqueIdentifier": "AA299822313",
            "issueDate": "2017-12-31",
            "issuerCountry": "EE",
            "issuerState": "",
            "expiryDate": "2027-12-31"
        }'
```

> Example Response:

```json
{  
}
```
Add identification document details to user profile. Applicable to personal profiles (not business) only.  
Returns empty result if successful. 


### Request (Business)

**`POST https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/verification-documents`**

Field                    | Description                                 | Format
---------                | -------                                     |-----------
firstName                | Person first name in document               | Text
lastName                 | Person last name in document                | Text
type                     | Document type. Allowed Values: <ul><li>DRIVERS_LICENCE</li><li>IDENTITY_CARD</li><li>GREEN_CARD</li><li>MY_NUMBER</li><li>PASSPORT</li><li>OTHER</ul>   | Text
uniqueIdentifier         | Document number                             | Text
issueDate                | Document issue date                         | YYYY-MM-DD
issuerCountry            | Issued by country code. For example "US"    | Text
issuerState              | Issued by state code. For example "NY"      | Text
expiryDate               | Document expiry date. (optional)            | YYYY-MM-DD


## Get business directors

> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/directors \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
[
  {
    "id": 10,
    "firstName": "John",
    "lastName": "Doe",
    "dateOfBirth": "1982-05-20",
    "countryOfResidenceIso3Code": "usa"
  },
  {
    "id": 11,
    "firstName": "Jane",
    "lastName": "Doe",
    "dateOfBirth": "1981-12-07",
    "countryOfResidenceIso3Code": "usa"
  }
]
```
Returns the list of all directors associated with the business profile.

### Request (Business)
**`GET https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/directors`**


## Add business directors

> Example Request:

```shell
curl -X POST https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/directors \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '[
             {
                 "firstName": "John",
                 "lastName": "Doe",
                 "dateOfBirth": "1982-05-20",
                 "countryOfResidenceIso3Code": "usa"
             },
             {
                 "firstName": "Jane",
                 "lastName": "Doe",
                 "dateOfBirth": "1981-12-07",
                 "countryOfResidenceIso3Code": "usa"
             }
        ]'
```

> Example Response:

```json
[
    {
        "id": 10,
        "firstName": "John",
        "lastName": "Doe",
        "dateOfBirth": "1982-05-20",
        "countryOfResidenceIso3Code": "usa"
    },
    {
        "id": 11,
        "firstName": "Jane",
        "lastName": "Doe",
        "dateOfBirth": "1981-12-07",
        "countryOfResidenceIso3Code": "usa"
    },
    {
        "id": 7,
        "firstName": "Oliver",
        "lastName": "Wilson",
        "dateOfBirth": "2017-12-31",
        "countryOfResidenceIso3Code": "gbr"
    }
]
```
Adds new directors to the business profile.
Returns the list of all directors associated with the business profile.

### Request (Business)
**`POST https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/directors`**

Field                      | Description                   | Format
---------                  | -------                       |-----------
firstName                  | Director first name           | Text
lastName                   | Director last name            | Text
dateOfBirth                | Date of birth                 | YYYY-MM-DD
countryOfResidenceIso3Code | 3 character country code      | Text


## Update business directors

> Example Request:

```shell
curl -X PUT https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/directors \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '[
             {
                 "firstName": "John",
                 "lastName": "Doe",
                 "dateOfBirth": "1982-05-20",
                 "countryOfResidenceIso3Code": "usa"
             },
             {
                 "firstName": "Jane",
                 "lastName": "Doe",
                 "dateOfBirth": "1981-12-07",
                 "countryOfResidenceIso3Code": "usa"
             }
        ]'
```

> Example Response:

```json
[
    {
        "id": 14,
        "firstName": "John",
        "lastName": "Doe",
        "dateOfBirth": "1982-05-20",
        "countryOfResidenceIso3Code": "usa"
    },
    {
        "id": 15,
        "firstName": "Jane",
        "lastName": "Doe",
        "dateOfBirth": "1981-12-07",
        "countryOfResidenceIso3Code": "usa"
    }
]
```
Overrides directors in the business profile.
Returns the list of all directors associated with the business profile.

### Request (Business)
**`PUT https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/directors`**

Field                      | Description                  | Format
---------                  | -------                      |-----------
firstName                  | Director first name          | Text
lastName                   | Director last name           | Text
dateOfBirth                | Date of birth                | YYYY-MM-DD
countryOfResidenceIso3Code | 3 character country code     | Text


## Get business ultimate beneficial owners

> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/ubos \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
[
    {
        "id": "013ab1c2688d0185b582ee7e0bcb28b2",
        "name": "John Doe",
        "dateOfBirth": "1982-05-20",
        "countryOfResidenceIso3Code": "usa",
        "addressFirstLine": "123 Fake St",
        "postCode": "FK 12345",
        "ownershipPercentage": 30
    },
    {
        "id": "912ce3f31c8b3a10572137e78417caa3",
        "name": "Jane Doe",
        "dateOfBirth": "1981-12-07",
        "countryOfResidenceIso3Code": "usa",
        "addressFirstLine": "125 Fake St",
        "postCode": "FK 12545",
        "ownershipPercentage": 70
    }
]
```
Returns the list of all ultimate beneficial owners associated with the business profile.

### Request (Business)
**`GET https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/ubos`**


## Add business ultimate beneficial owners

> Example Request:

```shell
curl -X POST https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/ubos \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '[
             {
                 "name": "John Doe",
                 "dateOfBirth": "1982-05-20",
                 "countryOfResidenceIso3Code": "usa",
                 "addressFirstLine": "123 Fake St",
                 "postCode": "FK 12345",
                 "ownershipPercentage": 30
             },
             {
                 "name": "Jane Doe",
                 "dateOfBirth": "1981-12-07",
                 "countryOfResidenceIso3Code": "usa",
                 "addressFirstLine": "125 Fake St",
                 "postCode": "FK 12545",
                 "ownershipPercentage": 40
             }
        ]'
```

> Example Response:

```json
[
     {
         "id": "f3e71aa1c97448d0b1eb5bdc0bacdcce",
         "name": "John Doe",
         "dateOfBirth": "1982-05-20",
         "countryOfResidenceIso3Code": "usa",
         "addressFirstLine": "123 Fake St",
         "postCode": "FK 12345",
         "ownershipPercentage": 30
     },
     {
         "id": "c6008d58a1664413b4c4dcacec1377f4",
         "name": "Jane Doe",
         "dateOfBirth": "1981-12-07",
         "countryOfResidenceIso3Code": "usa",
         "addressFirstLine": "125 Fake St",
         "postCode": "FK 12545",
         "ownershipPercentage": 40
     },
     {
         "id": "63bbdd1cf5ec4dd587597e74dbace376",
         "name": "Oliver Wilson",
         "dateOfBirth": "2017-12-31",
         "countryOfResidenceIso3Code": "gbr",
         "addressFirstLine": "222 Fake St",
         "postCode": "FK 22222",
         "ownershipPercentage": 30
     }
]
```
Adds new ultimate beneficial owners to the business profile.
Returns the list of all ultimate beneficial owners associated with the business profile.

### Request (Business)
**`POST https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/ubos`**

Field                      | Description                    | Format
---------                  | -------                        |-----------
name                       | Owner full name                | Text
dateOfBirth                | Date of birth                  | YYYY-MM-DD
countryOfResidenceIso3Code | 3 character country code       | Text
addressFirstLine           | First line of address          | Text
postCode                   | Address post code              | Text
ownershipPercentage        | Percentage of ownership        | Integer


## Update business ultimate beneficial owners

> Example Request:

```shell
curl -X PUT https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/ubos \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '[
             {
                 "name": "John Doe",
                 "dateOfBirth": "1982-05-20",
                 "countryOfResidenceIso3Code": "usa",
                 "addressFirstLine": "123 Fake St",
                 "postCode": "FK 12345",
                 "ownershipPercentage": 30
             },
             {
                 "name": "Jane Doe",
                 "dateOfBirth": "1981-12-07",
                 "countryOfResidenceIso3Code": "usa",
                 "addressFirstLine": "125 Fake St",
                 "postCode": "FK 12545",
                 "ownershipPercentage": 70
             }
        ]'
```

> Example Response:

```json
[
     {
         "id": "ff01cf3f206b40c090a14a1e51163e9e",
         "name": "John Doe",
         "dateOfBirth": "1982-05-20",
         "countryOfResidenceIso3Code": "usa",
         "addressFirstLine": "123 Fake St",
         "postCode": "FK 12545",
         "ownershipPercentage": 30
     },
     {
         "id": "c36b687d28ad44ad8c3864411f5f2612",
         "name": "Jane Doe",
         "dateOfBirth": "1981-12-07",
         "countryOfResidenceIso3Code": "usa",
         "addressFirstLine": "125 Fake St",
         "postCode": "FK 12545",
         "ownershipPercentage": 70
     }
]
```
Overrides ultimate beneficial owners in the business profile.
Returns the list of all ultimate beneficial owners associated with the business profile.

### Request (Business)
**`PUT https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/ubos`**

Field                      | Description                    | Format
---------                  | -------                        |-----------
name                       | Owner full name                | Text
dateOfBirth                | Date of birth                  | YYYY-MM-DD
countryOfResidenceIso3Code | 3 character country code       | Text
addressFirstLine           | First line of address          | Text
postCode                   | Address post code              | Text
ownershipPercentage        | Percentage of ownership        | Integer


## Open update window

> Example Request:

```shell
curl -X POST https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/update-window \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json

```

Opens the update window for updating the profile information: details, addresses, directors, owners, others.

### Request
**`POST https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/update-window`**


## Close update window

> Example Request:

```shell
curl -X DELETE https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/update-window \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json

```

Deletes the update window for updating the profile.

### Request
**`POST https://api.sandbox.transferwise.tech/v1/profiles/{profileId}/update-window`**
