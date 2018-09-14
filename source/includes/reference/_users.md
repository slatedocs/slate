# Users

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



## Sign Up with Registration Code

> 1) Example Request: Get Client Credentials Token

```shell
curl \
-u '[your-api-client-id]:[your-api-client-secret]' \
-d 'grant_type=client_credentials' \
'https://api.sandbox.transferwise.tech/oauth/token' 
```

> 1) Example Response: Get Client Credentials Token

```json
  {
    "access_token":"ba8k1234-00f2-475a-60d8-6g45377b4062",
    "token_type":"bearer",
    "expires_in": 43199,
    "scope":"transfers"
  }


















```

> 2) Example Request: Create User

```shell

curl -X POST https://api.sandbox.transferwise.tech/v1/user/signup/registration_code \
     -H "Authorization: Bearer <your client credentials token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "email": <user email>,
          "registrationCode": <registration code>
        }'

```

> 2) Example Response: Create User (Success (200) user created successfully)

```json
      {
        "id": 12345,
        "name": null,
        "email": "new.user@domain.com",
        "active": true,
        "details": null
      }

```

> 2) Example Response: Create User (Failure (409): User already exists)

```json
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









```


> 3) Example Request: Get User Tokens

```shell

curl \
-u '[your-api-client-id]:[your-api-client-secret]' \
-d 'grant_type=registration_code' \
-d 'email=<user email>' \
-d 'registration_code=<registration code used to create user>' \
'https://api.sandbox.transferwise.tech/oauth/token' 
```

> 3) Example Response: Get User Tokens (Success: 200)

```json
    {
      "access_token": "01234567-89ab-cdef-0123-456789abcdef",
      "token_type": "bearer",
      "refresh_token": "01234567-89ab-cdef-0123-456789abcdef",
      "expires_in": 43199,
      "scope": "transfers"
    }
```

> 3) Example Response: Get User Tokens (Failure: 401 - User reclaimed the account or invalid registration code used)

```json
    {
      "error": "invalid_grant",
      "error_description": "Invalid user credentials."
    }
```


This feature is related to [Bank Integrations](#bank-integrations-guide) product. 
It enables onboarding new users to TransferWise via backend API calls only. 
To get authorization from Transferwise existing users you still need to redirect them to our authorization webpage.

There are 3 steps you need to go through:
 
### 1) Get Client Credentials Token

Obtain access_token based on your API client credentials. 

### Request

**`POST https://api.sandbox.transferwise.tech/oauth/token`**

Use Basic Authentication with your api-client-id/api-client-secret as username/pwd.


Field                 | Description                                   | Format
---------             | -------                                       | -----------
grant_type            | "client_credentials"                          | Text

### Response

Field                 | Description                                   | Format
---------             | -------                                       | -----------
access_token          | Access token to be used when calling "create user" endpoint. Valid for 12 hours. | uuid
token_type            | "bearer"                                      | Text
expires_in            | Expiry time in seconds                        | Integer
scope                 | "transfers"                                   | Text



### 2) Create User
TransferWise uses email address as unique identifier for users. 
If email is new (there is no active user already) then new user will be created.

When you are submitting an email which already exists amongst our users then you will get a warning that
"You’re already a member. Please login".  If user already exists then you need to redirect to [Get user authorization](#bank-integrations-guide-get-user-authorization) webpage.

### Request

**`POST https://api.sandbox.transferwise.tech/v1/user/signup/registration_code`**

Use access_token obtained in first step as authentication header.

Field                   | Description                   | Format
---------               | -------                       | -----------
email                   | New user's email address      | Email
registrationCode        | Randomly generated registration code that is unique to this user. At least 32 characters long. <br/>You need to store registration code to obtain access token on behalf of this <br/>newly created user in next step. <br/>Please apply the same security standards to handling registration code as if it was a password.  | Text, min length is 32 chars

### Response
Field                   | Description               | Format
---------               | -------                   | -----------
id                      | userId                    | Integer
name                    | User full name. Empty.    | Text
email                   | Customer email            | Text
active                  | true                      | Boolean
details                 | User details. Empty.      | Group


### 3) Get User Tokens
You can now use registration code to obtain user access token and refresh token. 
This step can be repeated as long as user does not reclaim their TransferWise account. 
If user has reclaimed the account, then redirect to [Get user authorization](#bank-integrations-guide-get-user-authorization) flow should be used instead.

[Refresh user access token](#bank-integrations-guide-refresh-user-access-token) works same way for this flow as well.

### Request
**`POST https://api.sandbox.transferwise.tech/oauth/token`**

Use Basic Authentication with your api-client-id/api-client-secret as username/pwd.

Field                 | Description                                   | Format
---------             | -------                                       | -----------
grant_type            | "registration_code"                           | Text
email                 | New user's email address                      | Email
registration_code     | registrationCode from step 2                | Text

### Response

Field                 | Description                                   | Format
---------             | -------                                       | -----------
access_token          | Access token to be used when calling API endpoints on behalf of user. Valid for 12 hours. | uuid
token_type            | "bearer"                                      | Text
refresh_token         | Refresh token which you need to use in order to request new access_token. The lifetime of refresh tokens is 10 years. | uuid
expires_in            | Expiry time in seconds                        | Integer
scope                 | "transfers"                                   | Text
