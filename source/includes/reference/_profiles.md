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
Thus creating multiple profiles with the same details will fail.

### Request

**`POST https://api.sandbox.transferwise.tech/v1/profiles`**

Field                   | Description                   | Format
---------               | -------                       | -----------
type                    | "personal"                    | Text
details.firstName       | First name                    | Text
details.lastName        | Last name                     | Text
details.dateOfBirth     | Date of birth                 | YYYY-MM-DD
details.phoneNumber     | Phone number                  | Text


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
Request and response is same as described in [Create (Personal)](#user-profile-create-personal) and [Create (Business)](#user-profile-create-business)



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

**`POST https://api.sandbox.transferwise.tech/v1/profiles`**

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

