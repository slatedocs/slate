Syllabuses
=======

List Syllabuses
------------

```ruby
require 'manabu'
syllabuses = Manabu::Syllabuses.new(client).all
```

```shell
curl -X GET :endpoint:/api/v1/syllabuses -H 'Authorization: :auth_token:'
```

Register course
---------------

| Parameter              | Required | Description            |
| ---------------------- | -------- | ---------------------- |
| code                   | true     |                        |
| name                   | true     |                        |

```shell
  curl -X POST :endpoint:/api/v1/syllabuses?code=science101&name=Science 101 \
    -H 'Authorization: :auth_token:'
```

```ruby
require "manabu"

new_course = Manabu::Syllabuses.new(client).register(code: 'science101'. name: 'Science 101')
# or
course = Manabu::Course.new(code: 'science101'. name: 'Science 101')
new_course = Manabu::Syllabuses.new(client).register(course)
```
