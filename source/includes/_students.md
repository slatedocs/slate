Students
========

Student resources

Get students list
-----------------

```shell
  curl -X GET :endpoint:/api/v1/students -H 'Authorization: :auth_token:'
```

```ruby
require 'manabu'
Manabu::Students.new(client).roster
```

Filter students
---------------

Filter students with condition

| Condition              | Description            |
| ---------------------- | ---------------------- |
| enrollment_status      | filter by enrollment status code|

```ruby
  Manabu::Students.new(client).filter(enrollment_status: 'enrolled')
```


Create new student
------------------

| Parameter              | Required | Description            |
| ---------------------- | -------- | ---------------------- |
| name                   | true     | student name           |
| surname                | true     | student surname        |
| name_reading           | false    | name reading           |
| surname_reading        | false    | surname reading        |
| middle_name            | false    | middle name            |
| middle_name_reading    | false    | middle name reading    |
| birth_date             | false    | birth_date             |
| gender                 | false    | gender                 |
| enrollment_status_code | false    | enrollment status code |
| picture                | false    | multipart file field   |

```shell
  curl -X POST :endpoint:/api/v1/students?name=john&surname=doe \
    -H 'Authorization: :auth_token:'
```

```ruby
require "manabu"

new_user = Manabu::Students.new(client).register(name: 'john', surname: 'Doe')
#or
user = Manabu::Student.new(name: 'john', surname: 'doe')
new_user = Manabu::Students.new(client).register(user)
```

Update a student
----------------

Update student attribute

| Parameter              | Required | Description            |
| ---------------------- | -------- | ---------------------- |
| name                   | false    | student name           |
| surname                | false    | student surname        |
| name_reading           | false    | name reading           |
| surname_reading        | false    | surname reading        |
| middle_name            | false    | middle name            |
| middle_name_reading    | false    | middle name reading    |
| birth_date             | false    | birth_date             |
| gender                 | false    | gender                 |
| enrollment_status_code | false    | enrollment status code |
| picture                | false    | multipart file field   |

```shell
curl -X PATCH :endpoint:/api/v1/students/1?name=jane \
  -H 'Authorization: :auth_token:'
```

```ruby
  require 'manabu'

  user = Manabu::User.new(id: 1)
  user.set(name: 'jane', surname: 'doe')
```

Get a student picture
---------------------

Get picture file

```shell
  curl ':endpoint:/api/v1/students/:id:/picture'
```

```ruby
  require 'manabu'
  user = Manabu::User.new(id: 1)
  user.picture
```

Set Picture to a student
------------------------

```shell

```

```ruby
  require 'manabu'
  student = Manabu::Student.new(id: 1)
  student.set_picture('path/to/file')
```

Add guardian to а student

```shell
curl -X POST :endpoint:/api/v1/students/:id:/student_guardians?guardian_id=:guardian_id: \
  -H 'Authorization: :auth_token:'
```

```ruby
  require 'manabu'
  student = Manabu::Student.new(client, id: 1)
  guardian = Manabu::Guardian.new(client, id: 1)
  student.add_guardian(guardian)
```

List student guardians
----------------------

```shell
  curl -X POST :endpoint:/api/v1/students/:id:/guardians\
    -H 'Authorization: :auth_token:'
```

```ruby
require 'manabu'
student = Manabu::Student.new(client, id: 1)
student.guardians
```

List student courses
----------------------

```shell
  curl -X POST :endpoint:/api/v1/students/:id:/courses\
    -H 'Authorization: :auth_token:'
```

```ruby
require 'manabu'
student = Manabu::Student.new(client, id: 1)
student.courses
```
