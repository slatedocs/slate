# Contact Types

## Get contact types list

```shell
curl -X GET :endpoint:/api/v1/contact_types -H 'Authorization: :auth_token:'
```

```ruby
require 'manabu'
Manabu::ContactTypes.new(client).all
```

## Register new contact type

```shell
curl -X POST :endpoint:/api/v1/contact_types?name=test \
  -H 'Authorization: :auth_token:'
```

```ruby
require "manabu"
Manabu::ContactTypes.new(client).register('test')
```
