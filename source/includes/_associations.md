# Associations

## Association IDs

Some resources take an array of IDs as a parameter for create or update actions. These IDs are then used to create the association between the resources. For example, when creating a `role` you can provide a parameter of `course_ids`. This role will then be associated to each of these courses.

### Replacing associations
```json
  {
    "role": {
      "course_ids": ["2"]
    }
  }
```

Please note: when an array of IDs is accepted as a parameter, the IDs that are provided will replace any associations already in place.

For example:

If a `role` had associations to `courses` with the ID of 2 and 3, providing `course_ids: ['2']` to the update of the role will replace the associations entirely, and only the association to `course` with an ID of 2 would remain.



### Adding to associations
```json
  {
    "role": {
      "course_ids": ["2", "3", "4"]
    }
  }
```

In order to add to a list of associations, provide any existing associations, plus the new one.

For example:

If a `role` had associations to `courses` with the ID of 2 and 3, providing `course_ids: ['2', '3', '4']` to the update of the role will keep associations to `courses` ID 2 and 3, and would add an association to `course` ID 4.

### Removing associations
```json
  {
    "role": {
      "course_ids": []
    }
  }
```

If you provide an empty array to a parameter that accepts an array of association IDs then all associations for that resource will be removed.

For example:

If a `role` had associations to `courses` with the ID of 2, and 3 providing `course_ids: []` to the update of the role will remove these associations.
