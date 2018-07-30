# Extras

## Index

```ruby
require 'rest-client'

RestClient.get('https://app.procurementexpress.com/api/v1/extras')
```

```shell
curl 'https://app.procurementexpress.com/api/v1/extras'
  -X GET
  -H "Content-Type: application/json"
```

> The above command returns JSON structured like this:

```json
{
  "response": "Done"
}
```

Wait for 3 seconds and return a json response. Used for testing mobile app functionality.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/extras`





## Locales

```ruby
require 'rest-client'

RestClient.get('https://app.procurementexpress.com/api/v1/locales/en')
```

```shell
curl 'https://app.procurementexpress.com/api/v1/locales/en'
  -X GET
  -H "Content-Type: application/json"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": "myAccount.title",
    "value": "My account"
  },
  {
    "id": "myAccount.name",
    "value": "Name"
  },
  {
    "id": "myAccount.email",
    "value": "Email"
  },
  {
    "id": "myAccount.companies",
    "value": "Companies"
  },
  ....
]
```

Get list of locales depending on `locale` params

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/locales/:locale`

### URL Parameters

| Params   | Type   | Description      |
| -------- | ------ | -----------      |
| locale   | string | Valid locale key |

### Locale Keys

Supported locales right now are listed below

| locale  | Description              |
| ------- | -----------              |
| de      | German - Germany         |
| en_GB   | English - Great Braitain |



## Track

```ruby
require 'rest-client'

RestClient.get(
'https://app.procurementexpress.com/api/v1/track',
  {
    tracking_info: {
      event: 'yyy',
      authentication_token: 'token',
      properties: {
        uuid: 'somerandomuid',
        is_web_view: false,
        is_ipad: false,
        is_ios: true,
        is_android: false,
        platform: 'ios',
        version: 0,
        uuid: 'n/a'
      }
    }
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/track'
  -X GET
  -H "Content-Type: application/json"
  -d "tracking_info[event]=yyy"
  -d "tracking_info[authentication_token]=token"
  -d "tracking_info[properties][uuid]=somerandomuid"
  -d "tracking_info[properties][is_web_view]=false"
  -d "tracking_info[properties][is_ipad]=false"
  -d "tracking_info[properties][is_ios]=true"
  -d "tracking_info[properties][is_android]=false"
  -d "tracking_info[properties][platform]=ios"
  -d "tracking_info[properties][version]=0"
  -d "tracking_info[properties][uuid]=n/a"
```

> The above command returns JSON structured like this:

```json
{
  "response": "success",
  "tracking_info": {
    "event": "yyy",
    "authentication_token": "token",
    "properties": {
      "uuid": "n/a",
      "is_web_view": false,
      "is_ipad": false,
      "is_ios": true,
      "is_android": false,
      "platform": "ios",
      "version": 0
    }
  }
}
```

Track segment.io with given params value, and return as a json output.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/track`

### URL Parameters

| Params                                 | Type     | Description          |
| -------                                | -------- | -----------          |
| tracking_info[event]                   | string   | Event format         |
| tracking_info[authentication_token]    | string   | Authentication token |
| tracking_info[properties][uuid]        | string   | UUID                 |
| tracking_info[properties][is_web_view] | boolean  | `true` if Web view   |
| tracking_info[properties][is_ipad]     | boolean  | `true` if IPad       |
| tracking_info[properties][is_ios]      | boolean  | `true` if IPhone     |
| tracking_info[properties][is_android]  | boolean  | `true` if Android    |
| tracking_info[properties][platform]    | string   | platform name        |


## User already registered?

```ruby
require 'rest-client'

RestClient.get('https://app.procurementexpress.com/api/v1/useralreadyregistered?email=test@example.com')
```

```shell
curl 'https://app.procurementexpress.com/api/v1/useralreadyregistered?email=test@example.com'
  -X GET
  -H "Content-Type: application/json"
```

> The above command returns JSON structured like this:

```json
{
  "user_exist": false
}
```

Check if given email is already registered in our server. Returns `true` if
already registered otherwise returns `false`.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/useralreadyregistered?email=...`

### URL Parameters

| Params | Type    | Description            |
| ------ | ------- | ----------             |
| email  | string  | email address to check |

