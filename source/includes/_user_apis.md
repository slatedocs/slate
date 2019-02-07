

# User APIs

You need to login using your zoomsymbols account before using those APIs

## Get Profile

```APIs
GET https://dev.zoomsymbols.com/api/user/getProfile
```

## Set Profile

```
POST https://dev.zoomsymbols.com/api/user/setProfile
```
> Params

```json
{
  "first_name": "Alex",
  "last_name": "Alex",
  "phone_number" : "xxxxx",
  "title" : "Developer",
  "bio": "Your bio"
}
```

> Response

```json
{
  "result": {
    "id": "5cde2208-1078-11e8-ae1b-83714d76deca",
    "email": "xxxx",
    "username": "xxxx",
    "phone_number": "xxxxx",
    "phone_number_confirmed": true,
    "email_confirmed": true,
    "two_factor_enabled": false,
    "status_id": 1,
    "status": "active",
    "first_name": "xxxxx",
    "last_name": "xxxx",
    "display_name": "xxx xxxx",
    "picture": null,
    "profile_image": "/api/user/profile/image/xxxx",
    "gender": null,
    "location": null,
    "website": null,
    "organization": "EquEum",
    "title": "Developer",
    "best_time_to_call": "Evening",
    "is_public": true,
    "user_data": null,
    "bio": "This is the Bio for BIO",
    "create_date": "2018-09-14T07:20:16.650Z",
    "locale": null,
    "is_rtl": null,
    "subscription_status": "active",
    "is_subscription_active": true,
    "subscription_plan_id": 2,
    "subscription_expiry_date": "2019-12-29T23:57:00+00:00"
  }
}
```

