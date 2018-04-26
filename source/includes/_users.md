# Users

## Index

Retrieves list of all users

<aside class="warning">Only admin user can retrieve users</aside>

```shell
curl -X GET :endpoint:/api/v1/users -H 'Authorization: :auth_token:'
```

```ruby
require "manabu"
users = Manabu::Users.new(client).all
```

## Create

Create new user

| Parameter      | Required | Description             |
| -------------- | -------- | ----------------------- |
| email          | true     | User email address      |
| username       | true     | username                |
| password       | true     | User password min.6     |
| disabled       | false    | disable user            |
| disalbed_until | false    | disable user until date |

```shell
curl \
  -X POST ':endpoint:/api/v1/users?email=john@doe.com&username=johndoe&password=123456'\
  -H 'Authorization: :auth_token:'
```

```ruby
require "manabu"

# register with hash:
new_user = Manabu::Users.new(client).register(
  email: 'john@doe.com',
  username: 'johndoe',
  password: '123456'
)

user = Manabu::User.new(
  email: 'john@doe.com',
  username: 'johndoe',
  password: '123456'
)
new_user = Manabu::Students.new(client).register(user)
```

## Update

TODO: Update user attribute

## Add Role

Add role to user

```shell
curl -X POST :endpoint:/api/v1/users/1/user_roles?role_id=:role_id: \
  -H 'Authorization: :auth_token:'
```

```ruby
require 'manabu'
role = Manabu::Role.new(client, id:1)
user = Manabu::User.new(client, id: 1)
user.add_role(role)
```
