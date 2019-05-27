# Subscriber Referral Voucher
*Currently this feature is available only for accounts that use Voucherify*

Every subscriber has a referral voucher code that he can share with others.

## GET Referral voucher for a user

```shell--request
$ curl -H "X-SUBAUTH: <auth-token>" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/referral_voucher.json

```
```shell--response
{
    "referral_voucher": {
        "provider": "voucherify",
        "code": "MY_REFERRAL",
        "subscriber_id": 998
    }
}
```


This API will return the referral voucher code for a user.

It will accept the primary identity via URL parameters, and will also accept query parameters `alternate_provider`, `alternate_identitiy` and `name`.