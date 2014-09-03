# Paths

## Get All Paths

```shell
curl "https://www.codeschool.com/api/v1/paths.json"
  -H "Authorization: OAuth poopoopoo"
```

> The above command returns JSON structured like this:

```json
[
    {
        "name": "Ruby",
        "id": 1,
        "course_ids": [
            6
        ]
    },
    {
        "name": "JavaScript",
        "id": 2,
        "course_ids": [

        ]
    },
    {
        "name": "HTML/CSS",
        "id": 3,
        "course_ids": [

        ]
    },
    {
        "name": "iOS",
        "id": 4,
        "course_ids": [

        ]
    },
    {
        "name": "Electives",
        "id": 5,
        "course_ids": [

        ]
    }
]
```

This endpoint retrieves all Paths.

### HTTP Request

`GET https://www.codeschool.com/api/v1/paths`

### Query Parameters

None.

<aside class="notice">
The Path endpoint doesn't return nested course data. You'll need to query the Courses endpoint using the course IDs
that each Path returned.
</aside>
