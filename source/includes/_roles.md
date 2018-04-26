Roles
=====

Get roles list
--------------

```ruby
require 'manabu'

Manabu::Roles.new(client).all
```

```shell
curl http://localhost:9000/api/v1/roles
  -H 'Authorization: :auth_token:'
```
