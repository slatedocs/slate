# Authentication

<aside class="warning">Auth token must be refreshed. Auth token expire after 3 minutes. Refresh token is valid 20 minutes</aside>

## initial authentication

| Parameter | Required | Description                      |
| --------- | -------- | -------------------------------- |
| username  | true     | username for authentication      |
| password  | true     | user password for uathentication |

```shell
curl -X POST \
':endpoint:/api/v1/authenticate?username=:username:&password=:password:'
```

```ruby
require 'manabu'
client = Manabu::Client.new(':username:', ':password:', ':endpoint:', 9000,
  force_secure_connection: true
)
```

## refresh

| Parameter     | Required | Description                                      |
| ------------- | -------- | ------------------------------------------------ |
| refresh_token | true     | send :refresh_token: from authentication request |

```shell
curl -X POST \
':endpoint:/api/v1/authenticate/refresh/refresh_token=:refresh_token:'
```
