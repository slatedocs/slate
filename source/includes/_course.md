Course
======

Get students
-----------

```shell
  curl -X GET :endpoint:/api/v1/courses/:course_id/students \
    -H 'Authorization: :auth_token:'
```

```ruby
require 'manabu'
course = Manabu::Course.new(client, id: 1)
course.students
```

Get enrollments
-----------

```shell
  curl -X GET :endpoint:/api/v1/courses/:course_id/enrollments \
    -H 'Authorization: :auth_token:'
```

```ruby
require 'manabu'
course = Manabu::Course.new(client, id: 1)
course.enrollments
```

Add student to course
---------------------
```shell
  curl -X POST :endpoint:/api/v1/courses/:course_id/enrollments?student_id=:student_id:&seat_number=:seat_number: \
    -H 'Authorization: :auth_token:'
```

```ruby
require 'manabu'
student = Manabu::Student.new(client, id: 1)
course = Manabu::Course.new(client, id: 1)
course.add_student(student, seat_number: 5)
```

Set course enrollment seat_number for student
---------------------------------------------
```shell
  curl -X PATCH :endpoint:/api/v1/courses/:course_id/enrollments/:enrollment_id:?seat_number=:seat_number: \
    -H 'Authorization: :auth_token:'
```

```ruby
require 'manabu'
student = Manabu::Student.new(client, id: 1)
course = Manabu::Course.new(client, id: 1)
enrollment = course.enrollments.first
enrollment.seat_number = 5
```

Get enrollment student
---------------------

```shell
  # Get student by id
```

```ruby
require 'manabu'
student = Manabu::Student.new(client, id: 1)
course = Manabu::Course.new(client, id: 1)
enrollment = course.enrollments.first
enrollment.student
```
