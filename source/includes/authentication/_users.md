## User Tokens

```shell
curl -X POST {server_url}/api/v1/sso_auth/auth_token
-H "Content-type: application/json"
-d '{ "auth": {
         "first_name": "firstname",
         "last_name": "lastname",
         "gender": "M",
         "birthdate": "31-12-1960",
         "subscriber_id": "subscriberid",
         "member_id": "memberid",
         "phone": "555-555-5555",
         "email": "some@email.com",
         "address1": "address1",
         "address2": "address2",
         "city": "Sunrise",
         "state": "FL",
         "zip": "33303",
         "relationship": "Self",
         "primary_first_name": "",
         "primary_last_name": "",
         "primary_gender": "",
         "primary_birthdate": "",
         "primary_subscriber_id": "",
         "primary_member_id": "",
         "primary_address1": "",
         "primary_address2": "",
         "primary_city": "",
         "primary_state": "",
         "primary_zip": ""
       },
       "org": {
         "ou": "ou",
         "request_timestamp": "1509727623.5845659",
         "enterprise_hash": "YTBmNjVlNzFlODJlNmU3ZGQ5NjZlZDExODlhYTE2MDhmZWY4NDVmYTQ0ZmZkMmI0NzFlOGMyMWQ4ZWM3N2FjZg=="
       },
       "api": {
         "api_key": "my_api_key",
         "password": "my_password"
       }
     }'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/api/v1/sso_auth/auth_token",
  :headers => {
    "Content-type" => "application/json"
  },
  :payload => {
      "auth" => {
        "first_name" => "firstname",
        "last_name" => "lastname",
        "gender" => "M",
        "birthdate" => "31-12-1960",
        "subscriber_id" => "subscriberid",
        "member_id" => "memberid",
        "phone" => "555-555-5555",
        "email" => "some@email.com",
        "address1" => "address1",
        "address2" => "address2",
        "city" => "Sunrise",
        "state" => "FL",
        "zip" => "33303",
        "relationship" => "Self",
        "primary_first_name" => "",
        "primary_last_name" => "",
        "primary_gender" => "",
        "primary_birthdate" => "",
        "primary_subscriber_id" => "",
        "primary_member_id" => "",
        "primary_address1" => "",
        "primary_address2" => "",
        "primary_city" => "",
        "primary_state" => "",
        "primary_zip" => ""
      },
      "org" => {
        "ou" => "ou",
        "request_timestamp" => "1509727623.5845659",
        "enterprise_hash" => "YTBmNjVlNzFlODJlNmU3ZGQ5NjZlZDExODlhYTE2MDhmZWY4NDVmYTQ0ZmZkMmI0NzFlOGMyMWQ4ZWM3N2FjZg=="
      },
      "api" => {
        "api_key" => "my_api_key",
        "password" => "my_password"
      }
  }
).execute
```
>  Enterprise hash offers a higher level of security against the requests being replayed by a third party by limiting the time a request is valid to five minutes. To set up a shared secret key, please reach out to your Account Manager.

> The above command returns JSON structured like this:

```json
{
  "jwt": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOjUyLCJ1c2VybmFtZSI6ImRlbW9wYXRpZW50MSIsInByaW1hcnlfYWN0aW5nX2FzX2FnZW50IjpmYWxzZSwiZGV2aWNlX29zIjoiQW5kcm9pZCIsImFwcF9pZCI6Ik1ETElWRSIsImFwcF92ZXJzaW9uIjoiMTA1MSIsImFwaV9jcmVkX2lkIjoxLCJleHAiOjE1MDgzNTM5MTF9.orRpY5qV6f7NVAmOIX9-ZB92U-omf_rVjLZ6IyVxfU0",
  "user": {
    "id": 52,
    "type": "Patient",
    "time_to_live_minutes": 60
  }
}
```

To obtain an API JWT Token for a user

### HTTP Request

`POST {server_url}/api/v1/sso_auth/auth_token`

### Header Parameter

Parameter | Default
--------- | -------
Content-type | application/json


### Request Body

Attribute | Required | Description
--------- | ------- | -----------
auth | true | parent attribute specifying user information to update or create in MDLIVE
↳&nbsp;first_name | true | User's first name
↳&nbsp;last_name | true | User's last name
↳&nbsp;gender | true | User's gender, specified as 'M' for male, 'F' for female
↳&nbsp;birthdate | true | User's birthdate, specified as year-month-day
↳&nbsp;subscriber_id | true | User's subscriber id
↳&nbsp;member_id | false | user's member id
↳&nbsp;phone | true | User's contact phone number
↳&nbsp;email | true | User's email address
↳&nbsp;address1 | true | First line of user's mailing address
↳&nbsp;address2 | false | Second line of user's mailing address, if needed
↳&nbsp;city | true | City of user's mailing address
↳&nbsp;state | true | State of user's mailing address
↳&nbsp;zip | true | Zip code of user's mailing address
↳&nbsp;relationship | true | Relationship of user to primary account holder. Specified as either 'Self', 'Spouse', 'Child', or 'Other Adult'
↳&nbsp;primary_first_name | false | First name of primary account holder, if user is not primary
↳&nbsp;primary_last_name | false | Last name of primary account holder, if user is not primary
↳&nbsp;primary_gender | false | Gender of primary account holder, if user is not primary, specified as 'M' for male, 'F' for female
↳&nbsp;primary_birthdate | false | Birthdate of primary account holder, if user is not primary, specified as day-month-year
↳&nbsp;primary_subscriber_id | false | Subscriber id of primary account holder, if user is not primary
↳&nbsp;primary_member_id | false | Member id of primary account holder, if user is not primary
↳&nbsp;primary_address1 | false | First line of mailing address for primary account holder, if user is not primary
↳&nbsp;primary_address2 | false | Second line of mailing address for primary account holder, if user is not primary
↳&nbsp;primary_city | false | City of mailing address for primary account holder, if user is not primary
↳&nbsp;primary_state | false | State of mailing address for primary account holder, if user is not primary
↳&nbsp;primary_zip| false | Zip code of mailing address for primary account holder, if user is not primary
org | true | parent attribute for calling organizational information
↳&nbsp;ou | true | Organizational unit identifier assigned by MDLIVE
↳&nbsp;request_timestamp | false | Timestamp of request, specified as floating point number of seconds since the Epoch
↳&nbsp;enterprise_hash | false | Base64 encoded SHA-256 digest of memberid, request_timestamp, and a shared secret digest key
api | true | parent attribute of api_key and password
↳&nbsp;api_key | true | Unique key assigned to you by your account manager
↳&nbsp;password | true | Unique password assigned to key by your account manager

<aside class="notice">
 Although making use of the enterprise hash is optional, it does offer a higher level of security against the requests being replayed by a third party.
  It will limit the amount of time a request is valid to five minutes. To set up a shared secret key, please reach out to your Account Manager.
</aside>