# Signup

> Signup success JSON response:

```json
{
"status" : "success",
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

`POST http://dev-web.ydftay8q3x.us-west-2.elasticbeanstalk.com/api/v1/users`

### sign up Parameters

Parameter | Required | type
--------- | ------- | -----------
email | true | String
first_name | true | String
last_name | true | String
address | true | String
dob | true | Date
country | true | String
password | true | String
password_confirmation | true | String
