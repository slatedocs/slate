# Profile screen

> Profile success JSON response:

```json
{
   "account_info":
                {
    "account" : "acct_17pzoTIyisaMoG29",
    "account_holder_name" : null,
    "account_holder_type" : null,
    "bank_name" : "STRIPE TEST BANK",
    "country" : "US",
    "currency" : "usd",
    "default_for_currency" : true,
    "fingerprint" : "4skNK23S8tBgvM74",
    "id" : "ba_17pzp6IyisaMoG29QiRVv4Qu",
    "last4" : "6789",
    "metadata" : {},
    "name" : null,
    "object" : "bank_account",
    "routing_number" : "110000000",
    "status"  : "new"
                },
    "user":
        {
        "id" : 1,
        "provider" : "email",
        "address" : "karur",
        "approved_at" : null,
        "bank_linked" : false,
        "country" : "US",
        "created_at" : "2016-04-25T05:42:50.936-04:00",
        "credit_limit" : "500.0",
        "dob" : "1993-05-18T00:00:00.000-04:00",
        "email" : "Noverdraft@mallow-tech.com",
        "first_name" : "noverdraft",
        "last_name" : "API",
        "interest_rate" : "0.1",
        "name" : null,
        "plaid_access_token" : null,
        "plaid_account_id" : null,
        "rejected_at" : null,
        "ssn" : "0000",
        "stripe_customer_id" : null,
        "stripe_publishable_key" : "pk_test_SEuR6jJ2tHPdkkliLuBKh3n6",
        "stripe_token" : "sk_test_yin5qoTttQbiG3IDQheV5nQS",
        "stripe_user_id" : "acct_1846EvHkFKCmZoGT",
        "tc_accepted_at" : null,
        "uid" : "Noverdraft@mallow-tech.com",
        "updated_at" : "2016-04-25T05:42:50.936-04:00"
        }
}
```

### HTTP Request

`GET http://dev-web.ydftay8q3x.us-west-2.elasticbeanstalk.com/api/v1/profile/show`

# Profile update

> profile update success JSON response:

```json
{
   "data":
        {
        "id" : 1,
        "provider" : "email",
        "address" : "karur",
        "approved_at" : null,
        "bank_linked" : false,
        "country" : "US",
        "created_at" : "2016-04-25T05:42:50.936-04:00",
        "credit_limit" : "500.0",
        "dob" : "1993-05-18T00:00:00.000-04:00",
        "email" : "Noverdraft@mallow-tech.com",
        "first_name" : "noverdraft",
        "last_name" : "API",
        "interest_rate" : "0.1",
        "name" : null,
        "plaid_access_token" : null,
        "plaid_account_id" : null,
        "rejected_at" : null,
        "ssn" : "0000",
        "stripe_customer_id" : null,
        "stripe_publishable_key" : "pk_test_SEuR6jJ2tHPdkkliLuBKh3n6",
        "stripe_token" : "sk_test_yin5qoTttQbiG3IDQheV5nQS",
        "stripe_user_id" : "acct_1846EvHkFKCmZoGT",
        "tc_accepted_at" : null,
        "uid" : "Noverdraft@mallow-tech.com",
        "updated_at" : "2016-04-25T05:42:50.936-04:00"
        }
}
```
### HTTP Request

`PATCH http://dev-web.ydftay8q3x.us-west-2.elasticbeanstalk.com/api/v1/profile`

### sign up Parameters

Parameter | Required | type
--------- | ------- | -----------
first_name | true | String
last_name | true | String
address | true | String

# Change password

> change password success JSON response:

```json
{
  "user":
       {
       "id" : 1,
       "provider" : "email",
       "address" : "karur",
       "approved_at" : null,
       "bank_linked" : false,
       "country" : "US",
       "created_at" : "2016-04-25T05:42:50.936-04:00",
       "credit_limit" : "500.0",
       "dob" : "1993-05-18T00:00:00.000-04:00",
       "email" : "Noverdraft@mallow-tech.com",
       "first_name" : "noverdraft",
       "last_name" : "API",
       "interest_rate" : "0.1",
       "name" : null,
       "plaid_access_token" : null,
       "plaid_account_id" : null,
       "rejected_at" : null,
       "ssn" : "0000",
       "stripe_customer_id" : null,
       "stripe_publishable_key" : "pk_test_SEuR6jJ2tHPdkkliLuBKh3n6",
       "stripe_token" : "sk_test_yin5qoTttQbiG3IDQheV5nQS",
       "stripe_user_id" : "acct_1846EvHkFKCmZoGT",
       "tc_accepted_at" : null,
       "uid" : "Noverdraft@mallow-tech.com",
       "updated_at" : "2016-04-25T05:42:50.936-04:00"
        }
}
```
### HTTP Request

`PATCH http://dev-web.ydftay8q3x.us-west-2.elasticbeanstalk.com/api/v1/change/password`

### Change password Parameters

Parameter | Required | type
--------- | ------- | -----------
current_password | true | String
password | true | String
password_confirmation | true | String

# Interest rate

> Interest rate success JSON response:

```json
{
  "interest_rate": "0.1"
}
```
### HTTP Request

`GET http://dev-web.ydftay8q3x.us-west-2.elasticbeanstalk.com/api/v1/interest_rate`
