Enrollment Status
=================

List all enrollment statuses
----------------------------

```ruby
require 'manabu'
Manabu::EnrollmentStatuses.new(client).all
```

```shell
curl -X GET ":endpoint:/api/v1/enrollment_statuses"
  -H 'Authorization: :auth_token:'
```

Test all enrollment statuses
----------------------------

```ruby
require 'manabu'
Manabu::EnrollmentStatuses.new(client).all
```

```shell
curl -X GET ":endpoint:/api/v1/enrollment_statuses"
  -H 'Authorization: :auth_token:'
```
