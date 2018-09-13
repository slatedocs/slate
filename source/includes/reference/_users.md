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

This endpoint is related to [Bank Integrations](#bank-integrations-guide) product.<br/>
It  allows to onboard new users to TransferWise using email and registration code. 

TransferWise uses email address as unique identifier for users. 
When you are submitting an email which already exists among TransferWise customers you will get a warning that
"You’re already a member. Please login".

TODO --  copy all this text here!!!


Add this logic to #users-sign-up-with-registration-code



  Step 1: Get client credentials OAuth token

      Request POST /oauth/token
      HTTP Basic using client ID for username and client secret as a password.
      Body - Form
      grant_type=client_credentials

      response
      {
        "access_token": "01234567-89ab-cdef-0123-456789abcdef",
        "token_type": "bearer",
        "expires_in": 43199,
        "scope": "transfers"
      }
      
  Step 2: Create user
  
      Request POST /v1/user/signup/registration_code
      Bearer ${clientCredentialsToken} header
      {
      "email": "${email}",
      "registrationCode": "${registration code}"
      }

      ${email} — new user's email address
      ${registration code} — random value that is unique to this user, at least 32 characters long
  
      NB: Please apply the same security standards to handling registration code as if it was a password.
      

      Response — Success (201)
      {
        "id": 12345,
        "name": null,
        "email": "new.user@domain.com",
        "active": true,
        "details": null
      }
      
        

      Response — Failure (409): User already exists
      {
        "errors": [
          {
            "code": "NOT_UNIQUE",
            "message": "You’re already a member. Please login",
            "path": "email",
            "arguments": [
              "email",
              "class com.transferwise.fx.api.ApiRegisterCommand",
              "existing.user@domain.com"
            ]
          }
        ]
      }
      
      If user already exists then authorization_code  should be used instead.
      

  Step 3: Get user token
  POST /oauth/token
  
  Authentication
  HTTP Basic using client ID for username and client secret as a password.
  Body — Form
  
   grant_type=registration_code
    client_id=${client id}
    email=${email}
    registration_code=${registration code from step 2}

    Step 3 can be repeated as long as user does reclaim their TransferWise account.
    
    Response — Success (200)
    {
      "access_token": "01234567-89ab-cdef-0123-456789abcdef",
      "token_type": "bearer",
      "refresh_token": "01234567-89ab-cdef-0123-456789abcdef",
      "expires_in": 43199,
      "scope": "transfers"
    }

    Response — Failure (401): User reclaimed the account or invalid registration code used
    {
      "error": "invalid_grant",
      "error_description": "Invalid user credentials."
    }


  If user has reclaimed the account, then authorization_code  should be used instead.
  
  refresh token works same way as for the other flow.




TODO ---
<br/>
If email is new (does not have active user) then new user will be created.

### Request
**`POST https://api.sandbox.transferwise.tech/v1/user/signup/registration_code`**

Field                   | Description                   | Format
---------               | -------                       | -----------
email                   | User email                | Email
registrationCode        | Generated registration code. You need your registration code later to obtain access token on behalf of this newly created user.   | Text, min length is 32 chars


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

