Courses
=======

List Courses
------------

```ruby
require 'manabu'
courses = Manabu::Courses.new(client).all
```

```shell
curl -X GET :endpoint:/api/v1/courses -H 'Authorization: :auth_token:'
```

Register course
---------------

| Parameter              | Required | Description            |
| ---------------------- | -------- | ---------------------- |
| code                   | true     |                        |
| syllabus_id            | false    |                        |

```shell
  curl -X POST :endpoint:/api/v1/courses?code=Science101 \
    -H 'Authorization: :auth_token:'
```

```ruby
require "manabu"

new_course = Manabu::Courses.new(client).register(code: 'science101')
# or
course = Manabu::Course.new(code: 'science101')
new_course = Manabu::Courses.new(client).register(course)
```
