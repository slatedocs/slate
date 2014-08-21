---
title: API Reference

language_tabs:
  - shell
  - ruby

toc_footers:
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Code School API. You can use our API to access Code School API endpoints for Paths, Courses, and individual Users.

# Authentication

> To authorize you'll need an OAuth token:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: OAuth poopoopoo"

```

> Make sure to replace `poopoopoo` with your OAuth API key.

Code School uses API keys to allow access to the API. Email [Olivier](mailto:olivier@codeschool.com) to obtain one.

Code School expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: OAuth poopoopoo`

<aside class="notice">
You must replace `poopoopoo` with your personal API key.
</aside>

# Paths

## Get All Paths

```shell
curl "https://codeschool.com/api/v1/paths.json"
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

`GET https://codeschool.com/api/v1/paths.json`

### Query Parameters

None.

<aside class="notice">
The Path endpoint doesn't return nested course data. You'll need to query the Courses endpoint using the course IDs
that each Path returned.
</aside>


# Courses

## Get All Courses

```shell
curl "https://codeschool.com/api/v1/courses.json"
  -H "Authorization: OAuth poopoopoo"
```

> The above command returns JSON structured like this:

```json
[
    {
        "title": "Rails Best Practices",
        "path_id": 1,
        "id": 2,
        "badge_image_url": "/assets/fallback/default_course_badge.png",
        "levels": [
            {
                "course_id": 2,
                "id": 6,
                "badge_image_url": null,
                "videos": [
                    {
                        "position": 1,
                        "files": [
                            {
                                "profile": "720p",
                                "url": "http://projector.codeschool.com/asdasdas.mp4?profile=720p&site=ios&sso=abcdefg",
                                "id": 1,
                                "format": "mp4",
                                "height": 720,
                                "width": 1280
                            }
                        ],
                        "embed_id": "asasdasd",
                        "id": 1
                    }
                ],
                "videos_count": 1
            },
            {
                "course_id": 2,
                "id": 7,
                "badge_image_url": null,
                "videos": [
                    {
                        "position": 1,
                        "files": [
                            {
                                "profile": "720p",
                                "url": "http://projector.codeschool.com/asdasdas.mp4?profile=720p&site=ios&sso=abcdefg",
                                "id": 1,
                                "format": "mp4",
                                "height": 720,
                                "width": 1280
                            }
                        ],
                        "embed_id": "asasdasd",
                        "id": 1
                    }
                ],
                "videos_count": 1
            },
            {
                "course_id": 2,
                "id": 8,
                "badge_image_url": null,
                "videos": [
                    {
                        "position": 1,
                        "files": [
                            {
                                "profile": "720p",
                                "url": "http://projector.codeschool.com/asdasdas.mp4?profile=720p&site=ios&sso=abcdefg",
                                "id": 1,
                                "format": "mp4",
                                "height": 720,
                                "width": 1280
                            }
                        ],
                        "embed_id": "asasdasd",
                        "id": 1
                    }
                ],
                "videos_count": 1
            },
            {
                "course_id": 2,
                "id": 9,
                "badge_image_url": "/assets/fallback/default_achievement_large_badge.png",
                "videos": [
                    {
                        "position": 1,
                        "files": [
                            {
                                "profile": "720p",
                                "url": "http://projector.codeschool.com/asdasdas.mp4?profile=720p&site=ios&sso=abcdefg",
                                "id": 1,
                                "format": "mp4",
                                "height": 720,
                                "width": 1280
                            }
                        ],
                        "embed_id": "asasdasd",
                        "id": 1
                    }
                ],
                "videos_count": 1
            },
            {
                "course_id": 2,
                "id": 10,
                "badge_image_url": null,
                "videos": [
                    {
                        "position": 1,
                        "files": [
                            {
                                "profile": "720p",
                                "url": "http://projector.codeschool.com/asdasdas.mp4?profile=720p&site=ios&sso=abcdefg",
                                "id": 1,
                                "format": "mp4",
                                "height": 720,
                                "width": 1280
                            }
                        ],
                        "embed_id": "asasdasd",
                        "id": 1
                    }
                ],
                "videos_count": 1
            }
        ],
        "slides_url": "https://www.codeschool.com/api/v1/courses/rails-best-practices/slides",
        "videos_count": 5
    }
]
```

This endpoint retrieves all Courses.

### HTTP Request

`GET https://codeschool.com/api/v1/courses.json`

### Query Parameters

None.

<aside class="success">
The Path endpoint returns nested levels data, and soon will return
nested videos for each level as well. Badger [Olivier](mailto:olivier@codeschool.com)
if this isn't the case yet.
</aside>
