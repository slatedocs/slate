# Users

## Sign Up with Registration Code
> Example Request:

```shell

curl -X POST https://api.sandbox.transferwise.tech/v1/user/signup/registration_code \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "email": "joe@gmail.com",
          "registrationCode": "a94a8fe5ccb19ba61c4c0873d391e987982fbbd3a94a8fe5ccb19ba61c4c0873d391e987982fbbd3"
        }'


```

> Example Response:

```json
{
  "id": <user id>,
  "name": null,
  "email": "jose@gmail.com",
  "active": true,
  "details": null
}
```

Please read how to create new users at [Bank Integrations Guide](#bank-integrations-guide).<br/>
This endpoint allows to onboard new users to TransferWise using email and registration code. 
TransferWise uses email address as customer unique identifier. 
When you are submitting an email which already exists among TransferWise customers you will get a warning that
"You’re already a member. Please login".
<br/>
If email is new (does not have active user) then new user will be created.

### Request
**`POST https://api.sandbox.transferwise.tech/v1/user/signup/registration_code`**

Field                   | Description                   | Format
---------               | -------                       | -----------
email                   | User email                | Email
registrationCode        | Generated registration code   | Text, min length is 32 chars


### Response
Field                   | Description               | Format
---------               | -------                   | -----------
id                      | userId                   | Integer
name                    | User full name. Empty.    | Text
email                   | Customer email            | Text
active                  | true                      | Boolean
details                 | User details. Empty.      | Group



## Get By Id
> Example Request:

```shell

curl -X GET https://api.sandbox.transferwise.tech/v1/users/{userId} \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
{
  "id": 294205,
  "name": "Oliver Wilson",
  "email": "oliver@gmail.com",
  "active": true,
  "details": {
    "firstName": "Oliver",
    "lastName": "Wilson",
    "phoneNumber": "+3725064992",
    "occupation": "",
    "address": {
      "city": "Tallinn",
      "countryCode": "EE",
      "postCode": "12112",
      "state": "",
      "firstLine": "Salu tee 134"
    },
    "dateOfBirth": "1977-07-01",
    "avatar": "https://lh6.googleusercontent.com/-XzeFZ2PJE1A/AAAAAAAAAAI/AAAAAAAAAAA/RvuvhXFsqs0/photo.jpg",
    "primaryAddress": 236532
  }
}
```
Get authenticated user details by user id. Response includes also personal user profile info.

### Request
**`GET https://api.sandbox.transferwise.tech/v1/users/{userId}`**


### Response
Field                   | Description                    | Format
---------               | -------                        | -----------
id                      | userId                         | Integer
name                    | User full name                 | Text
email                   | User email                     | Text
active                  | If user is active or not       | Boolean
details.firstName       | User first name                | Text
details.lastName        | User lastname                  | Text
details.phoneNumber     | Phone number                   | Text
details.dateOfBirth     | Date of birth                  | YYYY-MM-DD
details.occupation      | Person occupation              | Text
details.avatar          | Link to person avatar image    | Text
details.primaryAddress  | Address object id              | Integer
details.address.country  | Address country code in 2 digits. "US" for example            | Text
details.address.firstLine  | Address first line          | Text
details.address.postCode    | Address post code          | Text
details.address.city        | Address city name          | Text
details.address.state  | Address state code State code. Required if country is US, CA, AU, BR. | Text
details.address.occupation  | User occupation. Required for US, CA, JP         | Text

