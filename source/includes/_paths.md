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
    "id": 1,
    "name": "Ruby",
    "course_ids": [
      1
    ],
    "courses_count": 1,
    "assets": {
      "badge_url": {
        "svg": "https://www.codeschool.com/assets/path/badge-ruby.svg"
      },
      "background_color": "#b54322"
    }
  },
  { ... },
  { ... },
  { ... },
  { ... }
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
