

# User APIs

You need to login using your zoomsymbols account before using those APIs

## Get Profile

Get your user profile


```APIs
GET https://dev.zoomsymbols.com/api/user/getProfile
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


## Set Profile

Set your user profile

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

## Get Global User Settings

Get mobile global settings for a user


```APIs
GET https://dev.zoomsymbols.com/api/user/settings/getDefaultSettings
```

> Response

```json
{
"result":{
  "user_setting_id":664,
  "user_id":"7b3bxxxxx",
  "username":"Alex",
  "is_default":false,
  ...
  } 

}
```
## Set Global User Settings

Set mobile global settings for a user



```APIs
POST https://dev.zoomsymbols.com/api/user/settings/setDefaultSettings
```

> Params

```json
{
  "symbol_id": "92",
  "auto_sign_in": "0",
  "timezone_id" : "1",
  "convert_currency_id_from" : "1",
  "convert_currency_id_to" : "2",
  "set_automatically_timezone" : true,
  "exchange_code" : "AAB",
  "exchange_id" : "1",
  "send_daily_market_email_report" : true,
  "send_daily_portfolio_email_report" : true    
}
```


## Reset Global User Settings

Reset mobile global settings for a user


```APIs
POST https://dev.zoomsymbols.com/api/user/settings/resetDefaultSettings
```


## Get Today App User Settings (Mobile)

Get mobile global settings for a user


```APIs
GET https://dev.zoomsymbols.com/api/user/settings/getTodayAppSettings
```

> Response

```json
{
"result":{
  "user_setting_id":664,
  "user_id":"7b3bxxxxx",
  "username":"Alex",
  "is_default":false,
  ...
  } 

}
```

## Set Today App User Settings

Set mobile global settings for a user


```APIs
POST https://dev.zoomsymbols.com/api/user/settings/setTodayAppSettings
```

> Params

```json
{
  "enable_earning": "1",
  "enable_news": "1",
  "enable_market_equity" : "0",
  "enable_market_commodity" : "0",
  "enable_market_global_instrument" : "0"
}
```
